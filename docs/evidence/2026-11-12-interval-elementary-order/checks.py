import subprocess,json
from pathlib import Path
root=Path('/tmp/interval-refactor/elementary-order')
commands=[]
for features in ['', 'serde', 'integer', 'fixed', 'dyadic']:
    commands.append(['cargo','+1.88.0','test','--locked','-p','hyperinterval','--no-default-features','--features',features])
for toolchain,features in [('1.88.0','float-enclosure'),('1.88.0','float-enclosure,serde'),('1.88.0','float-enclosure,dyadic'),('1.95.0','float-enclosure,rational'),('1.95.0','integer,fixed,real-ball,float-proposal,float-enclosure,serde,dispatch-trace')]:
    commands.append(['cargo','+'+toolchain,'test','--locked','-p','hyperinterval','--no-default-features','--features',features])
commands += [ ['cargo','test','--locked','-p','hyperinterval','--all-features'], ['cargo','clippy','--locked','-p','hyperinterval','--no-default-features','--features','float-enclosure','--all-targets','--','-D','warnings'], ['/tmp/interval-refactor/tools/bin/zizmor','--pedantic','--strict-collection','.'],
 ['cargo','+1.88.0','clippy','--locked','-p','hyperinterval','--all-targets','--features','integer,fixed,dyadic,float-proposal,float-enclosure,serde','--','-D','warnings'],
 ['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-targets','--all-features','--','-D','warnings'],
 ['cargo','doc','--locked','-p','hyperinterval','--no-deps','--all-features'],
 ['cargo','check','--locked','--manifest-path','crates/hyperinterval/fuzz/Cargo.toml','--bins'],
 ['cargo','fmt','--all','--','--check'], ['rustfmt','--edition','2024','--check','crates/hyperinterval/fuzz/fuzz_targets/strict_float.rs'],
 ['rustfmt','--edition','2024','--check','crates/hyperinterval/fuzz/fuzz_targets/dyadic_arithmetic.rs'],
 ['cargo','test','--locked','-p','hypersolve','--all-features','--lib','interval_migration'],
]
for target in ['thumbv7em-none-eabihf','wasm32-unknown-unknown']:
    commands.append(['cargo','+1.88.0','check','--locked','-p','hyperinterval','--target',target,'--no-default-features','--features','integer,fixed,dyadic,float-enclosure,serde'])
for compiler in ['1.88.0','1.95.0','stable']:
    commands.append(['cargo','+'+compiler,'test','--locked','--release','-p','hyperinterval','--features',('float-enclosure,float-proposal,dyadic,serde' if compiler=='1.88.0' else 'float-enclosure,float-proposal,dyadic,rational,serde'),'--test','float','--','--nocapture'])
    commands.append(['python3','scripts/check_interval_float_codegen.py','--toolchain',compiler,'--output',str(root/('codegen-final-'+compiler))])
commands.append(['bash','scripts/check-repository-budget.sh'])
commands.append(['cargo','test','--locked','-p','hyperinterval','--all-features','--all-targets'])
commands.append(['cargo','tree','--locked','-p','hyperinterval','--no-default-features','--features','float-enclosure','--edges','normal','--prefix','none'])
results=[]
for i,cmd in enumerate(commands):
    with (root/f'check-{i}.log').open('w') as out:
        p=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,env=__import__('os').environ|{'RUSTDOCFLAGS':'-D warnings'})
    row={'command':cmd,'exit_code':p.returncode,'log':f'check-{i}.log'}
    results.append(row); print(json.dumps(row),flush=True)
    (root/'checks.json').write_text(json.dumps(results,indent=2)+'\n')
assert all(r['exit_code']==0 for r in results)
