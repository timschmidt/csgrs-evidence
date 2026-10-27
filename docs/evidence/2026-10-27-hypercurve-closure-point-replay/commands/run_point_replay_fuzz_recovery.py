from pathlib import Path
import importlib.util,json,os,subprocess,sys,time
sys.dont_write_bytecode=True
root=Path(__file__).resolve().parent;checkout=Path('/tmp/hypercurve-closure-point-replay')
spec=importlib.util.spec_from_file_location('evidence',checkout/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
source,files,patch=e.source_snapshot()
assert not (root/'point-replay-fuzz-recovery.json').exists()
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.95.0','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-point-replay-admission-fuzz','CARGO_BUILD_JOBS':'2','CCACHE_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache','CCACHE_TEMPDIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
cmd=['cargo','clippy','--locked','--manifest-path','crates/hypercurve/fuzz/Cargo.toml','--bins','--keep-going','--','-D','warnings'];started=time.time()
with (root/'point-replay-fuzz-recovery.log').open('w') as out:r=subprocess.run(cmd,cwd=checkout,env=env,stdout=out,stderr=subprocess.STDOUT,timeout=600)
assert e.source_snapshot()[0]==source
result={'source':source,'command':cmd,'exit_code':r.returncode,'elapsed_seconds':time.time()-started,'source_stable':True}
(root/'point-replay-fuzz-recovery.json').write_text(json.dumps(result,indent=2)+'\n')
print((root/'point-replay-fuzz-recovery.log').read_text());assert r.returncode==0
