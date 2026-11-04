from pathlib import Path
import subprocess,os,json,time
env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':'/tmp/csgrs-research-target'}
commands=[
('stable-owner','cargo +stable clippy --offline --locked --all-features --all-targets -p hypermesh -- -D warnings'),
('stable-root','cargo +stable clippy --offline --locked -p csgrs --features dispatch-trace --test hull_determinism --test sampled_sphere_strict --test successive_operations --test downstream_solids --test construction_evidence --test receipt_composition -- -D warnings'),
('msrv-owner','cargo +1.95.0 clippy --offline --locked --all-features --all-targets -p hypermesh -- -D warnings'),
('msrv-root','cargo +1.95.0 clippy --offline --locked -p csgrs --features dispatch-trace --test hull_determinism --test sampled_sphere_strict --test successive_operations --test downstream_solids --test construction_evidence --test receipt_composition -- -D warnings'),
('doc','cargo doc --offline --locked --no-deps -p hypermesh -p csgrs --features dispatch-trace'),
('fuzz-check','cargo check --offline --locked --manifest-path crates/hypermesh/fuzz/Cargo.toml --bins'),
('minimal-root','cargo test --offline --locked --release --no-default-features --test hull_determinism'),
]
rows=[]
for name,command in commands:
    current={**env,'RUSTDOCFLAGS':'-D warnings'} if name=='doc' else env
    start=time.time()
    with open('/tmp/csgrs-r30-'+name+'-final.log','w') as log:r=subprocess.run(command.split(),env=current,stdout=log,stderr=subprocess.STDOUT)
    rows.append(dict(name=name,command=command,exit_code=r.returncode,elapsed=time.time()-start));Path('/tmp/csgrs-r30-static-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
    if r.returncode:raise SystemExit(r.returncode)
