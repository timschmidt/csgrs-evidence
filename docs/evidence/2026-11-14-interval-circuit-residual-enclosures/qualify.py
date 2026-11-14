from pathlib import Path
import subprocess,json,time,os
s=Path(__file__).parent;r='/mnt/development/csgrs-circuit-residual-enclosures';env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/circuit-residual-enclosures','CARGO_BUILD_JOBS':'4'}
commands=[
 ('core-tests',['cargo','+1.95.0','test','--locked','-p','hypercircuit','--features','interval-residuals,dispatch-trace']),
 ('clippy',['cargo','+1.95.0','clippy','--locked','-p','hypercircuit','--features','interval-residuals,dispatch-trace','--all-targets','--','-D','warnings']),
 ('docs',['cargo','+1.95.0','doc','--locked','-p','hypercircuit','--features','interval-residuals','--no-deps']),
 ('disabled',['cargo','+1.95.0','check','--locked','-p','hypercircuit','--no-default-features']),
 ('wasm',['cargo','+1.95.0','check','--locked','-p','hypercircuit','--features','interval-residuals','--target','wasm32-unknown-unknown']),
 ('format',['cargo','+1.95.0','fmt','--all','--','--check']),
 ('budget',['bash','scripts/check-repository-budget.sh']),
]
rows=[]
for name,command in commands:
 start=time.monotonic()
 with (s/f'{name}.log').open('w') as out:code=subprocess.run(command,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT).returncode
 rows.append(dict(name=name,command=command,returncode=code,seconds=time.monotonic()-start));(s/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,code,flush=True)
 if code:raise SystemExit(code)
