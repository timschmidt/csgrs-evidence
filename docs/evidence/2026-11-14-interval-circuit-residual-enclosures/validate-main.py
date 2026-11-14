from pathlib import Path
import subprocess,time,json,os
s=Path(__file__).parent;r='/mnt/development/csgrs';env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-polynomial-arithmetic-main','CARGO_BUILD_JOBS':'4'}
rows=[]
for name,cmd in [
('core-tests',['cargo','+1.95.0','test','--locked','-p','hypercircuit','--features','interval-residuals,dispatch-trace']),
('clippy',['cargo','+1.95.0','clippy','--locked','-p','hypercircuit','--all-features','--all-targets','--','-D','warnings']),
('format',['cargo','+1.95.0','fmt','--all','--','--check']),
('budget',['bash','scripts/check-repository-budget.sh'])]:
 start=time.monotonic()
 with (s/f'main-{name}.log').open('w') as out:code=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'main-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
 if code:raise SystemExit(code)
