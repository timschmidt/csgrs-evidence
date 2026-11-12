import subprocess,os,json,time
from pathlib import Path
root=Path('/tmp/interval-refactor/fixed-integer-div')
manifest='crates/hyperlattice-interval/conformance/alumina-foc/Cargo.toml'
commands=[
 ('scalar-asan.log',['cargo','+nightly','test','--locked','-p','hyperinterval','--no-default-features','--features','fixed,serde','--test','integer_division','--test','integer_division_no_alloc','--target','x86_64-unknown-linux-gnu','--','--nocapture'],{'CARGO_TARGET_DIR':'/tmp/interval-refactor/fixed-div-target-asan','RUSTFLAGS':'-Z sanitizer=address','ASAN_OPTIONS':'detect_leaks=1'}),
 ('foc-asan.log',['cargo','+nightly','test','--locked','--manifest-path',manifest,'--tests','--target','x86_64-unknown-linux-gnu','--','--nocapture'],{'CARGO_TARGET_DIR':'/tmp/interval-refactor/foc-target-asan','RUSTFLAGS':'-Z sanitizer=address','ASAN_OPTIONS':'detect_leaks=1'}),
 ('coverage/build.jsonl',['cargo','+1.95.0','test','--locked','--manifest-path',manifest,'--tests','--message-format=json','--','--nocapture'],{'CARGO_TARGET_DIR':'/tmp/interval-refactor/foc-target-coverage','RUSTFLAGS':'-C instrument-coverage','LLVM_PROFILE_FILE':str(root/'coverage/%p-%m.profraw')}),
 ('coverage/report-build.log',['python3',str(root/'coverage_report.py')],{}),
 ('wasm-build.log',['cargo','+1.88.0','build','--locked','--release','--manifest-path','crates/hyperlattice-interval/conformance/alumina-foc/wasm/Cargo.toml','--target','wasm32-unknown-unknown'],{}),
 ('wasm-replay.json',['/tmp/interval-refactor/tools/bin/python',str(root/'wasm-replay.py')],{}),
]
rows=[]
for log,cmd,env in commands:
 start=time.monotonic()
 with (root/log).open('w') as f: p=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=os.environ|env)
 row={'command':cmd,'environment':env,'exit_code':p.returncode,'elapsed_seconds':time.monotonic()-start,'log':log};rows.append(row)
 (root/'extra-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(log,p.returncode,flush=True)
 if p.returncode:break
assert all(row['exit_code']==0 for row in rows)
