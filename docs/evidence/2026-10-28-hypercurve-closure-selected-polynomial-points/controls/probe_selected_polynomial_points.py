from pathlib import Path
import argparse,os,subprocess,json,time,sys,importlib.util,signal
sys.dont_write_bytecode=True
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-polynomial-points'
p=argparse.ArgumentParser();p.add_argument('--attempt',required=True);p.add_argument('--case',action='append');args=p.parse_args()
record=c/('selected-polynomial-points-'+args.attempt);record.mkdir()
spec=importlib.util.spec_from_file_location('e',w/'scripts/successive-operations.py');e=importlib.util.module_from_spec(spec);spec.loader.exec_module(e)
before,files,patch=e.source_snapshot();e.save_json(record/'source-before.json',before);e.save_json(record/'files-before.json',files);(record/'candidate.patch').write_bytes(patch);(record/'driver.py').write_bytes(Path(__file__).read_bytes())
target=r.parent/'hypercurve-selected-circle-points-admission'
env={**os.environ,'CARGO_TARGET_DIR':str(target),'CARGO_BUILD_JOBS':'2','RUSTUP_TOOLCHAIN':'1.98.1','RUST_TEST_THREADS':'1'}
rows=[]
def run(name,command,timeout,extra_env=None):
 start=time.time()
 with (record/(name+'.log')).open('w') as out:
  process=subprocess.Popen(command,cwd=w,env={**env,**(extra_env or {})},stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
  e.save_json(record/'active.json',{'name':name,'pid':process.pid,'command':command,'epoch':start})
  try:code=process.wait(timeout=timeout)
  except subprocess.TimeoutExpired:
   os.killpg(process.pid,signal.SIGKILL);process.wait();code='external_timeout'
 after,af,_=e.source_snapshot();row={'name':name,'command':command,'exit_code':code,'elapsed_seconds':time.time()-start,'external_timeout_seconds':timeout,'source_stable':before==after};rows.append(row);e.save_json(record/'results.json',rows);e.save_json(record/'source-after.json',after);e.save_json(record/'files-after.json',af);print(row,flush=True);assert before==after
 return code
if args.attempt not in ['fix1','fix2','fix3','fix4','fix5','fix6','fix7']:
 if run('msrv-preflight',['cargo','+1.95.0','clippy','--locked','--release','-p','hypersolve','-p','hypercurve','-p','hyperbrep','-p','csgrs','--all-targets','--all-features','--','-D','warnings'],1800,{'CARGO_TARGET_DIR':str(target)+'-msrv'})!=0:sys.exit(1)
if args.attempt != 'fix1':
 if run('solver-joins',['cargo','test','--locked','--release','-p','hypersolve','--test','selected_polynomial_join_retention','--test','selected_polynomial_joins','--test','selected_polynomial_replay'],1800)!=0:sys.exit(1)
command=['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','selected_polynomial_points','--no-run','--message-format=json']
if run('compile',command,3600)!=0:sys.exit(1)
artifacts=[]
for row in (record/'compile.log').read_text().splitlines():
 try:artifacts.append(json.loads(row))
 except json.JSONDecodeError:pass
binary=next(row['executable'] for row in artifacts if row.get('reason')=='compiler-artifact' and row['target']['name']=='selected_polynomial_points' and row.get('executable'))
cases=args.case or ['independent_polynomial_point_sources_satisfy_original_equations','independent_polynomial_point_queries_compose_and_replay','independent_polynomial_point_zero_divisor_stays_invalid','independent_equal_selections_and_original_denominators_compose','selected_query_parameters_feed_affine_and_rational_evaluation','mixed_algebraic_base_and_independent_fiber_keep_original_relations','joint_query_replay_rejects_a_zero_original_guard','independent_query_budget_refusal_does_not_poison_retry','joint_point_native_replay_in_fresh_process_then_further_queries','joint_queries_keep_certainty_across_policy_transitions_and_transforms','selected_query_restriction_reconstruction_and_native_replay','nearby_polynomial_queries_remain_distinct_after_join_and_replay']
for name in cases:run(name,[binary,name,'--exact','--nocapture'],300)
if args.attempt != 'fix1':
 run('finite-query-projection',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','finite_projection::tests::selected_query_projection_keeps_enclosures_and_budget_failure','--','--exact'],1800)
 run('native-point-predecessors',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','svg_point_replay','--test','rational_point_forms','--test','point_affine_forms','--test','rational_point_images'],1800)
if args.attempt not in ['fix1','fix2','fix3','fix4','fix5','fix6','fix7']:
 run('brep-query-archive',['cargo','test','--locked','--release','-p','hyperbrep','--all-features','--test','selected_query_archive'],1800)
for name in ['nonlinear_algebraic_endpoint_fillet_uses_complete_incident_domain','nonrepresented_chord_parallel_corner_fillets_without_reintersection']:
 run('native-fillet-'+name,['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','bezier_region::tests::'+name,'--','--exact'],300)
run('native-composed-conic',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','hypercurve_composed_workloads','chamfered_conic_minus_its_fillet_completes','--','--exact'],300)
run('native-selected-quintic',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','polynomial_closure_composition','selected_face_probes_keep_quintic_ordinates_and_policy_receipts','--','--exact'],300)
run('native-generated-lines',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','polynomial_generated_lines'],300)
for name in ['signed_algebraic_gauges_preserve_orientation_order_and_equality','reversed_support_intersections_keep_positive_recursive_weights','cardinal_displacements_retain_the_imported_weight_sign']:
 run('projective-gauge-'+name,['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','bezier_offset::projective_gauge_tests::'+name,'--','--exact'],300)
run('native-selected-source-range',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','curve::curve_subdivision::tests::selected_source_range_regions_close_through_boolean_offset_and_boolean','--','--exact'],300)
for name in ['algebraic_chord_erosion_splits_a_collapsed_neck_exactly','algebraic_chord_material_hole_contact_and_hole_collapse_are_exact']:
 run('native-'+name,['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','hypercurve_curve_region_promotion',name,'--','--exact'],300)
run('native-distinct-fiber-selectors',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','joint_form_arithmetic','different_fiber_selectors_do_not_merge','--','--exact'],300)
e.save_json(record/'complete.json',{'source':before,'all_passed':all(row['exit_code']==0 for row in rows),'groups':len(rows),'settings':{k:env[k] for k in ['CARGO_TARGET_DIR','CARGO_BUILD_JOBS','RUSTUP_TOOLCHAIN','RUST_TEST_THREADS']},'epoch':time.time()})
