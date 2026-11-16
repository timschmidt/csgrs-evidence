from pathlib import Path
import subprocess,time,json,sys
s=Path(__file__).parent;p=s/'runs/candidate-inline-translation-correctness/result.json'
deadline=time.monotonic()+1800
while not p.exists():
 assert time.monotonic()<deadline
 time.sleep(2)
assert json.loads(p.read_text())['exit_code']==0
for name in ['candidate-inline-translation-certification-build','candidate-inline-translation-allocation-profile']:
 subprocess.run([sys.executable,str(s/'run-one.py'),str(s/'commands.json'),name],check=True)
subprocess.run([sys.executable,str(s/'collect-artifacts.py'),'candidate-inline-translation'],check=True)

subprocess.run([sys.executable,str(s/'size-screen.py'),'candidate-inline-translation'],check=True)
subprocess.run([sys.executable,str(s/'run-one.py'),str(s/'commands.json'),'candidate-inline-translation-format'],check=True)
