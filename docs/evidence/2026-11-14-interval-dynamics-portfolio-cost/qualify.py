from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-dynamics-portfolio-cost')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dynamics-portfolio-cost','CARGO_BUILD_JOBS':'4'}
commands=[
('tests',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--all-features']),
('clippy',['cargo','+1.95.0','clippy','--locked','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
('docs',['cargo','+1.95.0','doc','--locked','--no-deps','-p','hyperdynamics','--all-features']),
('minimal',['cargo','+1.95.0','test','--locked','-p','hyperdynamics','--no-default-features','--features','reachability','--test','reachability']),
('disabled',['cargo','+1.95.0','check','--locked','-p','hyperdynamics','--no-default-features']),
('wasm',['cargo','+1.95.0','check','--locked','-p','hyperdynamics','--no-default-features','--features','reachability,taylor-evolution,serde','--target','wasm32-unknown-unknown']),
('fmt',['cargo','+1.95.0','fmt','--all','--','--check'])]
rows=[]
for name,cmd in commands:
 start=time.monotonic()
 with (s/f'qualification-{name}.log').open('w') as out:result=subprocess.run(cmd,cwd=r,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=result.returncode,seconds=time.monotonic()-start));(s/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
 if result.returncode:break
