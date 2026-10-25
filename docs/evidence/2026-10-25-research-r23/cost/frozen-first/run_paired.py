from pathlib import Path
import os,json,time,subprocess,signal,resource,hashlib,random,platform
p=Path(__file__).resolve().parent
owner=p.parent/'owner-validation-1792940773067831299'
assert (owner/'completion.json').exists(),'owner validation is still active; do not time against it'
assert json.loads((owner/'completion.json').read_text())=={'failed':None,'sources_unchanged':True}
builds=json.loads((p/'latest-builds.json').read_text())
for build in builds:
 assert build['status']==0 and build['sources_unchanged']
 assert hashlib.sha256(Path(build['binary']['path']).read_bytes()).hexdigest()==build['binary']['sha256']
out=p/('paired-'+str(time.time_ns()));out.mkdir();(out/'driver.py').write_bytes(Path(__file__).read_bytes())
available=sorted(os.sched_getaffinity(0));cpu=available[0]
metadata={'scope':'native query costs; new baseline blockers are not completed-work latency comparisons','pairs':30,'samples_per_process':20,'affinity_cpu':cpu,'available_cpus':available,'platform':platform.platform(),'cpu_model':next(x.split(':',1)[1].strip() for x in Path('/proc/cpuinfo').read_text().splitlines() if x.startswith('model name')),'loadavg_before':Path('/proc/loadavg').read_text(),'builds':builds,'owner_completion':json.loads((owner/'completion.json').read_text()),'seed':20261025}
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
def contain():
 resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3));os.sched_setaffinity(0,{cpu})
cases=[(k,d,policy) for k in range(14) for d in ['forward','reverse'] for policy in ['strict','approximate']]
rng=random.Random(20261025)
with (out/'runs.jsonl').open('w',buffering=1) as journal:
 for pair in range(30):
  order=cases.copy();rng.shuffle(order);directory=out/f'pair-{pair:02}';directory.mkdir()
  for kind,direction,policy in order:
   for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
    name=f'{variant}-{kind:02}-{direction}-{policy}'
    cmd=[str(p/(variant+'-probe')),str(kind),direction,policy,variant,str(directory/(name+'.artifact.json'))]
    start=time.time();journal.write(json.dumps({'event':'start','pair':pair,'variant':variant,'kind':kind,'direction':direction,'policy':policy,'command':cmd,'epoch':start,'timeout_seconds':120,'address_space_bytes':8*1024**3})+'\n')
    with (directory/(name+'.jsonl')).open('w') as stdout,(directory/(name+'.stderr')).open('w') as stderr:
     proc=subprocess.Popen(cmd,stdout=stdout,stderr=stderr,start_new_session=True,preexec_fn=contain)
     try:status=proc.wait(timeout=120)
     except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
    journal.write(json.dumps({'event':'finish','pair':pair,'variant':variant,'kind':kind,'direction':direction,'policy':policy,'status':status,'elapsed_seconds':time.time()-start})+'\n')
    assert status==0,(pair,name,status)
    rows=[json.loads(line) for line in (directory/(name+'.jsonl')).read_text().splitlines()]
    assert len(rows)==20 and all(row['sample']==i and row['certainty']=='Certified' for i,row in enumerate(rows))
   if kind not in [6,7,8,9,10]:
    a=directory/f'baseline-{kind:02}-{direction}-{policy}.artifact.json';b=directory/f'candidate-{kind:02}-{direction}-{policy}.artifact.json';assert a.read_bytes()==b.read_bytes(),(pair,kind,direction,policy)
  print('PAIR',pair+1,'complete',flush=True)
metadata['loadavg_after']=Path('/proc/loadavg').read_text();metadata['complete']=True
(out/'metadata.json').write_text(json.dumps(metadata,indent=2)+'\n')
print('PAIRED COMPLETE',out,flush=True)
