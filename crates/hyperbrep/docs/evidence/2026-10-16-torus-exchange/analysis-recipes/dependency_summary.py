"""Compare full dependency outcomes without relabeling inherited failures green."""
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes
from dependency_binding import admit_dependency_source

attempts = json.loads((OUT / 'attempts.json').read_text())
latest = lambda label: [r for r in attempts if r['label'] == label][-1]
source = hashes()
rows = {}
bindings = {}
for phase in ['baseline', 'candidate']:
    row = latest('dependency-' + phase)
    assert row['source_unchanged']
    if phase == 'candidate':
        bindings[row['label']] = admit_dependency_source(row, source)
    text = (OUT / row['log']).read_text()
    tests = {}
    crate = None
    for line in text.splitlines():
        running = re.search(r'Running unittests .*\/(hyper\w+)-[0-9a-f]+\)', line)
        if running:
            crate = running[1]
        outcome = re.fullmatch(r'test (\S+)(?: - should panic)? \.\.\. (ok|FAILED|ignored)(?:, .*)?', line)
        if outcome:
            assert crate
            name = crate + '::' + outcome[1]
            assert name not in tests
            tests[name] = outcome[2]
    summaries = re.findall(r'^test result: (ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;', text, re.M)
    assert len(summaries) == 4, (phase, summaries)
    assert len(tests) == sum(sum(int(v) for v in row[1:]) for row in summaries)
    rows[phase] = dict(command=row, test_outcomes=tests,
        totals={key: sum(int(r[i+1]) for r in summaries) for i, key in enumerate(['passed', 'failed', 'ignored'])},
        failed=sorted(name for name, outcome in tests.items() if outcome == 'FAILED'))
assert rows['candidate']['test_outcomes'] == rows['baseline']['test_outcomes'], 'dependency outcome migration requires review'
checks = []
for label in ['dependency-clippy', 'dependency-minimal-clippy', 'dependency-rustdoc',
              'scalar-all-features', 'scalar-minimal', 'dependency-scalar-minimal-library']:
    row = latest(label)
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    bindings[label] = admit_dependency_source(row, source)
    checks.append(row)
inherited = []
for phase in ['baseline', 'candidate']:
    for features in ['default', 'all-features']:
        row = latest(f'zero-factor-{phase}-{features}')
        assert row['exit_code'] == 101 and row['source_unchanged'], row
        if phase == 'candidate':
            bindings[row['label']] = admit_dependency_source(row, source)
        text = (OUT / row['log']).read_text()
        assert 'assertion failed: FACTORS > 0' in text
        assert 'test result: FAILED. 0 passed; 1 failed;' in text
        inherited.append(row)
result = dict(baseline=rows['baseline'], candidate=rows['candidate'],
    preserved_test_outcomes=True, checks=checks,
    inherited_debug_failures=inherited,
    source_bindings=bindings,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Four complete release/all-feature library suites. Inherited failures remain failures; equal outcomes do not establish correctness of their failing domain. New scalar integration regressions and downstream BREP admission are separate.')
(OUT / 'dependency-summary.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(dict(totals=rows['candidate']['totals'], library_failures=rows['candidate']['failed'],
    inherited_debug_failure_runs=len(inherited)), indent=2))
