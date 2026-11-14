from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-physics-flow')
def git(*args):return subprocess.check_output(['git',*args],cwd=r)
base=git('rev-parse','HEAD').decode().strip();assert base==json.loads((s/'BASELINE.json').read_text())['csgrs']['head']
paths=['Cargo.lock','crates/hyperdynamics/CHANGELOG.md','crates/hyperdynamics/src/field.rs','crates/hyperdynamics/src/field/budget_adapter.rs','crates/hyperphysics/CHANGELOG.md','crates/hyperphysics/Cargo.toml','crates/hyperphysics/README.md','crates/hyperphysics/src/lib.rs','crates/hyperphysics/src/dynamics.rs','crates/hyperphysics/tests/certified_flow.rs','crates/hyperphysics/benches/certified_flow.rs']
git('diff','--check');git('add','--',*paths);assert sorted(git('diff','--cached','--name-only').decode().splitlines())==sorted(paths)
git('commit','-m','Add source-bound continuous point-mass flow certificates');commit=git('rev-parse','HEAD').decode().strip();patch=git('diff','--binary',base,commit);(s/'candidate.patch').write_bytes(patch)
(s/'SOURCE.json').write_text(json.dumps(dict(base=base,commit=commit,paths=paths,patch_sha256=hashlib.sha256(patch).hexdigest()),indent=2)+'\n');assert not git('status','--porcelain');print(commit)
