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
assert ledger['increments'][-1]['id'] == 'spline-trim-replay'
json.loads((root / 'docs/properties-status.json').read_text())

commands = json.loads((directory / 'commands.json').read_text())
for name in ['hypercurve-tests', 'hypercurve-clippy', 'tests', 'default-tests', 'clippy', 'docs', 'wasm', 'bench-build', 'release-selected-tests', 'fuzz-clippy', 'fmt', 'fuzz-fmt', 'final-hypercurve-tests', 'final-hypercurve-clippy', 'final-tests', 'final-clippy', 'final-fmt', 'diff-check']:
    matching = [record for record in commands if record['name'] == name]
    assert matching and matching[-1]['exit_code'] == 0, name

benchmarks = json.loads((directory / 'benchmark-commands.json').read_text())
accepted = benchmarks
assert len(accepted) == 9 and all(record['exit_code'] == 0 for record in accepted)
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

expected = receipt.expected_cases((root / 'crates/hyperbrep/benches/spline_replay_cost.rs').read_text())
assert len(expected) == 8
features = [receipt.read_receipt((directory / f'spline_replay-{trial}.log').read_text(), expected) for trial in range(1, 4)]
for rows in features:
    receipt.compare(features[0], rows)
costs = json.loads((directory / 'feature-cost.json').read_text())
assert len(costs) == 8
for index, case in enumerate(costs):
    row = features[0][index]
    assert case == dict(case=row.name, median_ns=statistics.median(rows[index].per_iteration_ns for rows in features), checksum=row.checksum, iterations=row.iterations)

print(json.dumps({
    'sources_verified': len(manifest['source_sha256']),
    'artifacts_verified': len(manifest['artifact_sha256']),
    'relative_links_resolve': links,
    'work_packages': len(packages),
    'completed_work_packages': 0,
    'matched_native_cases': 66,
    'feature_cohorts': 8,
    'rejected_implementation_faults': 4,
}, indent=2))
