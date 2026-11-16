from pathlib import Path
import subprocess,time,json,sys
s=Path(__file__).parent;p=s/'runs/candidate-consuming-correctness-borrowed-signature/result.json'
deadline=time.monotonic()+1800
while not p.exists():
 assert time.monotonic()<deadline
 time.sleep(2)
assert json.loads(p.read_text())['exit_code']==0
for name in ['candidate-consuming-certification-build','candidate-consuming-allocation-profile']:
 subprocess.run([sys.executable,str(s/'run-one.py'),str(s/'commands.json'),name],check=True)
subprocess.run([sys.executable,str(s/'collect-artifacts.py'),'candidate-consuming'],check=True)
