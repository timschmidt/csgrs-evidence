from pathlib import Path
import hashlib,json,os,subprocess,time
p=Path(__file__).parent;tree=Path('/mnt/development/csgrs-dynamics-return');main=Path('/mnt/development/csgrs')
variant='error-alias-outlined';binary=json.loads((p/(variant+'-build.json')).read_text())['path'];cmd=[binary,'--test'];start=time.monotonic()
with (p/(variant+'-smoke.log')).open('w') as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=180)
count=(p/(variant+'-smoke.log')).read_text().splitlines().count('Success');assert r.returncode==0 and count==194
rows=json.loads((p/'smoke-commands.json').read_text());rows.append({'variant':variant,'command':cmd,'returncode':r.returncode,'seconds':time.monotonic()-start,'success_cases':count});(p/'smoke-commands.json').write_text(json.dumps(rows,indent=2)+'\n')
assert subprocess.check_output(['git','diff','--binary'],cwd=tree)==(p/'error-alias-outlined.patch').read_bytes()
paths=subprocess.check_output(['git','diff','--name-only'],cwd=tree,text=True).splitlines();assert len(paths)==10
subprocess.run(['git','restore','--worktree','--',*paths],cwd=tree,check=True)
assert not subprocess.check_output(['git','diff','--binary'],cwd=tree)
original=(p/'pending-extraction.patch').read_bytes()
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree)==original
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=main)==original
commands=[('restored-routing-tests',['cargo','+1.95.0','test','--locked','-p','hyperpath','--features','dispatch-trace','--lib','routing::']),('restored-axis-tests',['cargo','+1.95.0','test','--locked','-p','hyperpath','--features','dispatch-trace','--test','axis_projection_migration']),('restored-format',['cargo','+1.95.0','fmt','--all','--','--check'])]
env=dict(os.environ,CARGO_BUILD_JOBS='4',CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/dynamics-return');results=[]
for name,cmd in commands:
 start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd=tree,env=env,stdout=log,stderr=subprocess.STDOUT)
 results.append({'name':name,'command':cmd,'returncode':r.returncode,'seconds':time.monotonic()-start});(p/'restored-qualification.json').write_text(json.dumps(results,indent=2)+'\n');assert r.returncode==0;print(name,'pass',flush=True)
subprocess.run(['git','diff','--cached','--check'],cwd=tree,check=True)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree)==original
assert not subprocess.check_output(['git','diff','--binary'],cwd=tree)
print('original extraction restored and checked',flush=True)
