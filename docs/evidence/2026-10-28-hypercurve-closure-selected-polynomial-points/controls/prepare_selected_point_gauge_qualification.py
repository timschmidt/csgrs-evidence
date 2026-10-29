from pathlib import Path
import ast,json,re,time
r=Path(__file__).resolve().parents[1];c=r/'controls';backup=c/'selected-point-gauges-controls-before';backup.mkdir()
scripts=['run_selected_polynomial_points_qualification.py','close_selected_polynomial_points.py','probe_polynomial_operations_points.py','probe_selected_query_derivative_frontier.py','finalize_selected_polynomial_points.py','probe_selected_polynomial_points.py','run_selected_query_derivatives_qualification.py','close_selected_query_derivatives.py','probe_polynomial_operations_derivatives.py','align_selected_query_derivatives.py','finalize_selected_query_derivatives.py','run_selected_field_root_discovery_qualification.py','qualify_selected_field_root_discovery.py','close_selected_field_root_discovery.py','probe_polynomial_operations_roots.py','align_selected_field_root_discovery.py','finalize_selected_field_root_discovery.py','run_rational_query_guards_qualification.py','close_rational_query_guards.py','probe_polynomial_operations_guards.py','align_rational_query_guards.py','finalize_rational_query_guards.py']
for name in scripts:(backup/name).write_bytes((c/name).read_bytes())
implementation=json.loads((c/'selected-point-gauges-integration.json').read_text())['point_implementation']
for name in scripts:
 p=c/name;s=p.read_text()
 for old,new in [('selected-polynomial-points-fix14','selected-polynomial-points-fix15'),("default='fix14'","default='fix15'"),('selected-query-derivatives-fix9','selected-query-derivatives-fix10'),('selected-query-derivatives-preflight-7','selected-query-derivatives-preflight-8'),('selected-field-root-discovery-fix5','selected-field-root-discovery-fix6'),('selected-field-root-discovery-preflight-4','selected-field-root-discovery-preflight-5'),('selected-point-fillets-query-guards-fix4','selected-point-fillets-query-guards-fix5'),('rational-query-guards-preflight-1','rational-query-guards-preflight-2'),('qualification-final6','qualification-final7'),('closeout-final6','closeout-final7'),("'final6'","'final7'"),('selected-field-root-discovery-qualification-final4','selected-field-root-discovery-qualification-final5'),("NAME + '-qualification-final4'","NAME + '-qualification-final5'"),('rational-query-guards-qualification-final1','rational-query-guards-qualification-final2'),("NAME + '-qualification-final1'","NAME + '-qualification-final2'")]:s=s.replace(old,new)
 if name=='run_rational_query_guards_qualification.py':s=s.replace("'final1'","'final2'")
 if name=='run_selected_polynomial_points_qualification.py':s=s.replace("complete['groups']==23","complete['groups']==30")
 if name=='finalize_selected_polynomial_points.py':
  s=re.sub(r'^IMPLEMENTATION = .*$', 'IMPLEMENTATION = '+repr(set(implementation)),s,flags=re.M)
  s=s.replace("focused['groups'] == 23","focused['groups'] == 30").replace('23-group focused run','30-group focused run')
  s=s.replace("prefixes = [", "prefixes = ['selected-point-regressions-', 'selected-point-gauges-', 'selected-point-predecessors-', 'selected-point-distinct-fiber-', 'selected-point-hole-parent-trace', ",1)
  s=s.replace("for name in ['selected-point-generated-lines-contract.json'", "for name in ['selected-point-regressions-contract.json', 'selected-point-gauges-integration.json', 'integrate_selected_point_gauges.py', 'prepare_selected_point_gauge_qualification.py', 'apply_selected_point_gauge_owner_fix.py', 'probe_selected_point_regressions.py', 'probe_selected_point_gauge_owners.py', 'probe_selected_point_predecessors.py', 'preflight_selected_point_gauges.py', 'probe_distinct_fiber_product.py', 'probe_selected_point_hole_parent_trace.py', 'selected-point-generated-lines-contract.json'")
  needle='Matched compiler/release observations, original interrupted broad runs and stacks are retained; no general speed claim.'
  text='Construction-level projective normalization transports tangent signs through retained-support reversals and preserves signed cardinal imports. The original selected-trim Boolean/offset chain, collapsed-neck and material/hole cases pass with all assertions preserved. Three independent gauge fixtures cover signed weights, reversals and subsequent predicates. The distinct opposite-fiber fixture now requires certified defining relations, distinct sources and replay, with an explicit Unsupported-to-exact capability migration. Failed full suites, direct baseline contradictions and diagnostic attempts remain retained. '
  assert needle in s;s=s.replace(needle,text+needle)
  needle='in the 30-group focused run. Shared scalar, finite and batched chord dispatch'
  s=s.replace(needle,'in the 30-group focused run, together with the three projective-gauge fixtures\nand four reproduced full-suite regressions. Reversed support intersections now\ntransport their tangent sign before positive-weight normalization; cardinal\nimports retain their actual gauge sign. The opposite-fiber capability migration\npreserves the original fixture and requires stronger exact equations, separate\nselectors, policy certainty and replay. Shared scalar, finite and batched chord dispatch')
 if name=='probe_selected_polynomial_points.py':
  needle="e.save_json(record/'complete.json'";assert s.count(needle)==1
  added='''for name in ['signed_algebraic_gauges_preserve_orientation_order_and_equality','reversed_support_intersections_keep_positive_recursive_weights','cardinal_displacements_retain_the_imported_weight_sign']:
 run('projective-gauge-'+name,['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','bezier_offset::projective_gauge_tests::'+name,'--','--exact'],300)
run('native-selected-source-range',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--lib','curve::curve_subdivision::tests::selected_source_range_regions_close_through_boolean_offset_and_boolean','--','--exact'],300)
for name in ['algebraic_chord_erosion_splits_a_collapsed_neck_exactly','algebraic_chord_material_hole_contact_and_hole_collapse_are_exact']:
 run('native-'+name,['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','hypercurve_curve_region_promotion',name,'--','--exact'],300)
run('native-distinct-fiber-selectors',['cargo','test','--locked','--release','-p','hypercurve','--all-features','--test','joint_form_arithmetic','different_fiber_selectors_do_not_merge','--','--exact'],300)
'''
  s=s.replace(needle,added+needle)
 ast.parse(s);p.write_text(s)
# Broad join qualification includes all local and downstream checks, on its own cache.
p=c/'qualify_selected_polynomial_points.py';s=p.read_text().replace("checkout=r/'selected-polynomial-points'","checkout=r/'selected-join-correspondence'").replace('selected-polynomial-points-qualification-','selected-join-correspondence-qualification-').replace('hypercurve-selected-circle-points-admission','hypersolve-selected-join-correspondence-admission')
s=s.replace('Selected polynomial query points, retained scalar parameters, native point/parameter graph replay, certified finite projection and native-base preservation:', 'Selected-field generator correspondence and cold definition replay, including inherited point sign transport:')
s=s.replace('General derivatives, selected polynomial region offsets/corners and complete operation closure remain unqualified;', 'General region and corner operation closure remains unqualified;')
ast.parse(s);(c/'qualify_selected_join_correspondence.py').write_text(s)
p=c/'run_selected_join_correspondence_qualification.py';p.write_text('''from pathlib import Path
import json,subprocess,time
r=Path(__file__).resolve().parents[1];c=r/'controls'
while True:
 focus=c/'selected-join-correspondence-fix5/complete.json';lint=c/'selected-join-correspondence-preflight-4/complete.json'
 if focus.exists():
  f=json.loads(focus.read_text());assert f['all_passed'] and f['groups']==10
 if lint.exists():
  l=json.loads(lint.read_text());assert l['exit_code']==0 and l['source_stable']
 if focus.exists() and lint.exists():
  assert f['source']==l['source'];break
 time.sleep(10)
raise SystemExit(subprocess.run(['python3',str(c/'qualify_selected_join_correspondence.py'),'--attempt','final1'],cwd=r/'selected-join-correspondence').returncode)
''')
for p in [c/'run_selected_join_correspondence_qualification.py']:ast.parse(p.read_text())
print('Prepared fresh qualification controllers; no checks or finalization launched by this script.')
