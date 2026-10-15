"""Verify the matching source snapshot and this increment's bounded claims."""

from pathlib import Path
import hashlib
import importlib.util
import json
import re
import statistics
import sys

directory = Path(__file__).resolve().parent
root = directory.parents[4]
manifest = json.loads((directory / 'manifest.json').read_text())
for key, base in [('source_sha256', root), ('artifact_sha256', directory)]:
    for relative, expected in manifest[key].items():
        actual = hashlib.sha256((base / relative).read_bytes()).hexdigest()
        assert actual == expected, (key, relative)

documents = [root / 'crates/hyperbrep/README.md', root / 'crates/hyperbrep/PERFORMANCE.md', directory / 'README.md']
documents.extend([root / 'crates/hypercurve/README.md', root / 'crates/hypercurve/PERFORMANCE.md'])
documents.extend((root / 'crates/hyperbrep/docs').glob('*.md'))
documents.extend((root / 'crates/hyperbrep/docs/architecture').glob('*.md'))
links = 0
for document in documents:
    for link in re.findall(r'\]\(([^)]+)\)', document.read_text()):
        if link.startswith(('http:', 'https:', '#')):
            continue
        target = link.split('#')[0]
        if target:
            assert (document.parent / target).resolve().exists(), (document, link)
            links += 1

ledger = json.loads((root / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
packages = ledger['work_packages']
assert len(packages) == 28 and len({package['id'] for package in packages}) == 28
assert not ledger['complete'] and not any(p['status'] == 'complete' for p in packages)
assert ledger['increments'][-1]['id'] == 'archive-input-admission'
json.loads((root / 'docs/properties-status.json').read_text())

commands = json.loads((directory / 'commands.json').read_text())
for name in ['tests', 'default-tests', 'clippy', 'docs', 'wasm', 'bench-build', 'release-selected-tests', 'fuzz-clippy', 'fmt', 'fuzz-fmt', 'final-tests', 'final-clippy', 'final-fmt', 'diff-check']:
    matching = [record for record in commands if record['name'] == name]
    assert matching and matching[-1]['exit_code'] == 0, name

benchmarks = json.loads((directory / 'benchmark-commands.json').read_text())
accepted = benchmarks
assert len(accepted) == 21 and all(record['exit_code'] == 0 for record in accepted)
controls = json.loads((directory / 'controls.json').read_text())
assert len(controls) == 4 and all(record['exit_code'] == 101 for record in controls)
for record in controls:
    log = (directory / 'controls' / (record['name'] + '.log')).read_text()
    assert record['expected_failure'] in log and 'test result: FAILED' in log
    assert record['restored_sha256'] == manifest['source_sha256'][record['source']]

spec = importlib.util.spec_from_file_location('benchmark_receipt', root / 'crates/hyperbrep/tools/benchmark_receipt.py')
receipt = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = receipt
spec.loader.exec_module(receipt)
expected = receipt.expected_cases((root / 'crates/hyperbrep/benches/kernel.rs').read_text())
assert len(expected) == 66
native = {kind: [receipt.read_receipt((directory / f'{kind}-{trial}.log').read_text(), expected) for trial in range(1, 4)] for kind in ['baseline', 'candidate']}
for rows in [*native['baseline'], *native['candidate']]:
    receipt.compare(native['baseline'][0], rows)
comparison = json.loads((directory / 'comparison.json').read_text())
assert comparison['all_66_receipts_equal']
assert len(comparison['cases']) == 66
ratios = []
for index, case in enumerate(comparison['cases']):
    baseline = statistics.median(rows[index].per_iteration_ns for rows in native['baseline'])
    candidate = statistics.median(rows[index].per_iteration_ns for rows in native['candidate'])
    assert case == dict(case=expected[index], baseline_median_ns=baseline, candidate_median_ns=candidate, ratio=candidate / baseline)
    ratios.append(candidate / baseline)
assert comparison['median_case_ratio'] == statistics.median(ratios)

for filename, trials in [('repeat-comparison.json', range(4, 7)), ('combined-comparison.json', range(1, 7))]:
    cohort = {kind: [receipt.read_receipt((directory / f'{kind}-{trial}.log').read_text(), expected) for trial in trials] for kind in ['baseline', 'candidate']}
    for rows in [*cohort['baseline'], *cohort['candidate']]:
        receipt.compare(native['baseline'][0], rows)
    comparison = json.loads((directory / filename).read_text())
    assert comparison['all_66_receipts_equal'] and len(comparison['cases']) == 66
    ratios = []
    for index, case in enumerate(comparison['cases']):
        baseline = statistics.median(rows[index].per_iteration_ns for rows in cohort['baseline'])
        candidate = statistics.median(rows[index].per_iteration_ns for rows in cohort['candidate'])
        assert case == dict(case=expected[index], baseline_median_ns=baseline, candidate_median_ns=candidate, ratio=candidate / baseline)
        ratios.append(candidate / baseline)
    assert comparison['median_case_ratio'] == statistics.median(ratios)

paired = json.loads((directory / 'paired-comparison.json').read_text())
assert len(paired['cases']) == 66
all_rows = {kind: [receipt.read_receipt((directory / f'{kind}-{trial}.log').read_text(), expected) for trial in range(1, 7)] for kind in ['baseline', 'candidate']}
for index, case in enumerate(paired['cases']):
    baseline = [r[index].per_iteration_ns for r in all_rows['baseline']]
    candidate = [r[index].per_iteration_ns for r in all_rows['candidate']]
    ratios = [c / b for b, c in zip(baseline, candidate)]
    assert case == dict(case=expected[index], ratios=ratios, paired_median_ratio=statistics.median(ratios), baseline_ns=baseline, candidate_ns=candidate)
decision = json.loads((directory / 'decision.json').read_text())
assert decision['native_timing_gate_passed'] is False
assert decision['completed_work_packages'] == 0
for field, filename in [('first_three_pairs', 'comparison.json'), ('second_three_pairs', 'repeat-comparison.json'), ('all_six_pairs_pooled', 'combined-comparison.json')]:
    comparison = json.loads((directory / filename).read_text())
    assert decision[field] == dict(median_case_ratio=comparison['median_case_ratio'], largest_case_ratio=max(case['ratio'] for case in comparison['cases']))
assert decision['all_six_pairs_paired_diagnostic']['median_case_ratio'] == statistics.median(row['paired_median_ratio'] for row in paired['cases'])
assert decision['all_six_pairs_paired_diagnostic']['largest_case_ratio'] == max(row['paired_median_ratio'] for row in paired['cases'])

expected = receipt.expected_cases((root / 'crates/hyperbrep/benches/archive_limits.rs').read_text())
assert len(expected) == 4
features = [receipt.read_receipt((directory / f'archive_admission-{trial}.log').read_text(), expected) for trial in range(1, 4)]
for rows in features:
    receipt.compare(features[0], rows)
costs = json.loads((directory / 'feature-cost.json').read_text())
assert len(costs) == 4
for index, case in enumerate(costs):
    row = features[0][index]
    assert case == dict(case=row.name, median_ns=statistics.median(rows[index].per_iteration_ns for rows in features), checksum=row.checksum, iterations=row.iterations)

expected = receipt.expected_cases((root / 'crates/hyperbrep/benches/spline_replay_cost.rs').read_text())
assert len(expected) == 8
positive = {kind: [receipt.read_receipt((directory / f'{kind}-{trial}.log').read_text(), expected) for trial in range(1, 4)] for kind in ['positive_baseline', 'positive_candidate']}
for rows in [*positive['positive_baseline'], *positive['positive_candidate']]:
    receipt.compare(positive['positive_baseline'][0], rows)
comparison = json.loads((directory / 'positive-comparison.json').read_text())
assert len(comparison) == 8
for index, case in enumerate(comparison):
    baseline = statistics.median(rows[index].per_iteration_ns for rows in positive['positive_baseline'])
    candidate = statistics.median(rows[index].per_iteration_ns for rows in positive['positive_candidate'])
    assert case == dict(case=expected[index], baseline_median_ns=baseline, candidate_median_ns=candidate, ratio=candidate / baseline)
for trial in range(1, 4):
    allocations = re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)', (directory / f'archive_admission-{trial}.log').read_text())
    assert len(allocations) == 4
    assert all(int(n) > 0 for n in allocations[0][1:])
    assert all(int(calls) == int(size) == 0 for _, calls, size in allocations[1:])
for row in json.loads((directory / 'harness-audit.json').read_text()):
    assert hashlib.sha256((root / row['path']).read_bytes()).hexdigest() == row['after_sha256']
    assert row['fixture_iterations_assertions_and_checksum_code_preserved']

print(json.dumps({
    'sources_verified': len(manifest['source_sha256']),
    'artifacts_verified': len(manifest['artifact_sha256']),
    'relative_links_resolve': links,
    'work_packages': len(packages),
    'completed_work_packages': 0,
    'matched_native_cases': 66,
    'feature_cohorts': 4,
    'matched_positive_replay_cohorts': 8,
    'rejected_implementation_faults': 4,
    'native_timing_gate_passed': False,
}, indent=2))
