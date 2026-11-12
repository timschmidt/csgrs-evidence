import subprocess,json
from pathlib import Path
root=Path('/tmp/interval-refactor/dyadic-measures')
commands=[]
for toolchain,features in [('1.88.0','dyadic'),('1.88.0','dyadic,serde'),('1.95.0','rational,dyadic'),('1.95.0','integer,fixed,real-ball,serde,dispatch-trace')]:
    commands.append(['cargo','+'+toolchain,'test','--locked','-p','hyperinterval','--no-default-features','--features',features])
commands += [
 ['cargo','+1.88.0','clippy','--locked','-p','hyperinterval','--all-targets','--features','integer,fixed,dyadic,serde','--','-D','warnings'],
 ['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-targets','--all-features','--','-D','warnings'],
 ['cargo','doc','--locked','-p','hyperinterval','--no-deps','--all-features'],
 ['cargo','check','--locked','--manifest-path','crates/hyperinterval/fuzz/Cargo.toml','--bins'],
 ['cargo','fmt','--all','--','--check'],
 ['rustfmt','--edition','2024','--check','crates/hyperinterval/fuzz/fuzz_targets/dyadic_arithmetic.rs'],
 ['cargo','test','--locked','-p','hypersolve','--all-features','--lib','interval_migration'],
]
for target in ['thumbv7em-none-eabihf','wasm32-unknown-unknown']:
    commands.append(['cargo','+1.88.0','check','--locked','-p','hyperinterval','--target',target,'--no-default-features','--features','dyadic,serde'])
results=[]
for i,cmd in enumerate(commands):
    with (root/f'check-{i}.log').open('w') as out:
        p=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,env=__import__('os').environ|{'RUSTDOCFLAGS':'-D warnings'})
    row={'command':cmd,'exit_code':p.returncode,'log':f'check-{i}.log'}
    results.append(row); print(json.dumps(row),flush=True)
    (root/'checks.json').write_text(json.dumps(results,indent=2)+'\n')
assert all(r['exit_code']==0 for r in results)
