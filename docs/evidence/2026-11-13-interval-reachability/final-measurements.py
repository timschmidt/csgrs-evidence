from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;start=time.monotonic()
while True:
 rows=json.loads((p/'downstream-qualification.json').read_text())
 assert all(r['exit']==0 for r in rows)
 if len(rows)==11:break
 assert time.monotonic()-start<180
 time.sleep(1)
print('All downstream checks finished; starting isolated timing',flush=True)
subprocess.run(['python3',str(p/'run-native-pairs.py')],check=True)
source=Path('/tmp/interval-refactor/reachability-binaries/reachability-cover');common=Path('/tmp/interval-refactor/reachability-cover-executable');shutil.copy2(source,common);rows=[]
for trial in range(2):
 cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common)];start=time.monotonic()
 with (p/f'cover-cost-{trial}.log').open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(trial=trial,command=cmd,cwd='/tmp/interval-refactor',returncode=r.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(source.read_bytes()).hexdigest()));(p/'cover-cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0
 print('cover trial',trial,round(time.monotonic()-start,2),flush=True)
