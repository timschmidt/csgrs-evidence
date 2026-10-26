from pathlib import Path
import hashlib
import json
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/home/tim/Documents/GitHub/workspace/csgrs')
private = Path('/tmp/csgrs-r18-trace')
base = json.loads((raw / 'baseline-sources.json').read_text())
candidate = json.loads((raw / 'native-candidate-sources.json').read_text())
for name, expected in base.items():
    assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected, name
for name in ['cost-final', 'workflow-final']:
    path = Path(json.loads((raw / ('latest-' + name + '.json')).read_text())['record'])
    assert json.loads((path / 'metadata.json').read_text())['complete']
    assert (path / 'analysis.json').exists()
assert json.loads((raw / 'latest-private-compatibility.json').read_text())['sources_unchanged']
assert not (root / 'tests/compound_rotations.rs').exists()
record = raw / ('primary-retention-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'status-before.txt').write_text(subprocess.check_output(['git', 'status', '--short'], cwd=root, text=True))
names = ['crates/hyperreal/src/computable/node/' + name for name in
         ['ring_product_sum.rs', 'ring_quotient_reduction.rs', 'ring_relations.rs', 'ring_product_sum_tests.rs']]
for name in names:
    data = (private / name).read_bytes()
    assert hashlib.sha256(data).hexdigest() == candidate[name], name
    target = record / 'before' / name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes((root / name).read_bytes())
    (root / name).write_bytes(data)
(root / 'tests/compound_rotations.rs').write_bytes((raw / 'retained-compound-rotations.rs').read_bytes())
after = {name: hashlib.sha256((root / name).read_bytes()).hexdigest()
         for name in [*names, 'tests/compound_rotations.rs']}
(record / 'completion.json').write_text(json.dumps({'files': after,
    'basis': 'Original exact-completion gain with disclosed adverse and inconclusive costs. Final combined-primary validation is required before completing admission.',
    'runtime_matches_measured_candidate': True}, indent=2) + '\n')
(raw / 'latest-primary-retention.json').write_text(json.dumps({'record': str(record), 'files': after}, indent=2) + '\n')
print('R18 CANDIDATE COPIED FOR FINAL PRIMARY VALIDATION', record)
