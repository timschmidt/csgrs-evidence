"""Qualify native geometry, topology, all preceding consumers and actual WASM."""
import hashlib
import json
from pathlib import Path
import sys
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,hashes,run
C=['--offline','--locked'];CORE=['-p','hyperbrep','-p','hyperbrep-io']
PROJECT=Path('/tmp/hyperbrep-axial-consumer');WASM=Path('/tmp/hyperbrep-partial-prism-wasm-probe');DIAG=Path('/tmp/hyperbrep-partial-prism-probe')
commands=[
 ('native-release',['cargo','test',*C,*CORE,'--all-features','--release','--no-fail-fast'],{},1800),
 ('native-minimal',['cargo','test',*C,*CORE,'--no-default-features','--release','--no-fail-fast'],{},1800),
 ('axial-debug',['cargo','test',*C,*CORE,'--all-features','--test','axial_cuts','--no-fail-fast'],{},900),
 ('axial-geometry-debug',['cargo','test',*C,'-p','hyperbrep','--lib','geometry::axial_lines::tests'],{},900),
 ('axial-cover-debug',['cargo','test',*C,'-p','hyperbrep','--lib','validation::convex_groups::tests'],{},900),
 ('native-clippy',['cargo','clippy',*C,*CORE,'--all-features','--all-targets','--','-D','warnings'],{},900),
 ('minimal-clippy',['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'],{},900),
 ('consumer-clippy',['cargo','clippy',*C,'--manifest-path',str(PROJECT/'Cargo.toml'),'--','-D','warnings'],{},900),
 ('diagnostic-clippy',['cargo','clippy',*C,'--manifest-path',str(DIAG/'Cargo.toml'),'--bins','--','-D','warnings'],{},900),
 ('rustdoc',['cargo','doc',*C,*CORE,'--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'},900),
 ('fuzz-check',['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'],{},900),
 ('consumer-build',['cargo','build',*C,'--manifest-path',str(PROJECT/'Cargo.toml'),'--release'],{},900),
 ('diagnostic-build',['cargo','build',*C,'--manifest-path',str(DIAG/'Cargo.toml'),'--release','--bins'],{},900),
 ('axial-benchmark-build',['cargo','build',*C,'-p','hyperbrep-io','--bench','axial_exchange','--release','--message-format=json'],{},900),
]
for name,example,folder in [('analytic','analytic_step','exports'),('faceted','faceted_step','faceted-exports'),('advanced','advanced_step','advanced-exports'),('supplied','supplied_step',None),('circular','circular_step',None),('similarity','analytic_similarity','scaled-exports'),('torus','torus_step','torus-exports'),('cone','cone_step','cone-exports'),('region','region_extrusion_step','region-exports')]:
 command=['cargo','run',*C,'-p','hyperbrep-io','--example',example,'--release']
 if folder:command+=['--',str(OUT/folder)]
 commands.append((name+'-example',command,{},900))
commands += [('wasm-build',['cargo','build',*C,'--manifest-path',str(WASM/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{'RUSTFLAGS':'-D warnings'},900),('wasm-runtime',['python3',str(WASM/'run.py')],{},1800),('fmt',['cargo','fmt','--all','--','--check'],{},300),('diff-check',['git','diff','--check'],{},300)]
source=hashes();recipe=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
inputs={}
for name in ['consumer-final-inputs.json','wasm-inputs.json','diagnostic-final-inputs.json']:inputs.update(json.loads((OUT/name).read_text()))
failures=[]
for label,command,env,seconds in commands:
 assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
 if run(label,command,seconds,env):failures.append(label)
 assert hashes()==source
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest()==recipe
(OUT/'qualification-driver.json').write_text(json.dumps(dict(source=source,recipe_sha256=recipe,executed=[x[0] for x in commands],failures=failures,external_inputs=inputs,scope='Native axial correspondence and its topology/profile prerequisites; all preceding BREP/IO tests, focused debug tests, lint/docs/fuzz compilation, examples and 127 source-path WASM groups. Partial-depth result shells, release/package/MSRV/bindings and complete pre-push gates remain open.'),indent=2)+'\n')
print('failed checks:',failures,flush=True)
raise SystemExit(bool(failures))
