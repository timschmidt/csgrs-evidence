"""Summarize completed, source-bound evidence without choosing retention."""
import hashlib
import json
from pathlib import Path
import re
import statistics
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes

read = lambda name: json.loads((OUT/name).read_text())
write = lambda name, value: (OUT/name).write_text(json.dumps(value, indent=2)+'\n')
source = hashes()
attempts = read('attempts.json')
latest = lambda label: [r for r in attempts if r['label'] == label][-1]
labels = ['native-debug', 'native-release', 'native-minimal', 'native-clippy',
          'native-minimal-clippy', 'rustdoc', 'analytic-example', 'faceted-example',
          'advanced-example', 'supplied-example', 'circular-example',
          'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
          'wasm-runtime', 'fmt', 'diff-check', 'diagnostic-build',
          'preceding-frontier', 'prism-occt', 'benchmark-build', 'benchmarks']
labels += [f'final-{family}-{rotation}' for family in ['cylinder', 'cone', 'torus']
           for rotation in ['identity', 'diagonal', 'rational']]
labels += sorted({r['label'] for r in attempts if r['label'].startswith('final-prism-')})
qualification = [latest(label) for label in labels]
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert read(row['source']) == source, row['label']
counts = {}
for label, expected in [('native-debug', 516), ('native-release', 516), ('native-minimal', 508)]:
    groups = re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                        (OUT/latest(label)['log']).read_text(), re.M)
    counts[label] = dict(zip(['passed', 'failed', 'ignored'],
                            [sum(int(x[i]) for x in groups) for i in range(3)]))
    assert counts[label] == dict(passed=expected, failed=0, ignored=0)
assert read('continuation-input-admission.json')['passed']
assert read('feature-graph-admission.json')['passed']
assert read('benchmark-v1/receipt-admission.json')['passed']
assert read('benchmark-v1/observed-receipt-migrations.json') == []
assert read('benchmark-v1/source.json') == source

costs = [dict(corpus=p.name.removesuffix('-costs.json'), **r)
         for p in sorted((OUT/'benchmark-v1').glob('*-costs.json'))
         for r in json.loads(p.read_text())]
commands = read('benchmark-v1/commands.json')
assert len(costs) == 167 and len(commands) == 102
assert all(r['exit_code'] == 0 for r in commands)
allocations = []
for row in costs:
    before, after = row.get('baseline_allocation_per_iteration'), row.get('candidate_allocation_per_iteration')
    if before is not None and before != after:
        allocations.append(dict(corpus=row['corpus'], case=row['case'], baseline=before,
            candidate=after, delta={key: after[key]-before[key] for key in before},
            increases=any(after[key] > before[key] for key in before)))
exes = read('benchmark-v1/executables.json')
assert set(exes['baseline']) == set(exes['candidate'])
sizes = []
for name in sorted(exes['baseline']):
    a, b = exes['baseline'][name], exes['candidate'][name]
    assert a['features'] == b['features']
    for executable in [a, b]:
        data = Path(executable['path']).read_bytes()
        assert len(data) == executable['bytes'] and hashlib.sha256(data).hexdigest() == executable['sha256']
    sizes.append(dict(corpus=name, baseline_bytes=a['bytes'], candidate_bytes=b['bytes'],
                      delta_bytes=b['bytes']-a['bytes']))
resources = []
for name in sorted(exes['baseline']):
    item = dict(corpus=name)
    for side in ['baseline', 'candidate']:
        rows = [read(f'benchmark-v1/{name}-{side}-{trial}-resources.json') for trial in range(1, 4)]
        assert all(r['wait_status'] == 0 for r in rows)
        item[side] = {field: statistics.median(r[field] for r in rows)
                      for field in ['max_rss_kib', 'user_seconds', 'system_seconds']}
    resources.append(item)
wasm = json.loads((OUT/latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups'] == 83 and wasm['imports'] == 0
baseline_wasm = read('baseline-wasm.json')
summary = dict(cases=167, matched_cases=167, corpora=17, processes=102,
    exact_receipts_preserved=True, costs=costs,
    median_case_ratio=statistics.median(r['ratio'] for r in costs),
    maximum_case_ratio=max(r['ratio'] for r in costs),
    adverse_timing_rows=[r for r in costs if r['ratio'] > 1.10],
    changed_allocation_rows=allocations,
    increased_allocation_rows=[r for r in allocations if r['increases']],
    binary_sizes=sizes, process_resources=resources,
    wasm=dict(baseline=baseline_wasm, candidate=wasm,
              delta_bytes=wasm['wasm_bytes']-baseline_wasm['bytes']),
    scope='Full original workloads, iteration counts, exact assertions, fresh/reused document states and output materialization. Three alternating pairs per corpus on a shared host. Allocator requests are cumulative, RSS is per complete process, and neither is a retained-heap bound. Harness sizes are not package sizes. Median across case ratios is descriptive, not an aggregate workload speedup. No timing row alone decides retention.')
write('benchmark-summary.json', summary)
write('qualification-summary.json', dict(source=source, commands=qualification,
    tests=counts, wasm=wasm, continuation=read('continuation-frontier.json')['counts'],
    prisms=read('prism-frontier.json')['counts'],
    exact_artifacts=dict(step=len(read('preserved-step-artifacts.json')),
                         prism=len(read('preserved-prism-artifacts.json'))),
    limitations=['Inherited upstream and scalar failures remain open and were not rerun for this BREP-only change.',
                 'No published-package, MSRV, actual C/Python/JS binding, coverage, formal proof, ASan, runtime fuzz, lexicase or full pre-push admission.',
                 'All 28 work packages remain open or in progress; no push.']))
write('final-source.json', source)
print(json.dumps(dict(cases=len(costs), processes=len(commands),
    median_case_ratio=summary['median_case_ratio'], maximum_case_ratio=summary['maximum_case_ratio'],
    adverse_timing_rows=len(summary['adverse_timing_rows']),
    changed_allocation_rows=len(allocations),
    increased_allocation_rows=len(summary['increased_allocation_rows']),
    native_size_delta_range=[min(r['delta_bytes'] for r in sizes), max(r['delta_bytes'] for r in sizes)],
    wasm_size_delta=summary['wasm']['delta_bytes']), indent=2))
