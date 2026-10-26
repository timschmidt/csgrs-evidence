from pathlib import Path
import hashlib
import json
import math
import statistics
import sys

from scipy.stats import t

record = Path(sys.argv[1]).resolve()
meta = json.loads((record / 'metadata.json').read_text())
assert meta['complete'] and meta['purpose'] in ['pilot', 'final']
assert meta['protected_metrics'] == 64
pairs = meta['pairs']
assert pairs > 1
rows = []
for kind in range(8):
    for policy in ['strict', 'approximate']:
        cell = f'{kind}-{policy}'
        records = {}
        for pair in range(pairs):
            for variant in ['baseline', 'candidate']:
                path = record / f'pair-{pair:02}' / f'{variant}-{cell}.jsonl'
                records[pair, variant] = [json.loads(line) for line in path.read_text().splitlines()]
        for phase in ['cold', 'warm']:
            for metric, aggregate in [('median', statistics.median), ('maximum', max)]:
                samples = {v: [aggregate(r['ns'] / r['iterations'] for r in records[pair, v] if r['phase'] == phase)
                               for pair in range(pairs)] for v in ['baseline', 'candidate']}
                logs = [math.log(b / a) for a, b in zip(samples['baseline'], samples['candidate'])]
                mean = statistics.mean(logs)
                sd = statistics.stdev(logs)
                se = sd / math.sqrt(pairs)
                marginal = t.ppf(1 - .05 / 2, pairs - 1) * se
                simultaneous = t.ppf(1 - .05 / (2 * 64), pairs - 1) * se
                row = {'kind': kind, 'policy': policy, 'phase': phase, 'metric': metric,
                       'ratio': math.exp(mean), 'paired_log_sd': sd,
                       'marginal_95': [math.exp(mean - marginal), math.exp(mean + marginal)],
                       'simultaneous_95': [math.exp(mean - simultaneous), math.exp(mean + simultaneous)],
                       'baseline_median_ns': statistics.median(samples['baseline']),
                       'candidate_median_ns': statistics.median(samples['candidate']),
                       'baseline_samples_ns': samples['baseline'], 'candidate_samples_ns': samples['candidate']}
                rows.append(row)
assert len(rows) == 64
result = {'record': str(record), 'purpose': meta['purpose'], 'pairs': pairs, 'metrics': rows,
          'method': 'Paired log-ratio Student t; marginal95% and two-sided Bonferroni simultaneous95% over64predeclared metrics',
          'upper_exceeds_one': sum(row['simultaneous_95'][1] > 1 for row in rows),
          'marginal_adverse': sum(row['marginal_95'][0] > 1 for row in rows),
          'simultaneous_adverse': sum(row['simultaneous_95'][0] > 1 for row in rows),
          'literal_performance_gate_pass': all(row['simultaneous_95'][1] <= 1 for row in rows),
          'scope': 'Only matched completed predicate contracts. Completeness of the new original binary64 geometry workflow is a separate gate; failing that workflow faster is not a speedup.'}
(record / 'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'analysis.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: v for k, v in result.items() if k != 'metrics'}, indent=2))
for row in rows:
    if row['simultaneous_95'][0] > 1:
        print(json.dumps({k: v for k, v in row.items() if not k.endswith('samples_ns')}))
