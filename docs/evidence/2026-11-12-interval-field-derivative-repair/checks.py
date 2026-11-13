from pathlib import Path
import subprocess,time,json
out=Path('/tmp/interval-refactor/dynamics-field-derivative');rows=[];root='/mnt/development/csgrs';interface='/mnt/development/alumina-interface'
commands=[
(root,['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--lib','--test','symbolic_power_boundary','--test','smoke']),
(root,['cargo','+1.95.0','test','--locked','--release','-p','hypersolve','--test','symbolic_power_boundary']),
(root,['cargo','+1.95.0','clippy','--locked','-p','hypersolve','--all-features','--all-targets','--','-D','warnings']),
(root,['cargo','+1.95.0','test','--locked','-p','hyperdynamics','-p','hyperpath','--all-features']),
(interface,['cargo','+1.95.0','test','--locked','-p','alumina-interface-core']),
(interface,['cargo','+1.95.0','clippy','--locked','-p','alumina-interface-core','--all-targets','--','-D','warnings']),
(root,['cargo','+1.95.0','doc','--locked','-p','hypersolve','--all-features','--no-deps']),
(root,['cargo','+stable','check','--locked','-p','hyperdynamics','--target','wasm32-unknown-unknown']),
(root,['cargo','+1.95.0','bench','--locked','--bench','successive_operations','--features','curve,stl-io,obj-io','--','--test']),
(root,['cargo','+1.95.0','fmt','--all','--','--check']),
(root,['git','diff','--check'])]
for i,(cwd,c) in enumerate(commands):
 start=time.monotonic()
 with (out/f'check-{i:02}.log').open('w') as f:r=subprocess.run(c,cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(cwd=cwd,command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,r.returncode,flush=True);assert r.returncode==0
