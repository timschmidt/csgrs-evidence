from pathlib import Path
import subprocess,json,time
s=Path(__file__).parent
paths={'control':'/tmp/interval-refactor/rational-time-evolution-control','direct':'/tmp/interval-refactor/rational-time-direct-helper-candidate','macro':'/tmp/interval-refactor/rational-time-target/release/dyadic-evolution-cost-probe'}
order=['control','direct','macro','macro','direct','control','direct','macro','control','control','macro','direct'];counts={k:0 for k in paths};rows=[]
for variant in order:
 counts[variant]+=1;name=f'warm-{variant}-{counts[variant]}';cmd=['taskset','-c','0','python3',str(s/'warm-start.py'),paths[variant]];start=time.monotonic()
 with (s/(name+'.log')).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,exit=r.returncode,seconds=time.monotonic()-start));(s/'warm-cost-runs.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:break
