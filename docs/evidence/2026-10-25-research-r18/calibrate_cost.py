from pathlib import Path
import hashlib
import json
import math
import statistics
import time

raw = Path(__file__).resolve().parent
record = Path(json.loads((raw / 'latest-cost-baseline-check.json').read_text())['record'])
meta = json.loads((record / 'metadata.json').read_text())
assert meta['complete'] and meta['purpose'] == 'baseline-check'
batches = {}
medians = {}
for kind in range(8):
    for policy in ['strict', 'approximate']:
        cell = f'{kind}-{policy}'
        rows = [json.loads(line) for line in (record / 'pair-00' / f'baseline-{cell}.jsonl').read_text().splitlines()]
        medians[cell] = {}
        batches[cell] = {}
        for phase in ['cold', 'warm']:
            median = statistics.median(row['ns'] / row['iterations'] for row in rows if row['phase'] == phase)
            assert median > 0
            requested = max(8, 2 ** math.ceil(math.log2(20_000_000 / median)))
            count = min(2048 if phase == 'cold' else 65536, requested)
            medians[cell][phase] = median
            batches[cell][phase] = count
result = {'created_ns': time.time_ns(), 'baseline_record': str(record),
          'baseline_metadata_sha256': hashlib.sha256((record / 'metadata.json').read_bytes()).hexdigest(),
          'baseline_medians_ns': medians, 'batches': batches,
          'rule': 'Baseline-only functional medians;20ms target rounded up to power of two;min8,max2048cold/max65536warm. Frozen before pilot and final, no candidate timings used.'}
output = raw / 'cost-batches.json'
assert not output.exists()
output.write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
