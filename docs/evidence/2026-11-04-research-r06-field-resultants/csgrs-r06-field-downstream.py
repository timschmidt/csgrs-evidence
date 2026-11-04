import subprocess,os,json,time
from pathlib import Path
commands=[
('curve-integration','cargo test --offline --locked --release --all-features -p hypercurve --test polynomial_query_fibers --test polynomial_curve_pairs --test polynomial_pair_charts --test polynomial_boundary_components --test selected_coefficient_roots --test selected_polynomial_points'),
('brep','cargo test --offline --locked --release --all-features -p hyperbrep --test plane_tensor_sections --test polynomial_points --test polynomial_replay --test section_differentials'),
('doctests','cargo test --offline --locked --release --all-features -p hypersolve -p hypercurve -p hyperbrep -p hyperbrep-io --doc'),
('owner-fuzz-check','cargo check --offline --locked --manifest-path crates/hypersolve/fuzz/Cargo.toml --bins'),
('curve-fuzz-check','cargo check --offline --locked --manifest-path crates/hypercurve/fuzz/Cargo.toml --bins'),
('brep-fuzz-check','cargo check --offline --locked --manifest-path crates/hyperbrep/fuzz/Cargo.toml --bins'),
]
env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':'/tmp/csgrs-research-target'};rows=[]
for name,command in commands:
 started=time.time()
 with open('/tmp/csgrs-r06-field-'+name+'-final.log','w') as log:r=subprocess.run(command.split(),env=env,stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=command,exit_code=r.returncode,elapsed=time.time()-started));Path('/tmp/csgrs-r06-field-downstream-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,r.returncode,flush=True)
 if r.returncode:raise SystemExit(r.returncode)
