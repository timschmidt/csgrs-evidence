from pathlib import Path
import json,subprocess,sys,time
root=Path(__file__).resolve().parent
started=time.time()
assert not (root/'circle-replay-final-results.json').exists()
print('Waiting for qualified point replay commit before reparenting circle replay.',flush=True)
while time.time()-started<10800:
    record=root/'point-replay-final-commit.json'
    if record.is_file():
        parent=json.loads(record.read_text());assert parent['clean']
        subprocess.run([sys.executable,str(root/'reparent_circle_replay.py')],check=True)
        subprocess.run([sys.executable,str(root/'run_circle_replay_qualification.py')],check=True)
        break
    time.sleep(15)
else:
    raise SystemExit('Parent commit is not available; no qualification inferred.')
