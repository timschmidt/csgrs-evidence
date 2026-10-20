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
assert ledger['increments'][-1]['id'] == 'archive-structure-admission'
json.loads((root / 'docs/properties-status.json').read_text())

commands = json.loads((directory / 'commands.json').read_text())
for name in ['tests', 'default-tests', 'clippy', 'docs', 'wasm', 'bench-build', 'release-selected-tests', 'fuzz-clippy', 'fmt', 'fuzz-fmt', 'final-tests', 'final-clippy', 'final-fmt', 'diff-check']:
    matching = [record for record in commands if record['name'] == name]
    assert matching and matching[-1]['exit_code'] == 0, name

benchmarks = json.loads((directory / 'benchmark-commands.json').read_text())
accepted = benchmarks
assert len(accepted) == 18 and all(record['exit_code'] == 0 for record in accepted)
controls = json.loads((directory / 'controls.json').read_text())
assert len(controls) == 6 and all(record['exit_code'] == 101 for record in controls)
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

expected = receipt.expected_cases((root / 'crates/hyperbrep/benches/archive_limits.rs').read_text())
assert len(expected) == 8
features = [receipt.read_receipt((directory / f'archive_structure-{trial}.log').read_text(), expected) for trial in range(1, 4)]
for rows in features:
    receipt.compare(features[0], rows)
costs = json.loads((directory / 'feature-cost.json').read_text())
assert len(costs) == 8
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
    allocations = re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)', (directory / f'archive_structure-{trial}.log').read_text())
    assert len(allocations) == 8
    assert all(int(n) > 0 for n in allocations[0][1:])
    assert all(int(calls) == int(size) == 0 for _, calls, size in allocations[1:4])

for row in json.loads((directory / 'harness-audit.json').read_text()):
    source = (root / row['path']).read_bytes()
    assert hashlib.sha256(source).hexdigest() == row['after_sha256']
    if row.get('unchanged'):
        assert row['before_sha256'] == row['after_sha256']
    else:
        assert row['only_new_cases_appended']
        assert hashlib.sha256(source[:row['preserved_prefix_bytes']]).hexdigest() == row['preserved_prefix_sha256']
expected_allocations = [(695, 216464), (0, 0), (0, 0), (0, 0), (7, 214), (4, 126), (5, 166), (4, 126)]
for trial in range(1, 4):
    allocations = re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)', (directory / f'archive_structure-{trial}.log').read_text())
    for row, metadata, (calls, size) in zip(features[trial - 1], allocations, expected_allocations, strict=True):
        assert metadata == (row.name, str(row.iterations * calls), str(row.iterations * size)), metadata

# Established archive costs compare only the identical four original cohorts.
expected = receipt.expected_cases((root / 'crates/hyperbrep/benches/archive_limits.rs').read_text())
old_features = [receipt.read_receipt((directory / f'input_limits_baseline-{trial}.log').read_text(), expected[:4]) for trial in range(1, 4)]
for rows in [*old_features, *[rows[:4] for rows in features]]:
    receipt.compare(old_features[0], rows)
comparison = json.loads((directory / 'admission-comparison.json').read_text())
for index, case in enumerate(comparison):
    baseline = statistics.median(rows[index].per_iteration_ns for rows in old_features)
    candidate = statistics.median(rows[index].per_iteration_ns for rows in features)
    assert case == dict(case=expected[index], baseline_median_ns=baseline, candidate_median_ns=candidate, ratio=candidate / baseline)
assert len(comparison) == 4

for name, total in [('tests', 317), ('default-tests', 309), ('release-selected-tests', 47), ('final-tests', 317)]:
    matches = re.findall(r'test result: ok[.] (\d+) passed;', (directory / (name + '.log')).read_text())
    assert sum(map(int, matches)) == total, (name, matches)

# The superseded prototype is kept as an experiment, never as final-source evidence.
trial_directory = directory / 'separate-pass'
trial_comparison = json.loads((trial_directory / 'admission-comparison.json').read_text())
trial_feature = [receipt.read_receipt((trial_directory / f'archive_structure-{trial}.log').read_text(), expected) for trial in range(1, 4)]
trial_old = [receipt.read_receipt((trial_directory / f'input_limits_baseline-{trial}.log').read_text(), expected[:4]) for trial in range(1, 4)]
for rows in [*trial_old, *[rows[:4] for rows in trial_feature]]:
    receipt.compare(old_features[0], rows)
for index, case in enumerate(trial_comparison):
    baseline = statistics.median(rows[index].per_iteration_ns for rows in trial_old)
    candidate = statistics.median(rows[index].per_iteration_ns for rows in trial_feature)
    assert case == dict(case=expected[index], baseline_median_ns=baseline, candidate_median_ns=candidate, ratio=candidate / baseline)

decision = json.loads((directory / 'decision.json').read_text())
assert decision['completed_work_packages'] == 0
assert decision['inherited_archive_admission_timing_gate_open'] is True
native_comparison = json.loads((directory / 'comparison.json').read_text())
assert decision['native_timing_gate_passed'] == all(case['ratio'] <= 1.1 for case in native_comparison['cases'])
assert decision['archive_timing_gate_passed'] == all(case['ratio'] <= 1.1 for case in comparison)
assert decision['separate_pass_prototype_kept'] is False
print(json.dumps({
    'sources_verified': len(manifest['source_sha256']),
    'artifacts_verified': len(manifest['artifact_sha256']),
    'relative_links_resolve': links,
    'work_packages': len(packages),
    'completed_work_packages': 0,
    'matched_native_cases': 66,
    'feature_cohorts': 8,
    'matched_positive_replay_cohorts': 8,
    'rejected_implementation_faults': 6,
    'native_timing_gate_passed': decision['native_timing_gate_passed'],
    'archive_timing_gate_passed': decision['archive_timing_gate_passed'],
    'inherited_archive_admission_timing_gate_open': True,
}, indent=2))
