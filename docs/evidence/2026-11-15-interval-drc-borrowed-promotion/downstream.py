from pathlib import Path
import subprocess,os,json,time,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/interval-promotion-boundaries/csgrs')
assert json.loads((s/'boundary-controls-complete.json').read_text())['success']
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/drc-boundary-native','CARGO_BUILD_JOBS':'12','CARGO_NET_OFFLINE':'true','RUSTUP_TOOLCHAIN':'stable'}
def git(*args,input=None):return subprocess.check_output(['git','-C',str(r),*args],input=input)
assert not git('status','--porcelain')
patch=(s/'candidate-with-witness.patch').read_bytes();git('apply','-',input=patch)
command=['cargo','+stable','test','--release','--locked','--no-default-features','--features','curve,stl-io,obj-io','--test','successive_operations','--','--include-ignored','--test-threads=2']
row={'command':command,'cwd':str(r),'env_overrides':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE','RUSTUP_TOOLCHAIN']},'candidate_patch_sha256':hashlib.sha256(patch).hexdigest(),'source_parent':git('rev-parse','HEAD').decode().strip()}
(s/'downstream-started.json').write_text(json.dumps(row,indent=2)+'\n');start=time.monotonic()
try:
 with (s/'downstream-tests.log').open('w') as log:result=subprocess.run(command,cwd=r,env=env,stdout=log,stderr=subprocess.STDOUT)
 row.update(exit_code=result.returncode,seconds=time.monotonic()-start)
finally:
 git('restore','--source=HEAD','--worktree','--','crates/hypercurve/src/arc_bezier.rs','crates/hypercurve/src/rational_bezier_general.rs')
 (r/'crates/hypercurve/src/rational_bezier_general/borrowed_promotion_tests.rs').unlink()
 assert not git('status','--porcelain');row['source_restored_clean']=True
 (s/'downstream-tests.json').write_text(json.dumps(row,indent=2)+'\n')
print(json.dumps(row),flush=True)
raise SystemExit(row['exit_code'])
