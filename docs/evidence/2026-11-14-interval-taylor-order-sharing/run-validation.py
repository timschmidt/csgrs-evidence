from pathlib import Path
import subprocess,json,os,time,sys
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-order-sharing');label=sys.argv[1];tc={'msrv':'1.95.0','stable':'stable'}[label]
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-order-sharing'+('' if label=='msrv' else '-stable'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true','HYPERSOLVE_SKIP_BENCHMARK_REPORTS':'1'}
base=['cargo','+'+tc];rows=[]
commands=[('all-tests',base+['test','--locked','-p','hyperdynamics','--all-features','--lib','--tests']),('doctests',base+['test','--locked','-p','hyperdynamics','--all-features','--doc']),('clippy',base+['clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),('docs',base+['doc','--locked','-p','hyperdynamics','--all-features','--no-deps']),('minimal-clippy',base+['clippy','--locked','-p','hyperdynamics','--no-default-features','--features','taylor-flow','--all-targets','--','-D','warnings']),('consumer',base+['run','--locked','-p','hyperdynamics','--features','taylor-flow','--example','taylor_orders']),('orders-release',base+['test','--locked','-p','hyperdynamics','--all-features','--release','--test','field_taylor_orders']),('legacy-benchmark-smoke',base+['bench','--locked','-p','hyperdynamics','--features','taylor-flow','--bench','taylor_flow','--','--test'])]
for name,cmd in commands:
 print(label,name,flush=True);start=time.monotonic()
 with (s/f'{label}-{name}.log').open('wb') as out:p=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=p.returncode,elapsed_seconds=time.monotonic()-start));(s/f'{label}-validation.json').write_text(json.dumps(rows,indent=2)+'\n')
 if p.returncode:raise SystemExit(p.returncode)
print('complete',label,flush=True)
