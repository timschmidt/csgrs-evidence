from pathlib import Path
from collections import Counter
import gzip
import hashlib
import json
import re
import subprocess

raw = Path(__file__).resolve().parent
record = Path(json.loads((raw / 'latest-raw-decode.json').read_text())['record'])
folder = record / 'nano'
counts = json.loads((folder / 'decode.stdout').read_text())
symbols = {}
for line in (folder / 'symbols.tsv').read_text().splitlines():
    index, symbol = line.split('\t', 1)
    symbols[int(index)] = symbol
ids = sorted(symbols)
cmd = ['c++filt', '-s', 'rust']
proc = subprocess.run(cmd, input='\n'.join(symbols[i] for i in ids) + '\n', text=True,
                      stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=120)
assert proc.returncode == 0, proc.stderr
names = proc.stdout.splitlines()
assert len(names) == len(ids)
resolved = {i: re.sub(r'\[[0-9a-f]+\]', '', text) for i, text in zip(ids, names)}
(folder / 'demangled-symbols.json').write_text(json.dumps(resolved, indent=2) + '\n')
(folder / 'demangler.json').write_text(json.dumps({'command': cmd, 'version': subprocess.check_output(['c++filt', '--version'], text=True), 'symbols': len(ids), 'stderr': proc.stderr}, indent=2) + '\n')
crates = ['hyperreal', 'hyperlattice', 'hyperlimit', 'hypersolve', 'hypercurve',
          'hypermesh', 'hypertri', 'hyperbrep', 'hyperdrc', 'hypercircuit', 'hyperphysics', 'hyperspatial']
prefixes = tuple(prefix for crate in crates for prefix in (crate + '::', '<' + crate + '::'))
frames = {0: []}
for line in (folder / 'frames.tsv').read_text().splitlines():
    fields = list(map(int, line.split('\t')))
    frames[fields[0]] = [resolved[i] for i in fields[1:]]
origins, laurents = {0: None}, {0: False}
for line in (folder / 'nodes.tsv').read_text().splitlines():
    node, ip, parent = map(int, line.split('\t'))
    assert parent in origins
    origins[node] = next((f for f in frames[ip] if f.startswith(prefixes)), origins[parent])
    laurents[node] = laurents[parent] or any('pi_laurent' in f for f in frames[ip])
exclusive, sites = Counter(), Counter()
total = inclusive_laurent = blocks = 0
weights = Counter()
for line in (folder / 'live.tsv').read_text().splitlines():
    trace, value, number = map(int, line.split('\t'))
    total += value
    blocks += number
    weights[value] += 1
    if laurents[trace]:
        inclusive_laurent += value
    project = origins[trace]
    if project is None:
        category = 'no recognized project frame'
    elif project.startswith(('hyperreal::', '<hyperreal::')):
        if any(name in project for name in ['retain_linear', 'retain_negation_entry', 'retain_inverse_entry', 'retain_square_reduction']):
            category = 'Hyperreal rational derived cache records'
        elif 'EvaluationCache' in project:
            category = 'Hyperreal Computable evaluation cache'
        elif 'rational::' in project:
            category = 'Hyperreal rational arithmetic/value storage'
        else:
            category = 'Hyperreal other scalar work'
    else:
        category = next(crate for crate in crates if project.startswith((crate + '::', '<' + crate + '::')))
    exclusive[category] += value
    sites[project or '[none]'] += value
assert total == counts['live_bytes'] == sum(exclusive.values())
assert blocks == counts['live_blocks']
# Independent Heaptrack output was interrupted only after long runs of zero
# weight stacks. Compare its retained positive-weight multiset to the COMPLETE
# event decoder, so the truncated text alone is never a completeness oracle.
partial = raw / 'held-analysis-positive-1792963759670984687/positive-held-stacks.txt.gz'
printed_weights = Counter()
with gzip.open(partial, 'rt') as inp:
    for line in inp:
        value = int(line.rstrip('\n').rsplit(' ', 1)[1])
        assert value > 0
        printed_weights[value] += 1
assert printed_weights == weights
result = {'counts': counts, 'exclusive_allocation_origins': exclusive.most_common(),
          'sites': sites.most_common(), 'inclusive_pi_laurent_bytes': inclusive_laurent,
          'independent_heaptrack_positive_weight_multiset_matches': True,
          'matched_positive_traces': sum(weights.values()),
          'scope': 'Complete event replay, all allocation origins exclusive by innermost project frame. This is allocation-site attribution, not a complete semantic ownership graph. Inclusive Laurent weight overlaps the exclusive categories. Heaptrack end-live occurs after process::exit handling; Rust stage snapshots precede that handling and exclude C/system allocations.'}
(record / 'attribution.json').write_text(json.dumps(result, indent=2) + '\n')
(record / 'attribution-driver.py').write_bytes(Path(__file__).read_bytes())
(raw / 'latest-held-analysis.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print(json.dumps({k: v for k, v in result.items() if k != 'sites'}, indent=2))
