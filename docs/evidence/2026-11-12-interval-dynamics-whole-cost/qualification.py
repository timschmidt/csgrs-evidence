from pathlib import Path
import subprocess,json,time,hashlib
out=Path('/tmp/interval-refactor/dynamics-whole-cost');root='/mnt/development/csgrs';interface='/mnt/development/alumina-interface';rows=[]
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
 with (out/f'qualification-{index:02}.log').open('w') as f:r=subprocess.run(command,cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(cwd=cwd,command=command,exit=r.returncode,seconds=time.monotonic()-start));(out/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(index,r.returncode,flush=True);assert r.returncode==0
p=Path(root)/'target/release/deps/path_predicates-f6f4f4070af4a364';actual=hashlib.sha256(p.read_bytes()).hexdigest();expected=json.loads((out/'inline-reports-binary.json').read_text())['sha256'];assert actual==expected
(out/'primary-binary.json').write_text(json.dumps(dict(path=str(p),sha256=actual,bytes=p.stat().st_size,identical_to_isolated=True),indent=2)+'\n')
