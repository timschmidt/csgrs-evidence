"""Final source checks after controls. Optional test oracles are installed in /tmp."""
import json,os,platform,shutil,subprocess,time
from pathlib import Path
root=Path('/mnt/development/csgrs');out=Path(__file__).resolve().parent
env=os.environ.copy();env.update(PATH='/home/tim/.cargo/bin:'+env['PATH'],CARGO_HOME='/tmp/hyperbrep-review-cargo',CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
wasm=Path('/tmp/hyperbrep-export-wasm-probe');(wasm/'src').mkdir(parents=True,exist_ok=True)
for name in ['Cargo.toml','Cargo.lock','run.py']:shutil.copy2(out/'wasm-probe'/name,wasm/name)
shutil.copy2(out/'wasm-probe/lib.rs',wasm/'src/lib.rs')
examples=out/'exports'
commands=[
    ('native-debug',['cargo','test','--offline','--locked','-p','hyperbrep','-p','hyperbrep-io','--all-features'],{}),
    ('io-release',['cargo','test','--offline','--locked','-p','hyperbrep-io','--release'],{}),
    ('clippy',['cargo','clippy','--offline','--locked','-p','hyperbrep-io','--all-targets','--all-features','--','-D','warnings'],{}),
    ('rustdoc',['cargo','doc','--offline','--locked','-p','hyperbrep-io','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'}),
    ('wasm-build',['cargo','build','--offline','--locked','--manifest-path',str(wasm/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{}),
    ('wasm-runtime',['python3',str(wasm/'run.py')],{}),
    ('export-examples',['cargo','run','--offline','--locked','-p','hyperbrep-io','--example','faceted_step','--',str(examples)],{}),
    ('occt-read',['python3',str(out/'occt_read.py'),str(examples)],{}),
    ('fmt',['cargo','fmt','--all','--','--check'],{}),
    ('diff-check',['git','diff','--check'],{}),
]
rows=[]
for label,command,extra in commands:
    print('running',label,flush=True);started=time.time()
    p=subprocess.run(command,cwd=root,env=env|extra,capture_output=True,text=True)
    (out/(label+'.log')).write_text(p.stdout+p.stderr)
    if label in ['wasm-runtime','occt-read'] and p.returncode==0:(out/(label+'.json')).write_text(p.stdout)
    rows.append(dict(label=label,command=command,environment=extra,exit_code=p.returncode,elapsed_seconds=time.time()-started))
    (out/'commands.json').write_text(json.dumps(rows,indent=2)+'\n')
    assert p.returncode==0,p.stdout+p.stderr
metadata=dict(python=platform.python_version(),platform=platform.platform(),cpu_affinity=sorted(os.sched_getaffinity(0)),rustc=subprocess.check_output(['rustc','--version','--verbose'],env=env,text=True),cargo=subprocess.check_output(['cargo','--version'],env=env,text=True),baseline_revision=subprocess.check_output(['git','rev-parse','HEAD'],cwd=root,text=True).strip())
(out/'environment.json').write_text(json.dumps(metadata,indent=2)+'\n')
print('all qualification commands passed',flush=True)
