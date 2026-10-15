import os, json, subprocess, time, sys
from pathlib import Path
root=Path('/mnt/development/csgrs')
out=Path('/tmp/hyperbrep-spline-replay-evidence')
out.mkdir(exist_ok=True)
env=os.environ.copy()
env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'], CARGO_HOME='/tmp/hyperbrep-review-cargo', CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
commands=[
('final-hypercurve-tests', ['cargo','test','--offline','--locked','-p','hypercurve','--all-features','--test','curve_injectivity','--test','parameter_charts']),
('final-hypercurve-clippy', ['cargo','clippy','--offline','--locked','-p','hypercurve','--all-features','--test','curve_injectivity','--test','parameter_charts','--','-D','warnings']),
('final-tests', ['cargo','test','--offline','--locked','-p','hyperbrep','--all-features']),
('final-clippy', ['cargo','clippy','--offline','--locked','-p','hyperbrep','--all-targets','--all-features','--','-D','warnings']),
('fmt', ['cargo','fmt','--all','--','--check']),
('fuzz-fmt', ['cargo','fmt','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--','--check']),
('final-fmt', ['cargo','fmt','--all','--','--check']),
('diff-check', ['git','diff','--check']),
]

start=int(sys.argv[1]) if len(sys.argv)>1 else 0
records=json.loads((out/'commands.json').read_text())
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
