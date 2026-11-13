from pathlib import Path
import subprocess,json,time,os
out=Path(__file__).parent;root='/mnt/development/csgrs'
commands=[
('program-owner','cargo test -p hypersolve --all-features --lib --test expression_program --test expression_interval --test program_jacobian --test symbolic_power_boundary --test smoke --test readme',{},root),
('integration','cargo test -p hyperdynamics -p hyperpath --all-features',{},root),
('lattice','cargo test -p hyperlattice-interval --all-features --all-targets',{},root),
('minimal-field','cargo test -p hyperdynamics --no-default-features --features field --test expression_field',{},root),
('minimal-program','cargo test -p hypersolve --no-default-features --features interval-program --test program_jacobian',{},root),
('default-field','cargo check -p hyperdynamics --no-default-features',{},root),
('field-msrv','cargo +1.95.0 test --locked -p hyperdynamics --all-features --test expression_field',{},root),
('program-msrv','cargo +1.95.0 test --locked -p hypersolve --all-features --test program_jacobian',{},root),
('lattice-msrv','cargo +1.88.0 test --locked -p hyperlattice-interval --no-default-features --features fixed,dyadic --test cartesian --test no_alloc',{},root),
('release-field','cargo test --release -p hyperdynamics --all-features --test expression_field',{},root),
('release-program','cargo test --release -p hypersolve --all-features --test program_jacobian',{},root),
('clippy','cargo clippy -p hypersolve -p hyperdynamics -p hyperlattice-interval --all-features --all-targets -- -D warnings',{},root),
('docs','cargo doc -p hypersolve -p hyperdynamics -p hyperlattice-interval --all-features --no-deps',{'RUSTDOCFLAGS':'-D warnings'},root),
('wasm','cargo +stable check -p hyperdynamics --all-features --target wasm32-unknown-unknown --lib',{},root),
('example','cargo run -p hyperdynamics --all-features --example expression_field',{},root),
('isolated-core','cargo test --locked -p hyperdynamics --all-features --all-targets',{},'/mnt/development/csgrs-field-core'),
('asan','cargo +nightly test --locked --target x86_64-unknown-linux-gnu -p hyperdynamics -p hypersolve --all-features --test expression_field --test program_jacobian',{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/picard-step-asan'},root),
('point-smoke','cargo bench -p hypersolve --bench expression_program --features expression-program -- --test',{},root),
('field-cost-build','cargo build --release --locked --manifest-path /tmp/interval-refactor/picard-step/field-cost-project/Cargo.toml',{'CARGO_TARGET_DIR':'/tmp/interval-refactor/picard-step-field-target'},root),
('fmt','cargo fmt --all -- --check',{},root),
('diff','git diff --check',{},root),
]
rows=json.loads((out/'checks-final.json').read_text()) if (out/'checks-final.json').exists() else []
for name,command,extra,cwd in commands:
 if any(r['name']==name and r['exit']==0 for r in rows):continue
 start=time.monotonic();cmd=command.split()
 with (out/(name+'-final.log')).open('w') as f:r=subprocess.run(cmd,cwd=cwd,env={**os.environ,**extra},stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,cwd=cwd,command=cmd,environment=extra,exit=r.returncode,seconds=time.monotonic()-start);rows.append(row)
 (out/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(row['seconds'],2),flush=True)
 if r.returncode:break
