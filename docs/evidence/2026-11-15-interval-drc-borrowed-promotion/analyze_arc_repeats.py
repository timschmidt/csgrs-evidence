from pathlib import Path
import difflib
import hashlib
import json
import statistics
import sys
sys.dont_write_bytecode = True
from analyze_owner_benchmarks import parse_line, self_check

self_check()
s = Path(__file__).parent
assert len(sys.argv) <= 2
p = s / (sys.argv[1] if len(sys.argv) == 2 else 'arc-controlled-repeats')
method = json.loads((p / 'method.json').read_text())
rows = json.loads((p / 'complete.json').read_text())
measured = [r for r in rows if r['phase'] == 'measured']
assert len(measured) == len(method['measured_order']) and all(r['exit_code'] == 0 for r in rows)
assert [r['label'] for r in measured] == method['measured_order']
assert [r['label'] for r in rows if r['phase'] == 'warmup'] == method['warmup']
parsed = []
for row in measured:
    raw = (p / row['log_file']).read_bytes()
    assert hashlib.sha256(raw).hexdigest() == row['log_sha256']
    parsed.append([parse_line(line) for line in raw.decode().splitlines()])
reference = [r['timing_masked'] for r in parsed[0]]
diffs = []
for execution, lines in zip(measured, parsed):
    normalized = [r['timing_masked'] for r in lines]
    if normalized != reference:
        diffs.append({'execution': execution['log_file'], 'diff': list(difflib.unified_diff(reference, normalized, lineterm=''))})
metrics = []
if not diffs:
    for line_index, line in enumerate(parsed[0]):
        for metric_index, field in enumerate(line['timings']):
            values = {'baseline': [], 'candidate': []}
            sequence = []
            for execution, lines in zip(measured, parsed):
                current = lines[line_index]['timings'][metric_index]
                assert current['field'] == field['field']
                value = float(current['nanoseconds'])
                values[execution['label']].append(value)
                sequence.append((execution['label'], value))
            b, c = values['baseline'], values['candidate']
            ratios = []
            for pair_index in range(0, len(sequence), 2):
                pair = dict(sequence[pair_index:pair_index + 2])
                ratios.append(pair['candidate'] / pair['baseline'] if pair['baseline'] else None)
            metrics.append({'workload': line['timing_masked'], 'field': field['field'], 'values_ns': values, 'mean_ratio': statistics.mean(c) / statistics.mean(b) if statistics.mean(b) else None, 'median_ratio': statistics.median(c) / statistics.median(b) if statistics.median(b) else None, 'adjacent_pair_ratios': ratios, 'candidate_range_entirely_slower': min(c) > max(b)})
cpu = {label: [r['children_cpu_seconds'] for r in measured if r['label'] == label] for label in ['baseline', 'candidate']}
result = {'measured_executions': len(measured), 'warmup_executions_retained_excluded': len(rows) - len(measured), 'non_timing_output_identical': not diffs, 'non_timing_differences': diffs, 'children_cpu_seconds': cpu, 'cpu_mean_ratio': statistics.mean(cpu['candidate']) / statistics.mean(cpu['baseline']), 'cpu_median_ratio': statistics.median(cpu['candidate']) / statistics.median(cpu['baseline']), 'timing_fields': metrics, 'limitations': 'Descriptive repeated measurements with balanced order and fixed CPU affinity. No automatic acceptance or statistical nonregression claim. Runtime comparisons do not establish exact geometry; all raw output remains retained.'}
(p / 'analysis.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: result[k] for k in ['measured_executions', 'non_timing_output_identical', 'cpu_mean_ratio', 'cpu_median_ratio']}))
for metric in metrics:
    if metric['field'] == 'in':
        print(metric['workload'].split(':')[0], 'mean_ratio', metric['mean_ratio'], 'median_ratio', metric['median_ratio'], 'ranges_separated_slower', metric['candidate_range_entirely_slower'])
