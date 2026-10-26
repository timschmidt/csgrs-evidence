from pathlib import Path
import json
import re
import statistics
import time

raw = Path(__file__).resolve().parent
record = Path(json.loads((raw / 'latest-cost-allocations.json').read_text())['record'])
meta = json.loads((record / 'metadata.json').read_text())
assert meta['complete'] and meta['pairs'] == 5
rows = []
for kind in range(8):
    for policy in ['strict', 'approximate']:
        for phase in ['cold', 'warm']:
            values = {}
            for variant in ['baseline', 'candidate']:
                samples = []
                for pair in range(meta['pairs']):
                    for line in (record / f'pair-{pair:02}' / f'{variant}-{kind}-{policy}.jsonl').read_text().splitlines():
                        row = json.loads(line)
                        if row['phase'] == phase:
                            samples.append({key: row[key] / row['iterations']
                                for key in ['bytes', 'calls', 'live_delta', 'peak_live_growth']})
                assert len(samples) == 35
                values[variant] = {key: {'min': min(row[key] for row in samples),
                    'median': statistics.median(row[key] for row in samples),
                    'max': max(row[key] for row in samples)} for key in samples[0]}
            rows.append({'kind': kind, 'policy': policy, 'phase': phase, **values})
result = {'created_ns': time.time_ns(), 'record': str(record), 'rows': rows,
    'scope': 'Five paired instrumented runs;35 batches per cell/variant,8 queries per batch. Requested bytes include full new realloc requests. Live and peak growth divided by batch count are batch-normalized, not individual-query peaks. Native timing is separate.',
    'queries': meta['total_measured_and_checked_queries']}
(raw / 'cost-allocation-summary.json').write_text(json.dumps(result, indent=2) + '\n')
(record / 'allocation-analysis-driver.py').write_bytes(Path(__file__).read_bytes())
before = json.loads((raw / 'latest-cost-build-baseline-native.json').read_text())
after = json.loads((raw / 'latest-cost-build-candidate-native.json').read_text())
def section(row, name):
    return int(re.search(r'^' + re.escape(name) + r'\s+(\d+)', row['sections'], re.M)[1])
summary = {'baseline_bytes': before['bytes'], 'candidate_bytes': after['bytes'],
    'file_delta': after['bytes'] - before['bytes'], 'baseline_text': section(before, '.text'),
    'candidate_text': section(after, '.text'), 'text_delta': section(after, '.text') - section(before, '.text'),
    'baseline_build': before['record'], 'candidate_build': after['record']}
(raw / 'cost-binary-size.json').write_text(json.dumps(summary, indent=2) + '\n')
print('R18 allocation analysis', result['queries'], 'checked queries;', summary)
