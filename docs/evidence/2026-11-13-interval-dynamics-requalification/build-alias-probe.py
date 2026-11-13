from pathlib import Path
import subprocess,json,time,shutil,hashlib
p=Path(__file__).parent;cmd=['cargo','+1.95.0','build','--release','--offline','--manifest-path',str(p/'owner-probe/Cargo.toml'),'--target-dir','/tmp/interval-refactor/dynamics-owner-probe-target'];start=time.monotonic()
with (p/'probe-error-alias-build.log').open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT)
(p/'probe-error-alias-build.json').write_text(json.dumps(dict(command=cmd,returncode=r.returncode,seconds=time.monotonic()-start),indent=2)+'\n');assert r.returncode==0
source=Path('/tmp/interval-refactor/dynamics-owner-probe-target/release/dynamics-owner-probe');dest=Path('/tmp/interval-refactor/dynamics-requal-binaries/probe-error-alias');shutil.copy2(source,dest)
(p/'probe-error-alias-binary.json').write_text(json.dumps(dict(path=str(dest),bytes=dest.stat().st_size,sha256=hashlib.sha256(dest.read_bytes()).hexdigest()),indent=2)+'\n')
with (p/'probe-error-alias.log').open('w') as f:r=subprocess.run([str(dest)],stdout=f,stderr=subprocess.STDOUT)
assert r.returncode==0
print('error alias probe built and all cases observed',flush=True)
