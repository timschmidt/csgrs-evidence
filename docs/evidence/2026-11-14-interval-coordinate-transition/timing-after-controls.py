from pathlib import Path
import time,json,subprocess,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-coordinate-transition');pid=2729486
while Path(f'/proc/{pid}/cmdline').exists():
 try:cmd=Path(f'/proc/{pid}/cmdline').read_bytes()
 except FileNotFoundError:break
 if b'coordinate-transition/controls-after-qualification.py' not in cmd:break
 time.sleep(1)
rows=json.loads((s/'control-builds.json').read_text());assert len(rows)==8 and all(x['returncode']==0 for x in rows)
expected=json.loads((s/'SOURCE.json').read_text())
for item in expected['files']:assert hashlib.sha256((r/item['path']).read_bytes()).hexdigest()==item['sha256'],item['path']
(s/'timing-start-processes.txt').write_bytes(subprocess.check_output(['ps','-eo','pid,ppid,pcpu,comm']))
subprocess.run(['python3','-B',str(s/'run-timing.py')],check=True)
