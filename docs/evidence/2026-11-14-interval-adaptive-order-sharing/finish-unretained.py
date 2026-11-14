from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-order-sharing');rows=[]
while not (s/'typed-controlled-driver.exit').exists():time.sleep(1)
assert (s/'typed-controlled-driver.exit').read_text().strip()=='0'
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/adaptive-order-sharing','CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
commands=[('typed-timing-analysis',['python3',str(s/'analyze-typed-controlled-timing.py')],r),('shared-benchmark',['python3',str(s/'run-shared-benchmark.py')],r),('typed-owner-tests',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features','--lib','--tests'],r),('typed-clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings'],r),('typed-example',['cargo','+1.95.0','run','--locked','-p','hyperdynamics','--features','adaptive-taylor','--example','adaptive_shared'],r)]
p=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-probe')
commands += [('cost-probe-lock',['cargo','+1.95.0','generate-lockfile','--offline'],p),('cost-probe',['cargo','+1.95.0','run','--locked','--release'],p)]
for name,cmd,cwd in commands:
 print(name,flush=True);start=time.monotonic()
 with (s/f'{name}.log').open('wb') as out:result=subprocess.run(cmd,cwd=cwd,env=env,stdout=out,stderr=subprocess.STDOUT)
 (s/f'{name}.exit').write_text(str(result.returncode)+'\n');rows.append(dict(name=name,command=cmd,cwd=str(cwd),returncode=result.returncode,seconds=time.monotonic()-start));(s/'unretained-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
 if result.returncode:raise SystemExit(result.returncode)
print('completed diagnostic validation; no retention claim',flush=True)
