import subprocess,json,time,platform,os
from pathlib import Path
root=Path('/mnt/development/csgrs')
out=Path('/tmp/interval-refactor/primitive-layouts')
manifest='crates/hyperlattice-interval/conformance/primitive-layouts/Cargo.toml'
wasm='crates/hyperlattice-interval/conformance/primitive-layouts/wasm/Cargo.toml'
commands=[
 ['cargo','+1.88.0','fmt','--manifest-path',manifest,'--','--check'],
 ['cargo','+1.88.0','fmt','--manifest-path',wasm,'--','--check'],
 ['cargo','+1.88.0','test','--locked','--manifest-path',manifest],
 ['cargo','+1.88.0','test','--locked','--release','--manifest-path',manifest],
 ['cargo','+1.88.0','clippy','--locked','--manifest-path',manifest,'--all-targets','--','-D','warnings'],
 ['cargo','+1.88.0','doc','--locked','--manifest-path',manifest,'--no-deps'],
 ['cargo','+1.88.0','build','--locked','--release','--manifest-path',manifest,'--bins'],
 ['cargo','+1.88.0','clippy','--locked','--manifest-path',wasm,'--target','wasm32-unknown-unknown','--','-D','warnings'],
 ['cargo','+1.88.0','build','--locked','--release','--manifest-path',wasm,'--target','wasm32-unknown-unknown'],
 ['cargo','+1.88.0','check','--locked','--manifest-path',manifest,'--lib','--target','thumbv7em-none-eabihf'],
 ['cargo','+stable','test','--locked','--manifest-path',manifest],
 ['cargo','+stable','clippy','--locked','--manifest-path',manifest,'--all-targets','--','-D','warnings'],
 ['cargo','+1.88.0','test','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed,float-enclosure,serde'],
 ['cargo','fmt','--all','--','--check'],
 ['git','diff','--check'],
]
results=[]
for i,cmd in enumerate(commands):
 start=time.monotonic()
 with (out/f'check-{i:02}.log').open('w') as log:
  p=subprocess.run(cmd,cwd=root,stdout=log,stderr=subprocess.STDOUT)
 row=dict(command=cmd,exit=p.returncode,seconds=time.monotonic()-start,log=f'check-{i:02}.log')
 results.append(row)
 (out/'checks.json').write_text(json.dumps(results,indent=2)+'\n')
 print(i,p.returncode,flush=True)
 if p.returncode: break
