from pathlib import Path
import subprocess,json,time,hashlib,platform,os
p=Path(__file__).resolve().parent
cases=[(mode,count) for mode in ['mixed','linear'] for count in [1,2,8,32]]
manifest={'cases':cases,'pairs':30,'samples_per_process':5,'timeout_seconds':120,'timing':'Boolean only, followed by ten role queries timed separately; input construction, exact serialization, area and drop outside those timers','cache':'sample 0 fresh process; samples 1-4 reuse source, outputs reconstructed each sample; no global reset','allocator':'System requested alloc/realloc bytes and calls; live allocation above initial baseline','status':'running'}
(p/'paired-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
(p/'rows').mkdir(exist_ok=True)
with (p/'paired-journal.jsonl').open('w',buffering=1) as journal:
 for pair in range(30):
  for mode,count in cases:
   for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
    tag=f'{variant}-{mode}-{count}-{pair}'
    cmd=[str(p/(variant+'-probe')),mode,str(count),str(p/'rows'/(tag+'.json'))]
    start=time.time();journal.write(json.dumps({'event':'start','tag':tag,'command':cmd,'time':start})+'\n')
    with (p/(tag+'.jsonl')).open('w') as out,(p/(tag+'.stderr')).open('w') as err:
     try: result=subprocess.run(cmd,stdout=out,stderr=err,timeout=120);code=result.returncode
     except subprocess.TimeoutExpired: code='timeout'
    journal.write(json.dumps({'event':'finish','tag':tag,'code':code,'seconds':time.time()-start})+'\n')
    if code!=0:raise SystemExit(f'{tag}: {code}')
  print('completed pair',pair,flush=True)
manifest['status']='completed'
(p/'paired-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
