"""Qualify the merged BREP consumers; keep unrelated failures visible."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run

C = ['--offline','--locked']
CORE = ['-p','hyperbrep','-p','hyperbrep-io']
WASM = Path('/tmp/hyperbrep-cone-exchange-wasm-probe')
commands = [
    ('native-release',['cargo','test',*C,*CORE,'--all-features','--release','--no-fail-fast'],{},1800),
    ('native-minimal',['cargo','test',*C,*CORE,'--no-default-features','--release','--no-fail-fast'],{},1800),
    ('curve-release',['cargo','test',*C,'-p','hypercurve','--all-features','--release','--lib','--test','native_linear_stroke','--test','native_linear_stroke_contracts','--no-fail-fast'],{},1800),
    ('stroke-debug',['cargo','test',*C,'-p','hypercurve','--test','native_linear_stroke','--test','native_linear_stroke_contracts','--no-fail-fast'],{},1200),
    ('native-clippy',['cargo','clippy',*C,*CORE,'--all-features','--all-targets','--','-D','warnings'],{},900),
    ('native-minimal-clippy',['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'],{},900),
    ('stroke-clippy',['cargo','clippy',*C,'-p','hypercurve','--all-features','--test','native_linear_stroke','--test','native_linear_stroke_contracts','--','-D','warnings'],{},900),
    ('consumer-clippy',['cargo','clippy',*C,'--manifest-path','/tmp/hyperbrep-linear-stroke-integration-probe/Cargo.toml','--bin','hyperbrep-linear-stroke-integration-probe','--','-D','warnings'],{},900),
    ('rustdoc',['cargo','doc',*C,*CORE,'-p','hypercurve','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'},900),
    ('fuzz-check',['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'],{},900),
]
for name,example,folder in [
    ('analytic','analytic_step','exports'),('faceted','faceted_step','faceted-exports'),
    ('advanced','advanced_step','advanced-exports'),('supplied','supplied_step',None),
    ('circular','circular_step',None),('similarity','analytic_similarity','scaled-exports'),
    ('torus','torus_step','torus-exports'),('cone','cone_step','cone-exports')]:
    cmd = ['cargo','run',*C,'-p','hyperbrep-io','--example',example,'--release']
    if folder: cmd += ['--',str(OUT/folder)]
    commands.append((name+'-example',cmd,{},900))
commands += [
    ('wasm-build',['cargo','build',*C,'--manifest-path',str(WASM/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{'RUSTFLAGS':'-D warnings'},900),
    ('wasm-runtime',['python3',str(WASM/'run.py')],{},1800),
    ('fmt',['cargo','fmt','--all','--','--check'],{},300),
    ('diff-check',['git','diff','--check'],{},300),
]
source = hashes()
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
bindings = {}
for name in ['consumer-inputs.json','wasm-inputs.json']:
    bindings.update(json.loads((OUT/name).read_text()))
failures=[]
for label,command,env,seconds in commands:
    assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==digest for p,digest in bindings.items())
    if run(label,command,seconds,env): failures.append(label)
    assert hashes()==source
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest()==recipe
(OUT/'qualification-driver.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,
    executed=[r[0] for r in commands],failures=failures,external_inputs=bindings,
    scope='Merged-source BREP qualification. The separate four-case path consumer retains its two pre-existing unsupported round-cap measurements. This driver does not relabel that consumer as completed or run the full pre-push matrix.'),indent=2)+'\n')
print('failed checks:',failures,flush=True)
raise SystemExit(bool(failures))
