"""Preserve the original four path workflows and their exact failure frontier."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ENV, hashes, run

OLD=OUT.parent/'2026-10-17-stroke-upstream-integration'
source=hashes()
inputs=json.loads((OLD/'consumer-inputs.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
assert run('old-path-build',['cargo','build','--offline','--locked','--release',
    '--manifest-path','/tmp/hyperbrep-linear-stroke-integration-probe/Cargo.toml'],900)==0
binary=Path('/tmp/hyperbrep-axial-shell-old-path-control')
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-linear-stroke-integration-probe',binary)
metadata=dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
baseline=json.loads((OLD/'candidate-consumer-outcomes.json').read_text())
rows=[]
for expected in baseline['rows']:
    case=expected['case']
    code=run('old-path-'+case,[str(binary),str(OUT/'old-path-artifacts'),case],300)
    command=json.loads((OUT/'attempts.json').read_text())[-1]
    log=(OUT/command['log']).read_text()
    assert code==expected['exit_code']
    assert (f'case={case} outcome=certified' in log) if code==0 else ('Geometry(UnsupportedMeasurement)' in log)
    rows.append(dict(case=case,exit_code=code,outcome=expected['outcome'],command=command))
artifacts=[]
for old in sorted((OLD/'candidate-artifacts').glob('*')):
    current=OUT/'old-path-artifacts'/old.name
    # Compare separately: native carrier specialization intentionally changes archive bytes.
    artifacts.append(dict(path=str(current.relative_to(OUT)),sha256=hashlib.sha256(current.read_bytes()).hexdigest(),
        bytes=current.stat().st_size,baseline=str(old),unchanged=current.read_bytes()==old.read_bytes()))
assert len(artifacts)==4 and hashes()==source
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
(OUT/'old-path-control.json').write_text(json.dumps(dict(source=source,inputs=inputs,binary=metadata,
    rows=rows,artifacts=artifacts,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    preserved=True,scope='Two completed butt workflows and two unsupported round measurements retained. This proves preservation, not completion of the original four-case path contract.'),indent=2)+'\n')
print([(row['case'],row['outcome']) for row in rows],flush=True)
