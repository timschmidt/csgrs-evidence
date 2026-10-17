"""Run all four original inputs separately without changing their assertions."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

phase = sys.argv[1]
assert phase in ['baseline','candidate']
source = hashes()
inputs = json.loads((OUT/'consumer-inputs.json').read_text())
for path,digest in inputs.items():
    assert hashlib.sha256(Path(path).read_bytes()).hexdigest() == digest
binary = Path('/tmp')/f'hyperbrep-linear-stroke-integration-{phase}-v2'
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-linear-stroke-integration-probe',binary)
metadata = dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
(OUT/(phase+'-consumer-binary.json')).write_text(json.dumps(metadata,indent=2)+'\n')
rows = []
for cap in ['Butt','Round']:
    for reverse in ['false','true']:
        name = f'{cap}-reverse-{reverse}'
        label = f'{phase}-stroke-{name}'
        code = run(label,[str(binary),str(OUT/(phase+'-artifacts')),name],300)
        row = json.loads((OUT/'attempts.json').read_text())[-1]
        log = (OUT/row['log']).read_text()
        outcome = 'certified' if code==0 else 'unsupported_measurement' if 'Geometry(UnsupportedMeasurement)' in log else 'failure'
        if code==0:
            assert f'case={name} outcome=certified' in log
        rows.append(dict(case=name,exit_code=code,outcome=outcome,command=row))
assert hashes()==source
for path,digest in inputs.items():
    assert hashlib.sha256(Path(path).read_bytes()).hexdigest() == digest
(OUT/(phase+'-consumer-outcomes.json')).write_text(json.dumps(dict(
    source=source,inputs=inputs,binary=metadata,rows=rows,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='The consumer unwraps strict public results as assertions. UnsupportedMeasurement is a typed native result, not a native panic. Failed original cases remain in the inventory; an earlier error is not successful-work performance.'),indent=2)+'\n')
print([(r['case'],r['outcome']) for r in rows])
if phase=='candidate':
    assert all(r['exit_code']==0 for r in rows)
