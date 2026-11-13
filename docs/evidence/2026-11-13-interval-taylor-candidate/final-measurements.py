from pathlib import Path
import subprocess,json,time
p=Path(__file__).parent;start=time.monotonic()
while True:
 owner=json.loads((p/'final-qualification.json').read_text());down=json.loads((p/'downstream-qualification.json').read_text())
 assert all(r['returncode']==0 for r in owner) and all(r['exit']==0 for r in down)
 if len(owner)==15 and len(down)==11:break
 assert time.monotonic()-start<1800
 time.sleep(2)
print('All owner and downstream commands finished; starting isolated paired timing',flush=True)
for script in ['run-final-pairs.py','run-model-cost.py','analyze-final-cost.py','analyze-model-cost.py']:
 subprocess.run(['python3',str(p/script)],check=True)
