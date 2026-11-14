from pathlib import Path
import hashlib, json, os, subprocess, time

s = Path(__file__).parent
tree = Path('/mnt/development/csgrs-dynamics-current-cost')
env = os.environ | {'CARGO_BUILD_JOBS':'4', 'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dynamics-current-cost'}
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree) == (s/'pending-extraction.patch').read_bytes()
actual = subprocess.check_output(['git','diff','--binary'],cwd=tree)
(s/'provider-current.patch').write_bytes(actual)
assert actual
fixture = tree/'crates/hyperdynamics/tests/provider_errors.rs'
assert fixture.read_bytes() == (s/'provider_errors.rs').read_bytes()
cmd = ['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--test','provider_errors']
start = time.monotonic()
with (s/'provider-fixtures.log').open('w') as log:
    run = subprocess.run(cmd,cwd=tree,env=env,stdout=log,stderr=subprocess.STDOUT)
(s/'provider-fixtures.json').write_text(json.dumps(dict(command=cmd,returncode=run.returncode,seconds=time.monotonic()-start),indent=2)+'\n')
assert run.returncode == 0
subprocess.run(['git','apply','--reverse',str(s/'provider-current.patch')],cwd=tree,check=True)
fixture.unlink()
assert not subprocess.check_output(['git','diff','--binary'],cwd=tree)
subprocess.run(['python3','-B',str(s/'restore-checks.py')],check=True)
# This worktree was created exclusively for this investigation. Both exact
# patches and the added fixture have already been preserved and checked.
subprocess.run(['git','apply','--reverse','--index',str(s/'pending-extraction.patch')],cwd=tree,check=True)
assert not subprocess.check_output(['git','status','--porcelain=v1'],cwd=tree)
(s/'isolated-tree-restored.json').write_text(json.dumps(dict(
    head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=tree,text=True).strip(),
    clean=True, provider_patch_sha256=hashlib.sha256(actual).hexdigest()),indent=2)+'\n')
print('provider fixtures and restored extraction checks pass; isolated tree clean',flush=True)
