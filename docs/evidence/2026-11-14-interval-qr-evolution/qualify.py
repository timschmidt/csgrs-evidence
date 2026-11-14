from pathlib import Path
import subprocess,os,time,json
s=Path(__file__).parent;r='/mnt/development/csgrs-qr-evolution';env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/qr-evolution','CARGO_BUILD_JOBS':'3'};rows=[]
commands=[('owner-tests',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features']),('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),('docs',['cargo','+1.95.0','doc','--locked','-p','hyperdynamics','--all-features','--no-deps']),('disabled',['cargo','+1.95.0','check','--locked','-p','hyperdynamics','--no-default-features']),('wasm',['cargo','+1.95.0','check','--locked','-p','hyperdynamics','--features','qr-evolution','--target','wasm32-unknown-unknown']),('format',['cargo','+1.95.0','fmt','--all','--','--check']),('budget',['bash','scripts/check-repository-budget.sh']),('physics',['cargo','+1.95.0','test','--locked','-p','hyperphysics','--features','certified-flow,hyperdynamics/qr-evolution','--test','certified_flow'])]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'{name}.log').open('w') as out:code=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=cmd,returncode=code,seconds=time.monotonic()-start));(s/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
