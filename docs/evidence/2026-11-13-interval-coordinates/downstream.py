from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).parent;r='/mnt/development/csgrs-coordinates-combined';rows=[]
commands=[
('tests','cargo +1.95.0 test --locked -p hyperdynamics -p hyperpath --all-features',{}),
('clippy','cargo +1.95.0 clippy --locked -p hyperdynamics -p hyperpath --all-features --all-targets -- -D warnings',{}),
('docs','cargo +1.95.0 doc --locked -p hyperdynamics -p hyperpath --all-features --no-deps',{'RUSTDOCFLAGS':'-D warnings'}),
('wasm','cargo +stable check --locked -p hyperdynamics --all-features --target wasm32-unknown-unknown --lib',{}),
('path-bench','cargo +1.95.0 bench --locked -p hyperpath --bench path_predicates -- --test',{}),
('successive','cargo +1.95.0 bench --locked --bench successive_operations --features curve,stl-io,obj-io -- --test',{}),
('diff','git diff --check',{})]
for name,command,extra in commands:
 start=time.monotonic()
 with (p/('downstream-'+name+'.log')).open('w') as f:q=subprocess.run(command.split(),cwd=r,env={**os.environ,'CARGO_TARGET_DIR':'/mnt/development/csgrs/target',**extra},stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=command.split(),cwd=r,environment=extra,returncode=q.returncode,seconds=time.monotonic()-start));(p/'downstream-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,q.returncode,flush=True)
 if q.returncode:break
