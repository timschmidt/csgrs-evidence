from pathlib import Path
import hashlib
import json
import subprocess
import time

root = Path(__file__).resolve().parent
workspace = Path('/home/tim/Documents/GitHub/workspace/csgrs')
checkout = Path('/tmp/hypercurve-closure-chord-replay')
bare = Path('/tmp/csgrs-closure-evidence.git')
persistent = Path('/home/tim/Documents/GitHub/workspace/csgrs-evidence.git')
record = json.loads((root / 'chord-replay-final-commit.json').read_text())
evidence = json.loads((root / 'chord-replay-evidence-archive.json').read_text())

def output(command, cwd=None):
    return subprocess.check_output(command, cwd=cwd, text=True).strip()

def user_state():
    return {
        'head': output(['git', 'rev-parse', 'HEAD'], workspace),
        'status': output(['git', 'status', '--porcelain'], workspace),
        'diff_sha256': hashlib.sha256(subprocess.check_output(['git', 'diff', '--binary'], cwd=workspace)).hexdigest(),
    }

before = user_state()
assert before['head'] == '904e5408e128a4f4b35ed0ce028f176023d7eadd'
assert before['diff_sha256'] == 'de4406085e56ad8915ef588bf1b9b1d18a44853f48ce5c3ce610edcc1af48570'
assert not output(['git', 'status', '--porcelain'], checkout)
assert output(['git', 'rev-parse', 'HEAD'], checkout) == record['commit']
assert record['clean'] and record['evidence'] == evidence['commit']
code_ref = 'refs/heads/' + record['branch']
subprocess.run(['git', 'fetch', str(checkout), code_ref + ':' + code_ref], cwd=workspace, check=True)
assert output(['git', 'rev-parse', code_ref], workspace) == record['commit']
evidence_ref = evidence['branch']
subprocess.run(['git', '--git-dir=' + str(persistent), 'fetch', str(bare), evidence_ref + ':' + evidence_ref], check=True)
assert output(['git', '--git-dir=' + str(persistent), 'rev-parse', evidence_ref]) == evidence['commit']
assert before == user_state()
result = {'code': record['commit'], 'evidence': evidence['commit'], 'persisted': True, 'user_worktree_unchanged': True, 'pushed': False, 'recorded_epoch': time.time()}
(root / 'chord-replay-persisted.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
