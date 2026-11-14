from pathlib import Path
import json,os,subprocess,time
s=Path(__file__).parent;root=Path('/mnt/development/csgrs-taylor-model-composition')
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/taylor-model-composition','CARGO_BUILD_JOBS':'4'}
commands=[
 ('full-tests',['cargo','+1.95.0','test','--locked','-p','hypersolve','-p','hyperdynamics','--all-features']),
 ('clippy',['cargo','+1.95.0','clippy','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--all-targets','--','-D','warnings']),
 ('docs',['cargo','+1.95.0','doc','--locked','-p','hypersolve','-p','hyperdynamics','--all-features','--no-deps']),
 ('minimal',['cargo','+1.95.0','check','--locked','-p','hypersolve','--no-default-features','--features','taylor-composition']),
 ('disabled',['cargo','+1.95.0','check','--locked','-p','hypersolve','-p','hyperdynamics','--no-default-features']),
 ('wasm',['cargo','+1.95.0','check','--locked','-p','hypersolve','--no-default-features','--features','taylor-composition,serde','--target','wasm32-unknown-unknown']),
 ('format',['cargo','+1.95.0','fmt','--all','--','--check']),
]
rows=[]
for name,cmd in commands:
    start=time.monotonic()
    with (s/f'final-{name}.log').open('w') as out:
        r=subprocess.run(cmd,cwd=root,env=env|({'RUSTDOCFLAGS':'-D warnings'} if name=='docs' else {}),stdout=out,stderr=subprocess.STDOUT,timeout=1800)
    rows.append(dict(name=name,command=cmd,returncode=r.returncode,seconds=time.monotonic()-start))
    (s/'qualification.json').write_text(json.dumps(rows,indent=2)+'\n')
    print(name,r.returncode,flush=True)
    if r.returncode:raise SystemExit(r.returncode)
