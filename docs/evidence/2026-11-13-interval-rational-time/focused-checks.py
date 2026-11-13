from pathlib import Path
import subprocess,json,time,os
s=Path(__file__).parent;root='/mnt/development/csgrs'
commands=[('program-focused', 'cargo test --locked -p hypersolve --all-features --lib --test program_affine --test program_jacobian --test symbolic_power_boundary --test expression_program --test expression_interval --test smoke --test readme', {}, '/mnt/development/csgrs')]
rows=json.loads((s/'focused-checks.json').read_text()) if (s/'focused-checks.json').exists() else []
for name,command,extra,cwd in commands:
 if any(r['name']==name and r['exit']==0 for r in rows):continue
 start=time.monotonic();cmd=command.split()
 with (s/(name+'-final.log')).open('w') as f:r=subprocess.run(cmd,cwd=cwd,env={**os.environ,**extra},stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,command=cmd,cwd=cwd,environment=extra,exit=r.returncode,seconds=time.monotonic()-start);rows.append(row);(s/'focused-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(row['seconds'],2),flush=True)
 if r.returncode:break
