from pathlib import Path
import hashlib,json,os,subprocess,time
p=Path(__file__).parent;tree=Path("/mnt/development/csgrs-dynamics-layout-recheck")
original=(p/"pending-extraction.patch").read_bytes()
commands=[('restored-routing-tests',['cargo','+1.95.0','test','--locked','-p','hyperpath','--features','dispatch-trace','--lib','routing::']),('restored-axis-tests',['cargo','+1.95.0','test','--locked','-p','hyperpath','--features','dispatch-trace','--test','axis_projection_migration']),('restored-format',['cargo','+1.95.0','fmt','--all','--','--check'])]
env=dict(os.environ,CARGO_BUILD_JOBS='4',CARGO_TARGET_DIR='/mnt/development/.interval-refactor-build/dynamics-layout-recheck');results=[]
for name,cmd in commands:
 start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd=tree,env=env,stdout=log,stderr=subprocess.STDOUT)
 results.append({'name':name,'command':cmd,'returncode':r.returncode,'seconds':time.monotonic()-start});(p/'restored-qualification.json').write_text(json.dumps(results,indent=2)+'\n');assert r.returncode==0;print(name,'pass',flush=True)
subprocess.run(['git','diff','--cached','--check'],cwd=tree,check=True)
assert subprocess.check_output(['git','diff','--cached','--binary'],cwd=tree)==original
assert not subprocess.check_output(['git','diff','--binary'],cwd=tree)
print('original extraction restored and checked',flush=True)
