from pathlib import Path
import hashlib
import json
import subprocess
import sys
import time

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-chord-replay')
expected_parent = '2eb55c5dd5a17dd7b9fb5731ea02b0ac62b38431'
assert not (root / 'chord-replay-final-commit.json').exists()
results = json.loads((root / 'chord-replay-final-results.json').read_text())
assert len(results) == 17 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
assert (root / 'chord-replay-final-files-after.json').exists()

for command in [
    [sys.executable, str(root / 'archive_chord_replay_evidence.py')],
    [sys.executable, str(root / 'prepare_chord_replay_receipt.py')],
    [sys.executable, str(root / 'check_increment_receipt.py'), 'chord-replay', str(checkout)],
]:
    subprocess.run(command, cwd=checkout, check=True)

def git(*args):
    return subprocess.check_output(['git', *args], cwd=checkout, text=True).strip()

assert git('rev-parse', 'HEAD') == expected_parent
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
snapshot = json.loads((root / 'chord-replay-final-files-before.json').read_text())
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
    with (root / ('chord-replay-' + label + '.log')).open('w') as out:
        subprocess.run(command, cwd=checkout, stdout=out, stderr=subprocess.STDOUT, check=True)
subprocess.run(['git', 'commit', '-m', 'Replay exact selected chord definitions'], cwd=checkout, check=True)
assert not git('status', '--porcelain')
archive = json.loads((root / 'chord-replay-evidence-archive.json').read_text())
result = {'commit': git('rev-parse', 'HEAD'), 'parent': expected_parent, 'branch': git('branch', '--show-current'), 'evidence': archive['commit'], 'clean': True, 'full_prepush_pending': True, 'recorded_epoch': time.time()}
(root / 'chord-replay-final-commit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result), flush=True)
