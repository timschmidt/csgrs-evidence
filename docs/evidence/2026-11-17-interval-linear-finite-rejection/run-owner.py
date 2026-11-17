from pathlib import Path
import os,subprocess,time,json,sys
s=Path(__file__).parent;label=sys.argv[1];cmd=['cargo','+1.95.0',*sys.argv[2:]];env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/dyadic-quotient-current','CARGO_BUILD_JOBS':'6','CARGO_NET_OFFLINE':'true'};t=time.monotonic()
with (s/f'{label}.log').open('w') as f:p=subprocess.run(cmd,cwd='/mnt/development/interval-linalg-finite/csgrs',env=env,stdout=f,stderr=subprocess.STDOUT,timeout=1800)
(s/f'{label}.json').write_text(json.dumps({'command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-t},indent=2)+'\n');print(label,p.returncode);print((s/f'{label}.log').read_text()[-1700:])
