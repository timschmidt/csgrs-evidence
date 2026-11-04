import pathlib,subprocess,json,hashlib,time,os
root=pathlib.Path.cwd(); prefix=pathlib.Path('/tmp/hyperbrep-retained-bridges-final')
paths=sorted([p for c in ['hypersolve','hypercurve','hyperbrep','hyperbrep-io'] for d in ['src','tests'] for p in pathlib.Path('crates',c,d).rglob('*.rs')])
source={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
pathlib.Path(str(prefix)+'-source.json').write_text(json.dumps(source,indent=2)+'\n')
base=['cargo','test','--offline','--locked','--all-features']
steps=[
('format',['cargo','fmt','--all','--','--check']),
('clippy',['cargo','clippy','--offline','--locked','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-targets','--all-features','--','-D','warnings']),
('curve-evaluation',base+['-p','hypercurve','--lib','curve_evaluation']),
('curve-line-sections',base+['-p','hypercurve','--lib','polynomial_curve_section']),
('curve',base+['-p','hypercurve']+sum((['--test',s] for s in ['polynomial_point_locations','polynomial_closure_composition','polynomial_boundary_components','polynomial_curve_pairs','polynomial_query_fibers','polynomial_region_admission','selected_point_definitions','work_budget','polynomial_generated_lines','polynomial_rational_sections','polynomial_line_components','polynomial_selected_chords']),[])),
('brep-library',base+['-p','hyperbrep','--lib']),
('brep',base+['-p','hyperbrep']+sum((['--test',s] for s in ['selected_topology','selected_query_archive','selected_planar_images','retained_parameters','tensor_graph_solids','plane_tensor_sections','tensor_face_splits','tensor_image_contacts','tensor_image_validation','section_differentials','coplanar','work_budget']),[])),
('io',base+['-p','hyperbrep-io']),
('open-target',base+['-p','hyperbrep','--test','tensor_graph_solids','nonlinear_tensor_caps_support_transverse_recuts','--','--ignored','--exact','--nocapture']),
('docs',['cargo','doc','--offline','--locked','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-features','--no-deps']),
('wasm',['cargo','build','--offline','--locked','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--lib','--target','wasm32-unknown-unknown','--features','hypercurve/svg,hypercurve/triangulation,hypercurve/hershey,hypercurve/dispatch-trace,hyperbrep/tessellation'])]
results=[]
for name,cmd in steps:
    assert all(hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()==h for p,h in source.items()), 'source changed before '+name
    log=pathlib.Path(str(prefix)+'-'+name+'.log');start=time.time()
    with log.open('w') as f:
        r=subprocess.run(cmd,stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,RUSTDOCFLAGS='-D warnings') if name=='docs' else None)
    unchanged=all(hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()==h for p,h in source.items())
    results.append(dict(name=name,command=cmd,status=r.returncode,seconds=time.time()-start,source_unchanged=unchanged,log=str(log)))
    pathlib.Path(str(prefix)+'-validation.json').write_text(json.dumps(results,indent=2)+'\n')
    print(name,r.returncode,flush=True)
    if not unchanged:raise SystemExit(1)
    if name=='open-target':
        assert r.returncode==101 and 'Topology(Geometry(UnsupportedSelectedEvaluation))' in log.read_text(), 'open target changed: inspect result'
    elif r.returncode:raise SystemExit(r.returncode)
