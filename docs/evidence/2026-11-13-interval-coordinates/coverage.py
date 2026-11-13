from pathlib import Path
import subprocess,json,time,os
p=Path(__file__).parent;r='/mnt/development/csgrs-coordinates';cmd=['timeout','1800','bash','crates/hypersolve/scripts/coverage.sh'];env={'RUSTUP_TOOLCHAIN':'1.95.0','CARGO_TARGET_DIR':'/tmp/interval-refactor/coordinates-coverage'};start=time.monotonic()
with (p/'hypersolve-coverage.log').open('w') as f:result=subprocess.run(cmd,cwd=r,env={**os.environ,**env},stdout=f,stderr=subprocess.STDOUT)
record=dict(command=cmd,cwd=r,environment=env,returncode=result.returncode,seconds=time.monotonic()-start,external_containment_seconds=1800)
(p/'coverage-status.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record,indent=2))
