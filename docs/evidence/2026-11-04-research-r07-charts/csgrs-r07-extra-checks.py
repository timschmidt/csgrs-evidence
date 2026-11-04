from pathlib import Path
import subprocess,os,time,json
checks=[
('minimal','cargo test --offline --locked --release --no-default-features -p hypercurve --test polynomial_pair_charts'),
('doctests','cargo test --offline --locked --release --all-features -p hypercurve -p hyperbrep -p hyperbrep-io --doc'),
('curve-fuzz-check','cargo check --offline --locked --manifest-path crates/hypercurve/fuzz/Cargo.toml --bins'),
('brep-fuzz-check','cargo check --offline --locked --manifest-path crates/hyperbrep/fuzz/Cargo.toml --bins'),
]
env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':'/tmp/csgrs-research-target'}
rows=[]
for name,command in checks:
 started=time.time()
 with open('/tmp/csgrs-r07-'+name+'-final.log','w') as log:
  result=subprocess.run(command.split(),env=env,stdout=log,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=command,started=started,elapsed=time.time()-started,exit_code=result.returncode))
 Path('/tmp/csgrs-r07-extra-checks.json').write_text(json.dumps(rows,indent=2)+'\n')
 print(name,result.returncode,flush=True)
 if result.returncode:raise SystemExit(result.returncode)
