from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).parent;r='/mnt/development/csgrs-coordinates'
commands=[
('solve','cargo +1.95.0 test --locked -p hypersolve --all-features --all-targets',{}),
('dynamics','cargo +1.95.0 test --locked -p hyperdynamics --all-features --all-targets',{}),
('minimal-solve','cargo +1.95.0 test --locked -p hypersolve --no-default-features --features coordinate-program --test program_coordinates --test program_affine',{}),
('minimal-field','cargo +1.95.0 test --locked -p hyperdynamics --no-default-features --features coordinates --test field_coordinates --test expression_field',{}),
('default-off','cargo +1.95.0 check --locked -p hypersolve -p hyperdynamics --no-default-features',{}),
('old-field','cargo +1.95.0 test --locked -p hyperdynamics --features field,serde,dispatch-trace --test native_evolution_trace --test rational_time',{}),
('clippy','cargo +1.95.0 clippy --locked -p hypersolve -p hyperdynamics --all-features --all-targets -- -D warnings',{}),
('minimal-clippy','cargo +1.95.0 clippy --locked -p hyperdynamics --no-default-features --features coordinates --test field_coordinates -- -D warnings',{}),
('docs','cargo +1.95.0 doc --locked -p hypersolve -p hyperdynamics --all-features --no-deps',{'RUSTDOCFLAGS':'-D warnings'}),
('wasm','cargo +stable check --locked -p hyperdynamics --all-features --target wasm32-unknown-unknown --lib',{}),
('example','cargo +1.95.0 run --locked -p hyperdynamics --features coordinates --example coordinates',{}),
('release','cargo +1.95.0 test --release --locked -p hypersolve -p hyperdynamics --all-features --test program_coordinates --test program_affine --test program_jacobian_trace --test program_taylor_affine --test field_coordinates --test native_evolution_trace',{}),
('asan','cargo +nightly test --locked --target x86_64-unknown-linux-gnu -p hypersolve -p hyperdynamics --all-features --test program_coordinates --test program_affine --test field_coordinates --test program_taylor_affine',{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/taylor-asan'}),
('fmt','cargo +1.95.0 fmt --all -- --check',{}),('diff','git diff --check',{})]
rows=[]
for name,command,extra in commands:
 start=time.monotonic();cmd=command.split()
 with (p/('final-'+name+'.log')).open('w') as f:q=subprocess.run(cmd,cwd=r,env={**os.environ,'CARGO_TARGET_DIR':'/tmp/interval-refactor/coordinates-owner-target',**extra},stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,cwd=r,environment=extra,returncode=q.returncode,seconds=time.monotonic()-start));(p/'final-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,q.returncode,flush=True)
 if q.returncode:break
