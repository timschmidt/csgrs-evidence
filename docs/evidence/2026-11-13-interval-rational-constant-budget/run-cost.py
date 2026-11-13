from pathlib import Path
import subprocess,json,time
out=Path(__file__).parent
old='/tmp/interval-refactor/rational-constant-field-control';new='/tmp/interval-refactor/rational-constant-field-target/release/expression-field-cost-probe'
assert all(r['exit']==0 for r in json.loads((out/'checks-final.json').read_text()))
assert len(json.loads((out/'supplementary-checks.json').read_text()))==5
assert all(r['exit']==0 for r in json.loads((out/'supplementary-checks.json').read_text()))
rows=[]
for name,path in [('candidate-1',new),('control-1',old),('control-2',old),('candidate-2',new),('control-3',old),('candidate-3',new),('candidate-4',new),('control-4',old)]:
 t=time.monotonic();cmd=['taskset','-c','0',path]
 with (out/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,exit=r.returncode,seconds=time.monotonic()-t));assert r.returncode==0
(out/'cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(json.dumps(rows,indent=2))
