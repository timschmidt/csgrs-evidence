from pathlib import Path
import tarfile,tomllib,re,subprocess,os,json,hashlib
s=Path(__file__).parent;root=Path('/mnt/development/.interval-refactor-build/interval-release-readme-probe');root.mkdir(exist_ok=True);package_dir=root/'packages';package_dir.mkdir(exist_ok=True);a=Path('/mnt/development/.interval-refactor-build/interval-release/release-check/package/tmp-crate');names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hyperdynamics'];packages={};records=[]
for name in names:
 archive,=a.glob(name+'-[0-9]*.crate')
 with tarfile.open(archive) as t:t.extractall(package_dir,filter='data')
 path=package_dir/archive.name[:-6];data=tomllib.loads((path/'Cargo.toml').read_text());packages[name]=(path,data['package']['version']);records.append(dict(name=name,archive=str(archive),sha256=hashlib.sha256(archive.read_bytes()).hexdigest()))
consumer=root/'consumer';(consumer/'src/bin').mkdir(parents=True,exist_ok=True)
manifest='[package]\nname="interval-readme-probe"\nversion="0.0.0"\nedition="2024"\n[workspace]\n[dependencies]\n'
for name,feature in [('hyperinterval','fixed'),('hyperlattice-interval','fixed'),('hyperdynamics','field'),('hypersolve','interval-program')]:manifest+=f'{name}={{version="={packages[name][1]}",features=["{feature}"]}}\n'
manifest+='[patch.crates-io]\n'
for name,(path,_) in packages.items():manifest+=f'{name}={{path="{path}"}}\n'
(consumer/'Cargo.toml').write_text(manifest)
for name in ['hyperinterval','hyperlattice-interval','hyperdynamics']:
 t=(packages[name][0]/'README.md').read_text();match=re.search(r'<!-- quickstart:start -->\s*```rust\n(.*?)```\s*<!-- quickstart:end -->',t,re.S);assert match;(consumer/'src/bin'/(name.replace('-','_')+'.rs')).write_text(match.group(1))
(s/'first-probe-archives.json').write_text(json.dumps(records,indent=2)+'\n');(s/'first-probe-manifest.toml').write_text(manifest)
with (s/'first-quickstart-probe.log').open('w') as o:p=subprocess.run(['cargo','+1.95.0','check','--offline','--bins'],cwd=consumer,env=os.environ|{'CARGO_BUILD_JOBS':'3','CARGO_TARGET_DIR':str(root/'target')},stdout=o,stderr=subprocess.STDOUT)
(s/'first-quickstart-probe.exit').write_text(str(p.returncode)+'\n');print(p.returncode)
