import subprocess,time,json
from pathlib import Path
out=Path('/tmp/interval-refactor/dynamics-axis');root='/tmp/interval-refactor/dynamics-axis-baseline'
commands=[
['cargo','+1.95.0','test','--locked','-p','hyperpath','--all-features'],
['cargo','+1.95.0','bench','--locked','-p','hyperpath','--bench','path_predicates','--','--test'],
['cargo','+1.95.0','bench','--locked','--bench','successive_operations','--features','curve,stl-io,obj-io','--','--test'],
]
rows=[]
for i,c in enumerate(commands):
 start=time.monotonic()
 with (out/f'baseline-check-{i}.log').open('w') as f:r=subprocess.run(c,cwd=root,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'baseline-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,r.returncode,flush=True)
 if r.returncode:break
