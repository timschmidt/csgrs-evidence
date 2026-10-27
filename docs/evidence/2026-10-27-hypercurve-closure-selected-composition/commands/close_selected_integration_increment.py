from pathlib import Path
import hashlib
import json
import subprocess
import sys
import time

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-integration')
expected_parent = 'b6da97710cbc124f243f969c5f224b06826c18d6'
parents = [expected_parent, 'e49c24719f3b7ccf60451e9e4caaeba155d2b550', 'f2d00711141f3738b5049d452f06326019312d5e']
assert not (root / 'selected-integration-final-commit.json').exists()
results = json.loads((root / 'selected-integration-final-results.json').read_text())
assert len(results) == 16 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
assert (root / 'selected-integration-final-files-after.json').exists()

for command in [
    [sys.executable, str(root / 'archive_selected_integration_evidence.py')],
    [sys.executable, str(root / 'prepare_selected_integration_receipt.py')],
    [sys.executable, str(root / 'check_increment_receipt.py'), 'selected-integration', str(checkout)],
]:
    subprocess.run(command, cwd=checkout, check=True)

def git(*args):
    return subprocess.check_output(['git', *args], cwd=checkout, text=True).strip()

assert git('rev-parse', 'HEAD') == expected_parent
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
snapshot = json.loads((root / 'selected-integration-final-files-before.json').read_text())
for name, mode, digest in snapshot:
    if mode in ['file', 'executable'] and name not in receipts:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
changed = set(git('diff', 'HEAD', '--name-only').splitlines()) | set(git('ls-files', '--others', '--exclude-standard').splitlines())
assert changed and changed <= {row[0] for row in snapshot} | receipts
subprocess.run(['git', 'add', '--', *sorted(changed)], cwd=checkout, check=True)
for label, command in [
    ('staged-budget', ['scripts/check-repository-budget.sh', '--staged']),
    ('staged-diff', ['git', 'diff', '--cached', '--check']),
]:
    with (root / ('selected-integration-' + label + '.log')).open('w') as out:
        subprocess.run(command, cwd=checkout, stdout=out, stderr=subprocess.STDOUT, check=True)
assert git('rev-parse', 'MERGE_HEAD') == parents[1]
tree = git('write-tree')
command = ['git', 'commit-tree', tree]
for parent in parents:
    command.extend(['-p', parent])
command.extend(['-m', 'Compose selected polynomial regions through exact face probes'])
commit = subprocess.check_output(command, cwd=checkout, text=True).strip()
branch_ref = git('symbolic-ref', 'HEAD')
subprocess.run(['git', 'update-ref', branch_ref, commit, expected_parent], cwd=checkout, check=True)
subprocess.run(['git', 'reset', '--mixed', commit], cwd=checkout, check=True)
assert git('show', '-s', '--format=%P', 'HEAD').split() == parents
assert git('rev-parse', 'HEAD^{tree}') == tree
assert not git('status', '--porcelain')
archive = json.loads((root / 'selected-integration-evidence-archive.json').read_text())
result = {'commit': git('rev-parse', 'HEAD'), 'parents': parents, 'branch': git('branch', '--show-current'), 'evidence': archive['commit'], 'clean': True, 'full_prepush_pending': True, 'recorded_epoch': time.time()}
(root / 'selected-integration-final-commit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
