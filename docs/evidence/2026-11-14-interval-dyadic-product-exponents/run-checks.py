from pathlib import Path
import subprocess,json,os,time
s=Path('/tmp/interval-refactor/dyadic-product-exponents');r='/mnt/development/csgrs-dyadic-product-exponents'
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dyadic-product-exponents','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
commands=[
 ('owner',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features']),
 ('lattice',['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--all-features']),
 ('solve',['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--lib','--tests']),
 ('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','-p','hyperlattice-interval','-p','hypersolve','--all-features','--all-targets','--','-D','warnings']),
 ('no-std',['cargo','+1.95.0','check','--locked','-p','hyperinterval','--no-default-features','--features','dyadic','--lib']),
 ('wasm',['cargo','+1.95.0','check','--locked','-p','hyperinterval','-p','hyperlattice-interval','--no-default-features','--features','hyperinterval/dyadic,hyperlattice-interval/dyadic','--lib','--target','wasm32-unknown-unknown']),
 ('docs',['cargo','+1.95.0','doc','--locked','-p','hyperinterval','--all-features','--no-deps']),
 ('fmt',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('diff',['git','diff','--check']),
]
rows=[]
for name,cmd in commands:
 start=time.time()
 with (s/(name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=f,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'cwd':r,'returncode':p.returncode,'elapsed_seconds':time.time()-start,'log':name+'.log'})
 (s/'checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
