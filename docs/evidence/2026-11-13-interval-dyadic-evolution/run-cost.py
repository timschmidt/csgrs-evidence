from pathlib import Path
import subprocess,json,time
s=Path(__file__).parent
assert len(json.loads((s/'checks-final.json').read_text()))==15
assert all(r['exit']==0 for r in json.loads((s/'checks-final.json').read_text()))
old='/tmp/interval-refactor/dyadic-evolution-picard-control';new='/tmp/interval-refactor/dyadic-evolution-target/release/picard-step-cost-probe';flow='/tmp/interval-refactor/dyadic-evolution-target/release/dyadic-evolution-cost-probe'
rows=json.loads((s/'cost-runs.json').read_text()) if (s/'cost-runs.json').exists() else []
for name,path in [('candidate-1',new),('control-1',old),('control-2',old),('candidate-2',new),('evolution-cost',flow)]:
 if any(r['name']==name and r['exit']==0 for r in rows):continue
 start=time.monotonic();cmd=['taskset','-c','0',path]
 with (s/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,exit=r.returncode,seconds=time.monotonic()-start));(s/'cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(rows[-1]['seconds'],2),flush=True)
 if r.returncode:break
