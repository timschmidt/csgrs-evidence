from collections import Counter
from pathlib import Path
import gzip
import hashlib
import json

raw = Path(__file__).resolve().parent
source = raw / 'held-analysis-positive-1792963759670984687/positive-held-stacks.txt.gz'
meta = json.loads((source.parent / 'command.json').read_text())
weights = Counter()
digest = hashlib.sha256()
size = 0
with gzip.open(source, 'rb') as inp:
    for line in inp:
        digest.update(line)
        size += len(line)
        value = int(line.rstrip(b'\n').rsplit(b' ', 1)[1])
        assert value > 0
        weights[value] += 1
assert size == meta['positive_stack_bytes']
assert digest.hexdigest() == meta['positive_stack_sha256']
decoded = Counter()
for line in (raw / 'raw-decode-1792964177399997447/nano/live.tsv').read_text().splitlines():
    fields = line.split('\t')
    if fields[0] == 'trace':
        continue
    decoded[int(fields[1])] += 1
assert weights == decoded
assert sum(weights.values()) == 61335
result = {'source': str(source.relative_to(raw)),
          'source_compressed_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
          'expanded_sha256': digest.hexdigest(), 'expanded_bytes': size,
          'weights': sorted(weights.items()), 'positive_traces': sum(weights.values()),
          'live_bytes': sum(value * count for value, count in weights.items()),
          'matches_complete_decoder': True,
          'scope': 'Exact weight multiset extracted from the preserved official Heaptrack positive-stack report. Full trace establishes completeness; the interrupted text alone does not. This compact derivative preserves the independent comparison without archiving repeated stack text.'}
(raw / 'official-positive-weights.json').write_text(json.dumps(result, indent=2) + '\n')
print('OFFICIAL WEIGHTS', result['positive_traces'], result['live_bytes'], len(weights))
