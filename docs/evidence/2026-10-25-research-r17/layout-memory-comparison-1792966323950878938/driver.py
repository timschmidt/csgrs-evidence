from pathlib import Path
import json
import re
import time

raw = Path(__file__).resolve().parent
record = raw / ('layout-memory-comparison-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
comparisons = []
for purpose, baseline_name in [('lifecycle', 'lifecycle-1792963112123410244'),
                               ('full-release', 'full-release-1792963628752395593')]:
    baseline = raw / baseline_name
    candidate = Path(json.loads((raw / ('latest-layout-memory-' + purpose + '.json')).read_text())['record'])
    for p in [baseline, candidate]:
        assert json.loads((p / 'completion.json').read_text())['status'] == 0
    def normalized(path):
        return re.sub(r'(?<![A-Za-z0-9])[0-9]+(?:\.[0-9]+)?(?:ns|µs|ms|s)(?![a-z])',
                      '<duration>', (path / 'run.stdout').read_text())
    a_text, b_text = normalized(baseline), normalized(candidate)
    (record / (purpose + '-baseline-normalized.stdout')).write_text(a_text)
    (record / (purpose + '-candidate-normalized.stdout')).write_text(b_text)
    assert a_text == b_text, purpose
    a = json.loads((baseline / 'snapshots.json').read_text())
    b = json.loads((candidate / 'snapshots.json').read_text())
    assert len(a) == len(b)
    rows = []
    for x, y in zip(a, b):
        assert x['stage'] == y['stage'] and x['repetition'] == y['repetition']
        row = {'stage': x['stage'], 'repetition': x['repetition']}
        for field in ['requested_bytes', 'live_bytes', 'peak_bytes', 'alloc_calls', 'realloc_calls', 'dealloc_calls']:
            row[field] = {'baseline': x[field], 'candidate': y[field],
                          'delta': y[field] - x[field],
                          'ratio': y[field] / x[field] if x[field] else None}
        rows.append(row)
    def rss(path):
        return int(next(s.split(':', 1)[1].strip() for s in (path / 'run.stderr').read_text().splitlines() if 'Maximum resident set size (kbytes)' in s))
    comparisons.append({'purpose': purpose, 'baseline': str(baseline), 'candidate': str(candidate),
                        'normalized_stdout_identical': True, 'memory': rows,
                        'max_rss_kib': {'baseline': rss(baseline), 'candidate': rss(candidate)}})
result = {'comparisons': comparisons,
          'scope': 'Identical diagnostic benchmark source, sequential builds in one checkout/target. Requested sizes include full new realloc size; Rust payload excludes allocator overhead and C allocations. Peaks are cumulative. RSS and duration are diagnostic, with earlier baseline background activity disclosed; no native speed claim.',
          'semantic_limit': 'Original Nano fixture completes. Printed layer geometry statistics, DRC findings, CAM/assembly issue counts and release blockers match; these are not an independent full-geometry oracle or the all-board golden snapshot. Independent scalar/predicate correctness is recorded separately.',
          'lifetime_limit': 'Two after-drop samples do not establish a heap bound or plateau.'}
(record / 'comparison.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-layout-memory-comparison.json').write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
for c in comparisons:
    print(c['purpose'], 'normalized output matches')
    for row in c['memory']:
        if row['stage'] in ['report-projected', 'after-all-drops']:
            print(row['stage'], row['repetition'], 'live', row['live_bytes'], 'peak', row['peak_bytes'])
print('R17 MEMORY COMPARISON COMPLETE', record)
