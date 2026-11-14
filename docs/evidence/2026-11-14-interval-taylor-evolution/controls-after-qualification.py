from pathlib import Path
import time,json,subprocess,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-evolution');pid=2783847
while Path(f'/proc/{pid}/cmdline').exists():
 try:cmd=Path(f'/proc/{pid}/cmdline').read_bytes()
 except FileNotFoundError:break
 if b'taylor-evolution/qualify.py' not in cmd:break
 time.sleep(1)
assert '8 passed; 0 failed' in (s/'minimal-focused-tests.log').read_text()
assert '11 passed; 0 failed' in (s/'final-focused-tests.log').read_text()
rows=json.loads((s/'qualification.json').read_text());assert len(rows)==7 and all(x['returncode']==0 for x in rows),rows
paths=subprocess.check_output(['git','diff','--name-only'],cwd=r).decode().splitlines()+subprocess.check_output(['git','ls-files','--others','--exclude-standard'],cwd=r).decode().splitlines()
files=[]
for name in sorted(paths):
 p=r/name;dst=s/'candidate-source'/name;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,dst);files.append({'path':name,'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
(s/'SOURCE.json').write_text(json.dumps({'base':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip(),'files':files},indent=2)+'\n')
subprocess.run(['python3','-B',str(s/'build-controls.py')],check=True)
