from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-polynomial-arithmetic-main','CARGO_BUILD_JOBS':'4'}
rows=[]
for name,cmd in [('tests',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features']),('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),('format',['cargo','+1.95.0','fmt','--all','--','--check']),('repository-budget',['bash','scripts/check-repository-budget.sh'])]:
    start=time.monotonic()
    with (s/f'main-{name}.log').open('w') as out:result=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
    rows.append(dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start));(s/'main-validation.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
    if result.returncode:raise SystemExit(result.returncode)
