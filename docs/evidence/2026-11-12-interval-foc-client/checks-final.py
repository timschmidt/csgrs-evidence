import os,json,subprocess,time
from pathlib import Path
root=Path('/tmp/interval-refactor/foc-client')
manifest='crates/hyperlattice-interval/conformance/alumina-foc/Cargo.toml'
wasm='crates/hyperlattice-interval/conformance/alumina-foc/wasm/Cargo.toml'
commands=[]
for tc in ['1.88.0','stable']:
 for extra in [[],['--release']]:
  commands.append(['cargo','+'+tc,'test','--locked','--manifest-path',manifest,'--all-targets',*extra,'--','--nocapture'])
 commands.append(['cargo','+'+tc,'clippy','--locked','--manifest-path',manifest,'--all-targets','--','-D','warnings'])
 commands.append(['cargo','+'+tc,'doc','--locked','--manifest-path',manifest,'--no-deps'])
 for target in ['thumbv7em-none-eabihf','wasm32-unknown-unknown']:
  commands.append(['cargo','+'+tc,'check','--locked','--manifest-path',manifest,'--lib','--target',target])
  commands.append(['cargo','+'+tc,'clippy','--locked','--manifest-path',manifest,'--lib','--target',target,'--','-D','warnings'])
 commands.append(['cargo','+'+tc,'clippy','--locked','--manifest-path',wasm,'--target','wasm32-unknown-unknown','--','-D','warnings'])
commands += [
 ['cargo','fmt','--manifest-path',manifest,'--','--check'],
 ['cargo','fmt','--manifest-path',wasm,'--','--check'],
 ['cargo','fmt','--all','--','--check'],
 ['cargo','+1.88.0','test','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed'],
 ['cargo','+1.88.0','test','--locked','--manifest-path','/mnt/development/alumina-firmware/Cargo.toml','-p','alumina-foc'],
 ['cargo','+1.88.0','tree','--locked','--manifest-path',manifest,'--edges','normal','--prefix','none'],
]
rows=[]
for i,cmd in enumerate(commands):
 start=time.monotonic();log=f'check-{i}-final.log'
 with (root/log).open('w') as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=os.environ|{'RUSTDOCFLAGS':'-D warnings'})
 row={'command':cmd,'exit_code':p.returncode,'elapsed_seconds':time.monotonic()-start,'log':log};rows.append(row)
 (root/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,p.returncode,cmd,flush=True)
assert all(row['exit_code']==0 for row in rows)
