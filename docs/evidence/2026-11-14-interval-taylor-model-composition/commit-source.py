from pathlib import Path
import json,subprocess,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-model-composition');base=json.loads((s/'BASELINE.json').read_text())['csgrs']['head']
def git(*args):return subprocess.check_output(['git',*args],cwd=r)
assert git('rev-parse','HEAD').decode().strip()==base
paths=['crates/hypersolve/Cargo.toml','crates/hypersolve/CHANGELOG.md','crates/hypersolve/README.md','crates/hypersolve/src/expression_program/taylor/model/polynomial.rs','crates/hypersolve/src/expression_program/taylor/model/polynomial/composition.rs','crates/hypersolve/tests/program_taylor_composition.rs','crates/hypersolve/benches/taylor_composition.rs']
assert len(json.loads((s/'new-timing-summary.json').read_text()))==24
controls=json.loads((s/'control-timing-comparison.json').read_text());assert len(controls)==6 and not any(r['adverse_separated'] for r in controls)
assert all(r['returncode']==0 for r in json.loads((s/'qualification.json').read_text()))
subprocess.run(['git','add','--',*paths],cwd=r,check=True);assert set(git('diff','--cached','--name-only').decode().splitlines())==set(paths)
subprocess.run(['git','diff','--cached','--check'],cwd=r,check=True)
subprocess.run(['git','commit','-m','Compose certified Taylor models with retained source and remainder proofs'],cwd=r,check=True)
assert not git('status','--porcelain')
head=git('rev-parse','HEAD').decode().strip();patch=git('diff','--binary',base,head);(s/'candidate.patch').write_bytes(patch)
(s/'SOURCE.json').write_text(json.dumps(dict(base=base,commit=head,paths=paths,patch_sha256=hashlib.sha256(patch).hexdigest()),indent=2)+'\n');print(head,flush=True)
