from pathlib import Path
import subprocess,os,json,time,shutil,hashlib
p=Path(__file__).parent;common=Path('/tmp/interval-refactor/reachability-old-executable');rows=[]
shutil.copy2('/tmp/interval-refactor/dynamics-requalification/warm-exec.py',p/'warm-exec.py')
for index,variant in enumerate(['native','baseline','baseline','native']):
 source=Path('/tmp/interval-refactor/reachability-binaries')/(variant+'-old-native-cost');shutil.copy2(source,common)
 cmd=['setarch','x86_64','-R','taskset','-c','0','python3',str(p/'warm-exec.py'),str(common)];start=time.monotonic()
 with (p/f'native-old-cost-{index}-{variant}.log').open('w') as log:r=subprocess.run(cmd,cwd='/tmp/interval-refactor',stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(index=index,variant=variant,command=cmd,cwd='/tmp/interval-refactor',returncode=r.returncode,seconds=time.monotonic()-start,sha256=hashlib.sha256(source.read_bytes()).hexdigest()));(p/'native-old-cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');assert r.returncode==0;print(index,variant,round(time.monotonic()-start,2),flush=True)
