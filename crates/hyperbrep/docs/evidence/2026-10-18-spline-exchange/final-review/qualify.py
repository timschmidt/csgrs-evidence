"""Qualification of exact spline exchange and all preceding complete BREP consumers."""
import hashlib,json,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from check import OUT,ROOT,ENV,hashes,run
C=['--offline','--locked'];CORE=['-p','hyperbrep','-p','hyperbrep-io'];P=Path('/tmp/hyperbrep-axial-shell-consumer');W=Path('/tmp/hyperbrep-axial-shell-wasm-probe')
commands=[
 ('spline-native-debug',['cargo','test',*C,'-p','hyperbrep','--test','spline_geometry'],{},900),
 ('spline-io-debug',['cargo','test',*C,'-p','hyperbrep-io','--test','spline_exchange'],{},900),
 ('curve-clippy',['cargo','clippy',*C,'-p','hypercurve','--all-features','--all-targets','--','-D','warnings'],{},1200),
 ('curve-tests',['cargo','test',*C,'--release','-p','hypercurve','--all-features','--test','native_curve_images','--test','hypercurve_curve_intersection','--test','hypercurve_analytic_parallel_region','--test','hypercurve_path_closure','--no-fail-fast'],{},1800),
 ('native-image-debug',['cargo','test',*C,'-p','hypercurve','--test','native_curve_images'],{},900),
 ('retained-profile-debug',['cargo','test',*C,'-p','hyperbrep','--test','retained_region_extrusion'],{},900),
 ('native-clippy',['cargo','clippy',*C,*CORE,'--all-features','--all-targets','--','-D','warnings'],{},900),
 ('minimal-clippy',['cargo','clippy',*C,*CORE,'--no-default-features','--all-targets','--','-D','warnings'],{},900),
 ('native-release',['cargo','test',*C,*CORE,'--all-features','--release','--no-fail-fast'],{},1800),
 ('native-minimal',['cargo','test',*C,*CORE,'--no-default-features','--release','--no-fail-fast'],{},1800),
 ('axial-debug',['cargo','test',*C,*CORE,'--all-features','--test','axial_shells','--test','axial_cuts','--no-fail-fast'],{},900),
 ('axial-proof-debug',['cargo','test',*C,'-p','hyperbrep','--lib','validation::axial_shell::tests'],{},900),
 ('plane-relation-debug',['cargo','test',*C,'-p','hyperbrep','--lib','geometry::planes::tests'],{},900),
 ('axial-chart-debug',['cargo','test',*C,'-p','hyperbrep','--lib','geometry::periodic_charts::tests'],{},900),
 ('consumer-clippy',['cargo','clippy',*C,'--manifest-path',str(P/'Cargo.toml'),'--','-D','warnings'],{},900),
 ('rustdoc',['cargo','doc',*C,*CORE,'-p','hypercurve','--all-features','--no-deps'],{'RUSTDOCFLAGS':'-D warnings'},900),
 ('fuzz-check',['cargo','check',*C,'--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'],{},900),
 ('consumer-build',['cargo','build',*C,'--manifest-path',str(P/'Cargo.toml'),'--release'],{},900),
]
for name,example,folder in [('analytic','analytic_step','exports'),('faceted','faceted_step','faceted-exports'),('advanced','advanced_step','advanced-exports'),('supplied','supplied_step',None),('circular','circular_step',None),('similarity','analytic_similarity','scaled-exports'),('torus','torus_step','torus-exports'),('cone','cone_step','cone-exports'),('region','region_extrusion_step','region-exports')]:
 command=['cargo','run',*C,'-p','hyperbrep-io','--example',example,'--release']
 if folder:command+=['--',str(OUT/folder)]
 commands.append((name+'-example',command,{},900))
commands += [('wasm-build',['cargo','build',*C,'--manifest-path',str(W/'Cargo.toml'),'--target','wasm32-unknown-unknown','--release'],{'RUSTFLAGS':'-D warnings'},900),('wasm-runtime',['python3',str(W/'run.py')],{},1800),('fmt',['cargo','fmt','--all','--','--check'],{},300),('diff-check',['git','diff','--check'],{},300)]
source=hashes();inputs=json.loads((OUT/'external-inputs.json').read_text());inputs[str(Path(__file__).resolve())]=hashlib.sha256(Path(__file__).read_bytes()).hexdigest();failures=[];blocked=[]
for label,command,extra,seconds in commands:
 assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in inputs.items())
 code=run(label,command,seconds,extra)
 assert hashes()==source
 if code:
  row=json.loads((OUT/'attempts.json').read_text())[-1];log=(OUT/row['log']).read_text()
  (blocked if 'debug' in label and 'FACTORS > 0' in log else failures).append(label)
 (OUT/'qualification-driver.json').write_text(json.dumps(dict(source=source,executed=[x['label'] for x in json.loads((OUT/'attempts.json').read_text()) if x['source_unchanged'] and x['source']=='source-'+hashlib.sha256(json.dumps(source,sort_keys=True).encode()).hexdigest()+'.json'],failures=failures,upstream_debug_blocked=blocked,external_inputs=inputs,scope='Source-path BREP/IO admission; not full pre-push, packaging, MSRV, coverage, formal proof or general resource bounds.'),indent=2)+'\n')
print('failed checks:',failures,'upstream-owned debug blockers:',blocked,flush=True)
raise SystemExit(bool(failures))
