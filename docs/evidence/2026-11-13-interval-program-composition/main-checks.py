from pathlib import Path
import subprocess,os,json,time
p=Path(__file__).parent;root=Path('/mnt/development/csgrs');base=['cargo','+1.95.0'];env=os.environ|{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/composition-main','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'};rows=[]
commands=[('main-acceptance',base+['test','--locked','-p','hypersolve','--all-features','--test','program_composition']),('main-consumers',base+['test','--locked','-p','hyperdynamics','--all-features','--test','field_taylor_model','--test','field_coordinates']),('main-clippy',base+['clippy','--locked','-p','hypersolve','--all-features','--test','program_composition','--','-D','warnings']),('main-format',base+['fmt','--all','--','--check'])]
for name,cmd in commands:
 start=time.monotonic()
 with (p/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start));(p/'main-commands.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:raise SystemExit(r.returncode)
