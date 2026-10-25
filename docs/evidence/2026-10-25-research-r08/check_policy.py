from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).resolve().parent;root=Path('/home/tim/Documents/GitHub/workspace/csgrs');env=os.environ.copy();env['CCACHE_DIR']='/tmp/csgrs-research-ccache';env['CCACHE_TEMPDIR']='/tmp/csgrs-research-ccache-tmp'
checks=[('fmt',['cargo','fmt','--all','--','--check'],300),('clippy-hypercurve',['cargo','clippy','--locked','-p','hypercurve','--all-targets','--all-features','--','-D','warnings'],900),('hypercurve-all-features',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--no-fail-fast','--','--test-threads=2'],1800)]
with (p/'policy-checks.jsonl').open('w',buffering=1) as journal:
 for name,cmd,limit in checks:
  print('START',name,flush=True);start=time.time();journal.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'epoch':start,'timeout_seconds':limit})+'\n')
  with (p/(name+'.log')).open('w') as log:
   try:r=subprocess.run(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=limit);status=r.returncode
   except subprocess.TimeoutExpired:status='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'code':status,'seconds':time.time()-start})+'\n');print('FINISH',name,status,flush=True)
  if status:raise SystemExit(1)
