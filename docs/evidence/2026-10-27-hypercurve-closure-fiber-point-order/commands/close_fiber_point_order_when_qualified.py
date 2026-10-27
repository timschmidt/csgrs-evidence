from pathlib import Path
import json
import subprocess
import sys
import time

root = Path(__file__).resolve().parent
started = time.time()
last_count = None
while time.time() - started < 21600:
    result_path = root / 'fiber-point-order-final-results.json'
    if not result_path.exists():
        time.sleep(15)
        continue
    rows = json.loads(result_path.read_text())
    if any(row['exit_code'] != 0 or not row['source_stable'] for row in rows):
        raise SystemExit('Qualification did not pass; no closeout performed.')
    if len(rows) != last_count:
        print('QUALIFICATION GROUPS', len(rows), 'of 18 passed', flush=True)
        last_count = len(rows)
    if len(rows) == 18 and (root / 'fiber-point-order-final-dependent-packages.log').is_file() and (root / 'circle-replay-final-commit.json').is_file():
        subprocess.run([sys.executable, str(root / 'reparent_fiber_point_order.py')], check=True)
        subprocess.run([sys.executable, str(root / 'close_fiber_point_order_increment.py')], check=True)
        break
    time.sleep(15)
else:
    raise SystemExit('External closeout wait expired; no successful completion is inferred.')
