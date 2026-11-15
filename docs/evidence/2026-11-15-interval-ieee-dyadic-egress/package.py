from pathlib import Path
import subprocess,os,json,time,tarfile,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-ieee-egress');b=Path('/mnt/development/.interval-refactor-build/ieee-egress-package');b.mkdir();source=json.loads((s/'SOURCE.json').read_text())
setup=['bash','-c','source scripts/release-package-cache.sh; prepare_release_package_home "$1"','package-home',str(b/'cargo-home')]
p=subprocess.run(setup,cwd=r,capture_output=True,text=True);(s/'package-home.log').write_text(p.stdout+p.stderr);assert p.returncode==0
env=os.environ|{'CARGO_HOME':str(b/'cargo-home'),'CARGO_TARGET_DIR':str(b/'target'),'CARGO_BUILD_JOBS':'12','CARGO_NET_OFFLINE':'true','CARGO_TERM_COLOR':'never'};rows=[]
def run(name,args,cwd=r):
 t=time.monotonic()
 with (s/(name+'.log')).open('w') as out,(s/(name+'.stderr.log')).open('w') as err:p=subprocess.run(args,cwd=cwd,env=env,stdout=out,stderr=err,timeout=900)
 rows.append({'name':name,'command':args,'exit_code':p.returncode,'seconds':time.monotonic()-t});(s/'package-results.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True);assert p.returncode==0
run('package-build',['cargo','+1.95.0','package','--locked','-p','hyperreal','-p','hyperinterval'])
packages=b/'packages';packages.mkdir();artifacts=[]
for name in ['hyperreal','hyperinterval']:
 archive,=(b/'target/package').glob(name+'-[0-9]*.crate')
 with tarfile.open(archive) as t:t.extractall(packages,filter='data')
 root=packages/archive.name.removesuffix('.crate');vcs=json.loads((root/'.cargo_vcs_info.json').read_text());assert vcs['git']['sha1']==source['commit'] and not vcs['git'].get('dirty',False)
 artifacts.append({'name':name,'archive':str(archive),'sha256':hashlib.sha256(archive.read_bytes()).hexdigest(),'bytes':archive.stat().st_size,'vcs':vcs})
(s/'package-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
client=b/'consumer';(client/'src').mkdir(parents=True)
shutil.copyfile(r/'crates/hyperinterval/tests/support/dyadic_egress_cases.rs',client/'src/cases.rs')
(client/'src/lib.rs').write_text('mod cases;\n#[unsafe(no_mangle)]\npub extern "C" fn verify_dyadic_egress()->u32 {cases::verify()}\n')
(client/'src/main.rs').write_text('fn main(){assert_eq!(packaged_dyadic_client::verify_dyadic_egress(),56);println!("56 exact dyadic egress cases passed");}\n')
manifest='[package]\nname="packaged-dyadic-client"\nversion="0.0.0"\nedition="2024"\nrust-version="1.88"\n[workspace]\n[lib]\ncrate-type=["cdylib","rlib"]\n[dependencies]\nhyperinterval={version="=0.1.0",default-features=false,features=["dyadic","float-enclosure"]}\nnum-bigint="=0.4.6"\n[profile.release]\npanic="abort"\noverflow-checks=true\n[patch.crates-io]\nhyperinterval={path='+json.dumps(str(packages/'hyperinterval-0.1.0'))+'}\n'
(client/'Cargo.toml').write_text(manifest);(s/'package-consumer-Cargo.toml').write_text(manifest)
env['CARGO_TARGET_DIR']=str(b/'consumer-target')
for version in ['1.88.0','stable']:
 run('consumer-native-'+version,['cargo','+'+version,'run','--offline','--release'],client)
 run('consumer-build-'+version,['cargo','+'+version,'build','--locked','--offline','--release','--lib','--target','wasm32-unknown-unknown'],client)
 run('consumer-clippy-'+version,['cargo','+'+version,'clippy','--locked','--offline','--all-targets','--','-D','warnings'],client)
 module=b/('packaged-'+version+'.wasm');shutil.copyfile(b/'consumer-target/wasm32-unknown-unknown/release/packaged_dyadic_client.wasm',module)
 corpus='/mnt/development/.interval-refactor-build/ieee-egress-final-stable/corpus.json'
 for kind in ['check','browser']:
  run('consumer-'+kind+'-'+version,['node',str(r/('crates/hyperinterval/conformance/wasm-float/'+kind+'.mjs')),str(module),corpus,'--egress'],client)
 run('consumer-metadata-'+version,['cargo','+'+version,'metadata','--locked','--offline','--format-version','1'],client)
 metadata=json.loads((s/('consumer-metadata-'+version+'.log')).read_text())
 for item in metadata['packages']:
  if item['source'] is None and item['name']!='packaged-dyadic-client':assert Path(item['manifest_path']).resolve().is_relative_to(packages)
 assert {item['name'] for item in metadata['packages']}=={'packaged-dyadic-client','hyperinterval','num-bigint','num-integer','num-traits','autocfg'}
shutil.copyfile(client/'Cargo.lock',s/'package-consumer-Cargo.lock')
env['CARGO_TARGET_DIR']=str(b/'reproduce-target')
run('package-reproduce',['cargo','+1.95.0','package','--locked','-p','hyperreal','-p','hyperinterval','--no-verify'])
for row in artifacts:
 archive,=(b/'reproduce-target/package').glob(row['name']+'-[0-9]*.crate');assert hashlib.sha256(archive.read_bytes()).hexdigest()==row['sha256']
(s/'package-completed.json').write_text(json.dumps({'all_passed':True,'archives_reproduced':True,'source':source['commit'],'all_library_sources_from_archives_or_registry':True,'workspace_library_dependencies':False})+'\n')
