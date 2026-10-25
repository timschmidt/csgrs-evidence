import os, subprocess, json, time, signal
from pathlib import Path
record=Path(__file__).resolve().parent
root=Path('/tmp/csgrs-r14-baseline')
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r14-baseline-target',CCACHE_DIR='/tmp/csgrs-r14-baseline-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r14-baseline-ccache/tmp',R14_LEAF_DIRECTORY='/tmp/csgrs-research-2026-10-25/r25-recovered/historical/leaves',PROPTEST_RNG_SEED='20261025')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
checks=[('baseline-oracle',['cargo','test','--locked','--offline','--release','-p','hypercurve','--lib','integer_bernstein_sign_decides_as_the_rational_basis_change','--','--exact','bezier_parameter::rational_bernstein_sign_regression::integer_bernstein_sign_decides_as_the_rational_basis_change'],900),('captured-leaves',['cargo','test','--locked','--offline','--release','-p','hypercurve','--lib','research_r14_probe::captured_leaf_preparation_counts','--','--nocapture','--test-threads=1'],900)]
with (record/'diagnostic-checks.jsonl').open('a',buffering=1) as journal:
 for name,cmd,limit in checks:
  print('START',name,flush=True);start=time.time();journal.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'timeout_seconds':limit,'epoch':start,'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','R14_LEAF_DIRECTORY','PROPTEST_RNG_SEED']}})+'\n')
  with (record/(name+'.log')).open('w') as log:
   proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   try: status=proc.wait(timeout=limit)
   except subprocess.TimeoutExpired:
    os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'status':status,'elapsed_seconds':time.time()-start})+'\n');print('FINISH',name,status,flush=True)
  if status!=0: raise SystemExit(1)
