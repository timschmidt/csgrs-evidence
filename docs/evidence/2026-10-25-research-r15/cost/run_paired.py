from pathlib import Path
import os, json, time, subprocess, signal, resource, hashlib, random, platform

p=Path(__file__).resolve().parent
mode=os.environ.get('R15_PROBE_MODE','native')
assert mode in ['native','allocations']
purpose=os.environ.get('R15_RUN_PURPOSE','final');assert purpose in ['final','variance-pilot']
assert purpose=='final' or mode=='native'
owner=Path(json.loads((p.parent/'latest-owner.json').read_text())['directory'])
if mode=='native':
    assert (owner/'completion.json').exists(),'owner validation is still active; do not time against it'
    assert json.loads((owner/'completion.json').read_text())=={'failed':None,'sources_unchanged':True}
builds=json.loads((p/('latest-'+mode+'-builds.json')).read_text())
for build in builds:
    assert build['status']==0 and build['sources_unchanged']
    assert hashlib.sha256(Path(build['binary']['path']).read_bytes()).hexdigest()==build['binary']['sha256']
out=p/('paired-'+mode+'-'+('variance-' if purpose=='variance-pilot' else '')+str(time.time_ns()));out.mkdir()
(out/'driver.py').write_bytes(Path(__file__).read_bytes())
(out/'contract.md').write_bytes((p/'contract.md').read_bytes())
available=sorted(os.sched_getaffinity(0));cpu=available[0]
def read_if_exists(path):
    try:return Path(path).read_text()
    except OSError:return None
pairs=30 if mode=='native' and purpose=='final' else 5
metadata={'mode':mode,'purpose':purpose,'scope':'matched certified public trimming and complete validation; allocations timing is excluded',
    'pairs':pairs,'samples_per_process':8,'affinity_cpu':cpu,'available_cpus':available,'platform':platform.platform(),
    'cpu_model':next(x.split(':',1)[1].strip() for x in Path('/proc/cpuinfo').read_text().splitlines() if x.startswith('model name')),
    'lscpu':subprocess.check_output(['lscpu'],text=True),'governor':read_if_exists(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/scaling_governor'),
    'loadavg_before':Path('/proc/loadavg').read_text(),'builds':builds,'owner_directory':str(owner),
    'owner_completion':json.loads((owner/'completion.json').read_text()) if (owner/'completion.json').exists() else None,'seed':20261025}
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
def contain():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));os.sched_setaffinity(0,{cpu})
cases=[(kind,direction,policy,lane) for kind in range(7) for direction in ['forward','reverse'] for policy in ['strict','approximate'] for lane in ['retained','workflow']]
rng=random.Random(20261025)
firsts={}
for case in cases:
    order=[0]*(pairs//2)+[1]*(pairs-pairs//2);rng.shuffle(order);firsts[case]=order
metadata['variant_order']={','.join(map(str,case)):order for case,order in firsts.items()}
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
with (out/'runs.jsonl').open('w',buffering=1) as journal:
    for pair in range(pairs):
        order=cases.copy();rng.shuffle(order);directory=out/f'pair-{pair:02}';directory.mkdir()
        for kind,direction,policy,lane in order:
            case=(kind,direction,policy,lane)
            for variant in (['baseline','candidate'] if firsts[case][pair]==0 else ['candidate','baseline']):
                name=f'{variant}-{kind:02}-{direction}-{policy}-{lane}'
                probe=[str(p/(variant+'-'+mode+'-probe')),str(kind),direction,policy,'8',str(directory/(name+'.artifact.json')),lane]
                cmd=['/usr/bin/time','-v','-o',str(directory/(name+'.time')), *probe]
                start=time.time();journal.write(json.dumps({'event':'start','pair':pair,'variant':variant,'kind':kind,'direction':direction,'policy':policy,'lane':lane,'command':cmd,'epoch':start,'timeout_seconds':120,'address_space_bytes':8*1024**3})+'\n')
                with (directory/(name+'.jsonl')).open('w') as stdout,(directory/(name+'.stderr')).open('w') as stderr:
                    proc=subprocess.Popen(cmd,stdout=stdout,stderr=stderr,start_new_session=True,preexec_fn=contain)
                    try:status=proc.wait(timeout=120)
                    except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
                journal.write(json.dumps({'event':'finish','pair':pair,'variant':variant,'kind':kind,'direction':direction,'policy':policy,'lane':lane,'status':status,'elapsed_seconds':time.time()-start})+'\n')
                assert status==0,(pair,name,status)
                rows=[json.loads(line) for line in (directory/(name+'.jsonl')).read_text().splitlines()]
                assert len(rows)==8 and all(row['sample']==i and row['certainty']=='Certified' and row['status']=='complete' and row['lane']==lane and row['allocation_counters']==(mode=='allocations') for i,row in enumerate(rows))
            a=directory/f'baseline-{kind:02}-{direction}-{policy}-{lane}.artifact.json';b=directory/f'candidate-{kind:02}-{direction}-{policy}-{lane}.artifact.json'
            assert a.read_bytes()==b.read_bytes(),(pair,case)
        print(mode.upper(),'PAIR',pair+1,'complete',flush=True)
metadata['loadavg_after']=Path('/proc/loadavg').read_text();metadata['complete']=True
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
print('PAIRED COMPLETE',out,flush=True)
