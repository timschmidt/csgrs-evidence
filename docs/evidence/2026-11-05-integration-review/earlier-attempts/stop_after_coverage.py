"""Stop the task's broad batch at a completed coverage boundary for parallel scheduling."""
import json
from pathlib import Path
import subprocess
import time

out = Path(__file__).resolve().parent
while True:
    rows = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()]
    matching = [r for r in rows if r['sequence'] == 80 and r['env'].get('RUSTUP_TOOLCHAIN') == '1.99.1']
    if matching:
        subprocess.run(['python3', str(out / 'stop_runners.py'), 'python3 target/prepush-20261105/run.py --start 73 --end 131 --only-failed'], check=True)
        (out / 'spatial-batch-split.json').write_text(json.dumps(dict(reason='Independent directed/sanitizer and coverage/demo jobs now run separately; no fixture or campaign budget changes.', coverage_result=matching[-1]), indent=2) + '\n')
        break
    time.sleep(1)
