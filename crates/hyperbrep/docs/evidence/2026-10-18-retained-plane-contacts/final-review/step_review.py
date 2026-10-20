"""Audit the existing native consumer's selected STEP boundary checks."""
import hashlib,json
from pathlib import Path
import sys
OUT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import hashes
source=hashes()
latest={r['label']:r for r in json.loads((OUT/'attempts.json').read_text())}
consumer=json.loads((OUT/'consumers.json').read_text())
assert consumer['source']==source
row=latest['new-consumer-step']
assert row['exit_code']==0 and json.loads((OUT/row['source']).read_text())==source
rows=[line for line in (OUT/row['log']).read_text().splitlines() if line.startswith('plane_contact_step_case=')]
assert rows == [f'plane_contact_step_case={case} replay={replay} outcome={kind} body=true entity=true native_recovery=true' for case,kind in [('cube','UnmaterializedPoint'),('parallel_cap','NonRational')] for replay in ['false','true']]
inputs={str(p.relative_to(OUT)):hashlib.sha256(p.read_bytes()).hexdigest() for p in (OUT/'consumer-project').iterdir() if p.is_file()}
report=dict(source=source,rows=rows,checks=[latest[name] for name in ['new-consumer-clippy','new-consumer-build','new-consumer-all','new-consumer-step']],binary=consumer['binaries']['new_native'],inputs=inputs,scope='Native source-path STEP boundary: represented unsplit cube succeeds; selected-contact cube rejects UnmaterializedPoint and the nonlinear parallel cap rejects NonRational, both with body/entity attribution before/after cold replay, then native classification and self-subtraction recover. Not a new STEP encoding or independent-reader claim.')
(OUT/'step-review.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(dict(rows=rows),indent=2))
