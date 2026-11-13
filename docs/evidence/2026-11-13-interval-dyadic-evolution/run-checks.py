from pathlib import Path
import subprocess,json,time,os
s=Path(__file__).parent;root='/mnt/development/csgrs'
commands=[
('integration','cargo test -p hyperdynamics -p hyperpath --all-features',{},root),
('minimal','cargo test -p hyperdynamics --no-default-features --features field --test evolution --test expression_field',{},root),
('default-off','cargo check -p hyperdynamics --no-default-features',{},root),
('msrv','cargo +1.95.0 test --locked -p hyperdynamics --all-features --test evolution --test expression_field',{},root),
('release','cargo test --release -p hyperdynamics --all-features --test evolution --test expression_field',{},root),
('clippy','cargo clippy -p hyperdynamics -p hyperpath --all-features --all-targets -- -D warnings',{},root),
('docs','cargo doc -p hyperdynamics --all-features --no-deps',{'RUSTDOCFLAGS':'-D warnings'},root),
('wasm','cargo +stable check -p hyperdynamics --all-features --target wasm32-unknown-unknown --lib',{},root),
('example','cargo run -p hyperdynamics --all-features --example expression_field',{},root),
('isolated-core','cargo test --locked -p hyperdynamics --all-features --all-targets',{},'/mnt/development/csgrs-field-core'),
('asan','cargo +nightly test --locked --target x86_64-unknown-linux-gnu -p hyperdynamics --all-features --test evolution --test expression_field',{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/dyadic-evolution-asan'},root),
('picard-cost-build','cargo build --release --locked --manifest-path /tmp/interval-refactor/dyadic-evolution/picard-cost-project/Cargo.toml',{'CARGO_TARGET_DIR':'/tmp/interval-refactor/dyadic-evolution-target'},root),
('evolution-cost-build','cargo build --release --locked --manifest-path /tmp/interval-refactor/dyadic-evolution/evolution-cost-project/Cargo.toml',{'CARGO_TARGET_DIR':'/tmp/interval-refactor/dyadic-evolution-target'},root),
('fmt','cargo fmt --all -- --check',{},root),
('diff','git diff --check',{},root),
]
rows=json.loads((s/'checks-final.json').read_text()) if (s/'checks-final.json').exists() else []
for name,command,extra,cwd in commands:
 if any(r['name']==name and r['exit']==0 for r in rows):continue
 start=time.monotonic();cmd=command.split()
 with (s/(name+'-final.log')).open('w') as f:r=subprocess.run(cmd,cwd=cwd,env={**os.environ,**extra},stdout=f,stderr=subprocess.STDOUT)
 row=dict(name=name,command=cmd,cwd=cwd,environment=extra,exit=r.returncode,seconds=time.monotonic()-start);rows.append(row);(s/'checks-final.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,round(row['seconds'],2),flush=True)
 if r.returncode:break
