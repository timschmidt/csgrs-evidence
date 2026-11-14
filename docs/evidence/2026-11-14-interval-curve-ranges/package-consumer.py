from pathlib import Path
import subprocess,os,json,time,tarfile,hashlib,shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-curve-interval-ranges');b=Path('/mnt/development/.interval-refactor-build/curve-interval-ranges-packages');b.mkdir();home=b/'cargo-home';names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypertri','hypersolve','hypercurve'];source=json.loads((s/'SOURCE.json').read_text());assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip()==source['commit'];assert not subprocess.check_output(['git','status','--porcelain'],cwd=r)
subprocess.run(['bash','-c','source scripts/release-package-cache.sh; prepare_release_package_home "$1"','bash',str(home)],cwd=r,check=True)
cmd=['cargo','+1.95.0','package','--locked','--config','patch.crates-io.hypervoxel.path="crates/hypervoxel"']
for name in names:cmd+=['-p',name]
env=os.environ|{'CARGO_HOME':str(home),'CARGO_TARGET_DIR':str(b/'target'),'CARGO_BUILD_JOBS':'4','CARGO_NET_OFFLINE':'true'};rows=[]
def run(name,cmd,cwd,local=env):
 start=time.monotonic()
 with (s/(name+'.log')).open('wb') as out:p=subprocess.run(cmd,cwd=cwd,env=local,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,cwd=str(cwd),returncode=p.returncode,seconds=time.monotonic()-start));(s/'package-commands.json').write_text(json.dumps(rows,indent=2)+'\n');assert p.returncode==0,name
run('package-verified',cmd,r)
packages=b/'packages';packages.mkdir();artifacts=[];paths={}
for name in names:
 archive,=(b/'target/package').glob(name+'-[0-9]*.crate');data=archive.read_bytes()
 with tarfile.open(archive) as tar:tar.extractall(packages,filter='data')
 path=packages/archive.name[:-6];paths[name]=path
 vcs=json.loads((path/'.cargo_vcs_info.json').read_text());assert vcs['git']['sha1']==source['commit'] and not vcs['git'].get('dirty',False)
 artifacts.append(dict(name=name,sha256=hashlib.sha256(data).hexdigest(),bytes=len(data),vcs=vcs))
(s/'package-artifacts.json').write_text(json.dumps(artifacts,indent=2)+'\n')
assert (paths['hypercurve']/'src/interval_ranges.rs').read_bytes()==(r/'crates/hypercurve/src/interval_ranges.rs').read_bytes()
consumer=b/'consumer';(consumer/'src').mkdir(parents=True);example=(paths['hypercurve']/'examples/interval_ranges.rs').read_bytes();assert example==(r/'crates/hypercurve/examples/interval_ranges.rs').read_bytes();(consumer/'src/main.rs').write_bytes(example)
manifest='''[package]
name="packaged-curve-interval-ranges"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hypercurve={version="0.4.0",features=["interval-ranges"]}
hypersolve={version="0.4.0",default-features=false}
hyperreal="0.14.0"
hyperinterval={version="0.1.0",features=["hyperreal"]}
[patch.crates-io]
'''+''.join(name+'={path='+json.dumps(str(path))+'}\n' for name,path in paths.items())
(consumer/'Cargo.toml').write_text(manifest);(s/'packaged-consumer-Cargo.toml').write_text(manifest);shutil.copyfile(r/'Cargo.lock',consumer/'Cargo.lock')
run('packaged-consumer-lock',['cargo','+1.95.0','generate-lockfile','--offline'],consumer)
shutil.copyfile(consumer/'Cargo.lock',s/'packaged-consumer-Cargo.lock')
run('packaged-consumer-build',['cargo','+1.95.0','build','--locked'],consumer)
run('packaged-consumer-run',['cargo','+1.95.0','run','--locked'],consumer)
run('packaged-consumer-clippy',['cargo','+1.95.0','clippy','--locked','--','-D','warnings'],consumer)
p=subprocess.run(['cargo','+1.95.0','metadata','--locked','--format-version','1'],cwd=consumer,env=env,stdout=subprocess.PIPE,stderr=subprocess.PIPE);assert p.returncode==0;(s/'packaged-consumer-metadata.json').write_bytes(p.stdout);(s/'packaged-consumer-metadata.stderr').write_bytes(p.stderr);metadata=json.loads(p.stdout)
found=[]
for item in metadata['packages']:
 if item['name'] in names:
  path=Path(item['manifest_path']).resolve();assert path.is_relative_to(packages.resolve());assert item['source'] is None;found.append(item['name'])
assert {'hyperreal','hyperinterval','hyperlattice','hyperlimit','hypersolve','hypercurve'} <= set(found); (s/'packaged-consumer-source.json').write_text(json.dumps(dict(all_resolved_hyper_packages_from_archives=True,verified_packages=names,resolved_packages=sorted(found),source_commit=source['commit'],example_sha256=hashlib.sha256(example).hexdigest(),full_release_not_claimed=True),indent=2)+'\n');print('eight packages verified; archive-only curve consumer passed')
