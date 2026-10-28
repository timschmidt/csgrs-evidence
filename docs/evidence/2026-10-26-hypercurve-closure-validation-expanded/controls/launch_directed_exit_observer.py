from pathlib import Path
import json
import subprocess
import time

root = Path(__file__).resolve().parent
receipt = root / 'directed-exit-observer-launch.json'
assert not receipt.exists()
command = ['python3', str(root / 'observe_directed_retry_exit.py')]
with (root / 'directed-exit-observer.log').open('x') as out:
    child = subprocess.Popen(command, cwd=root, stdin=subprocess.DEVNULL,
                             stdout=out, stderr=subprocess.STDOUT, start_new_session=True)
data = {'pid': child.pid, 'command': command, 'started_epoch': time.time(),
        'purpose': 'Detached observer for the already-running original sanitizer workflow; does not restart, weaken, or alter its campaigns.'}
receipt.write_text(json.dumps(data, indent=2) + '\n')
print(json.dumps(data))
