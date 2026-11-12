from pathlib import Path
import subprocess,json,time
out=Path('/tmp/interval-refactor/authored-center-radius')
wasm='crates/hyperlattice-interval/conformance/centered-wasm/Cargo.toml'
commands=[
['cargo','+1.88.0','test','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed,float-enclosure,dyadic,serde'],
['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--all-features'],
['cargo','+1.95.0','test','--locked','--release','-p','hyperlattice-interval','--all-features'],
['cargo','+stable','test','--locked','-p','hyperlattice-interval','--all-features'],
['cargo','+1.88.0','clippy','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed,float-enclosure,dyadic,serde','--all-targets','--','-D','warnings'],
['cargo','+1.95.0','clippy','--locked','-p','hyperlattice-interval','--all-features','--all-targets','--','-D','warnings'],
['cargo','+stable','clippy','--locked','-p','hyperlattice-interval','--all-features','--all-targets','--','-D','warnings'],
['cargo','+1.95.0','doc','--locked','-p','hyperlattice-interval','--all-features','--no-deps'],
['cargo','+1.88.0','check','--locked','-p','hyperlattice-interval','--no-default-features'],
['cargo','+1.88.0','check','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed','--target','thumbv7em-none-eabihf'],
['cargo','+1.88.0','clippy','--locked','--manifest-path',wasm,'--target','wasm32-unknown-unknown','--','-D','warnings'],
['cargo','+1.88.0','build','--locked','--release','--manifest-path',wasm,'--target','wasm32-unknown-unknown'],
['cargo','+1.95.0','test','--locked','-p','hyperlattice','--all-features'],
['cargo','+1.95.0','clippy','--locked','-p','hyperlattice','--all-features','--all-targets','--','-D','warnings'],
['cargo','+1.95.0','build','--locked','--release','-p','hyperlattice-interval','--all-features','--example','centered_cost'],
['cargo','fmt','--all','--','--check'],
['cargo','+1.88.0','fmt','--manifest-path',wasm,'--','--check'],
['git','diff','--check'],
]
rows=[]
for i,cmd in enumerate(commands):
 start=time.monotonic()
 with (out/f'check-{i:02}.log').open('w') as f:
  p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=cmd,exit=p.returncode,seconds=time.monotonic()-start,log=f'check-{i:02}.log'))
 (out/'checks.json').write_text(json.dumps(rows,indent=2)+'\n')
 print(i,p.returncode,flush=True)
 if p.returncode: break
