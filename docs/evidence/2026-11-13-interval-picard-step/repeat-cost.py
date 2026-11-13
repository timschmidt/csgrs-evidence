from pathlib import Path
import subprocess,json,time
s=Path(__file__).parent
old='/tmp/interval-refactor/picard-step-field-control';new='/tmp/interval-refactor/picard-step-field-target/release/expression-field-cost-probe';picard='/tmp/interval-refactor/picard-step-field-target/release/picard-step-cost-probe'
rows=json.loads((s/'cost-runs.json').read_text());final=[r for r in rows if r['name']!='picard-cost']
for name,path in [('control-3',old),('candidate-3',new),('candidate-4',new),('control-4',old),('picard-cost-final',picard)]:
 start=time.monotonic();cmd=['taskset','-c','0',path]
 with (s/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,command=cmd,exit=r.returncode,seconds=time.monotonic()-start);rows.append(row);final.append(row)
 (s/'cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');(s/'cost-final-runs.json').write_text(json.dumps(final,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:break
