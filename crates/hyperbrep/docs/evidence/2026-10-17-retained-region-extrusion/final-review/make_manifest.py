"""Bind the complete diagnostic record and the next implementation decision."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
baseline = json.loads((OUT/'baseline.json').read_text())
assert hashes() == baseline['source']
documents = ['crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json']
record = dict(baseline=baseline['revision'], upstream=baseline['upstream'],
    source_identity=baseline['source_identity'], contract='contract.md', frontier='frontier.json',
    reconstruction='source-reconstruction.json',
    evidence_files={str(p.relative_to(OUT)): sha(p) for p in sorted(OUT.rglob('*'))
                    if p.is_file() and p.name not in ['manifest.json', 'audit.json', 'audit.log']},
    documents={name: sha(ROOT/name) for name in documents},
    scope='Seven source-path diagnostics; six typed unsupported results and one already-supported native control. No runtime/API change, new capability, complete continuation, STEP or release claim.')
(OUT/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
print('Bound', len(record['evidence_files']), 'diagnostic evidence files.', flush=True)
