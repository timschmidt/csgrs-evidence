from pathlib import Path
import subprocess,os,json,time
s=Path(__file__).parent;old=Path('/tmp/interval-refactor/profile-owned-intervals');root=Path('/mnt/development/interval-profile-static/csgrs');interface=root.parent/'alumina-interface'
env=os.environ|{'CARGO_TARGET_DIR':'/mnt/development/.interval-refactor-build/profile-typed-fraction/owner','CARGO_BUILD_JOBS':'16','CARGO_NET_OFFLINE':'true'}
p=root/'crates/hyperinterval/tests/retained_owner.rs';assert not p.exists();p.write_bytes((old/'final-source/csgrs/crates/hyperinterval/tests/retained_owner.rs').read_bytes())
command=['cargo','+1.95.0','test','--locked','-p','hyperinterval','--all-features','--test','retained_owner','--no-run'];start=time.monotonic()
with (s/'missing-owner.log').open('w') as out:r=subprocess.run(command,cwd=root,env=env,stdout=out,stderr=subprocess.STDOUT)
(s/'missing-owner.json').write_text(json.dumps({'command':command,'exit_code':r.returncode,'seconds':time.monotonic()-start},indent=2)+'\n')
assert r.returncode!=0 and 'E0432' in (s/'missing-owner.log').read_text() and 'PositiveRational' in (s/'missing-owner.log').read_text();p.unlink()
for repo,name in [(root,'csgrs-candidate.patch'),(interface,'alumina-interface-candidate.patch')]:
 subprocess.run(['git','apply','--check',str(old/name)],cwd=repo,check=True)
 subprocess.run(['git','apply',str(old/name)],cwd=repo,check=True)
print('Current missing APIs reproduced; retained-owner candidate applied in isolated repos.',flush=True)
