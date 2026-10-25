from pathlib import Path
import os,sys,time,json,subprocess,signal,hashlib
variant=sys.argv[1];assert variant in ['baseline','candidate']
root=Path('/tmp/csgrs-r14-'+variant);record=Path(__file__).resolve().parent/('acceptance-'+variant);record.mkdir(exist_ok=True)
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r14-'+variant+'-target',CCACHE_DIR='/tmp/csgrs-r14-'+variant+'-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r14-'+variant+'-ccache/tmp',R14_LEAF_DIRECTORY='/tmp/csgrs-research-2026-10-25/r25-recovered/historical/leaves',PROPTEST_RNG_SEED='20261025')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
patch=subprocess.check_output(['git','diff','--binary'],cwd=root);(record/'source.patch').write_bytes(patch)
(record/'source.json').write_text(json.dumps({'patch_sha256':hashlib.sha256(patch).hexdigest(),'lock_sha256':hashlib.sha256((root/'Cargo.lock').read_bytes()).hexdigest(),'head':subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip(),'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','R14_LEAF_DIRECTORY','PROPTEST_RNG_SEED']}},indent=2)+'\n')
checks=[('original-1152-oracle',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','integer_bernstein_sign_decides_as_the_rational_basis_change','--','--nocapture'],900),('new-acceptance',['cargo','test','--locked','--offline','--release','-p','hypercurve','--all-features','--lib','r14_','--','--nocapture','--test-threads=1'],900),('clippy',['cargo','clippy','--locked','--offline','-p','hypercurve','--all-features','--all-targets','--','-D','warnings'],900)]
with (record/'checks.jsonl').open('a',buffering=1) as journal:
 for name,cmd,limit in checks:
  print('START',variant,name,flush=True);start=time.time();journal.write(json.dumps({'event':'start','name':name,'command':cmd,'cwd':str(root),'timeout_seconds':limit,'epoch':start})+'\n')
  with (record/(name+'.log')).open('w') as log:
   proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
   try:status=proc.wait(timeout=limit)
   except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
  journal.write(json.dumps({'event':'finish','name':name,'status':status,'elapsed_seconds':time.time()-start})+'\n');print('FINISH',variant,name,status,flush=True)
  if status!=0:raise SystemExit(1)
assert subprocess.check_output(['git','diff','--binary'],cwd=root)==patch
print('Source unchanged throughout '+variant+' acceptance',flush=True)
