from pathlib import Path
import subprocess,time,json
out=Path(__file__).parent;root='/mnt/development/csgrs';core='/mnt/development/csgrs-field-core'
commands=[
('point-bench',root,['cargo','bench','-p','hypersolve','--features','expression-program','--bench','expression_program','--','--test']),
('dyadic-msrv',root,['cargo','+1.88.0','test','--locked','-p','hyperinterval','--no-default-features','--features','dyadic','--test','dyadic']),
('isolated-field',core,['cargo','test','-p','hyperdynamics','--all-features','--test','expression_field']),
('staged-diff',root,['git','diff','--cached','--check']),
('budget',root,['bash','scripts/check-repository-budget.sh']),
]
rows=[]
for name,cwd,cmd in commands:
 t=time.monotonic()
 with (out/(name+'-final.log')).open('w') as f:r=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,cwd=cwd,command=cmd,exit=r.returncode,seconds=time.monotonic()-t);rows.append(row);(out/'supplementary-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(row['seconds'],2),flush=True)
 if r.returncode:break
