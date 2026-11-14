from pathlib import Path
import tarfile,tomllib,re,subprocess,os,json,hashlib
s=Path(__file__).parent;root=Path('/mnt/development/.interval-refactor-build/interval-release-readme-final');root.mkdir(exist_ok=True);package_dir=root/'packages';package_dir.mkdir(exist_ok=True);a=Path('/mnt/development/.interval-refactor-build/interval-release/release-check/package/tmp-crate');names=['hyperreal','hyperinterval','hyperlattice-interval','hyperlattice','hyperlimit','hypersolve','hyperdynamics'];packages={};records=[]
for name in names:
 choices=list(a.glob(name+'-[0-9]*.crate')) or list(a.parent.glob(name+'-[0-9]*.crate'));archive,=choices
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
(s/'focused-probe-archives.json').write_text(json.dumps(records,indent=2)+'\n');(s/'focused-probe-manifest.toml').write_text(manifest)
rows=[]
commands=[('build',['cargo','+1.95.0','build','--offline','--bins']),('clippy',['cargo','+1.95.0','clippy','--offline','--locked','--bins','--','-D','warnings'])]+[(name,['cargo','+1.95.0','run','--offline','--locked','--bin',name]) for name in ['hyperinterval','hyperlattice_interval','hyperdynamics']]
for name,cmd in commands:
 with (s/f'focused-{name}.log').open('w') as out:p=subprocess.run(cmd,cwd=consumer,env=os.environ|{'CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':str(root/'target')},stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=p.returncode));(s/'focused-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:break
(s/'focused-Cargo.lock').write_bytes((consumer/'Cargo.lock').read_bytes())
