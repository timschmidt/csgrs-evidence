from pathlib import Path
import json, hashlib, statistics, re
from collections import Counter
import numpy as np

root = Path(__file__).resolve().parent
import sys
run = root / (sys.argv[1] if len(sys.argv) > 1 else 'paired-1792942672225370576')
meta = json.loads((run / 'metadata.json').read_text())
assert meta['complete'] and meta['pairs'] == 30
journal = [json.loads(x) for x in (run / 'runs.jsonl').read_text().splitlines()]
assert len(journal) == 6720
assert all(x['status'] == 0 for x in journal if x['event'] == 'finish')
rng = np.random.default_rng(20261025)
resamples = rng.integers(0, 30, size=(20000, 30))

def stats(a, b):
    a, b = np.array(a, dtype=float), np.array(b, dtype=float)
    assert len(a) == len(b) == 30 and np.all(a > 0) and np.all(b > 0)
    logs = np.log(b / a)
    ci = np.exp(np.quantile(np.mean(logs[resamples], axis=1), [0.025, 0.975]))
    return {'baseline_median_ns': float(np.median(a)), 'candidate_median_ns': float(np.median(b)),
            'paired_geometric_ratio': float(np.exp(np.mean(logs))), 'bootstrap_95_ci': ci.tolist()}

def artifact_hash(data):
    h = 14695981039346656037
    for b in data:
        h = ((h ^ b) * 1099511628211) & ((1 << 64) - 1)
    return str(h)

counts = {'baseline': Counter(), 'candidate': Counter()}
cells = []
old_artifact_pairs = old_row_pairs = 0
artifact_inventory = {}
new_kinds = {6, 7, 8, 9, 10}
names = ['line_hull', 'cubic_hull', 'cubic_tangent', 'cubic_escape', 'rational_hull',
         'rational_monotone', 'rational_tangent', 'rational_escape', 'selected_trim_tangent',
         'irrational_quartic_escape', 'finite_trim_beside_pole', 'analytic_unsupported',
         'periodic_rational', 'whole_source_pole']
for kind in range(14):
    for direction in ['forward', 'reverse']:
        for policy in ['strict', 'approximate']:
            all_rows = {'baseline': [], 'candidate': []}
            for pair in range(30):
                artifacts = {}
                for variant in ['baseline', 'candidate']:
                    stem = run / f'pair-{pair:02}' / f'{variant}-{kind:02}-{direction}-{policy}'
                    rows = [json.loads(x) for x in stem.with_suffix('.jsonl').read_text().splitlines()]
                    assert len(rows) == 20
                    assert all(row['sample'] == i and row['kind'] == kind and row['policy'] == policy
                               and row['reversed'] == (direction == 'reverse')
                               and row['certainty'] == 'Certified' for i, row in enumerate(rows))
                    assert stem.with_suffix('.stderr').read_bytes() == b''
                    data = stem.with_suffix('.artifact.json').read_bytes()
                    artifacts[variant] = data
                    artifact_inventory[str(stem.with_suffix('.artifact.json').relative_to(run))] = hashlib.sha256(data).hexdigest()
                    assert rows[0]['checksum'] == artifact_hash(data) and rows[0]['output_size'] == len(data)
                    counts[variant].update(row['status'] for row in rows)
                    all_rows[variant].append(rows)
                if kind not in new_kinds:
                    assert artifacts['baseline'] == artifacts['candidate']
                    old_artifact_pairs += 1
                    for a, b in zip(all_rows['baseline'][-1], all_rows['candidate'][-1]):
                        assert all(a[key] == b[key] for key in ['status', 'certainty', 'checksum', 'output_size'])
                        old_row_pairs += 1
            cell = {'kind': kind, 'name': names[kind], 'direction': direction, 'policy': policy,
                    'new_domain': kind in new_kinds, 'status': {}, 'query': {}, 'validation': {}, 'drop': {}, 'allocation': {}}
            for variant, processes in all_rows.items():
                cell['status'][variant] = dict(Counter(row['status'] for rows in processes for row in rows))
                assert all([row[key] for row in rows] == [row[key] for row in processes[0]]
                           for key in ['status', 'certainty', 'checksum', 'output_size'] for rows in processes)
                # These non-time sequences are stable across independent processes.
                fields = ['bytes', 'calls', 'peak_live_growth', 'result_live_delta',
                          'continuation_bytes', 'continuation_calls', 'retained_after_drop']
                sequences = {key: [row[key] for row in processes[0]] for key in fields}
                assert all([row[key] for row in rows] == sequences[key]
                           for key in fields for rows in processes), (kind, direction, policy, variant)
                assert sequences['retained_after_drop'][-5:] == [0] * 5
                cell['allocation'][variant] = sequences
            for category, field in [('query', 'ns'), ('validation', 'continuation_ns'), ('drop', 'drop_ns')]:
                for mode in ['cold', 'warm']:
                    values = {variant: [rows[0][field] if mode == 'cold' else statistics.median(row[field] for row in rows[1:])
                                        for rows in processes] for variant, processes in all_rows.items()}
                    measured = stats(values['baseline'], values['candidate'])
                    if kind in new_kinds:
                        measured.pop('paired_geometric_ratio')
                        measured.pop('bootstrap_95_ci')
                        measured['comparison'] = 'baseline blocker versus newly completed work; no speed ratio claim'
                    cell[category][mode] = measured
            cells.append(cell)

builds = meta['builds']
def section(build, name):
    return int(re.search(r'^' + re.escape(name) + r'\s+(\d+)\s', build['binary']['sections'], re.M).group(1))
binary = {'baseline_bytes': builds[0]['binary']['bytes'], 'candidate_bytes': builds[1]['binary']['bytes'],
          'file_delta_bytes': builds[1]['binary']['bytes'] - builds[0]['binary']['bytes'],
          'baseline_text_bytes': section(builds[0], '.text'), 'candidate_text_bytes': section(builds[1], '.text'),
          'text_delta_bytes': section(builds[1], '.text') - section(builds[0], '.text')}
adverse = [dict(kind=c['kind'], name=c['name'], direction=c['direction'], policy=c['policy'], mode=mode, **c['query'][mode])
           for c in cells if not c['new_domain'] for mode in ['cold', 'warm'] if c['query'][mode]['bootstrap_95_ci'][0] > 1]
result = {'run': str(run), 'counts': counts, 'total_query_outcomes': sum(sum(c.values()) for c in counts.values()),
          'old_exact_artifact_pairs': old_artifact_pairs, 'old_row_artifact_pairs': old_row_pairs,
          'per_sample_status_receipt_checksum_size_stable_across_30_processes': True,
          'bootstrap': {'resamples': 20000, 'seed': 20261025, 'method': 'percentile bootstrap of paired log ratios; warm per-process median of samples 1..19; unadjusted 95% intervals'},
          'binary': binary, 'adverse_old_query_cells': adverse, 'cells': cells,
          'limitations': ['native focused probe, not deployment size', 'no input construction timing',
                         'sample zero cold after input construction; later samples reuse source and validation caches',
                         'validation includes witness oracle, definition replay and serialization',
                         'drop timer covers returned result only, not source or artifact destruction',
                         'retained deltas include query and validation warming, and plateau over twenty samples is not a heap bound',
                         'typed failures have a Certified receipt for consumed decisions; they are not certified successful geometry',
                         'error and success latency are not comparable completed work']}
(run / 'analysis.json').write_text(json.dumps(result, indent=2) + '\n')
(run / 'artifact-sha256.json').write_text(json.dumps(artifact_inventory, indent=2) + '\n')
(run / 'analysis-driver.py').write_bytes(Path(__file__).read_bytes())
print(json.dumps({k:v for k,v in result.items() if k not in ['cells', 'limitations']}, indent=2))
