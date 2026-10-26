from pathlib import Path
import hashlib
import json
import sys
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r18-trace')
main = Path('/home/tim/Documents/GitHub/workspace/csgrs')
variant = sys.argv[1]
assert variant in ['baseline', 'candidate']
base = json.loads((raw / 'baseline-sources.json').read_text())
candidate = json.loads((raw / 'native-candidate-sources.json').read_text())
names = ['crates/hyperreal/src/computable/node/' + name for name in
         ['ring_product_sum.rs', 'ring_quotient_reduction.rs', 'ring_relations.rs']]
before = {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in names}
assert all(before[name] in [base[name], candidate[name]] for name in names)
for name in names:
    source = main / name if variant == 'baseline' else raw / 'native-candidate-runtime' / Path(name).name
    data = source.read_bytes()
    expected = base[name] if variant == 'baseline' else candidate[name]
    assert hashlib.sha256(data).hexdigest() == expected
    (root / name).write_bytes(data)
after = {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in names}
record = raw / ('cost-variant-' + variant + '-' + str(time.time_ns()) + '.json')
record.write_text(json.dumps({'variant': variant, 'before': before, 'after': after,
    'scope': 'Only the three private runtime files change; source tests and harness stay identical. Baseline builds do not compile the candidate-only internal cfg(test) controls.'}, indent=2) + '\n')
print('R18 PRIVATE VARIANT', variant, record)
