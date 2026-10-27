from pathlib import Path
import json
import re
import subprocess
import time

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-integration')
base = '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
j = 'b6da97710cbc124f243f969c5f224b06826c18d6'
k = 'e49c24719f3b7ccf60451e9e4caaeba155d2b550'
archive = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-selected-integration-evidence-2026-10-27'

def git(*args):
    return subprocess.check_output(['git', *args], cwd=checkout, text=True).strip()

assert git('rev-parse', 'HEAD') == j and git('rev-parse', 'MERGE_HEAD') == k
conflicts = set(git('diff', '--name-only', '--diff-filter=U').splitlines())
assert conflicts == {'crates/hypercurve/FUTURE_WORK.md',
                     'crates/hypercurve/qualification/capabilities.json',
                     'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
for name in ['crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md']:
    path = checkout / name
    original = path.read_text()
    pattern = r'^<<<<<<< HEAD\n(.*?)^=======\n(.*?)^>>>>>>> ' + k + r'\n'
    resolved, count = re.subn(pattern, lambda m: m[1].rstrip() + '\n\n' + m[2],
                              original, flags=re.MULTILINE | re.DOTALL)
    assert count == 1
    assert not re.search(r'^(<<<<<<<|=======|>>>>>>>)', resolved, re.MULTILINE)
    path.write_text(resolved)

name = 'crates/hypercurve/qualification/capabilities.json'
before, first, second = [json.loads(git('show', revision + ':' + name)) for revision in [base, j, k]]
assert all({key: value for key, value in doc.items() if key != 'fixtures'} ==
           {key: value for key, value in before.items() if key != 'fixtures'}
           for doc in [first, second])
by_id = [{row['id']: row for row in doc['fixtures']} for doc in [before, first, second]]
assert all(len(rows) == len(doc['fixtures']) for rows, doc in zip(by_id, [before, first, second]))
identifiers = list(by_id[1]) + [key for key in by_id[2] if key not in by_id[1]]
merged = []
for key in identifiers:
    original, left, right = (rows.get(key) for rows in by_id)
    if left == right or right == original:
        value = left
    elif left == original:
        value = right
    else:
        raise AssertionError(('conflicting fixture claims', key))
    assert value is not None
    merged.append(value)
assert len(merged) == 113
first['fixtures'] = merged
(checkout / name).write_text(json.dumps(first, indent=2) + '\n')

parents = [json.loads((root / (prefix + '-evidence-archive.json')).read_text())['commit']
           for prefix in ['polynomial-region', 'horizontal-boundary']]
archive_git = ['git', '--git-dir=' + str(archive)]
assert subprocess.run(archive_git + ['show-ref', '--verify', '--quiet', branch]).returncode == 1
result = subprocess.run(archive_git + ['merge-tree', '--write-tree', *parents], text=True, capture_output=True)
(root / 'selected-integration-jk-evidence-merge.log').write_text(result.stdout + result.stderr)
assert result.returncode == 0
tree = result.stdout.splitlines()[0]
commit = subprocess.check_output(archive_git + ['commit-tree', tree,
    '-p', parents[0], '-p', parents[1], '-m', 'Combine qualified polynomial region and boundary evidence'], text=True).strip()
subprocess.run(archive_git + ['update-ref', branch, commit, '0' * 40], check=True)
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', str(archive), commit],
                                  cwd=checkout, text=True).splitlines()
assert len(manifest) == 351
excluded = [line for line in git('show', j + ':docs/evidence-archive.tsv').splitlines()
            if line.startswith('excluded:')]
assert len(excluded) == 4
(checkout / 'docs/evidence-archive.tsv').write_text('\n'.join(manifest + excluded) + '\n')
doc = checkout / 'docs/evidence-archive.md'
marker = '## Follow-on records\n\n'
text = doc.read_text()
assert marker in text
receipt = ('The local `hypercurve-selected-integration-evidence-2026-10-27` branch\n'
           f'at `{commit}` combines 350 archived records from the\n'
           'qualified region and horizontal-boundary increments. The individual\n'
           'receipts below retain their original source scope. Combined integration\n'
           'checks and repository pre-push validation remain pending.\n\n')
doc.write_text(text.replace(marker, marker + receipt, 1))
subprocess.run(['git', 'add', '--', *sorted(conflicts)], cwd=checkout, check=True)
assert not git('diff', '--name-only', '--diff-filter=U')
(root / 'selected-integration-jk-evidence.json').write_text(json.dumps({
    'commit': commit, 'parents': parents, 'branch': branch, 'records': 350,
    'capability_rows': 113, 'recorded_epoch': time.time(),
    'source_merge': 'Production changes merged without conflicts; independent receipt additions retained, fixture claims merged by identity with unchanged base claims preserved.'
}, indent=2) + '\n')
print(json.dumps({'evidence': commit, 'records': 350, 'capability_rows': 113}), flush=True)
