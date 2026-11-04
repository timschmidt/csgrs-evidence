from pathlib import Path
import subprocess,tarfile,io,shutil
root=Path('/home/tim/Documents/GitHub/workspace/csgrs');dest=Path('/tmp/csgrs-r06-field-cost-baseline-owner');dest.mkdir()
with tarfile.open(fileobj=io.BytesIO(subprocess.check_output(['git','archive','HEAD','crates/hypersolve']))) as archive:archive.extractall(dest,filter='data')
crate=dest/'crates/hypersolve'
s=(crate/'Cargo.toml').read_text()
for name in ['hyperreal','hyperlimit','hyperlattice']:s=s.replace('path = "../'+name+'"','path = "'+str(root/'crates'/name)+'"')
(crate/'Cargo.toml').write_text(s+'\n[workspace]\nresolver="3"\n')
for variant in ['baseline','candidate']:
 out=Path('/tmp/csgrs-r06-field-cost-'+variant);(out/'src').mkdir(parents=True)
 owner=crate if variant=='baseline' else root/'crates/hypersolve'
 (out/'Cargo.toml').write_text(f'''[package]
name="csgrs-r06-field-cost"
version="0.0.0"
edition="2024"
[workspace]
resolver="3"
[dependencies]
hypersolve={{path="{owner}"}}
hyperreal={{path="{root/'crates/hyperreal'}",features=["serde"]}}
serde_json="1.0.149"
''')
 lock=(root/'Cargo.lock').read_text()+'''\n[[package]]
name = "csgrs-r06-field-cost"
version = "0.0.0"
dependencies = [
 "hyperreal",
 "hypersolve",
 "serde_json",
]
'''
 (out/'Cargo.lock').write_text(lock)
 shutil.copyfile('/tmp/csgrs-r06-field-cost-main.rs',out/'src/main.rs')
