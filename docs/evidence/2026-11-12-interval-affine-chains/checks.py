import subprocess,json,os,time
from pathlib import Path
root=Path('/tmp/interval-refactor/affine-chains');commands=[]
for tc in ['1.88.0','stable']:
 for feature in ['', 'fixed','dyadic','float-enclosure','serde','fixed,serde','dyadic,serde','float-enclosure,serde']:
  commands.append(['cargo','+'+tc,'test','--locked','-p','hyperlattice-interval','--no-default-features','--features',feature])
 features='fixed,dyadic,float-enclosure,serde'+(',rational' if tc=='stable' else '')
 commands.append(['cargo','+'+tc,'test','--locked','-p','hyperlattice-interval','--all-targets','--features',features])
 for feature in ['',features]:
  commands.append(['cargo','+'+tc,'clippy','--locked','-p','hyperlattice-interval','--all-targets','--no-default-features','--features',feature,'--','-D','warnings'])
 commands.append(['cargo','+'+tc,'doc','--locked','-p','hyperlattice-interval','--no-deps','--features',features])
commands += [
 ['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--all-features'],
 ['cargo','test','--locked','-p','hyperlattice-interval','--features','rational,serde'],
 ['cargo','test','--locked','-p','hyperlattice-interval','--all-features','--release'],
 ['cargo','test','--locked','-p','hyperlattice','--all-features','--test','interval_surface'],
 ['cargo','clippy','--locked','-p','hyperlattice','--all-targets','--all-features','--','-D','warnings'],
 ['cargo','check','--locked','-p','hyperlattice','--no-default-features','--all-targets'],
 ['cargo','test','--locked','-p','hypersolve','--all-features','--lib','interval_migration'],
 ['cargo','fmt','--all','--','--check'],
 ['rustfmt','+1.88.0','--edition','2024','--check','crates/hyperlattice-interval/conformance/no_alloc_wasm.rs'],
 ['cargo','package','-p','hyperlattice-interval','--list','--allow-dirty'],
 ['cargo','tree','--locked','-p','hyperlattice-interval','--no-default-features','--features','fixed,float-enclosure','--edges','normal','--prefix','none'],
 ['cargo','doc','--locked','-p','hyperlattice','--no-deps','--all-features'],
]
for tc in ['1.88.0','stable']:
 for target in ['thumbv7em-none-eabihf','wasm32-unknown-unknown']:
  for feature in ['fixed,float-enclosure,serde','dyadic,serde']:
   commands.append(['cargo','+'+tc,'check','--locked','-p','hyperlattice-interval','--target',target,'--no-default-features','--features',feature])
rows=[]
for i,cmd in enumerate(commands):
 start=time.monotonic();log=f'check-{i}.log'
 with (root/log).open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=os.environ|{'RUSTDOCFLAGS':'-D warnings'})
 rows.append(dict(command=cmd,exit_code=r.returncode,elapsed_seconds=time.monotonic()-start,log=log));print(i,r.returncode,cmd,flush=True)
 (root/'checks.json').write_text(json.dumps(rows,indent=2)+'\n')
assert all(row['exit_code']==0 for row in rows)
