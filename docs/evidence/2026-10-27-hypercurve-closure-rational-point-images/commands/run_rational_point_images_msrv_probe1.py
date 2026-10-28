from pathlib import Path
import importlib.util,json,os,signal,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-rational-point-images')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot();assert not (root/'rational-point-images-msrv-probe1.json').exists()
e.save_json(root/'rational-point-images-msrv-probe1-source-before.json',source);e.save_json(root/'rational-point-images-msrv-probe1-files-before.json',files);(root/'rational-point-images-msrv-probe1.patch').write_bytes(patch)
command=['cargo','clippy','--locked','-p','hypercurve','-p','csgrs','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.95.0','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-rational-point-images-admission-msrv','CARGO_BUILD_JOBS':'2','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
start=time.time()
with (root/'rational-point-images-msrv-probe1.log').open('w') as log:
 p=subprocess.Popen(command,cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=1800)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code='external_timeout'
after,afterfiles,_=e.source_snapshot();e.save_json(root/'rational-point-images-msrv-probe1-source-after.json',after);e.save_json(root/'rational-point-images-msrv-probe1-files-after.json',afterfiles)
result={'command':command,'exit_code':code,'elapsed_seconds':time.time()-start,'source_stable':source==after,'source':source,'external_timeout_seconds':1800};e.save_json(root/'rational-point-images-msrv-probe1.json',result);print(result,flush=True);raise SystemExit(0 if code==0 and source==after else 1)
