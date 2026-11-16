from pathlib import Path
import json,subprocess,sys,time
s=Path(__file__).parent
before=Path(sys.argv[1]);after=Path(sys.argv[2]);label=sys.argv[3]
ids=[r['id'] for r in json.loads(before.read_text())]
print('WAIT FOR',before.name,flush=True)
while not all((s/'runs'/name/'result.json').exists() for name in ids):
 time.sleep(5)
print('DEPENDENCY LANE TERMINAL',before.name,flush=True)
sys.exit(subprocess.call([sys.executable,str(s/'run-lane.py'),str(after),label]))
