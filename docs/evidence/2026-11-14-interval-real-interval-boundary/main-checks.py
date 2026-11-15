from pathlib import Path
import json,os,subprocess,time,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');rows=[]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/real-interval-boundary','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
for name,cmd in [
 ('main-focused',['cargo','+1.95.0','test','--locked','-p','hypersolve','--test','real_interval_migration_contract','--','--nocapture']),
 ('main-format',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('main-diff',['git','diff','--check']),
 ('main-staged-diff',['git','diff','--cached','--check']),
 ('main-budget',['bash','scripts/check-repository-budget.sh'])]:
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'cwd':str(r),'returncode':p.returncode,'seconds':time.monotonic()-start});(s/'main-checks.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,name
 print(name+' passed',flush=True)
shutil.copy2('/tmp/interval-refactor/release-docs-arguments-final-frozen-check.json',s/'prior-frozen-check.json')
