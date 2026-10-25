from pathlib import Path
import subprocess, json, time, hashlib, os, platform
p=Path(__file__).resolve().parent
cases=['linear-third','linear-tiny','circle','mixed-third','mixed-sqrt','mixed-tiny','mixed-large','hole-tiny','span-third']
operations=['triangulate','extrude','twist-zero','sweep','revolve']
manifest={'cases':cases,'operations':operations,'pairs':3,'samples_per_process':5,'timeout_seconds':120,'timing':'operation only; source constructed before timing, validation and exact serialization afterwards','cache':'sample 0 fresh process, samples 1-4 reuse source; no global cache reset','allocator':'System; requested alloc/realloc bytes, allocation calls, live peak above pre-operation baseline','affinity':sorted(os.sched_getaffinity(0)),'host':platform.uname()._asdict(),'status':'running'}
for variant in ['baseline','candidate']:
 b=p/(variant+'-probe'); manifest[variant+'_binary_sha256']=hashlib.file_digest(b.open('rb'),'sha256').hexdigest()
 subprocess.run(['size','-A',str(b)],stdout=(p/(variant+'-size.txt')).open('w'),check=True)
(p/'paired-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
(p/'rows').mkdir(exist_ok=True)
with (p/'paired-journal.jsonl').open('w',buffering=1) as journal:
 for pair in range(3):
  for case in cases:
   for operation in operations:
    for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
     tag=f'{variant}-{case}-{operation}-{pair}'
     row=p/'rows'/(tag+'.json'); cmd=[str(p/(variant+'-probe')),case,operation,str(row)]
     start=time.time(); journal.write(json.dumps({'event':'start','tag':tag,'command':cmd,'time':start})+'\n')
     with (p/(tag+'.jsonl')).open('w') as out,(p/(tag+'.stderr')).open('w') as err:
      try: result=subprocess.run(cmd,stdout=out,stderr=err,timeout=120); code=result.returncode
      except subprocess.TimeoutExpired: code='timeout'
     journal.write(json.dumps({'event':'finish','tag':tag,'code':code,'seconds':time.time()-start})+'\n')
     if code!=0: raise SystemExit(f'{tag}: {code}')
  print('completed pair',pair,flush=True)
manifest['status']='completed'
(p/'paired-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
