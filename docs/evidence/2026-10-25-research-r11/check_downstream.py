from pathlib import Path
import json,subprocess,time,os
p=Path(__file__).resolve().parent
env=os.environ.copy();env['CCACHE_DIR']='/tmp/csgrs-research-ccache';env['CCACHE_TEMPDIR']='/tmp/csgrs-research-ccache-tmp'
checks=[('brep-profiles',['cargo','test','--locked','--release','-p','hyperbrep','--test','region_extrusion','--test','retained_region_extrusion','--test','axial_shells'],900),('circuit-materialization',['cargo','test','--locked','--release','-p','hypercircuit','--features','geometry','--test','materialize'],900)]
with (p/'downstream-checks.jsonl').open('w',buffering=1) as journal:
 for name,cmd,limit in checks:
  start=time.time();journal.write(json.dumps({'event':'start','name':name,'command':cmd,'timeout_seconds':limit,'epoch':start,'environment':{key:env[key] for key in ['CCACHE_DIR','CCACHE_TEMPDIR']}})+'\n');print('START',name,flush=True)
  with (p/(name+'.log')).open('w') as log:
   try: result=subprocess.run(cmd,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=limit);code=result.returncode
   except subprocess.TimeoutExpired: code='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'code':code,'seconds':time.time()-start})+'\n');print('FINISH',name,code,flush=True)
  if code!=0:raise SystemExit(1)
