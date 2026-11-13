from pathlib import Path
import subprocess,json,time
out=Path(__file__).parent
old='/tmp/interval-refactor/picard-step-field-control';new='/tmp/interval-refactor/picard-step-field-target/release/expression-field-cost-probe';picard='/tmp/interval-refactor/picard-step-field-target/release/picard-step-cost-probe'
assert len(json.loads((out/'checks-final.json').read_text()))==21
assert all(r['exit']==0 for r in json.loads((out/'checks-final.json').read_text()))
rows=[]
for name,path in [('candidate-1',new),('control-1',old),('control-2',old),('candidate-2',new),('picard-cost',picard)]:
 t=time.monotonic();cmd=['taskset','-c','0',path]
 with (out/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,exit=r.returncode,seconds=time.monotonic()-t));(out/'cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:break
