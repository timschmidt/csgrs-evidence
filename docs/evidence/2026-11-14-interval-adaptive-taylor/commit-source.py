from pathlib import Path
import subprocess,json,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-taylor')
def git(*args):return subprocess.check_output(['git',*args],cwd=r)
base=git('rev-parse','HEAD').decode().strip();assert base==json.loads((s/'BASELINE.json').read_text())['csgrs']['head'];assert all(x['returncode']==0 for x in json.loads((s/'qualification.json').read_text()))
paths=['crates/hyperdynamics/CHANGELOG.md','crates/hyperdynamics/Cargo.toml','crates/hyperdynamics/README.md','crates/hyperdynamics/src/field/taylor_flow.rs','crates/hyperdynamics/src/field/taylor_flow/adaptive.rs','crates/hyperdynamics/tests/adaptive_taylor.rs','crates/hyperdynamics/benches/adaptive_taylor.rs']
git('diff','--check');git('add','--',*paths);assert sorted(git('diff','--cached','--name-only').decode().splitlines())==sorted(paths);git('commit','-m','Add bounded adaptive Taylor order and duration selection');commit=git('rev-parse','HEAD').decode().strip();patch=git('diff','--binary',base,commit);(s/'candidate.patch').write_bytes(patch);(s/'SOURCE.json').write_text(json.dumps(dict(base=base,commit=commit,paths=paths,patch_sha256=hashlib.sha256(patch).hexdigest()),indent=2)+'\n');assert not git('status','--porcelain');print(commit)
