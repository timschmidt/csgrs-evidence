from pathlib import Path
import hashlib,json,os,random,resource,signal,subprocess,time

root=Path(__file__).resolve().parent
mode=os.environ.get('R28_MODE','native');purpose=os.environ.get('R28_PURPOSE','final')
assert mode in ['native','allocations'] and purpose in ['functional','variance-pilot','final']
pairs=1 if purpose=='functional' else 5 if purpose=='variance-pilot' or mode=='allocations' else 30
batch=16 if purpose=='functional' else 64 if mode=='allocations' else 8192
record=root/('paired-'+mode+'-'+purpose+'-'+str(time.time_ns()));record.mkdir()
(record/'driver.py').write_bytes(Path(__file__).read_bytes())
builds=json.loads((root/('latest-'+mode+'-builds.json')).read_text());assert all(r['status']==0 for r in builds)
binaries={r['variant']:r['binary'] for r in builds}
for meta in binaries.values():assert hashlib.sha256(Path(meta['path']).read_bytes()).hexdigest()==meta['sha256']
cpu=min(os.sched_getaffinity(0));rng=random.Random(20261025)
def read(path):
    try:return Path(path).read_text()
    except OSError:return None
metadata={'mode':mode,'purpose':purpose,'pairs':pairs,'batch':batch,'seed':20261025,'cpu':cpu,'affinity':sorted(os.sched_getaffinity(0)),'builds':builds,'loadavg_start':read('/proc/loadavg'),'cpuinfo':read('/proc/cpuinfo'),'governor':read(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/scaling_governor'),'complete':False,'scope':'complete public line-fit query with receipts, result validation and destruction; input construction/JSON export excluded; direct API veto, not full-workflow admission'}
if purpose=='final' and mode=='native':
    assert (root/'native-final-design.json').exists(), 'pilot review and final design must precede final native timing'
(record/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
cases=[(kind,policy) for kind in range(12) for policy in ['strict','approximate']]
orders={case:([0,1]*(pairs//2)+([rng.randrange(2)] if pairs%2 else [])) for case in cases}
for sequence in orders.values():rng.shuffle(sequence)
def limits():
    resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));os.sched_setaffinity(0,{cpu})
def expected_checksum(code,iterations):
    checksum=14695981039346656037
    for _ in range(iterations):checksum=((checksum*1099511628211)&((1<<64)-1))^code
    return str(checksum)
total_queries=0;successful_queries=0;unsupported_queries=0
for pair in range(pairs):
    directory=record/f'pair-{pair:02}';directory.mkdir();shuffled=cases.copy();rng.shuffle(shuffled)
    for kind,policy in shuffled:
        order=['baseline','candidate'] if orders[kind,policy][pair]==0 else ['candidate','baseline']
        comparison=[]
        for variant in order:
            stem=directory/f'{variant}-{kind:02}-{policy}';cmd=['/usr/bin/time','-v',binaries[variant]['path'],str(kind),policy,str(batch)]
            start=time.time()
            with stem.with_suffix('.jsonl').open('w') as stdout,stem.with_suffix('.stderr').open('w') as stderr:
                proc=subprocess.Popen(cmd,stdout=stdout,stderr=stderr,preexec_fn=limits,start_new_session=True)
                try:status=proc.wait(timeout=120)
                except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
            with (record/'commands.jsonl').open('a') as out:out.write(json.dumps({'pair':pair,'case':[kind,policy],'variant':variant,'order':order,'command':cmd,'status':status,'seconds':time.time()-start})+'\n')
            assert status==0,(variant,kind,policy,status)
            values=[json.loads(line) for line in stem.with_suffix('.jsonl').read_text().splitlines()];assert len(values)==8
            code=3 if kind>=10 else 2 if kind in [6,7] else 1
            for i,row in enumerate(values):
                n=1 if i==0 else batch
                assert row['kind']==kind and row['policy']==policy and row['sample']==i and row['iterations']==n
                assert row['certainty']=='Certified' and row['allocation_instrumented']==(mode=='allocations')
                assert row['checksum']==expected_checksum(code,n)
                total_queries+=n
                if code==3:unsupported_queries+=n
                else:successful_queries+=n
            comparison.append([{k:r[k] for k in ['kind','policy','sample','iterations','certainty','expected_outcome','checksum']} for r in values])
        assert comparison[0]==comparison[1]
    print(mode,purpose,'PAIR',pair+1,'complete',flush=True)
metadata.update(complete=True,total_certified_queries=total_queries,successful_fit_queries=successful_queries,typed_unsupported_queries=unsupported_queries,exact_outcome_row_pairs=pairs*len(cases)*8,loadavg_end=read('/proc/loadavg'))
(record/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
print('PAIRED COMPLETE',record,flush=True)
