from pathlib import Path
import hashlib
import json
import os
import subprocess
import time

root = Path(__file__).resolve().parent
prior = Path('/tmp/hypercurve-closure-prepush')
workspace = Path('/home/tim/Documents/GitHub/workspace/csgrs')
g_checkout = Path('/tmp/hypercurve-closure-rational-sections')
checkout = root / 'normal'
archive = Path('/tmp/csgrs-closure-evidence.git')
evidence_branch = 'hypercurve-publication-evidence-2026-10-26'
code_branch = 'hypercurve-closure-publication'
x = '06708f1091802f061f40c1b4e34acdbf4eaa63e6'
attempt = '469d6eb2e6b5e7ccc481e0c671d9a50a6b20c0e2'
h = '80bcc08ae9710b84e9b17f6c343a8cc26aae4600'

def output(command, cwd=None):
    return subprocess.check_output(command, cwd=cwd, text=True).strip()

def git(*args):
    return output(['git', *args], checkout)

assert not (root / 'publication-source.json').exists()
assert not output(['git', 'status', '--porcelain'], g_checkout)
g = output(['git', 'rev-parse', 'HEAD'], g_checkout)
assert output(['git', 'rev-parse', 'HEAD^'], g_checkout) == h
assert output(['git', 'rev-parse', 'hypercurve-polynomial-rational-sections'], workspace) == g
checks = json.loads((prior / 'rational-section-final-results.json').read_text())
assert len(checks) == 15 and all(r['exit_code'] == 0 and r['source_stable'] for r in checks)
receipt_checks = json.loads((prior / 'rational-section-receipt-checks.json').read_text())
assert len(receipt_checks) == 5 and all(r['exit_code'] == 0 for r in receipt_checks)
g_evidence = json.loads((prior / 'rational-section-evidence-archive.json').read_text())['commit']
assert git('rev-parse', 'HEAD') == h and not git('status', '--porcelain')
user_before = {
    'head': output(['git', 'rev-parse', 'HEAD'], workspace),
    'status': output(['git', 'status', '--porcelain'], workspace),
    'diff_sha256': hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=workspace)).hexdigest(),
}

# Both branches add disjoint evidence records to the same archived parent.
archive_git = ['git', '--git-dir=' + str(archive)]
assert subprocess.run(archive_git + ['show-ref', '--verify', '--quiet', 'refs/heads/' + evidence_branch]).returncode == 1
merged = subprocess.run(archive_git + ['merge-tree', '--write-tree', g_evidence, attempt], text=True, capture_output=True)
(root / 'evidence-merge-tree.log').write_text(merged.stdout + merged.stderr)
assert merged.returncode == 0, merged.stdout + merged.stderr
tree = merged.stdout.splitlines()[0]
evidence_commit = output(archive_git + ['commit-tree', tree, '-p', g_evidence, '-p', attempt, '-m', 'Combine qualified curve closure and voxel validation evidence'])
subprocess.run(archive_git + ['update-ref', 'refs/heads/' + evidence_branch, evidence_commit, '0' * 40], check=True)
(root / 'combined-evidence.json').write_text(json.dumps({'commit': evidence_commit, 'parents': [g_evidence, attempt], 'branch': evidence_branch}, indent=2) + '\n')

subprocess.run(['git', 'fetch', str(workspace), 'hypercurve-polynomial-rational-sections', 'hypercurve-voxel-write-oracle'], cwd=checkout, check=True)
subprocess.run(['git', 'checkout', '-b', code_branch, g], cwd=checkout, check=True)
merge = subprocess.run(['git', 'merge', '--no-ff', '--no-commit', x], cwd=checkout, text=True, capture_output=True)
(root / 'code-merge.log').write_text(merge.stdout + merge.stderr)
conflicts = set(git('diff', '--name-only', '--diff-filter=U').splitlines())
receipts = {'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
assert merge.returncode in [0, 1] and conflicts <= receipts, (merge.returncode, conflicts)
assert git('rev-parse', 'MERGE_HEAD') == x

g_doc = git('show', g + ':docs/evidence-archive.md') + '\n'
x_doc = git('show', x + ':docs/evidence-archive.md')
marker = '## Follow-on records\n\n'
x_receipt = x_doc.split(marker, 1)[1].split('The local `hypercurve-closure-2026-10-26` branch', 1)[0]
assert 'e5b2ee8217a3b9254b30130aacbbccbc0001ccc6' in x_receipt
attempt_receipt = '''The complete command inventory was attempted against `904e5408e1`: 324 of
325 groups passed. The unchanged-value voxel assertion failed, so that revision
was not published. Both release/package checks and all 13 ASan campaigns passed;
the unsuccessful run remains evidence of an incomplete qualification attempt.
Its record, `docs/evidence/2026-10-26-hypercurve-closure-validation-attempt-904e`,
contains 12,786 files and 36,965,435 bytes, SHA-256
`94d4948defd834cd3b4984d64196a6063eab0038b9bde0454341a86c347951a4`.
The combined local archive retains this attempt and all independently qualified
follow-on records. A fresh 328-group pre-push run is required for the combined
code candidate; no previous command execution is counted toward that run.

'''
combined_receipt = f'The combined local `{evidence_branch}` archive ends at\n`{evidence_commit}` and retains 349 records.\n\n'
assert marker in g_doc
(checkout / 'docs/evidence-archive.md').write_text(g_doc.replace(marker, marker + combined_receipt + attempt_receipt + x_receipt, 1))
excluded = [line for line in git('show', g + ':docs/evidence-archive.tsv').splitlines() if line.startswith('excluded:')]
assert len(excluded) == 4
manifest = subprocess.check_output(['python3', 'scripts/evidence_archive.py', 'manifest', str(archive), evidence_commit], cwd=checkout, text=True).splitlines()
assert len(manifest) == 350
(checkout / 'docs/evidence-archive.tsv').write_text('\n'.join(manifest + excluded) + '\n')
subprocess.run(['git', 'add', '--', *sorted(receipts)], cwd=checkout, check=True)
assert not git('diff', '--name-only', '--diff-filter=U')
expected = receipts | {'crates/hypervoxel/README.md', 'crates/hypervoxel/voxelis/src/spatial/voxtree.rs'}
assert set(git('diff', '--cached', '--name-only', g).splitlines()) == expected
for name in expected - receipts:
    assert (checkout / name).read_bytes() == subprocess.check_output(['git', 'show', x + ':' + name], cwd=checkout)

for label, command in [
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
    ('typos', ['typos']),
    ('budget', ['scripts/check-repository-budget.sh', '--staged']),
    ('diff', ['git', 'diff', '--cached', '--check']),
    ('archive', ['python3', 'scripts/evidence_archive.py', 'verify', str(archive), evidence_commit]),
]:
    with (root / ('assembly-' + label + '.log')).open('w') as out:
        subprocess.run(command, cwd=checkout, stdout=out, stderr=subprocess.STDOUT, check=True)
subprocess.run(['git', 'commit', '-m', 'Merge qualified curve closure increments and voxel oracle correction'], cwd=checkout, check=True)
head = git('rev-parse', 'HEAD')
assert not git('status', '--porcelain')
review = json.loads((root / 'hosted-action-review-prepared.json').read_text())
for name, digest in review['workflow_sha256'].items():
    assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

directed = root / 'directed'
assert not output(['git', 'status', '--porcelain'], directed)
subprocess.run(['git', 'fetch', str(checkout), code_branch], cwd=directed, check=True)
subprocess.run(['git', 'checkout', '--detach', head], cwd=directed, check=True)
assert not output(['git', 'status', '--porcelain'], directed)
user_after = {
    'head': output(['git', 'rev-parse', 'HEAD'], workspace),
    'status': output(['git', 'status', '--porcelain'], workspace),
    'diff_sha256': hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=workspace)).hexdigest(),
}
assert user_before == user_after
result = {'head': head, 'parents': [g, x], 'code_branch': code_branch, 'evidence': evidence_commit, 'evidence_branch': evidence_branch, 'records': 349, 'recorded_epoch': time.time(), 'user_worktree_unchanged': True, 'validation_status': 'Not yet executed; all 328 command groups must run freshly'}
(root / 'publication-source.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
