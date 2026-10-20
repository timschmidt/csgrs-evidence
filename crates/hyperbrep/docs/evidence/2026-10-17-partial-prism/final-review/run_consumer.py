"""Run every original complete-workflow assertion through the new public input."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ENV, hashes, run

phase=sys.argv[1]
assert phase.isalnum()
source=hashes()
inputs=json.loads((OUT/'consumer-final-inputs.json').read_text())
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==value for p,value in inputs.items())
binary=Path('/tmp')/('hyperbrep-axial-consumer-'+phase)
assert not binary.exists()
shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-axial-consumer',binary)
metadata=dict(path=str(binary),bytes=binary.stat().st_size,sha256=hashlib.sha256(binary.read_bytes()).hexdigest())
rows=[]
for disjoint in ['false','true']:
    for reflected in ['false','true']:
        case=f'axial-disjoint-{disjoint}-reflected-{reflected}'
        label=f'consumer-{phase}-{case}'
        code=run(label,[str(binary),str(OUT/(phase+'-artifacts')),disjoint,reflected],300)
        row=json.loads((OUT/'attempts.json').read_text())[-1]
        text=(OUT/row['log']).read_text()
        if code==0:assert f'case={case} outcome=certified' in text
        rows.append(dict(case=case,exit_code=code,log=row['log'],source=row['source']))
assert hashes()==source
assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==value for p,value in inputs.items())
(OUT/('consumer-'+phase+'.json')).write_text(json.dumps(dict(source=source,inputs=inputs,
    binary=metadata,rows=rows,recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),indent=2)+'\n')
print(rows,flush=True)
assert all(row['exit_code']==0 for row in rows)
