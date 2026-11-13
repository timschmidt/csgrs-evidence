from pathlib import Path
import subprocess,time,json,shutil,hashlib
p=Path(__file__).parent;q=p/'final';r=Path('/mnt/development/csgrs-taylor-affine');start=time.monotonic()
while True:
 ready=True
 for name,count in [('final-qualification.json',16),('downstream-qualification.json',7)]:
  try:rows=json.loads((q/name).read_text())
  except (FileNotFoundError,json.JSONDecodeError):ready=False;continue
  assert all(v['returncode']==0 for v in rows),(name,rows[-1]);ready &= len(rows)==count
 if ready:break
 assert time.monotonic()-start<1800
 time.sleep(1)
print('Final owner and downstream qualification complete',flush=True)
for name in ['algebraic_fiber_benchmarks.md','dispatch_trace.md']:
 dest=q/'generated-reports'/name;dest.parent.mkdir(exist_ok=True);shutil.copy2(r/'crates/hypersolve'/name,dest);subprocess.run(['git','restore','--','crates/hypersolve/'+name],cwd=r,check=True)
state=json.loads((p/'SOURCE_FINAL.json').read_text())
for row in state['paths']:assert hashlib.sha256((r/row['path']).read_bytes()).hexdigest()==row['sha256']
subprocess.run(['python3',str(p/'build-consumers.py')],check=True)
