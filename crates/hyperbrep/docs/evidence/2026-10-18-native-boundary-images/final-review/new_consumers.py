"""Freeze and execute the new complete external consumers after source freeze."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, hashes, run

source = hashes()
project = OUT/'consumer-project'
wasm = OUT/'wasm-probe'
commands = [
    ('new-consumer-clippy', ['cargo','clippy','--offline','--locked','--manifest-path',str(project/'Cargo.toml'),'--all-targets','--','-D','warnings'], {}),
    ('new-consumer-build', ['cargo','build','--offline','--locked','--release','--manifest-path',str(project/'Cargo.toml')], {}),
    ('new-wasm-build', ['cargo','build','--offline','--locked','--release','--manifest-path',str(wasm/'Cargo.toml'),'--target','wasm32-unknown-unknown'], {'RUSTFLAGS':'-D warnings'}),
    ('new-wasm-runtime', ['python3',str(wasm/'run.py')], {}),
]
for label, command, extra in commands:
    assert run(label,command,1200,extra)==0,label
    assert hashes()==source
binaries={}
for name, original, destination in [
    ('native',Path(ENV['CARGO_TARGET_DIR'])/'release/hyperbrep-native-images-consumer',Path('/tmp/hyperbrep-native-images-consumer-qualified')),
    ('wasm',Path(ENV['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hyperbrep_native_images_wasm_probe.wasm',Path('/tmp/hyperbrep-native-images-new-qualified.wasm')),
]:
    assert not destination.exists()
    shutil.copy2(original,destination)
    binaries[name]=dict(path=str(destination),bytes=destination.stat().st_size,sha256=hashlib.sha256(destination.read_bytes()).hexdigest())
for mode in ['all','artifacts','step']:
    command=[binaries['native']['path'],mode]
    if mode=='artifacts':command+=[str(OUT/'new-native-artifacts')]
    assert run('new-consumer-'+mode,command,600)==0
assert hashes()==source
(OUT/'new-consumers.json').write_text(json.dumps(dict(source=source,binaries=binaries,
    complete_native_groups=6,curve_proof_groups=8,wasm_groups=14,artifacts=8,
    scope='Strict source-path consumers. STEP is separately diagnosed; success of native operations does not establish STEP export or full source-history persistence.'),indent=2)+'\n')
