from pathlib import Path
import time,json,subprocess
s=Path(__file__).parent
pid=2713428
while Path(f'/proc/{pid}/cmdline').exists():
 try:cmd=Path(f'/proc/{pid}/cmdline').read_bytes()
 except FileNotFoundError:break
 if b'coordinate-transition/qualify.py' not in cmd:break
 time.sleep(1)
rows=json.loads((s/'qualification.json').read_text());assert len(rows)==7 and all(r['returncode']==0 for r in rows),rows
subprocess.run(['python3','-B',str(s/'build-controls.py')],check=True)
