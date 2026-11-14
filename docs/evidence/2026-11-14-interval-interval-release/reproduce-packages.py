from pathlib import Path
import subprocess,os,json,re,time
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-interval-release-reproduce');build=Path('/mnt/development/.interval-refactor-build/interval-release-reproduce');build.mkdir(exist_ok=True);cargo_home=build/'cargo-home';assert not cargo_home.exists();text=(r/'scripts/release-check.sh').read_text();crates=re.search(r'^crates=\(\n(.*?)\n\)',text,re.S|re.M).group(1).split();assert len(crates)==21
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()=='2611ab263ba58c5ce928374127d4bf2cc25e2c6d';assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
subprocess.run(['bash','-c','source scripts/release-package-cache.sh; prepare_release_package_home "$1"','bash',str(cargo_home)],cwd=r,check=True)
cmd=['cargo','+1.95.0','package','--locked','--no-verify','--config','patch.crates-io.hypervoxel.path="crates/hypervoxel"']
for name in crates:cmd+=['-p',name]
start=time.monotonic()
with (s/'reproduce-packages.log').open('w') as out:p=subprocess.run(cmd,cwd=r,env=os.environ|{'CARGO_HOME':str(cargo_home),'CARGO_TARGET_DIR':str(build/'target'),'CARGO_NET_OFFLINE':'true','CARGO_BUILD_JOBS':'4'},stdout=out,stderr=subprocess.STDOUT)
(s/'reproduce-packages.json').write_text(json.dumps(dict(command=cmd,repository=str(r),head='2611ab263ba58c5ce928374127d4bf2cc25e2c6d',returncode=p.returncode,seconds=time.monotonic()-start,scope='second archive generation only; full clean release validation remains mandatory',cargo_home=str(cargo_home),target=str(build/'target')),indent=2)+'\n');print(p.returncode)
