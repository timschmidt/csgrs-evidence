from pathlib import Path
import hashlib,json,os,subprocess,time
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-similarity-policy')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=checkout,text=True).strip()=='4519ec554d0bffdae3c7f45ffaac4a688c7663de'
assert not subprocess.check_output(['git','status','--porcelain'],cwd=checkout,text=True).strip()
env={**os.environ,'RUSTUP_TOOLCHAIN':'1.98.1','CARGO_TARGET_DIR':'/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-contact-admission','CARGO_BUILD_JOBS':'2','RUST_TEST_THREADS':'2','EXACTCORE_ROOT':'/home/tim/Documents/GitHub/workspace/exactCorelib-main/trunk'}
command=['cargo','test','--locked','--release','--all-features','--manifest-path','crates/comparisons/Cargo.toml','--test','coverage_manifest','every_hyper_crate_has_an_explicit_audit_disposition','--','--exact']
started=time.time()
with (root/'algebraic-pair-comparison-audit-baseline.log').open('w') as log:
 result=subprocess.run(command,cwd=checkout,env=env,stdout=log,stderr=subprocess.STDOUT)
record={'revision':'4519ec554d0bffdae3c7f45ffaac4a688c7663de','command':command,'exit_code':result.returncode,'elapsed_seconds':time.time()-started,'settings':{key:env[key] for key in ['RUSTUP_TOOLCHAIN','CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUST_TEST_THREADS','EXACTCORE_ROOT']},'source_clean_after':not subprocess.check_output(['git','status','--porcelain'],cwd=checkout,text=True).strip(),'audit_sha256':hashlib.sha256((checkout/'crates/comparisons/coverage/hyper-crates.tsv').read_bytes()).hexdigest(),'guard_sha256':hashlib.sha256((checkout/'crates/comparisons/tests/coverage_manifest.rs').read_bytes()).hexdigest()}
(root/'algebraic-pair-comparison-audit-baseline.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
