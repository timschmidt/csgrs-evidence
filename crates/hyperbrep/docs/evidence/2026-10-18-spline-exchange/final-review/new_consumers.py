"""Qualify new exchange consumers and preserve the preceding fourteen groups."""
import hashlib,json,shutil,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
source=hashes();old=OUT.parent/'2026-10-18-native-boundary-images';project=OUT/'consumer-project'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
inputs={str(p):sha(p) for p in [Path(__file__),*old.joinpath('consumer-project').glob('*'),*old.joinpath('wasm-probe').glob('*')] if p.is_file()}
for label,args,extra in [
 ('new-consumer-clippy',['cargo','clippy','--offline','--locked','--all-targets','--manifest-path',str(project/'Cargo.toml'),'--','-D','warnings'],{}),
 ('new-consumer-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml')],{}),
 ('new-wasm-build',['cargo','build','--offline','--locked','--release','--lib','--manifest-path',str(project/'Cargo.toml'),'--target','wasm32-unknown-unknown'],{'RUSTFLAGS':'-D warnings'}),
 ('new-wasm-runtime',['python3',str(project/'run.py')],{}),
 ('prior-image-consumer-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(old/'consumer-project/Cargo.toml')],{}),
 ('prior-image-wasm-build',['cargo','build','--offline','--locked','--release','--manifest-path',str(old/'wasm-probe/Cargo.toml'),'--target','wasm32-unknown-unknown'],{'RUSTFLAGS':'-D warnings'}),
 ('prior-image-wasm-runtime',['python3',str(old/'wasm-probe/run.py')],{}),
]:
 assert run(label,args,1200,extra)==0,label
 assert hashes()==source and all(sha(p)==h for p,h in inputs.items())
binaries={}
for name,relative,destination in [
 ('native','release/hyperbrep-spline-exchange-consumer','/tmp/hyperbrep-spline-exchange-qualified'),
 ('wasm','wasm32-unknown-unknown/release/hyperbrep_spline_exchange_probe.wasm','/tmp/hyperbrep-spline-exchange-new-qualified.wasm'),
 ('prior_native','release/hyperbrep-native-images-consumer','/tmp/hyperbrep-spline-exchange-prior-native'),
 ('prior_wasm','wasm32-unknown-unknown/release/hyperbrep_native_images_wasm_probe.wasm','/tmp/hyperbrep-spline-exchange-prior14.wasm'),
]:
 p=Path(destination);assert not p.exists();shutil.copy2(Path(ENV['CARGO_TARGET_DIR'])/relative,p)
 binaries[name]=dict(path=str(p),bytes=p.stat().st_size,sha256=sha(p))
assert run('new-consumer-all',[binaries['native']['path'],'all'],600)==0
assert run('prior-image-all',[binaries['prior_native']['path'],'all'],600)==0
assert run('prior-image-step',[binaries['prior_native']['path'],'step'],600)==0
rows=[]
for suffix in ['artifacts','repeat']:
 folder=OUT/('prior-native-'+suffix)
 assert run('prior-image-'+suffix,[binaries['prior_native']['path'],'artifacts',str(folder)],600)==0
 for baseline in sorted((old/'new-native-artifacts').glob('*.json')):
  current=folder/baseline.name;assert current.read_bytes()==baseline.read_bytes()
  rows.append(dict(path=str(current.relative_to(OUT)),baseline=str(baseline.relative_to(ROOT)),sha256=sha(current),bytes=current.stat().st_size))
assert len(rows)==16 and hashes()==source
(OUT/'prior-image-artifacts.json').write_text(json.dumps(dict(source=source,rows=rows,unchanged=8,fresh_processes=2),indent=2)+'\n')
(OUT/'new-consumers.json').write_text(json.dumps(dict(source=source,inputs=inputs,binaries=binaries,new_native_groups=9,new_wasm_groups=9,preserved_native_groups=14,preserved_wasm_groups=14,scope='Shared public acceptance bodies in native and real WASM; source-path ABI consumers, not published bindings or complete STEP/AP coverage.'),indent=2)+'\n')
