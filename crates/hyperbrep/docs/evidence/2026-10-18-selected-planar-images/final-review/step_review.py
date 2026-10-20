"""Supplemental actual STEP consumer of a newly admitted selected solid."""
import hashlib,json
from pathlib import Path
import sys
OUT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import hashes,run
source=hashes();probe=Path(__file__).with_name('step-probe')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inputs={str(p.relative_to(OUT)):sha(p) for p in [Path(__file__),*probe.glob('*')] if p.is_file()}
manifest=str(probe/'Cargo.toml')
commands=[('selected-step-format',['cargo','fmt','--manifest-path',manifest,'--','--check']),('selected-step-clippy',['cargo','clippy','--release','--offline','--locked','--manifest-path',manifest,'--','-D','warnings']),('selected-step-runtime',['cargo','run','--release','--offline','--locked','--manifest-path',manifest])]
for label,command in commands:
 assert run(label,command,900)==0,label
assert hashes()==source and all(sha(OUT/p)==h for p,h in inputs.items())
latest={r['label']:r for r in json.loads((OUT/'attempts.json').read_text())}
rows=[line for line in (OUT/latest['selected-step-runtime']['log']).read_text().splitlines() if line.startswith('selected_step_case=')]
assert len(rows)==2 and all('body=true entity=true native_recovery=true' in r for r in rows)
binary=Path('/tmp/hyperbrep-review-target/release/hyperbrep-selected-planar-step-review')
(OUT/'step-review.json').write_text(json.dumps(dict(source=source,inputs=inputs,checks=[latest[label] for label,_ in commands],rows=rows,binary=dict(path=str(binary),sha256=sha(binary),bytes=binary.stat().st_size),scope='Supplemental native source-path STEP consumer before and after selected-solid cold replay. Typed encoding failure has body/entity attribution; original bytes, classification and subsequent empty-set composition remain usable. No new STEP encoding, performance or additional WASM claim.'),indent=2)+'\n')
print(json.dumps(dict(passed=True,rows=rows),indent=2))
