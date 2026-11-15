from pathlib import Path
import json,os,subprocess,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs');env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/flow-noise-main','CARGO_BUILD_JOBS':'4'};rows=[]
commands=[
 ('main-owner',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features']),
 ('main-clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
 ('main-physics',['cargo','+1.95.0','test','--locked','-p','hyperphysics','--all-features','--features','hyperdynamics/flow-noise']),
 ('main-format',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('main-budget',['bash','scripts/check-repository-budget.sh']),
 ('main-diff',['git','diff','--check']),
]
for name,cmd in commands:
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append({'name':name,'command':cmd,'returncode':p.returncode,'seconds':time.monotonic()-start});(s/'main-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:raise SystemExit(p.returncode)
