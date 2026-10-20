"""Compare all named library outcomes with the preceding retained revision."""
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes
from source_binding import admit

read = lambda p: json.loads(p.read_text())
old_path = OUT.parent / '2026-10-16-torus-exchange/dependency-summary.json'
old = read(old_path)['candidate']
attempts = read(OUT / 'attempts.json')
latest = lambda label: next(r for r in reversed(attempts) if r['label'] == label)
row = latest('dependency-libraries')
assert row['exit_code'] == 0 and row['source_unchanged']
binding = admit(row, hashes())
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
assert len(summaries) == 4
assert len(tests) == sum(sum(int(v) for v in r[1:]) for r in summaries)
assert all(tests.get(name) == value for name, value in old['test_outcomes'].items())
added = {name: value for name, value in tests.items() if name not in old['test_outcomes']}
assert len(added) == 4 and all('ring_trig_congruence_tests::' in name and value == 'ok' for name, value in added.items())
inherited = []
for features in ['default', 'all-features']:
    r = latest('inherited-zero-factor-' + features)
    assert r['exit_code'] == 101 and r['source_unchanged'] and read(OUT / r['source']) == hashes()
    log = (OUT / r['log']).read_text()
    assert 'assertion failed: FACTORS > 0' in log and 'test result: FAILED. 0 passed; 1 failed;' in log
    inherited.append(r)
result = dict(source=hashes(), baseline_record=str(old_path), baseline_record_sha256=hashlib.sha256(old_path.read_bytes()).hexdigest(),
    source_admission=binding,
    baseline=old, candidate=dict(command=row, test_outcomes=tests,
        totals={key: sum(int(r[i+1]) for r in summaries) for i, key in enumerate(['passed', 'failed', 'ignored'])}),
    preserved_test_outcomes=True, added=added, inherited_debug_failures=inherited,
    recipe_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    scope='Four complete release/all-feature library suites, preserving every preceding named outcome and adding four private proof groups. Inherited external-owner debug failures remain failures; they are not repaired or counted as successful whole-crate admission.')
(OUT / 'dependency-summary.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(dict(totals=result['candidate']['totals'], new_groups=len(added), inherited_failed_runs=len(inherited))))
