"""Summarize complete checks and costs; retain every adverse observation."""
import hashlib
import json
from pathlib import Path
import re
import statistics
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes
from source_binding import admit

read = lambda p: json.loads((OUT / p).read_text())
write = lambda p, v: (OUT / p).write_text(json.dumps(v, indent=2) + '\n')
source = hashes()
attempts = read('attempts.json')
latest = lambda label: next(r for r in reversed(attempts) if r['label'] == label)
drivers = read('qualification-drivers.json')
driver = drivers[-1]
expected_blockers = {'inherited-zero-factor-default', 'inherited-zero-factor-all-features'}
assert set(driver['failures']) == expected_blockers and read('finish-checks-driver.json')['passed']
labels = list(dict.fromkeys(label for d in drivers for label in d['executed'] if label not in expected_blockers)) + [
    'continuation-build', 'preceding-frontier', 'prism-occt', 'torus-growth', 'frontier-extension',
    'reconstruction-continuation', 'benchmark-build', 'benchmarks',
    'dependency-build', 'rounding-build', 'dependency-costs']
supplemental_formatter = latest('final-included-fmt')
assert supplemental_formatter['exit_code'] == 1 and supplemental_formatter['source_unchanged']
admit(supplemental_formatter, source)
formatter_review = read('included-format-review.json')
assert formatter_review['source'] == source and formatter_review['same_formatter_edits']
assert formatter_review['additional_files_check']['exit_code'] == 0
labels += sorted({r['label'] for r in attempts
    if r['label'].startswith(('final-', 'cone-continuation-')) and r['label'] != 'final-included-fmt'})
qualification = [latest(label) for label in labels]
bindings = {}
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    bindings[row['label']] = admit(row, source)
counts = {}
for label in [row['label'] for row in qualification if row['command'][:2] == ['cargo', 'test']]:
    groups = re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                        (OUT / latest(label)['log']).read_text(), re.M)
    assert groups
    counts[label] = dict(zip(['passed', 'failed', 'ignored'], [sum(int(x[i]) for x in groups) for i in range(3)]))
    assert counts[label]['failed'] == 0
assert counts['native-debug'] == counts['native-release']
assert counts['native-debug']['passed'] == 534 and counts['native-minimal']['passed'] == 526
assert counts['scalar-all-features']['passed'] == counts['scalar-minimal']['passed'] == 17
assert read('continuation-admission.json')['passed'] and read('feature-graph-admission.json')['passed']
assert read('dependency-summary.json')['preserved_test_outcomes']
assert read('benchmark-v1/receipt-admission.json')['passed']
assert not read('benchmark-v1/observed-receipt-migrations.json')
bindings['benchmark-inputs'] = admit(dict(source='benchmark-v1/source.json', source_unchanged=True), source)
assert read('growth-summary.json')['source'] == source
costs = [dict(corpus=p.name.removesuffix('-costs.json'), **r)
         for p in sorted((OUT / 'benchmark-v1').glob('*-costs.json')) for r in json.loads(p.read_text())]
commands = read('benchmark-v1/commands.json')
matched = [r for r in costs if 'ratio' in r]
new = [r for r in costs if 'ratio' not in r]
assert len(matched) == 172 and len(new) == 3 and len(commands) == 108
assert all(r['exit_code'] == 0 for r in commands)
allocations = []
for row in matched:
    a, b = row.get('baseline_allocation_per_iteration'), row.get('candidate_allocation_per_iteration')
    if a is not None and a != b:
        allocations.append(dict(corpus=row['corpus'], case=row['case'], baseline=a, candidate=b,
            delta={k: b[k]-a[k] for k in a}, increases=any(b[k] > a[k] for k in a)))
exes = read('benchmark-v1/executables.json')
assert set(exes['candidate']) == set(exes['baseline']) and len(exes['candidate']) == 18
sizes, resources = [], []
for name, a in sorted(exes['baseline'].items()):
    b = exes['candidate'][name]
    assert a['features'] == b['features']
    for exe in [a, b]:
        data = Path(exe['path']).read_bytes()
        assert len(data) == exe['bytes'] and hashlib.sha256(data).hexdigest() == exe['sha256']
    sizes.append(dict(corpus=name, baseline_bytes=a['bytes'], candidate_bytes=b['bytes'],
                      delta_bytes=b['bytes']-a['bytes'], same_case_inventory=name != 'sectors', same_preflight=name != 'edge_images'))
    item = dict(corpus=name, same_case_inventory=name != 'sectors', same_preflight=name != 'edge_images')
    for side in ['baseline', 'candidate']:
        rows = [read(f'benchmark-v1/{name}-{side}-{trial}-resources.json') for trial in range(1, 4)]
        assert all(r['wait_status'] == 0 for r in rows)
        item[side] = {field: statistics.median(r[field] for r in rows)
                      for field in ['max_rss_kib', 'user_seconds', 'system_seconds']}
    resources.append(item)
wasm = json.loads((OUT / latest('wasm-runtime')['log']).read_text())
assert wasm['probe_groups'] == 103 and wasm['imports'] == 0
baseline_wasm = json.loads((OUT.parent / '2026-10-17-curved-continuation/wasm-runtime-1.log').read_text())
summary = dict(cases=175, matched_cases=172, new_cases=3, corpora=18, processes=108,
    exact_receipts_preserved=True, unchanged_receipts=172, costs=costs,
    median_case_ratio=statistics.median(r['ratio'] for r in matched),
    maximum_case_ratio=max(r['ratio'] for r in matched),
    adverse_timing_rows=[r for r in matched if r['ratio'] > 1.10], changed_allocation_rows=allocations,
    increased_allocation_rows=[r for r in allocations if r['increases']],
    binary_sizes=sizes, process_resources=resources,
    wasm=dict(baseline=baseline_wasm, candidate=wasm, delta_bytes=wasm['wasm_bytes']-baseline_wasm['wasm_bytes'], same_probe_inventory=False,
        existing_group_migration='The shared edge-image group also runs the explicit positive-proof and unresolved-control fixture migration. Preserved group counts do not mean identical test work; runtime totals are qualification observations, not a matched speed comparison.'),
    scope='All 172 original completed workloads, exact assertions, iteration counts, materialization and cache states; three alternating process pairs per corpus. Three new successful cone workflows have absolute costs only. Sector process resources/size include additional cases. WASM adds nine groups. Edge-image preflight adds the explicit uncertainty-fixture migration outside measured cases; process resources include it. Shared host, CPU 0; no simultaneous builds/tests. Allocation requests and process RSS are not retained-heap bounds; harness sizes are not package sizes. A median of case ratios is not an aggregate speedup.')
write('benchmark-summary.json', summary)
write('qualification-summary.json', dict(source=source, source_admissions=bindings, commands=qualification, tests=counts,
    supplemental_formatter_failure=dict(command=supplemental_formatter, baseline_review='included-format-review.json',
        scope='The standalone included-file audit retains 97 byte-identical inherited algebra.rs formatting edits. Seven other affected included files pass their explicit formatter check. This is separate from the passed repository cargo fmt command; no unrelated formatting is changed.'),
    wasm=wasm, continuation=read('continuation-frontier.json')['counts'],
    prisms=read('prism-frontier.json')['counts'], exact_artifacts=len(read('preserved-artifacts.json')),
    limitations=['Inherited external-crate zero-factor debug failures remain open.',
        'Supplemental standalone algebra.rs formatting differences reproduce identically on the pinned baseline; the failed check is retained.',
        'No package, MSRV, actual C/Python/JS binding, coverage, formal proof, ASan, runtime fuzz, lexicase or full pre-push admission.',
        'Shared-host costs and finite growth observations do not close earlier performance/resource gates.',
        'All 28 work packages remain open or in progress; no push.']))
write('final-source.json', source)
print(json.dumps(dict(tests=counts, cases=len(costs), processes=len(commands),
    median_case_ratio=summary['median_case_ratio'], maximum_case_ratio=summary['maximum_case_ratio'],
    adverse_timing_rows=len(summary['adverse_timing_rows']), increased_allocation_rows=len(summary['increased_allocation_rows'])), indent=2))
