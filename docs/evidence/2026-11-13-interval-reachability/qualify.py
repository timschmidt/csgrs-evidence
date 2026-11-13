from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).parent;r='/mnt/development/csgrs-reachability'
commands=[
('owner','cargo +1.95.0 test --locked -p hyperdynamics --all-features --all-targets',{}),
('lattice','cargo +1.95.0 test --locked -p hyperlattice-interval --all-features --all-targets',{}),
('minimal','cargo +1.95.0 test --locked -p hyperdynamics --no-default-features --features reachability --test reachability --test evolution',{}),
('native-trace','cargo +1.95.0 test --locked -p hyperdynamics --features field,serde,dispatch-trace --test native_evolution_trace -- --nocapture',{}),
('default-off','cargo +1.95.0 check --locked -p hyperdynamics -p hyperlattice-interval --no-default-features',{}),
('clippy','cargo +1.95.0 clippy --locked -p hyperdynamics -p hyperlattice-interval --all-features --all-targets -- -D warnings',{}),
('docs','cargo +1.95.0 doc --locked -p hyperdynamics -p hyperlattice-interval --all-features --no-deps',{'RUSTDOCFLAGS':'-D warnings'}),
('wasm','cargo +stable check --locked -p hyperdynamics --all-features --target wasm32-unknown-unknown --lib',{}),
('example','cargo +1.95.0 run --locked -p hyperdynamics --features reachability --example reachability',{}),
('release','cargo +1.95.0 test --locked --release -p hyperdynamics --all-features --test reachability --test native_evolution_trace --test evolution --test rational_time --test rk_proposal',{}),
('asan','cargo +nightly test --locked --target x86_64-unknown-linux-gnu -p hyperdynamics --all-features --test reachability --test evolution',{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/reachability-asan'}),
('fmt','cargo +1.95.0 fmt --all -- --check',{}),
('diff','git diff --check',{}),
('cover-cost-build','cargo +1.95.0 build --release --locked --manifest-path /tmp/interval-refactor/reachability/cover-cost/Cargo.toml --target-dir /tmp/interval-refactor/reachability-new-target',{})]
rows=[]
for name,command,extra in commands:
 cmd=command.split();start=time.monotonic()
 with (p/('final-'+name+'.log')).open('w') as log:q=subprocess.run(cmd,cwd=r,env={**os.environ,**extra},stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,cwd=r,environment=extra,returncode=q.returncode,seconds=time.monotonic()-start));(p/'final-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,q.returncode,round(time.monotonic()-start,2),flush=True)
 if q.returncode:break
