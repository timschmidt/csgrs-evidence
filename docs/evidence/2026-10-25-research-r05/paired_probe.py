from pathlib import Path
import subprocess,json,time
p=Path(__file__).resolve().parent
cases=['split','topology','section','restrict','reversed','selected','translated','mapped','line','quadratic']
manifest={'cases':cases,'pairs':10,'samples_per_process':5,'timeout_seconds':120,'policy':'STRICT','status':'running','timing':'operation only; source construction, definition serialization and drop outside the operation timer','cache':'sample zero fresh process; samples one through four reuse source, reconstruct output; no global reset','allocator':'System requested allocation/reallocation bytes and calls; live and peak above pre-operation baseline'}
(p/'paired-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');(p/'rows').mkdir(exist_ok=True)
with (p/'paired-journal.jsonl').open('w',buffering=1) as journal:
 for pair in range(manifest['pairs']):
  for case in cases:
   for variant in (['baseline','candidate'] if pair%2==0 else ['candidate','baseline']):
    tag=f'{variant}-{case}-{pair}';cmd=[str(p/(variant+'-probe')),case,str(p/'rows'/(tag+'.json'))];start=time.time()
    journal.write(json.dumps({'event':'start','tag':tag,'command':cmd,'epoch':start})+'\n')
    with (p/(tag+'.jsonl')).open('w') as out,(p/(tag+'.stderr')).open('w') as err:
     try:result=subprocess.run(cmd,stdout=out,stderr=err,timeout=120);code=result.returncode
     except subprocess.TimeoutExpired:code='timeout'
    journal.write(json.dumps({'event':'finish','tag':tag,'code':code,'seconds':time.time()-start})+'\n')
    if code!=0:raise SystemExit(f'{tag}: {code}')
  print('completed pair',pair,flush=True)
manifest['status']='completed';(p/'paired-manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
