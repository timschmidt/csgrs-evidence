from pathlib import Path
import subprocess,json,time
s=Path(__file__).parent
assert len(json.loads((s/'checks-final.json').read_text()))==20
assert len(json.loads((s/'supplementary-checks.json').read_text()))==8
for name in ['checks-final.json','supplementary-checks.json']:
 assert all(r['exit']==0 for r in json.loads((s/name).read_text()))
assert json.loads((s/'semantic-comparison.json').read_text())['equal']
old='/tmp/interval-refactor/rational-time-evolution-control';new='/tmp/interval-refactor/rational-time-target/release/dyadic-evolution-cost-probe';flow='/tmp/interval-refactor/rational-time-target/release/rational-clock-cost-probe'
rows=[]
for name,path in [('candidate-1',new),('control-1',old),('control-2',old),('candidate-2',new),('clock-cost',flow)]:
 start=time.monotonic();cmd=['taskset','-c','0',path]
 with (s/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,exit=r.returncode,seconds=time.monotonic()-start));(s/'cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(rows[-1]['seconds'],2),flush=True)
 if r.returncode:break
