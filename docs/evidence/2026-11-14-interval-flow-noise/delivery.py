from pathlib import Path
import hashlib,json,os,shutil,subprocess,tarfile,time,tomllib
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-flow-noise');b=Path('/mnt/development/.interval-refactor-build/flow-noise-delivery');b.mkdir(exist_ok=False)
source=json.loads((s/'SOURCE.json').read_text())
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r,text=True).strip()==source['commit']
assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hyperdynamics']
env=os.environ|{'CARGO_TARGET_DIR':str(b/'package-target'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'}
records=[]
def run(label,cmd,cwd=r,extra={}):
 start=time.monotonic()
 with (s/(label+'.log')).open('wb') as f: result=subprocess.run(cmd,cwd=cwd,env=env|extra,stdout=f,stderr=subprocess.STDOUT)
 records.append({'label':label,'command':cmd,'cwd':str(cwd),'environment':{k:(env|extra)[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','CARGO_NET_OFFLINE']}|extra,'returncode':result.returncode,'seconds':time.monotonic()-start})
 (s/'delivery-checks.json').write_text(json.dumps(records,indent=2)+'\n');print(label,result.returncode,flush=True)
 assert result.returncode==0,label
run('delivery-cargo-home',['bash','-c','source scripts/release-package-cache.sh; prepare_release_package_home "$1"','prepare',str(b/'cargo-home')])
run('delivery-package',['cargo','+1.95.0','package','--locked',*[a for n in names for a in ['-p',n]]],extra={'CARGO_HOME':str(b/'cargo-home')})
packages=b/'packages';packages.mkdir();artifacts=[];versions={}
for name in names:
 archive,=(b/'package-target/package').glob(name+'-[0-9]*.crate')
 with tarfile.open(archive) as t:
  t.extractall(packages,filter='data')
 root=packages/archive.name.removesuffix('.crate')
 manifest=tomllib.loads((root/'Cargo.toml').read_text());versions[name]=manifest['package']['version']
 vcs=json.loads((root/'.cargo_vcs_info.json').read_text());assert vcs['git']['sha1']==source['commit'] and not vcs['git'].get('dirty',False)
 artifacts.append({'name':name,'archive':str(archive),'sha256':hashlib.sha256(archive.read_bytes()).hexdigest(),'bytes':archive.stat().st_size,'vcs':vcs})
(s/'delivery-archives.json').write_text(json.dumps(artifacts,indent=2)+'\n')
p=b/'consumer';(p/'src').mkdir(parents=True);(p/'examples').mkdir();(p/'tests/support').mkdir(parents=True)
archive_example=packages/('hyperdynamics-'+versions['hyperdynamics'])/'examples/flow_noise.rs'
assert archive_example.read_bytes()==(r/'crates/hyperdynamics/examples/flow_noise.rs').read_bytes()
shutil.copy2(archive_example,p/'src/main.rs');shutil.copy2(archive_example,p/'examples/flow_noise.rs')
for name in ['flow_noise_witness.rs','support/flow_oracles.rs']:shutil.copy2(r/'crates/hyperdynamics/tests'/name,p/'tests'/name)
manifest='''[package]
name = "flow-noise-archive-consumer"
version = "0.0.0"
edition = "2024"
[workspace]
[features]
default = ["taylor-flow", "flow-noise", "serde"]
taylor-flow = []
flow-noise = []
serde = []
[dependencies]
'''
features={'hyperdynamics':['flow-noise','serde'],'hyperinterval':['hyperreal'],'hyperlattice-interval':['dyadic']}
for name in names:
 manifest+=name+' = { version = "='+versions[name]+'", default-features = false, features = '+json.dumps(features.get(name,[]))+' }\n'
manifest+='serde_json = "1.0"\n[patch.crates-io]\n'
patches=[]
for name in names:
 path=packages/(name+'-'+versions[name]);manifest+=name+' = { path = '+json.dumps(str(path))+' }\n';patches+=['--config','patch.crates-io.'+name+'.path='+json.dumps(str(path))]
(p/'Cargo.toml').write_text(manifest)
for label,toolchain in [('msrv','1.95.0'),('stable','stable')]:
 extra={'CARGO_TARGET_DIR':str(b/label)}
 run('delivery-'+label+'-toolchain',['rustc','+'+toolchain,'-Vv'])
 run('delivery-'+label+'-example',['cargo','+'+toolchain,'run','--bin','flow-noise-archive-consumer'],p,extra)
 run('delivery-'+label+'-tests',['cargo','+'+toolchain,'test','--locked','--test','flow_noise_witness'],p,extra)
 run('delivery-'+label+'-metadata',['cargo','+'+toolchain,'metadata','--locked','--format-version','1'],p,extra)
 meta=json.loads((s/('delivery-'+label+'-metadata.log')).read_text())
 for item in meta['packages']:
  if item['source'] is None and item['name']!='flow-noise-archive-consumer':
   assert Path(item['manifest_path']).resolve().is_relative_to(packages)
 assert {i['name'] for i in meta['packages'] if i['source'] is None}==set(names)|{'flow-noise-archive-consumer'}
 run('delivery-'+label+'-archive-docs',['cargo','+'+toolchain,'doc','--manifest-path',str(packages/('hyperdynamics-'+versions['hyperdynamics'])/'Cargo.toml'),'--all-features','--no-deps',*patches],extra=extra|{'RUSTDOCFLAGS':'-D warnings'})
 shutil.copy2(p/'Cargo.lock',s/('delivery-'+label+'-consumer-Cargo.lock'))
(s/'delivery-consumer-Cargo.toml').write_text(manifest)
(s/'delivery-summary.json').write_text(json.dumps({'source_commit':source['commit'],'archives_verified':len(names),'toolchains':['1.95.0','stable'],'shipped_example_bytes_unchanged':True,'tests_copied_unchanged':True,'all_path_dependencies_from_archives':True,'full_stack_release_claim':False,'publication':False},indent=2)+'\n')
