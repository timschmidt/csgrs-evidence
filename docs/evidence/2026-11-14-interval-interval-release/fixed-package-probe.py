from pathlib import Path
import tarfile,tomllib,subprocess,os,json,re,hashlib
s=Path(__file__).parent;base=Path('/mnt/development/.interval-refactor-build/interval-release-fixed-probe');base.mkdir(exist_ok=True);packages=base/'packages';packages.mkdir(exist_ok=True);archive_root=Path('/mnt/development/.interval-refactor-build/interval-release/release-check/package');paths={};records=[]
for name in ['hyperreal','hyperinterval','hyperlattice-interval']:
 choices=list(archive_root.glob(name+'-[0-9]*.crate')) or list((archive_root/'tmp-crate').glob(name+'-[0-9]*.crate'));a,=choices
 with tarfile.open(a) as t:t.extractall(packages,filter='data')
 p=packages/a.name[:-6];paths[name]=p;records.append(dict(name=name,bytes=a.stat().st_size,sha256=hashlib.sha256(a.read_bytes()).hexdigest(),path=str(a)))
consumer=base/'consumer';(consumer/'src/bin').mkdir(parents=True,exist_ok=True);manifest='[package]\nname="fixed-packaged-consumer"\nversion="0.0.0"\nedition="2024"\nrust-version="1.88"\n[workspace]\n[dependencies]\n'
for name in ['hyperinterval','hyperlattice-interval']:manifest+=f'{name}={{version="=0.1.0",default-features=false,features=["fixed"]}}\n'
manifest+='[patch.crates-io]\n'+''.join(f'{n}={{path="{p}"}}\n' for n,p in paths.items());(consumer/'Cargo.toml').write_text(manifest);source='#![no_std]\n'
for name in ['hyperinterval','hyperlattice-interval']:
 text=(paths[name]/'README.md').read_text();code=re.search(r'<!-- quickstart:start -->\s*```rust\n(.*?)```\s*<!-- quickstart:end -->',text,re.S).group(1);label=name.replace('-','_');(consumer/f'src/bin/{label}.rs').write_text(code);source+='pub mod '+label+' {\n'+code.replace('fn main()','pub fn verify()')+'\n}\n'
(consumer/'src/lib.rs').write_text(source);(s/'fixed-probe-archives.json').write_text(json.dumps(records,indent=2)+'\n');(s/'fixed-probe-manifest.toml').write_text(manifest);(s/'fixed-probe-lib.rs').write_text(source)
rows=[];env=os.environ|{'CARGO_NET_OFFLINE':'true','CARGO_BUILD_JOBS':'2','CARGO_TARGET_DIR':str(base/'target')}
commands=[('native',['cargo','+1.88.0','build','--bins']),('scalar',['cargo','+1.88.0','run','--locked','--bin','hyperinterval']),('lattice',['cargo','+1.88.0','run','--locked','--bin','hyperlattice_interval']),('wasm',['cargo','+1.88.0','check','--locked','--lib','--target','wasm32-unknown-unknown']),('thumb',['cargo','+1.88.0','check','--locked','--lib','--target','thumbv7em-none-eabihf']),('tree',['cargo','+1.88.0','tree','--locked','--edges','normal','--prefix','none'])]
for name,cmd in commands:
 with (s/f'fixed-package-{name}.log').open('w') as out:p=subprocess.run(cmd,cwd=consumer,env=env,stdout=out,stderr=subprocess.STDOUT)
 rows.append(dict(name=name,command=cmd,returncode=p.returncode));(s/'fixed-package-checks.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,p.returncode,flush=True)
 if p.returncode:break
(s/'fixed-probe-Cargo.lock').write_bytes((consumer/'Cargo.lock').read_bytes())
