from pathlib import Path
import json, os, subprocess, time
root = Path(__file__).resolve().parents[1]
c = root / 'controls'
run = c / 'zero-chord-displacement-qualification-final1'
controller = json.loads((c / 'zero-chord-displacement-integration-controller.json').read_text())['pid']
while not (run / 'complete.json').exists():
    if (run / 'results.json').exists():
        assert all(row['exit_code'] == 0 and row['source_stable']
                   for row in json.loads((run / 'results.json').read_text())), 'qualification failed; no commit'
    os.kill(controller, 0)
    time.sleep(10)
complete = json.loads((run / 'complete.json').read_text())
assert complete['all_passed'] and complete['groups'] == 21
for action in ['archive', 'receipts', 'check', 'commit']:
    command = ['python3', str(c / 'finalize_zero_chord_displacements.py'), action]
    print('START', command, flush=True)
    result = subprocess.run(command, cwd=root / 'polynomial-chamfer-dispatch')
    print('FINISH', result.returncode, flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
print('Zero-distance bounds correction committed locally; no push.', flush=True)
