"""Wait for finalized increments and record an exact, read-only merge inventory."""
from pathlib import Path
import json
import subprocess
import time

r = Path(__file__).resolve().parents[1]
c = r / 'controls'
names = [
    ('selected-polynomial-points', 'final7'),
    ('selected-field-root-discovery', 'final5'),
    ('selected-query-derivatives', 'final7'),
    ('rational-query-guards', 'final2'),
    ('selected-join-correspondence', 'final1'),
    ('selected-query-fibers', 'final1'),
]
output_path = c / 'selected-closure-integration-ready.json'
assert not output_path.exists()

def alive(pid):
    try:
        return (Path('/proc') / str(pid) / 'stat').read_text().rsplit(')', 1)[1].split()[0] != 'Z'
    except FileNotFoundError:
        return False

while True:
    commits = {}
    for name, attempt in names:
        run = c / (name + '-qualification-' + attempt)
        rows = json.loads((run / 'results.json').read_text()) if (run / 'results.json').exists() else []
        assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows), name
        path = c / (name + '-final-commit.json')
        launch = json.loads((c / (name + '-closeout-' + attempt + '-controller.json')).read_text())
        if path.exists() and not alive(launch['pid']):
            value = json.loads(path.read_text())
            assert len(value['checks']) == 5 and all(row['exit_code'] == 0 for row in value['checks'])
            assert value['user_checkout_unchanged']
            assert json.loads((run / 'complete.json').read_text())['all_passed']
            commits[name] = value
        elif not path.exists() and not alive(launch['pid']):
            raise SystemExit(name + ' closeout stopped before a final commit; integration remains pending')
    if len(commits) == len(names):
        break
    time.sleep(15)

git = ['git', '--git-dir=' + str(r / 'code.git')]
def code(*args):
    return subprocess.check_output([*git, *args], text=True).strip()

point = commits['selected-polynomial-points']['commit']
base = commits['selected-query-fibers']['commit']
assert subprocess.run([*git, 'merge-base', '--is-ancestor', point, base]).returncode == 0
assert subprocess.run([*git, 'merge-base', '--is-ancestor', commits['selected-field-root-discovery']['commit'], base]).returncode == 0
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
changes = {}
for name, value in commits.items():
    checkout = r / name
    assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == value['commit']
    assert not subprocess.check_output(['git', 'status', '--porcelain'], cwd=checkout, text=True).strip()
    changes[name] = code('diff', '--name-only', value['parent'], value['commit']).splitlines()

merge_order = ['rational-query-guards', 'selected-query-derivatives', 'selected-join-correspondence']
base_changes = set(code('diff', '--name-only', point, base).splitlines())
overlaps = {}
for name in merge_order:
    overlap = base_changes & set(changes[name])
    overlaps[name] = sorted(overlap)
    assert overlap <= receipts | {'crates/hypercurve/CHANGELOG.md', 'crates/hypersolve/CHANGELOG.md', 'crates/hypercurve/qualification/capabilities.json'}, overlaps
    base_changes.update(changes[name])

baseline = json.loads((c / 'selected-closure-integration-baseline1/complete.json').read_text())
assert baseline['expected_outcomes_reproduced']
record = {
    'base': base, 'increments': commits, 'changes': changes, 'merge_order': merge_order,
    'overlapping_paths': overlaps, 'all_local_qualification_and_receipt_checks_passed': True,
    'integration_baseline': baseline,
    'compatibility_edits': 'Derivative and guard test PolynomialFiber literals need the declared BezierParameter2.into() conversion. Preserve original assertions. Merge capability rows by distinct fixture IDs, retain all receipt paragraphs and evidence records, and regenerate the exact archive manifest from the merged evidence history.',
    'next': 'Create an isolated integration checkout at base, merge the three finalized sibling commits and evidence histories, review every conflict, add the original integration witnesses, then qualify the combined source. This record authorizes no publication and changes no source.',
    'epoch': time.time(),
}
output_path.write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps({'ready': str(output_path), 'base': base, 'merge_order': merge_order, 'overlaps': overlaps}, indent=2))
