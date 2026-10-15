from pathlib import Path
import os,subprocess,json,time
root=Path('/mnt/development/csgrs');out=Path('/tmp/hyperbrep-step-syntax-evidence');out.mkdir(exist_ok=True)
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
commands=[
('io-tests',['cargo','test','--offline','--locked','-p','hyperbrep-io','--all-features']),
('io-release-tests',['cargo','test','--offline','--locked','-p','hyperbrep-io','--release','--all-features']),
('io-clippy',['cargo','clippy','--offline','--locked','-p','hyperbrep-io','--all-targets','--all-features','--','-D','warnings']),
('io-docs',['cargo','doc','--offline','--locked','-p','hyperbrep-io','--all-features','--no-deps']),
('io-wasm',['cargo','build','--offline','--locked','-p','hyperbrep-io','--all-features','--target','wasm32-unknown-unknown']),
('wasm-probe-build',['cargo','build','--offline','--manifest-path','/tmp/hyperbrep-step-wasm-probe/Cargo.toml','--release','--target','wasm32-unknown-unknown']),
('wasm-execution',['python3','/tmp/hyperbrep-step-wasm-probe/run.py']),
('fmt',['cargo','fmt','--all','--','--check']),
]
records=json.loads((out/'commands.json').read_text())
for name,cmd in commands:
 print('running',name,flush=True);started=time.time();runenv=env.copy()
 if name=='io-docs':runenv['RUSTDOCFLAGS']='-D warnings'
 with (out/(name+'.log')).open('w') as log:r=subprocess.run(cmd,cwd=root,env=runenv,stdout=log,stderr=subprocess.STDOUT)
 records.append(dict(name=name,command=cmd,exit_code=r.returncode,elapsed_seconds=time.time()-started));(out/'commands.json').write_text(json.dumps(records,indent=2)+'\n')
 print(name,r.returncode,flush=True)
 if r.returncode:print((out/(name+'.log')).read_text()[-8000:]);raise SystemExit(r.returncode)
