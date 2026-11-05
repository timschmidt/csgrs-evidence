from pathlib import Path
import hashlib,json,os,subprocess,tempfile,time
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'target/final-prepush-20261105/package-cache-reproduction'
OUT.mkdir(exist_ok=True)
SOURCE=Path(tempfile.mkdtemp(prefix='csgrs-package-cache-source-',dir='/tmp'))
(SOURCE/'Cargo.toml').write_text('[workspace]\nmembers=["child","parent"]\nresolver="3"\n')
for name in ['child','parent']:
 d=SOURCE/name;(d/'src').mkdir(parents=True)
 text=f'[package]\nname="csgrs-release-cache-{name}-fixture"\nversion="0.1.0"\nedition="2024"\nlicense="MIT"\ndescription="CSGRS local packaging acceptance fixture"\nrepository="https://github.com/timschmidt/csgrs"\n'
 if name=='parent':text+='[dependencies]\nchild={package="csgrs-release-cache-child-fixture",version="0.1.0",path="../child"}\n'
 (d/'Cargo.toml').write_text(text)
(SOURCE/'child/src/lib.rs').write_text('pub fn original() -> u32 { 41 }\n')
(SOURCE/'parent/src/lib.rs').write_text('pub fn value() -> u32 { child::original() }\n')
env=dict(os.environ,RUSTUP_TOOLCHAIN='1.99.1',CARGO_HOME=str(OUT/'cargo-home'),CARGO_INCREMENTAL='0',CCACHE_DISABLE='1',CARGO_BUILD_JOBS='2')
base=OUT/'target';base.mkdir(exist_ok=True)
subprocess.run(['cargo','generate-lockfile','--offline'],cwd=SOURCE,env=env,check=True,capture_output=True)
rows=[]
def package(name,target):
 e=dict(env,CARGO_TARGET_DIR=str(target));cmd=['cargo','package','--locked','-p','csgrs-release-cache-child-fixture','-p','csgrs-release-cache-parent-fixture'];start=time.time()
 with (OUT/(name+'.log')).open('w') as f:r=subprocess.run(cmd,cwd=SOURCE,env=e,stdout=f,stderr=subprocess.STDOUT)
 row={'name':name,'command':cmd,'exit_code':r.returncode,'seconds':time.time()-start,'source':str(SOURCE),'target':str(target),'log_sha256':hashlib.sha256((OUT/(name+'.log')).read_bytes()).hexdigest()};rows.append(row);print(json.dumps(row),flush=True);return r.returncode
assert package('first',base)==0
(SOURCE/'child/src/lib.rs').write_text('pub fn original() -> u32 { 41 }\npub fn newly_added() -> u32 { 43 }\n')
(SOURCE/'parent/src/lib.rs').write_text('pub fn value() -> u32 { child::newly_added() }\n')
second=package('changed-same-version',base)
third=package('changed-fresh-registry-identity',OUT/'target-fresh')
(OUT/'results.json').write_text(json.dumps({'attempts':rows,'reproduced':second!=0,'fresh_identity_passes':third==0},indent=2)+'\n')
assert second!=0 and third==0
