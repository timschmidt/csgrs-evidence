from pathlib import Path
import subprocess,json,time,os
q=Path(__file__).parent;r='/mnt/development/csgrs-taylor-affine';c='/mnt/development/csgrs-taylor-affine-combined';rows=[]
commands=[
('focused',r,'cargo +1.95.0 test --locked -p hypersolve --all-features --test program_taylor_affine --test program_taylor_model --test program_coefficients --test program_jacobian_trace',{}),
('minimal-affine',r,'cargo +1.95.0 test --locked -p hypersolve --no-default-features --features taylor-affine --test program_taylor_affine',{}),
('minimal-taylor',r,'cargo +1.95.0 test --locked -p hypersolve --no-default-features --features taylor-model --test program_taylor_model --test program_coefficients --test program_jacobian',{}),
('dynamics',r,'cargo +1.95.0 test --locked -p hyperdynamics --all-features --all-targets',{}),
('clippy',r,'cargo +1.95.0 clippy --locked -p hypersolve -p hyperdynamics --all-features --all-targets -- -D warnings',{}),
('docs',r,'cargo +1.95.0 doc --locked -p hypersolve -p hyperdynamics --all-features --no-deps',{'RUSTDOCFLAGS':'-D warnings'}),
('wasm',r,'cargo +stable check --locked -p hyperdynamics --all-features --target wasm32-unknown-unknown --lib',{}),
('consumer',c,'cargo +1.95.0 run --locked -p hyperdynamics --features taylor-affine --example taylor_affine',{'CARGO_TARGET_DIR':'/mnt/development/csgrs/target'}),
('release',r,'cargo +1.95.0 test --release --locked -p hypersolve --all-features --test program_taylor_affine --test program_taylor_model',{}),
('asan',r,'cargo +nightly test --locked --target x86_64-unknown-linux-gnu -p hypersolve -p hyperdynamics --all-features --test program_taylor_affine --test program_taylor_model --test field_taylor_model',{'RUSTFLAGS':'-Zsanitizer=address','CARGO_TARGET_DIR':'/tmp/interval-refactor/taylor-asan'}),
('fmt',r,'cargo +1.95.0 fmt -p hypersolve -p hyperdynamics -- --check',{}),
('diff',r,'git diff --check',{})]
for name,cwd,command,extra in commands:
 start=time.monotonic()
 with (q/('post-domain-'+name+'.log')).open('w') as f:result=subprocess.run(command.split(),cwd=cwd,env={**os.environ,'CARGO_TARGET_DIR':'/mnt/development/csgrs-taylor/target',**extra},stdout=f,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=command.split(),cwd=cwd,environment=extra,returncode=result.returncode,seconds=time.monotonic()-start));(q/'post-domain-qualification.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,result.returncode,flush=True)
 if result.returncode:break
