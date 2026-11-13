from pathlib import Path
import subprocess,time,json
out=Path('/tmp/interval-refactor/dynamics-jerk')
commands=[
['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','-p','hyperpath','--all-features','--all-targets','--','-D','warnings'],
['cargo','+1.95.0','doc','--locked','-p','hyperdynamics','-p','hyperpath','--all-features','--no-deps'],
['cargo','+stable','check','--locked','-p','hyperdynamics','--target','wasm32-unknown-unknown'],
['cargo','+1.95.0','bench','--locked','-p','hyperpath','--bench','path_predicates','--','--test'],
['cargo','+1.95.0','bench','--locked','--bench','successive_operations','--features','curve,stl-io,obj-io','--','--test'],
['cargo','+1.95.0','test','--locked','--manifest-path','/mnt/development/alumina-interface/Cargo.toml','-p','alumina-interface-core'],
['cargo','+1.95.0','clippy','--locked','--manifest-path','/mnt/development/alumina-interface/Cargo.toml','-p','alumina-interface-core','--all-targets','--','-D','warnings'],
['cargo','+1.95.0','fmt','--all','--','--check'],
['cargo','+1.95.0','fmt','--manifest-path','/mnt/development/alumina-interface/Cargo.toml','--all','--','--check'],
['git','diff','--check']]
rows=[]
for i,c in enumerate(commands):
 start=time.monotonic()
 with (out/f'final-check-{i:02}.log').open('w') as f:r=subprocess.run(c,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'final-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,r.returncode,flush=True)
 if r.returncode:break
