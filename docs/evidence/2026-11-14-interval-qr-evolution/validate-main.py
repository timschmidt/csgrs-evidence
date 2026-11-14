from pathlib import Path
import subprocess,time,json,os
s=Path(__file__).parent;r='/mnt/development/csgrs';env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/adaptive-taylor','CARGO_BUILD_JOBS':'4'};rows=[]
commands=[
('owner-tests',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features']),
('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
('physics-tests',['cargo','+1.95.0','test','--locked','-p','hyperphysics','--features','certified-flow,hyperdynamics/qr-evolution','--test','certified_flow']),
('format',['cargo','+1.95.0','fmt','--all','--','--check']),
('budget',['bash','scripts/check-repository-budget.sh'])]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'main-{name}.log').open('w') as out:code=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'main-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
 if code:raise SystemExit(code)
