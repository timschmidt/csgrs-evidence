import os, json, subprocess, time, sys
from pathlib import Path
root=Path('/mnt/development/csgrs')
out=Path('/tmp/hyperbrep-selected-solids-evidence')
out.mkdir(exist_ok=True)
env=os.environ.copy()
env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'], CARGO_HOME='/tmp/hyperbrep-review-cargo', CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
commands=[
('tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features']),
('default-tests', ['cargo','test','--offline','--locked','-p','hyperbrep']),
('clippy', ['cargo','clippy','--offline','--locked','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']),
('docs', ['cargo','doc','--offline','--locked','-p','hyperbrep','-p','hypercurve','--all-features','--no-deps']),
('wasm', ['cargo','build','--offline','--locked','-p','hyperbrep','--all-features','--lib','--target','wasm32-unknown-unknown']),
('bench-build', ['cargo','build','--offline','--locked','-p','hyperbrep','--benches','--all-features','--release']),
('release-selected-tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features','--release','--test','selected_topology','--test','selected_solids','--test','retained_points']),
('fuzz-clippy', ['cargo','clippy','--offline','--locked','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins','--','-D','warnings']),
('fmt', ['cargo','fmt','--all','--','--check']),
('fuzz-fmt', ['cargo','fmt','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--','--check']),
]
start=int(sys.argv[1]) if len(sys.argv)>1 else 0
records=json.loads((out/'commands.json').read_text()) if start else []
for name, cmd in commands[start:]:
    print('running', name, flush=True)
    started=time.time()
    runenv=env.copy()
    if name=='docs': runenv['RUSTDOCFLAGS']='-D warnings'
    with (out/(name+'.log')).open('w') as f:
        p=subprocess.run(cmd,cwd=root,env=runenv,stdout=f,stderr=subprocess.STDOUT)
    records.append(dict(name=name,command=cmd,exit_code=p.returncode,elapsed_seconds=time.time()-started))
    (out/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
    print(name,p.returncode,flush=True)
    if p.returncode:
        print((out/(name+'.log')).read_text()[-10000:],flush=True)
        raise SystemExit(p.returncode)
