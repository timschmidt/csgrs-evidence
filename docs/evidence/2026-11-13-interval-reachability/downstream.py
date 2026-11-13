from pathlib import Path
import subprocess,json,time,hashlib
out=Path(__file__).parent;root='/mnt/development/csgrs';interface='/mnt/development/alumina-interface';rows=[]
commands=[
(root,['cargo','+1.95.0','test','--locked','-p','hyperdynamics','-p','hyperpath','--all-features']),
(root,['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','-p','hyperpath','--all-features','--all-targets','--','-D','warnings']),
(root,['cargo','+1.95.0','doc','--locked','-p','hyperdynamics','-p','hyperpath','--all-features','--no-deps']),
(root,['cargo','+stable','check','--locked','-p','hyperdynamics','--target','wasm32-unknown-unknown']),
(root,['cargo','+1.95.0','bench','--locked','-p','hyperpath','--bench','path_predicates','--','--test']),
(interface,['cargo','+1.95.0','test','--locked','-p','alumina-interface-core']),
(interface,['cargo','+1.95.0','clippy','--locked','-p','alumina-interface-core','--all-targets','--','-D','warnings']),
(root,['cargo','+1.95.0','bench','--locked','--bench','successive_operations','--features','curve,stl-io,obj-io','--','--test']),
(root,['cargo','+1.95.0','fmt','--all','--','--check']),
(interface,['cargo','+1.95.0','fmt','--all','--','--check']),
(root,['git','diff','--check'])]
for index,(cwd,command) in enumerate(commands):
 start=time.monotonic()
 with (out/f'downstream-{index:02}.log').open('w') as f:r=subprocess.run(command,cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(cwd=cwd,command=command,exit=r.returncode,seconds=time.monotonic()-start));(out/'downstream-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(index,r.returncode,flush=True);assert r.returncode==0
