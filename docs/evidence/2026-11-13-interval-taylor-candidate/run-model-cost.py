from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;source=Path('/tmp/interval-refactor/taylor-new-target/release/taylor-model-cost-probe');exe=Path('/tmp/interval-refactor/taylor-binaries/model-cost');shutil.copy2(source,exe);rows=[]
for trial in range(2):
 command=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(exe)];start=time.monotonic()
 with (p/f'model-cost-{trial}.log').open('w') as f:r=subprocess.run(command,stdout=f,stderr=subprocess.STDOUT,cwd='/tmp/interval-refactor')
 rows.append(dict(trial=trial,command=command,returncode=r.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(exe.read_bytes()).hexdigest(),bytes=exe.stat().st_size));(p/'model-cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
 print('model trial',trial,flush=True)
