"""Require explicit review and complete evidence for the five known migrations."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, ROOT, hashes

read = lambda name: json.loads((OUT/name).read_text())
digest = lambda name: hashlib.sha256((OUT/name).read_bytes()).hexdigest()
source = hashes()
identity = hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest()
approval = read('approved-receipt-migrations.json')
assert approval['decision'] == 'approved exact representation migration'
assert approval['source_identity'] == identity
assert approval['migrations'] == read('benchmark-v1/observed-receipt-migrations.json')
assert len(approval['migrations']) == 5
assert approval['receipt_binding_sha256'] == digest('receipt-artifact-binding.json')
subprocess.run(['python3', str(Path(__file__).with_name('receipt_binding.py'))], cwd=ROOT, env=ENV, check=True)
assert approval['receipt_binding_sha256'] == digest('receipt-artifact-binding.json')
binding = read('receipt-artifact-binding.json')
assert binding['passed'] and binding['source_identity'] == identity
assert binding['archive_pairs'] == 173 and binding['non_scalar_changes'] == 0
assert binding['all_three_trials_bound']
gate = read('benchmark-v1/receipt-admission.json')
assert not gate['passed'] and gate['review'] is None
commands = read('benchmark-v1/commands.json')
assert len(commands) == 105 and all(r['exit_code'] == 0 for r in commands)
assert hashes() == source
result = dict(passed=True, source_identity=identity,
    approval_sha256=digest('approved-receipt-migrations.json'),
    binding_sha256=digest('receipt-artifact-binding.json'),
    original_gate_sha256=digest('benchmark-v1/receipt-admission.json'),
    unchanged_receipts=162, reviewed_receipts=5,
    scope='Exact feature/representation extension. Original raw no-migration gate remains failed; all five changes have explicit review, complete exact archive comparison and binding to every timed trial. No measured code, workload, source bytes, raw sample or former receipt is rewritten.')
(OUT/'receipt-review.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps(result, indent=2))
