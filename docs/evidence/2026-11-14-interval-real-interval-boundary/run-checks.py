from pathlib import Path
import json,os,subprocess,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-real-adapter-boundary');rows=[]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/real-interval-boundary','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
commands=[
 ('owner-tests',['cargo','+1.95.0','test','--locked','-p','hypersolve','--all-features','--lib','--tests']),
 ('owner-clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','--all-features','--all-targets','--','-D','warnings']),
 ('curve-strict',['cargo','+1.95.0','test','--locked','-p','hypercurve','--all-features','--lib','real_interval_enclosures_do_not_consume_topology_approximation']),
 ('curve-bernstein',['cargo','+1.95.0','test','--locked','-p','hypercurve','--all-features','--lib','bivariate_parameter_box_sign_keeps_boundary_zeros_and_bernstein_fallback']),
 ('curve-unused-radical',['cargo','+1.95.0','test','--locked','-p','hypercurve','--all-features','--lib','unused_positive_radicals_do_not_block_recursive_enclosures']),
 ('format',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('diff',['git','diff','--check'])]
for name,cmd in commands:
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'cwd':str(r),'returncode':p.returncode,'seconds':time.monotonic()-start});(s/'checks.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,name
 print(name+' passed',flush=True)
