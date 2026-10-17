"""Qualify the public region entry point and its native/STEP/WASM consumers."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, hashes, run

C=['--offline','--locked']
CORE=['-p','hyperbrep','-p','hyperbrep-io']
PROJECT=Path('/tmp/hyperbrep-region-extrusion-probe')
WASM=Path('/tmp/hyperbrep-region-extrusion-wasm-probe')
commands=[
    ('native-release',['cargo','test',*C,*CORE,'--all-features','--release','--no-fail-fast'],{},1800),
    ('native-minimal',['cargo','test',*C,*CORE,'--no-default-features','--release','--no-fail-fast'],{},1800),
    ('region-debug',['cargo','test',*C,*CORE,'--all-features','--test','region_extrusion','--no-fail-fast'],{},900),
    ('native-clippy',['cargo','clippy',*C,*CORE,'--all-features','--all-targets','--','-D','warnings'],{},900),
    ('native-minimal-clippy',['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'],{},900),
    ('consumer-clippy',['cargo','clippy',*C,'--manifest-path',str(PROJECT/'Cargo.toml'),'--','-D','warnings'],{},900),
    ('rustdoc',['cargo','doc',*C,*CORE,'--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'},900),
    ('fuzz-check',['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'],{},900),
    ('consumer-final-build',['cargo','build',*C,'--manifest-path',str(PROJECT/'Cargo.toml'),'--release'],{},900),
    ('region-benchmark-build',['cargo','build',*C,'-p','hyperbrep-io','--bench','region_exchange','--release','--message-format=json'],{},900),
]
for name,example,folder in [
    ('analytic','analytic_step','exports'),('faceted','faceted_step','faceted-exports'),
    ('advanced','advanced_step','advanced-exports'),('supplied','supplied_step',None),
    ('circular','circular_step',None),('similarity','analytic_similarity','scaled-exports'),
    ('torus','torus_step','torus-exports'),('cone','cone_step','cone-exports'),
    ('region','region_extrusion_step','region-exports')]:
    cmd=['cargo','run',*C,'-p','hyperbrep-io','--example',example,'--release']
    if folder:cmd+=['--',str(OUT/folder)]
    commands.append((name+'-example',cmd,{},900))
commands+=[
    ('wasm-build',['cargo','build',*C,'--manifest-path',str(WASM/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{'RUSTFLAGS':'-D warnings'},900),
    ('wasm-runtime',['python3',str(WASM/'run.py')],{},1800),
    ('fmt',['cargo','fmt','--all','--','--check'],{},300),
    ('diff-check',['git','diff','--check'],{},300),
]
source=hashes()
recipe=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
inputs={}
for name in ['consumer-inputs.json','wasm-inputs.json']:inputs.update(json.loads((OUT/name).read_text()))
construction=json.loads((OUT/'wasm-construction.json').read_text())
assert hashlib.sha256(Path(construction['native_acceptance']['path']).read_bytes()).hexdigest()==construction['native_acceptance']['sha256']
failures=[]
for label,command,env,seconds in commands:
    assert all(hashlib.sha256(Path(path).read_bytes()).hexdigest()==value for path,value in inputs.items())
    if run(label,command,seconds,env):failures.append(label)
    assert hashes()==source
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest()==recipe
(OUT/'qualification-driver.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,
    executed=[row[0] for row in commands],failures=failures,external_inputs=inputs,
    scope='Public normalized-region extrusion, all preceding native/IO test contracts, and 119 source-path WASM groups. General rational-path measurements, package delivery and complete pre-push gates remain separate.'),indent=2)+'\n')
print('failed checks:',failures,flush=True)
raise SystemExit(bool(failures))
