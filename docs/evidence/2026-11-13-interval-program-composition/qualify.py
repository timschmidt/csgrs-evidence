from pathlib import Path
import subprocess,os,json,time
p=Path(__file__).parent;root=Path('/mnt/development/csgrs-program-composition');base=['cargo','+1.95.0'];env=os.environ|{'CARGO_BUILD_JOBS':'4','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/program-composition','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
commands=[('acceptance',base+['test','--locked','-p','hypersolve','--all-features','--test','program_composition']),('owner-tests',base+['test','--locked','-p','hypersolve','--all-features']),('downstream-tests',base+['test','--locked','-p','hyperdynamics','--all-features']),('clippy',base+['clippy','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),('docs',base+['doc','--locked','-p','hypersolve','--all-features','--no-deps']),('wasm',base+['check','--locked','-p','hypersolve','--all-features','--target','wasm32-unknown-unknown']),('minimal',base+['test','--locked','-p','hypersolve','--no-default-features','--features','expression-program','--test','program_composition']),('disabled',base+['check','--locked','-p','hypersolve','--no-default-features']),('format',base+['fmt','--all','--','--check'])]
rows=[]
for name,cmd in commands:
 start=time.monotonic();e=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {})
 with (p/('final-'+name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd=root,env=e,stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start));(p/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:raise SystemExit(r.returncode)
