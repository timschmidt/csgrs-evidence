from pathlib import Path
import json
import math
import statistics
import sys
from scipy.stats import t

record = Path(sys.argv[1])
meta = json.loads((record / 'metadata.json').read_text())
assert meta['complete'] and set(meta['builds']) == {'baseline', 'candidate'}
(record / 'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
names = ['primary-sum', 'secondary-sum', 'tertiary-sum', 'primary-inverse',
         'tertiary-inverse', 'fourth-inverse', 'fifth-inverse', 'primary-negation',
         'tertiary-negation', 'fourth-negation', 'fifth-negation',
         'square-reduction', 'primary-product', 'wide-sum', 'wide-late-inverse',
         'wide-late-negation']
n = meta['pairs']
rows = {}
latency = []
rss = {'baseline': 0, 'candidate': 0}
for kind in range(16):
    for pair in range(n):
        for variant in ['baseline', 'candidate']:
            prefix = record / f'pair-{pair:02}/{variant}-{kind:02}'
            rows[variant, kind, pair] = [json.loads(s) for s in prefix.with_suffix('.jsonl').read_text().splitlines()]
            peak = int(next(s.split(':', 1)[1].strip() for s in prefix.with_suffix('.stderr').read_text().splitlines() if 'Maximum resident set size (kbytes)' in s))
            rss[variant] = max(rss[variant], peak)
        fields = ['kind', 'sample', 'cold_iterations', 'warm_iterations', 'exact']
        assert [{k: r[k] for k in fields} for r in rows['baseline', kind, pair]] == [{k: r[k] for k in fields} for r in rows['candidate', kind, pair]]
    if n > 1:
        for phase in ['cold', 'warm']:
            for stat, fn in [('median', statistics.median), ('maximum', max)]:
                def observations(variant):
                    return [fn(r[phase + '_ns'] / r[phase + '_iterations'] for r in rows[variant, kind, pair]) for pair in range(n)]
                a, b = observations('baseline'), observations('candidate')
                logs = [math.log(y / x) for x, y in zip(a, b)]
                center = statistics.mean(logs)
                sd = statistics.stdev(logs)
                se = sd / math.sqrt(n)
                def interval(level):
                    q = float(t.ppf(level, n - 1))
                    return [math.exp(center - q * se), math.exp(center + q * se)]
                latency.append({'case': names[kind], 'kind': kind, 'phase': phase, 'statistic': stat,
                                'ratio': math.exp(center), 'ci95': interval(.975),
                                'simultaneous_ci95': interval(1 - .05 / (2 * 64)),
                                'paired_log_sd': sd,
                                'baseline_median_ns': statistics.median(a),
                                'candidate_median_ns': statistics.median(b),
                                'baseline_process_ns': a, 'candidate_process_ns': b})
summary = {k: meta[k] for k in ['purpose', 'pairs', 'batches', 'total_measured_queries', 'exact_outcome_rows']}
summary['max_process_rss_kib'] = rss
summary['probe_sizes'] = {v: {'file_bytes': d['bytes'],
                             'text_bytes': int(next(s.split()[1] for s in d['sections'].splitlines() if s.split() and s.split()[0] == '.text')),
                             'sha256': d['sha256']} for v, d in meta['builds'].items()}
if latency:
    compact = lambda r: {k: v for k, v in r.items() if not k.endswith('process_ns')}
    summary.update(protected_metrics=len(latency),
                   literal_nonregression=all(r['simultaneous_ci95'][1] <= 1 for r in latency),
                   unproved_cells=[compact(r) for r in latency if r['simultaneous_ci95'][1] > 1],
                   marginal_adverse=[compact(r) for r in latency if r['ci95'][0] > 1],
                   simultaneous_adverse=[compact(r) for r in latency if r['simultaneous_ci95'][0] > 1])
    (record / 'latency.json').write_text(json.dumps(latency, indent=2) + '\n')
(record / 'analysis.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps({k: v for k, v in summary.items() if k not in ['batches', 'unproved_cells', 'marginal_adverse', 'simultaneous_adverse']}, indent=2))
if latency:
    print('ADVERSE', len(summary['marginal_adverse']), 'marginal', len(summary['simultaneous_adverse']), 'simultaneous; UNPROVED', len(summary['unproved_cells']))
