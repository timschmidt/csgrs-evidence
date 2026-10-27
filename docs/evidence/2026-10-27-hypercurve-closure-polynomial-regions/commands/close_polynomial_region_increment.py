from pathlib import Path
import hashlib
import json
import subprocess
import sys
import time

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-polynomial-regions')
expected_parent = '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec'
assert not (root / 'polynomial-region-final-commit.json').exists()
results = json.loads((root / 'polynomial-region-final-results.json').read_text())
assert len(results) == 15 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
assert (root / 'polynomial-region-final-files-after.json').exists()

for command in [
    [sys.executable, str(root / 'archive_polynomial_region_evidence.py')],
    [sys.executable, str(root / 'prepare_polynomial_region_receipt.py')],
    [sys.executable, str(root / 'check_increment_receipt.py'), 'polynomial-region', str(checkout)],
]:
    subprocess.run(command, cwd=checkout, check=True)

def git(*args):
    return subprocess.check_output(['git', *args], cwd=checkout, text=True).strip()

assert git('rev-parse', 'HEAD') == expected_parent
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
snapshot = json.loads((root / 'polynomial-region-final-files-before.json').read_text())
for name, mode, digest in snapshot:
    if mode in ['file', 'executable'] and name not in receipts:
        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name
changed = set(git('diff', '--name-only').splitlines()) | set(git('ls-files', '--others', '--exclude-standard').splitlines())
assert changed and changed <= {row[0] for row in snapshot} | receipts
subprocess.run(['git', 'add', '--', *sorted(changed)], cwd=checkout, check=True)
for label, command in [
    ('staged-budget', ['scripts/check-repository-budget.sh', '--staged']),
    ('staged-diff', ['git', 'diff', '--cached', '--check']),
]:
    with (root / ('polynomial-region-' + label + '.log')).open('w') as out:
        subprocess.run(command, cwd=checkout, stdout=out, stderr=subprocess.STDOUT, check=True)
subprocess.run(['git', 'commit', '-m', 'Admit selected polynomial branches to the shared region arrangement'], cwd=checkout, check=True)
assert not git('status', '--porcelain')
archive = json.loads((root / 'polynomial-region-evidence-archive.json').read_text())
result = {'commit': git('rev-parse', 'HEAD'), 'parent': expected_parent, 'branch': git('branch', '--show-current'), 'evidence': archive['commit'], 'clean': True, 'full_prepush_pending': True, 'recorded_epoch': time.time()}
(root / 'polynomial-region-final-commit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
