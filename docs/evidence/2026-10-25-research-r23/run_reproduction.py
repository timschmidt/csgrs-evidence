from pathlib import Path
import os,subprocess,signal,time,json,hashlib
record=Path(__file__).resolve().parent;root=Path('/tmp/csgrs-r23-baseline')
env=os.environ.copy();env.update(CARGO_TARGET_DIR='/tmp/csgrs-r23-baseline-target',CCACHE_DIR='/tmp/csgrs-r23-baseline-ccache',CCACHE_TEMPDIR='/tmp/csgrs-r23-baseline-ccache/tmp',PROPTEST_RNG_SEED='20261025');Path(env['CCACHE_TEMPDIR']).mkdir(parents=True,exist_ok=True)
cmd=['cargo','test','--locked','--offline','--release','-p','hypercurve','--test','research_containment','--','--nocapture','--test-threads=1'];start=time.time()
with (record/'baseline-reproduction.log').open('w') as log:
 proc=subprocess.Popen(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 try:status=proc.wait(timeout=900)
 except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();status='timeout'
(record/'baseline-reproduction.json').write_text(json.dumps({'command':cmd,'cwd':str(root),'status':status,'elapsed_seconds':time.time()-start,'timeout_seconds':900,'test_sha256':hashlib.sha256((record/'reproduction.rs').read_bytes()).hexdigest(),'compiler':subprocess.check_output(['rustc','-Vv'],text=True),'env':{k:env[k] for k in ['CARGO_TARGET_DIR','CCACHE_DIR','CCACHE_TEMPDIR','PROPTEST_RNG_SEED']}},indent=2)+'\n')
print('R23 reproduction exit',status,flush=True)
