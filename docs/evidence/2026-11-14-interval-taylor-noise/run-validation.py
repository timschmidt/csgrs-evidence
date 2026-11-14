from pathlib import Path
import subprocess,json,os,time,sys
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-noise');label=sys.argv[1];toolchain={'msrv':'1.95.0','stable':'stable'}[label]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-noise'+('' if label=='msrv' else '-stable'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','+'+toolchain];rows=[]
commands=[('all-tests',base+['test','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--lib','--tests']),('doctests',base+['test','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--doc']),('clippy',base+['clippy','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),('docs',base+['doc','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--no-deps']),('noise-feature',base+['check','--locked','-p','hypersolve','-p','hyperdynamics','--no-default-features','--features','hyperdynamics/taylor-noise','--all-targets']),('consumer',base+['run','--locked','-p','hyperdynamics','--features','taylor-noise','--example','taylor_noise']),('noise-release',base+['test','--locked','-p','hypersolve','--features','taylor-noise,serde,dispatch-trace','--release','--test','program_taylor_noise']),('consumer-release',base+['test','--locked','-p','hyperdynamics','--features','taylor-noise,serde,dispatch-trace','--release','--test','field_taylor_noise'])]
for name,command in commands:
 print(label,name,flush=True);start=time.monotonic();local=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {})
 with (s/f'{label}-{name}.log').open('wb') as out:p=subprocess.run(command,cwd=r,env=local,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=command,returncode=p.returncode,elapsed_seconds=time.monotonic()-start));(s/f'{label}-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
 if p.returncode:raise SystemExit(p.returncode)
print(label,'complete',flush=True)
