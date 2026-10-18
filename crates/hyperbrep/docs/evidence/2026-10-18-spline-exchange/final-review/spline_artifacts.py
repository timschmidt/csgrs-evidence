"""Materialize complete spline workflows twice and retain independent-reader inputs."""
import hashlib,json,shutil,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
source=hashes();project=Path(__file__).with_name('artifact-project')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
# The helper source belongs to the main guarded IO test suite. This manifest,
# entry point and lock file are additional independently hashed external inputs.
assert run('spline-artifacts-lock',['cargo','generate-lockfile','--offline','--manifest-path',str(project/'Cargo.toml')],300)==0
inputs={str(p):sha(p) for p in [Path(__file__),*project.glob('*')] if p.is_file()}
assert run('spline-artifacts-clippy',['cargo','clippy','--offline','--locked','--manifest-path',str(project/'Cargo.toml'),'--all-targets','--','-D','warnings'],900)==0
assert run('spline-artifacts-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml')],900)==0
binary=Path('/tmp/hyperbrep-spline-exchange-artifacts-qualified');assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-spline-exchange-artifacts',binary)
metadata=dict(path=str(binary),sha256=sha(binary),bytes=binary.stat().st_size)
readers=[]
for label in ['spline-artifacts','spline-repeat']:
 assert run(label,[str(binary),str(OUT/label)],900)==0
 attempt=json.loads((OUT/'attempts.json').read_text())[-1]
 rows=[json.loads(x) for x in (OUT/attempt['log']).read_text().splitlines() if x.startswith('{')]
 assert len(rows)==28
 if readers:assert readers==rows
 readers=rows
 assert hashes()==source and all(sha(p)==h for p,h in inputs.items()) and sha(binary)==metadata['sha256']
rows=[]
a=OUT/'spline-artifacts';b=OUT/'spline-repeat'
first=sorted(p.name for p in a.iterdir());assert first==sorted(p.name for p in b.iterdir()) and len(first)==58
for name in first:
 assert (a/name).read_bytes()==(b/name).read_bytes(),name
 rows.append(dict(path=str((a/name).relative_to(OUT)),repeat=str((b/name).relative_to(OUT)),sha256=sha(a/name),bytes=(a/name).stat().st_size))
(OUT/'spline-artifacts.json').write_text(json.dumps(dict(source=source,inputs=inputs,binary=metadata,artifacts=rows,reader_cases=readers,scope='Two fresh native processes repeat all five complete spline exchange/control acceptance groups, then retain 58 native/STEP artifacts covering eight retained profiles and ten independently authored variants. Determinism is separate from the exact semantic assertions.'),indent=2)+'\n')
