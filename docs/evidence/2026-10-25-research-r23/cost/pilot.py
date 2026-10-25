from pathlib import Path
import subprocess,time,json,signal,resource,concurrent.futures,os
p=Path(__file__).resolve().parent;out=p/('pilot-'+str(time.time_ns()));out.mkdir()
(out/'scope.txt').write_text('Correctness and harness diagnostic under concurrent owner validation. No latency samples from this pilot are admission evidence.\n')
(out/'driver.py').write_bytes(Path(__file__).read_bytes())
def limits():resource.setrlimit(resource.RLIMIT_AS,(8*1024**3,8*1024**3))
def run(item):
 variant,kind,direction,policy=item;name=f'{variant}-{kind:02}-{direction}-{policy}'
 cmd=[str(p/(variant+'-probe')),str(kind),direction,policy,variant,str(out/(name+'.artifact.json'))];start=time.time()
 with (out/(name+'.jsonl')).open('w') as stdout,(out/(name+'.stderr')).open('w') as stderr:
  proc=subprocess.Popen(cmd,stdout=stdout,stderr=stderr,start_new_session=True,preexec_fn=limits)
  try:status=proc.wait(timeout=120)
  except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
 return {'variant':variant,'kind':kind,'direction':direction,'policy':policy,'command':cmd,'status':status,'elapsed_seconds':time.time()-start,'timeout_seconds':120,'address_space_bytes':8*1024**3}
items=[(v,k,d,policy) for v in ['baseline','candidate'] for k in range(14) for d in ['forward','reverse'] for policy in ['strict','approximate']]
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
 with (out/'runs.jsonl').open('w',buffering=1) as log:
  for row in pool.map(run,items):log.write(json.dumps(row)+'\n')
rows=[json.loads(line) for line in (out/'runs.jsonl').read_text().splitlines()]
print(json.dumps({'directory':str(out),'runs':len(rows),'failures':[r for r in rows if r['status']!=0]},indent=2))
