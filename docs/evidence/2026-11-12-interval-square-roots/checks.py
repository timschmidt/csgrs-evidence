import subprocess,json,os
from pathlib import Path
root=Path('/tmp/interval-refactor/square-roots')
commands=[]
for c,f in [('1.95.0','rational'),('1.95.0','rational,serde'),('1.95.0','rational,dyadic'),('1.88.0',''),('1.88.0','integer,fixed'),('1.88.0','dyadic,float-enclosure,serde')]:
 commands.append(['cargo','+'+c,'test','--locked','-p','hyperinterval','--no-default-features','--features',f])
commands += [
 ['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features'],
 ['cargo','test','--locked','-p','hyperinterval','--all-features','--all-targets'],
 ['cargo','test','--locked','-p','hyperinterval','--all-features','--doc'],
]
for c in ['1.95.0','stable']:
 commands.append(['cargo','+'+c,'test','--locked','--release','-p','hyperinterval','--all-features','--test','square_roots'])
 commands.append(['cargo','+'+c,'clippy','--locked','-p','hyperinterval','--all-targets','--all-features','--','-D','warnings'])
commands += [
 ['cargo','+1.88.0','clippy','--locked','-p','hyperinterval','--all-targets','--features','integer,fixed,dyadic,float-proposal,float-enclosure,serde','--','-D','warnings'],
 ['cargo','+1.95.0','doc','--locked','-p','hyperinterval','--no-deps','--all-features'],
 ['cargo','fmt','--all','--','--check'],
 ['bash','-c','rustfmt --edition 2024 --check crates/hyperinterval/fuzz/fuzz_targets/*.rs'],
 ['cargo','check','--locked','--manifest-path','crates/hyperinterval/fuzz/Cargo.toml','--bins'],
 ['cargo','check','--locked','--manifest-path','crates/hyperinterval/fuzz/Cargo.toml','--bins','--features','rational'],
 ['/tmp/interval-refactor/tools/bin/zizmor','--pedantic','--strict-collection','.'],
 ['bash','scripts/check-repository-budget.sh'],
 ['cargo','test','--locked','-p','hypersolve','--all-features','--lib','interval_migration'],
 ['cargo','tree','--locked','-p','hyperinterval','--no-default-features','--features','integer,fixed','--edges','normal','--prefix','none'],
 ['timeout','60s','cargo','test','--locked','-p','hyperinterval','--all-features','--test','square_roots','budgets_refuse'],
]
for t in ['thumbv7em-none-eabihf','wasm32-unknown-unknown']:
 commands.append(['cargo','+1.88.0','check','--locked','-p','hyperinterval','--target',t,'--no-default-features','--features','integer,fixed,dyadic,float-enclosure,serde'])
rows=[]
for i,cmd in enumerate(commands):
 name=f'check-{i}.log'
 with (root/name).open('w') as out:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,env=os.environ|{'RUSTDOCFLAGS':'-D warnings'})
 rows.append(dict(command=cmd,exit_code=r.returncode,log=name));print(rows[-1],flush=True)
 (root/'checks.json').write_text(json.dumps(rows,indent=2)+'\n')
assert all(r['exit_code']==0 for r in rows)
