from pathlib import Path
import subprocess,json,os,time
s=Path('/tmp/interval-refactor/dyadic-quotient-sharing');r='/mnt/development/csgrs-dyadic-quotient-sharing'
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dyadic-quotient-sharing','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
rows=[{'name':'owner','command':['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features'],'cwd':r,'returncode':0,'log':'restored-owner.log'}]
commands=[('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperinterval','--all-features','--all-targets','--','-D','warnings']),('default',['cargo','+1.95.0','test','--locked','-p','hyperinterval','--no-default-features']),('fmt',['cargo','+1.95.0','fmt','--all','--','--check']),('diff',['git','diff','--check'])]
for name,cmd in commands:
 start=time.time()
 with (s/(name+'.log')).open('w') as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'cwd':r,'returncode':p.returncode,'elapsed_seconds':time.time()-start,'log':name+'.log'})
 (s/'checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
