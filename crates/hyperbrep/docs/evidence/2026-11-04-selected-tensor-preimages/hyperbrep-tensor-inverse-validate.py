from pathlib import Path
import subprocess,json,hashlib,time,os
prefix='/tmp/hyperbrep-tensor-inverse-final'
roots=[Path('crates',c) for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io']]
paths=sorted(p for root in roots for p in root.rglob('*') if p.is_file() and '.git' not in p.parts and 'target' not in p.parts and p.suffix in ['.rs','.json','.toml'] and ('docs' not in p.parts))
source={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
Path(prefix+'-source.json').write_text(json.dumps(source,indent=2)+'\n')
base=['cargo','test','--offline','--locked','--all-features']
steps=[('format',['cargo','fmt','--all','--','--check']),
('clippy',['cargo','clippy','--offline','--locked','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-targets','--all-features','--','-D','warnings']),
('curve-evaluation',base+['-p','hypercurve','--lib','curve_evaluation']),
('curve-incidence',base+['-p','hypercurve','--lib','curve_intersection']),
('curve-polynomial',base+['-p','hypercurve','--lib','polynomial_curve']),
('curve-support',base+['-p','hypercurve','--lib','curve_support']),
('curve',base+['-p','hypercurve']+sum((['--test',s] for s in ['line_constant_coordinates','polynomial_point_locations','polynomial_closure_composition','polynomial_boundary_components','polynomial_curve_pairs','polynomial_query_fibers','polynomial_region_admission','selected_point_definitions','work_budget','polynomial_generated_lines','polynomial_rational_sections','polynomial_line_components','polynomial_selected_chords','selected_rational_locations','rational_image_locations']),[])),
('brep',base+['-p','hyperbrep']),('io',base+['-p','hyperbrep-io']),
('docs',['cargo','doc','--offline','--locked','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-features','--no-deps']),
('wasm',['cargo','build','--offline','--locked','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--lib','--target','wasm32-unknown-unknown','--features','hypercurve/svg,hypercurve/triangulation,hypercurve/hershey,hypercurve/dispatch-trace,hyperbrep/tessellation']),
('fuzz-consumers',['cargo','check','--offline','--locked','--manifest-path','crates/hyperbrep/fuzz/Cargo.toml','--bins'])]
results=[]
for name,cmd in steps:
 assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items()),'source changed before '+name
 log=Path(prefix+'-'+name+'.log');start=time.time()
 with log.open('w') as f:r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,RUSTDOCFLAGS='-D warnings',CCACHE_DISABLE='1'))
 unchanged=all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
 results.append(dict(name=name,command=cmd,status=r.returncode,seconds=time.time()-start,source_unchanged=unchanged,log=str(log)))
 Path(prefix+'-validation.json').write_text(json.dumps(results,indent=2)+'\n')
 print(name,r.returncode,round(time.time()-start,2),flush=True)
 if not unchanged or r.returncode:raise SystemExit(1)
