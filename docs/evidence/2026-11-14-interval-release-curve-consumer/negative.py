from pathlib import Path
import hashlib,json,os,subprocess,time,tomllib
s=Path(__file__).parent
r=Path('/mnt/development/csgrs-release-curve-consumer')
b=Path('/mnt/development/.interval-refactor-build/release-curve-consumer')
c=b/'negative';(c/'src').mkdir(parents=True,exist_ok=False)
source=(r/'crates/hypercurve/examples/interval_ranges.rs').read_bytes()
(c/'src/main.rs').write_bytes(source)
manifest='''[package]
name="release-curve-missing-feature"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hypercurve="=0.4.0"
hyperinterval={version="=0.1.0",features=["fixed"]}
hyperreal="=0.14.0"
hypersolve="=0.4.0"
[patch.crates-io]
'''
for name in ['hypercurve','hyperinterval','hyperreal','hypersolve','hyperlimit','hyperlattice','hypertri']:
 manifest+=f'{name}={{path={json.dumps(str(r/"crates"/name))}}}\n'
(c/'Cargo.toml').write_text(manifest)
cmd=['cargo','+1.95.0','check','--offline']
start=time.monotonic()
p=subprocess.run(cmd,cwd=c,env=os.environ|{'CARGO_TARGET_DIR':str(b/'negative-target'),'CARGO_BUILD_JOBS':'4'},stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
(s/'negative.log').write_bytes(p.stdout)
assert p.returncode!=0
assert b'E0432' in p.stdout and b'interval_ranges' in p.stdout and b'interval-ranges' in p.stdout,p.stdout[-5000:]
(s/'negative.json').write_text(json.dumps({'source_commit':subprocess.check_output(['git','rev-parse','HEAD'],cwd=r).decode().strip(),'command':cmd,'cwd':str(c),'returncode':p.returncode,'seconds':time.monotonic()-start,'example_sha256':hashlib.sha256(source).hexdigest(),'scope':'current workspace library source, external consumer without the optional Hypercurve feature; not an archive verification','expected_missing_feature_reproduced':True},indent=2)+'\n')
print('negative control reproduced E0432 for feature-gated interval_ranges')
