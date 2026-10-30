"""Wait for frozen qualification, then retain the local code/evidence increment."""
from pathlib import Path
import json
import os
import subprocess
import time

root = Path(__file__).resolve().parents[1]
c = root / 'controls'
run = c / 'empty-axis-topology-full-final1'
controller = json.loads((c / 'empty-axis-topology-final-controller.json').read_text())['pid']


def read(path):
    try:
        return json.loads(path.read_text())
    except (FileNotFoundError, json.JSONDecodeError):
        return None


while True:
    complete = read(run / 'complete.json')
    if complete is not None:
        assert complete['all_passed'] and complete['groups'] == 24
        break
    rows = read(run / 'results.json')
    if rows is not None:
        assert all(row['exit_code'] == 0 and row['source_stable'] for row in rows), 'qualification failed; no commit'
    os.kill(controller, 0)
    assert 'run_empty_axis_topology_final.py' in (Path('/proc') / str(controller) / 'cmdline').read_text(), 'qualification controller replaced'
    time.sleep(10)

for action in ['archive', 'receipts', 'check', 'commit']:
    command = ['python3', str(c / 'finalize_empty_axis_topology.py'), action]
    print('START', command, flush=True)
    result = subprocess.run(command, cwd=root / 'empty-axis-topology')
    print('FINISH', result.returncode, flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
print('Empty first-coordinate topology committed locally; no push.', flush=True)
