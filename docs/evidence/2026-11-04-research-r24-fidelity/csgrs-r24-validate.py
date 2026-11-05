from pathlib import Path
import subprocess,os,json,time
root=Path.cwd();env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':str(root/'target')}
commands=[
('owner','cargo test --offline --locked --release --all-features -p hypercurve'),
('brep','cargo test --offline --locked --release --all-features -p hyperbrep --test selected_planar_images --test selected_profiles --test parallel_profile_extrusion'),
('io','cargo test --offline --locked --release --all-features -p hyperbrep-io --test selected_procedural_profiles --test region_exchange'),
('root','cargo test --offline --locked --release -p csgrs --features dispatch-trace --test exact_profile_sweeps --test downstream_profiles --test receipt_composition --test construction_evidence --test mixed_modeling_profiles'),
('stable-owner','cargo +stable clippy --offline --locked --all-features --all-targets -p hypercurve -p hyperbrep -p hyperbrep-io -- -D warnings'),
('minimal-owner','cargo +stable clippy --offline --locked --no-default-features --all-targets -p hypercurve -- -D warnings'),
('msrv-owner','cargo +1.95.0 clippy --offline --locked --all-features --all-targets -p hypercurve -p hyperbrep -p hyperbrep-io -- -D warnings'),
('stable-root','cargo +stable clippy --offline --locked -p csgrs --features dispatch-trace --test exact_profile_sweeps --test downstream_profiles --test receipt_composition --test construction_evidence --test mixed_modeling_profiles -- -D warnings'),
('msrv-root','cargo +1.95.0 clippy --offline --locked -p csgrs --features dispatch-trace --test exact_profile_sweeps --test downstream_profiles --test receipt_composition --test construction_evidence --test mixed_modeling_profiles -- -D warnings'),
('minimal-tests','cargo test --offline --locked --release --no-default-features -p hypercurve --test parallel_fidelity'),
('doc','cargo doc --offline --locked --no-deps --all-features -p hypercurve -p hyperbrep -p hyperbrep-io'),
('fuzz','cargo check --offline --locked --manifest-path crates/hypercurve/fuzz/Cargo.toml --bins'),
]
rows=[]
for name,command in commands:
 current={**env,'RUSTDOCFLAGS':'-D warnings'} if name=='doc' else env
 start=time.time()
 with open('/tmp/csgrs-r24-'+name+'-final.log','w') as log:r=subprocess.run(command.split(),env=current,stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=command,exit_code=r.returncode,elapsed=time.time()-start));Path('/tmp/csgrs-r24-validation-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:raise SystemExit(r.returncode)
