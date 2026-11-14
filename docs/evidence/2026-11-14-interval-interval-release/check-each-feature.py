from pathlib import Path
import subprocess,os,json,time,re,hashlib
s=Path(__file__).parent;r=Path('/mnt/development/.interval-refactor-build/interval-release-feature-workspace');assert (s/'feature-workspace-prepare.exit').read_text().strip()=='0';before=(r/'Cargo.lock').read_bytes();(s/'each-feature-Cargo.lock').write_bytes(before);rows=[];env=os.environ|{'CARGO_NET_OFFLINE':'true','CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/interval-release-feature-target','CARGO_BUILD_JOBS':'2'}
for name in ['hyperinterval','hyperlattice-interval','hyperdynamics']:
 cmd=['cargo','+1.95.0','hack','check','--locked','--each-feature','-p',name];start=time.monotonic()
 with (s/f'each-feature-{name}.log').open('w') as out:p=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(package=name,command=cmd,returncode=p.returncode,seconds=time.monotonic()-start));(s/'each-feature-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 assert p.returncode==0
assert (r/'Cargo.lock').read_bytes()==before
(s/'each-feature-lock-verification.json').write_text(json.dumps(dict(unchanged=True,sha256=hashlib.sha256(before).hexdigest()),indent=2)+'\n')
