import json, pathlib, subprocess, time
root=pathlib.Path.cwd()
prefix=pathlib.Path('/tmp/hyperbrep-selected-incidence-final')
base=['cargo','test','--offline','--locked','--all-features']
polynomial=sorted(pathlib.Path('crates/hypercurve/tests').glob('polynomial*.rs'))
steps=[
('format',['cargo','fmt','--all','--','--check']),
('solver',base+['-p','hypersolve','--test','ordered_field_resultants','--test','ordered_field_sturm_reuse','--test','selected_polynomial_fields','--test','selected_polynomial_joins','--test','selected_polynomial_join_retention','--test','selected_polynomial_replay']),
('polynomial',base+['-p','hypercurve']+sum((['--test',p.stem] for p in polynomial),[])),
('polynomial-focused',base+['-p','hypercurve']+sum((['--test',s] for s in ['polynomial_closure_composition','polynomial_curve_pairs','polynomial_boundary_components','polynomial_point_locations','polynomial_selected_chords','polynomial_generated_lines','polynomial_algebraic_lines','polynomial_algebraic_pairs','polynomial_line_components','polynomial_chamfer_corners']),[])),
('selected-curves',base+['-p','hypercurve']+sum((['--test',s] for s in ['selected_point_definitions','selected_coefficient_roots','selected_fiber_images','selected_polynomial_points','selected_query_derivatives','selected_chord_displacements','point_affine_forms','rational_point_forms','joint_form_arithmetic','native_curve_images','retained_bezier_images','parameter_charts','work_budget']),[])),
('chord-units',base+['-p','hypercurve','--lib','algebraic_chord']),
('conversion-units',base+['-p','hypercurve','--lib','conversion_tests','--','--skip','correlated_degree_fifteen_nonsquare_speed_points_project_final_images']),
('map-units',base+['-p','hypercurve','--lib','rational_map']),
('fiber-units',base+['-p','hypercurve','--lib','polynomial_fiber_query']),
('brep',base+['-p','hyperbrep']+sum((['--test',s] for s in ['selected_query_archive','supporting_line_archive','chord_displacement_archive','selected_planar_images','retained_parameters','retained_points','polynomial_replay','selected_topology','tensor_graph_solids','plane_tensor_sections','tensor_face_splits','work_budget']),[])),
('io',base+['-p','hyperbrep-io']),
('clippy',['cargo','clippy','--offline','--locked','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-targets','--all-features','--','-D','warnings']),
('docs',['cargo','doc','--offline','--locked','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-features','--no-deps']),
('wasm',['cargo','build','--offline','--locked','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','hyperbrep-io','--all-features','--lib','--target','wasm32-unknown-unknown'])]
results=[]
for name,cmd in steps:
    if name=='polynomial':
        continue
    log=pathlib.Path(str(prefix)+'-'+name+'.log')
    started=time.time()
    env=None
    if name=='docs':
        import os
        env=dict(os.environ,RUSTDOCFLAGS='-D warnings')
    with log.open('w') as f:
        result=subprocess.run(cmd,cwd=root,stdout=f,stderr=subprocess.STDOUT,env=env)
    results.append(dict(name=name,command=cmd,status=result.returncode,seconds=round(time.time()-started,3),log=str(log)))
    pathlib.Path(str(prefix)+'-validation.json').write_text(json.dumps(results,indent=2)+'\n')
    print(name, result.returncode, flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
