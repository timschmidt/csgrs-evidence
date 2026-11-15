from pathlib import Path
import subprocess,json,os,time
s=Path('/tmp/interval-refactor/dyadic-product-exponents');r='/mnt/development/csgrs'
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dyadic-product-exponents','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
commands=[
 ('main-owner',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--test','dyadic_product_exponents','--test','dyadic']),
 ('main-lattice',['cargo','+1.95.0','test','--locked','-p','hyperlattice-interval','--all-features','--test','dyadic_product_exponents']),
 ('main-solve',['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--test','expression_interval']),
 ('main-fmt',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('main-diff',['git','diff','--check']),
 ('main-staged-diff',['git','diff','--cached','--check']),
 ('main-budget',['bash','scripts/check-repository-budget.sh']),
]
rows=[]
for name,cmd in commands:
 start=time.time()
 with (s/(name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'cwd':r,'returncode':p.returncode,'elapsed_seconds':time.time()-start,'log':name+'.log'})
 (s/'main-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
