from pathlib import Path
import json
root=Path('.')
p=root/'crates/hypercurve/qualification/capabilities.json';x=json.loads(p.read_text());row=next(r for r in x['fixtures'] if r['id']=='vertical_topology_consumer_boundary');row['test']='whole_vertical_topology_enters_a_complete_native_curve_collection';row['semantics']='Solver vertical intervals retain selected first coordinates and full closed second bounds. Native admission assembles original nonvertical graphs and selected exchanged-chart components with exact reflection, preserving full equations and factor powers.';row['claims'][1]={'stage':'representation','outcome':'exact_success','assertion':'The original x, xy and x(x^2+y^2) inputs publish complete native collections with respectively 1, 4 and 2 branches and no spurious isolated point.'};row['oracle']='Exact retained source, one whole vertical solver component, identical topology replay, independent native component counts and no spurious isolated point. Broader native operation claims have separate fixtures.'
def add(id,test,domain,claims,oracle):
 x['fixtures'].append({'id':id,'target':'polynomial_vertical_components','test':test,'owner':'Hypercurve polynomial chart admission and existing selected-branch consumers','properties':['P15','P17','P18','P19','P20','P35','P39'],'domain':domain,'origins':['authored','generated'],'families':['ImplicitPolynomial','Line'],'policies':['STRICT'],'semantics':'Exact coordinate exchange retains the complete defining polynomial, source domains, selected fibers and defining powers. No fitted curve, materialized algebraic coordinate or trusted replay flag. This fixture is a bounded increment, not general algebraic operation closure.','claims':[{'stage':stage,'outcome':'exact_success','assertion':assertion} for stage,assertion in claims],'oracle':oracle,'timeout_seconds':300})
add('vertical_selected_quintic','selected_quintic_columns_keep_points_jets_and_sections_exact','The cube of x^5+5x+5 in [-2,2]^2, max_axis_degree=16 and otherwise default solver/evaluation controls.',[('evaluation','Point queries satisfy the independently specified quintic relation and exact ordinate.'),('differentials','First and second jets equal (0,1) and (0,0).'),('incidence_order','A horizontal authored line has exactly one certified transverse contact; split output is consumed by another complete line section.'),('restriction_reconstruction','Split branches retain defining exponent three.')],'Strict monotonicity proves one real column; defining relation, ordinate identities, exact jets and independent one-contact census.')
add('vertical_singular_and_boundary','singular_contacts_boundary_columns_and_close_roots_keep_complete_native_sets','Column times node, cusp, crossing or tangential parabola in [-2,2]^2; squared columns on either rectangle boundary; two columns separated by 2^-80.',[('representation','Independent component counts are 6,4,4,6 for the singular cases; boundary columns retain exponent two and close columns remain distinct.'),('incidence_order','Known column points remain incident on both sides of each singular event.'),('evaluation','Every retained endpoint satisfies the original equation; whole-image divisibility certificates retain the defining relation.')],'Independent product equations, graph-piece census, exact column coordinates and distinctness. Does not classify every singular tangent germ.')
add('vertical_region_reconstruction','vertical_charts_reenter_region_arrangement_and_reconstruction','Square bounded by two native selected vertical sides and two authored horizontal lines.',[('region_admission','The mixed exact boundary enters CurveRegion2.'),('classification','Interior, boundary and exterior witnesses agree with the independently specified square.'),('booleans','Reconstruction under EvenOdd has empty symmetric difference; self-difference is empty and union from empty restores the region.'),('restriction_reconstruction','Vertical sides retain exact selected restrictions and reversed traversal.')],'Independent square boundaries, closed path incidence, exact set identities and empty-operand composition; sampled membership is supplementary.')
add('vertical_cold_replay','exchanged_charts_replay_cold_and_compose','The native square plus a reversed, restricted, reflected/scaled/translated repeated quintic column; native SVG source graph.',[('exact_replay','Fresh-process replay reconstructs the selected source and factor power; re-encoding is deterministic.'),('transforms','World points satisfy the transported quintic relation (y+1)^5+80(y+1)+160=0 and x=2t+3.'),('restriction_reconstruction','Replayed curves split with shared endpoint and exponent three; the replayed filled square re-enters classification and Boolean identities.')],'Independent transformed polynomial identity, source multiplicity, exact point forms and region set identities; bytes checked separately.')
add('vertical_resource_retry','admission_exhaustion_and_cancellation_do_not_poison_retry','A pre-certified x=0 topology, zero promotion/refinement budget, pre-cancelled token, and subsequent unrestricted retry.',[('resource_recovery','The new exchanged-chart decomposition declines exactly one promotion against limit zero, propagates cancellation and allows a later successful native admission.')],'Actual BudgetExceeded receipts (kind, requested, used and limit) and successful larger-budget retry; no total-work, heap or cancellation-latency bound.')
p.write_text(json.dumps(x,indent=2)+'\n')
p=root/'crates/hypercurve/FUTURE_WORK.md';s=p.read_text();a=s.index('## Vertical topology consumer boundary (R06, 2026-11-04)');s=s[:a]+'''## Vertical native charts (R06, 2026-11-04)

Whole rational vertical components now enter the existing selected graph carrier
through an exchanged chart and exact reflection. Original nonvertical graphs
use the solver's residual fiber equation and reduced graph support; neither
vertical columns nor residual isolated points on those columns disappear.
Full equations, selected fibers, source rectangles and defining powers remain
available after restriction, reversal, similarities and native SVG/BRep replay.
The [qualification](PERFORMANCE.md#r06-native-vertical-charts-2026-11-04)
records the demonstrated workflows and their limits. The original
`vertical_topology_consumer_boundary` witness is now a positive native census;
separate fixtures cover selected quintics, singular/boundary columns, filled
reconstruction, cold replay and actual resource-denial/retry receipts.

R06/R07 remain in progress. General algebraic coefficient fields and selected
rectangle bounds, complete incidence across distinct polynomial charts,
singular differential germs, implicit offset/corner operations and total
resource contracts remain open. The second complete decomposition can add
avoidable projection events and work; this is not the minimum-cost chart atlas
or a general closure claim. Keep native specializations and original hard
cases while completing these consumers.
''';p.write_text(s)
p=root/'crates/hyperbrep/docs/SUPPORT_MATRIX.md';s=p.read_text();a=s.index('R06 additionally certifies whole vertical intervals');b=s.index('\n`CurveSurfacePoint`',a);s=s[:a]+'''R06 additionally admits rational vertical sections as selected exchanged native
charts. The original vertical tensor-section fixture now completes both
pcurves, whole-image validation, restriction/reversal, native save/reload,
affine transport/revalidation and a further transverse plane cut. A squared
vertical section also reconstructs its defining power in a fresh process.
Hypercurve owns chart pullback and the sufficient polynomial identity proof;
BRep retains its spatial/pcurve correspondence check. See the
[owner qualification](../../hypercurve/PERFORMANCE.md#r06-native-vertical-charts-2026-11-04).
General coefficient fields, complete mixed-chart intersections and trimmed
arrangements remain open.
''' + s[b:];p.write_text(s)
p=root/'docs/research-program.md';s=p.read_text();a=s.index('| R06 |');b=s.index('\n',a);s=s[:a]+'''| R06 | Publish component and multiplicity authority for polynomial topology | in progress; rational vertical topology now enters native exchanged curve charts, selected queries/jets, line sections, named filled reconstruction and cold SVG/BRep replay/recut. Full mixed-chart incidence, algebraic coefficients/bounds, offset/corner closure and total resources remain open. [Qualification](../crates/hypercurve/PERFORMANCE.md#r06-native-vertical-charts-2026-11-04). |'''+s[b:];p.write_text(s)
p=root/'docs/MIGRATIONS.md';s=p.read_text();a=s.index('  `VerticalComponent` error on a whole interval.');b=s.index('- **Stationary straight BRep sweeps.**',a);s=s[:a]+'''  `VerticalComponent` error on a whole interval. Native admission now assembles
  vertical components in exchanged source charts, with exact reflections.
  `curves()` returns the original graph branches followed by exchanged-chart
  components. Each branch's parameter, slab/root indices and topology belong
  to its own chart. Use `graph_branch(slab, root)` to select a branch of a
  collection's original chart; indexing the complete collection by a source
  slab/root pair is insufficient. Native replay validates this distinction.
  `certifies_polynomial_identity` supplies a sufficient whole-image proof
  through retained maps, including these charts; false is not nonincidence.
  The original vertical BRep section now succeeds through native replay and
  recut. Archive/SVG record grammar is unchanged. General mixed-chart incidence
  and implicit operation closure remain open. See the
  [native R06 qualification](../crates/hypercurve/PERFORMANCE.md#r06-native-vertical-charts-2026-11-04).
'''+s[b:];p.write_text(s)
