from pathlib import Path
import subprocess,os,time,json
root=Path.cwd();env={**os.environ,'CCACHE_DISABLE':'1','CARGO_INCREMENTAL':'0','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':str(root/'target')}
commands=[
'cargo test --offline --locked --release --all-features -p hypercurve --lib svg::',
'cargo test --offline --locked --release --all-features -p hypercurve --test parallel_fidelity',
'cargo test --offline --locked --release --no-default-features -p hyperbrep --test selected_planar_images',
'cargo test --offline --locked --release --all-features -p hyperbrep --test archive_limits --test archive_structure',
]
rows=[]
with open('/tmp/csgrs-r24-affected-recheck-final.log','w') as log:
 for command in commands:
  start=time.time();r=subprocess.run(command.split(),env=env,stdout=log,stderr=subprocess.STDOUT);rows.append({'command':command,'exit_code':r.returncode,'elapsed':time.time()-start});Path('/tmp/csgrs-r24-affected-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(command,r.returncode,flush=True)
  if r.returncode:raise SystemExit(r.returncode)
