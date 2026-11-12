import os,subprocess,json,time
from pathlib import Path
root=Path('/tmp/interval-refactor/interface-measurements')
manifest='crates/hyperinterval/conformance/alumina-measurements/Cargo.toml'
wasm='crates/hyperinterval/conformance/alumina-measurements/wasm/Cargo.toml'
interface='/mnt/development/alumina-interface/Cargo.toml'
commands=[
 ['cargo','+1.95.0','test','--locked','--manifest-path',manifest,'--all-targets','--features','trace','--','--nocapture'],
 ['cargo','+1.95.0','test','--locked','--release','--manifest-path',manifest,'--all-targets','--features','trace','--','--nocapture'],
 ['cargo','+1.95.0','clippy','--locked','--manifest-path',manifest,'--all-targets','--all-features','--','-D','warnings'],
 ['cargo','+1.95.0','doc','--locked','--manifest-path',manifest,'--no-deps','--all-features'],
 ['cargo','+stable','clippy','--locked','--manifest-path',wasm,'--target','wasm32-unknown-unknown','--','-D','warnings'],
 ['cargo','+1.95.0','test','--locked','--manifest-path',interface,'-p','alumina-interface-core'],
 ['cargo','+1.95.0','clippy','--locked','--manifest-path',interface,'-p','alumina-interface-core','--all-targets','--','-D','warnings'],
 ['cargo','+1.95.0','doc','--locked','--manifest-path',interface,'-p','alumina-interface-core','--no-deps'],
 ['cargo','+1.95.0','test','--locked','-p','hyperinterval','--no-default-features','--features','rational,serde'],
 ['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--no-default-features','--features','rational,serde','--all-targets','--','-D','warnings'],
 ['cargo','+1.95.0','fmt','--manifest-path',manifest,'--','--check'],
 ['cargo','+1.95.0','fmt','--manifest-path',wasm,'--','--check'],
 ['cargo','+1.95.0','fmt','--manifest-path',interface,'--all','--','--check'],
 ['cargo','fmt','--all','--','--check'],
 ['cargo','+1.95.0','tree','--locked','--manifest-path',interface,'-p','alumina-interface-core','--edges','normal','--prefix','none'],
]
rows=[]
for i,cmd in enumerate(commands):
 start=time.monotonic();log=f'final-check-{i}.log'
 with (root/log).open('w') as f:p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=os.environ|{'RUSTDOCFLAGS':'-D warnings'})
 rows.append({'command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-start,'log':log})
 (root/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(i,p.returncode,flush=True)
assert all(row['exit_code']==0 for row in rows)
