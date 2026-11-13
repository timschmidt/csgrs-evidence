import subprocess,json,time
from pathlib import Path
out=Path('/tmp/interval-refactor/centered-affine')
w='crates/hyperlattice-interval/conformance/centered-wasm/Cargo.toml'
commands=[
['cargo','+1.88.0','test','--locked','-p','hyperlattice-interval','--features','fixed,dyadic,float-enclosure,serde'],
['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--all-features'],
['cargo','+1.95.0','test','--locked','--release','-p','hyperlattice-interval','--all-features'],
['cargo','+stable','test','--locked','-p','hyperlattice-interval','--all-features'],
['cargo','+1.95.0','clippy','--locked','-p','hyperlattice-interval','--all-features','--all-targets','--','-D','warnings'],
['cargo','+stable','clippy','--locked','-p','hyperlattice-interval','--all-features','--all-targets','--','-D','warnings'],
['cargo','+1.95.0','doc','--locked','-p','hyperlattice-interval','--all-features','--no-deps'],
['cargo','+1.88.0','check','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed','--target','thumbv7em-none-eabihf'],
['cargo','+1.95.0','test','--locked','-p','hyperlattice','--all-features','--test','interval_surface'],
['cargo','+1.95.0','clippy','--locked','-p','hyperlattice','--all-features','--lib','--','-D','warnings'],
['cargo','+1.88.0','clippy','--locked','--manifest-path',w,'--target','wasm32-unknown-unknown','--','-D','warnings'],
['cargo','+1.88.0','build','--locked','--release','--manifest-path',w,'--target','wasm32-unknown-unknown'],
['cargo','+1.95.0','build','--locked','--release','-p','hyperlattice-interval','--all-features','--example','centered_cost'],
['cargo','fmt','--all','--','--check'],
['git','diff','--check'],
]
rows=[]
for i,c in enumerate(commands):
 start=time.monotonic()
 with (out/f'check-{i:02}.log').open('w') as f:r=subprocess.run(c,stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(command=c,exit=r.returncode,seconds=time.monotonic()-start));(out/'checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,r.returncode,flush=True)
 if r.returncode:break
