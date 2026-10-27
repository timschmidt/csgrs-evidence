from pathlib import Path
import json
import subprocess
import sys
import time

root = Path(__file__).resolve().parent
started = time.time()
last_count = None
while time.time() - started < 21600:
    rows = json.loads((root / 'parallel-replay-final-results.json').read_text())
    if any(row['exit_code'] != 0 or not row['source_stable'] for row in rows):
        raise SystemExit('Qualification did not pass; no closeout performed.')
    if len(rows) != last_count:
        print('QUALIFICATION GROUPS', len(rows), 'of 17 passed', flush=True)
        last_count = len(rows)
    if len(rows) == 17 and (root / 'parallel-replay-final-dependent-packages.log').is_file():
        subprocess.run([sys.executable, str(root / 'close_parallel_replay_increment.py')], check=True)
        break
    time.sleep(15)
else:
    raise SystemExit('External closeout wait expired; no successful completion is inferred.')
