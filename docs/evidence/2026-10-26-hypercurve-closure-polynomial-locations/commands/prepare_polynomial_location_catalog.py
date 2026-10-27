from pathlib import Path
import json
checkout=Path('/tmp/hypercurve-closure-polynomial-locations')
p=checkout/'crates/hypercurve/qualification/capabilities.json';catalog=json.loads(p.read_text());assert len(catalog['fixtures'])==83
rows=[
('fiber','polynomial_locations_consume_selected_fiber_output','The generic quintic branch y^5+5y+5-x=0 at x=0, reversed and replayed as a checked point definition.','The returned point locates at source x=0 in both traversals.','Selected fiber identity, exact parameter comparison and reevaluation.'),
('native','polynomial_locations_check_native_points_and_closed_trims','The parabola y=x^2, independent native points, an off-support point, an on-support point outside the domain, and the closed trim [-1/2,1/2].','Only the selected closed graph interval admits its incident points.','Independent native parabola coordinates and interval endpoints; off-support and out-of-domain points have zero preimages.'),
('generated','polynomial_locations_consume_generated_rational_contact','A quintic/quadratic contact evaluated independently on C(t)=(t^2,-t), with t^5+t^2+5t-5=0.','The generated rational point and its checked replay locate at the original polynomial parameter.','Original contact parameter, independent rational-source evaluation, and selected point equality.'),
('branches','polynomial_locations_distinguish_ordered_branches_and_nearby_points','Both roots of y^2=x at x=1/2, their common origin, and points at ordinate +-2^-80 off y=x^2.','The other ordered root is absent, the common boundary is retained, and nearby distinct points stay absent.','Exact root ordinal, shared endpoint and independent nonzero rational residuals.'),
('trims','polynomial_locations_keep_selected_boundaries_for_later_operations','The generic quintic restricted from selected X=t^2 to 3/4, then cut at x=2/3 in both traversals.','Location reuses the retained boundary parameter; restricted outputs accept further intersection and its endpoint points locate on both resulting pieces.','Structural boundary-parameter reuse, exact excluded parameter and independently known vertical-cut abscissa.'),
('similarities','polynomial_locations_transport_rational_and_algebraic_similarities','The generic quintic contact under a quarter rotation/translation, reflection and uniform sqrt(2) scaling.','World points satisfying independently expanded equations locate in the unchanged source chart; the original untransformed point is absent.','Expanded quintics, retained source parameter, checked point replay and changed-transform separation.'),
('singular','polynomial_locations_preserve_singular_endpoint_incidence','Cusp y^2=x^3 and node y^2=x^2+x^3 at their shared origin.','Every incident selected branch retains the singular endpoint in both traversals.','Independent origin equation, exact endpoint abscissa and every branch in the decomposed graph.'),
('retry','polynomial_locations_retry_after_counted_exhaustion','An independent retained generic-quintic rational point under zero allowance, larger retry and STRICT/APPROXIMATE_512/STRICT.','A reached zero allowance returns BudgetExhausted; a 100000-refinement/100000-promotion retry locates the point with Certified policy receipts.','Actual reached budget counters, selected parameter equality and certainty receipts.'),
]
for suffix,test,domain,assertion,oracle in rows:
 claims=[{'stage':'incidence_order','outcome':'exact_success','assertion':assertion}]
 if suffix=='retry':
  claims=[{'stage':'incidence_order','outcome':'exhausted','assertion':'Zero counted work is actually reached before publication.'},{'stage':'resource_recovery','outcome':'exact_success','assertion':assertion}]
 catalog['fixtures'].append({'id':'implicit_point_location_'+suffix,'target':'polynomial_point_locations','test':test,'owner':'Hypercurve polynomial branch point incidence and original source chart','properties':['P15','P17','P18','P19','P20'],'domain':domain,'origins':['authored','selected_implicit','generated'],'families':['ImplicitPolynomial','QuadraticBezier'],'policies':['STRICT','APPROXIMATE_512'] if suffix=='retry' else ['STRICT'],'semantics':'An injective graph and its invertible similarity recover at most one original abscissa; closed-domain membership and equality with the selected branch fiber prove incidence. Nonlinear maps and continuous preimages need separate contracts. This does not establish filled-region or fresh-process native replay closure. Counted refinements/promotions and external timeouts do not bound all arithmetic or retained memory.','claims':claims,'oracle':oracle,'timeout_seconds':300})
assert len(catalog['fixtures'])==91
p.write_text(json.dumps(catalog,indent=2)+'\n')
p=checkout/'crates/hypercurve/qualification/README.md';s=p.read_text();marker="The driver obtains executables from Cargo's artifact messages";assert marker in s
text='''Polynomial point-location witnesses consume native and generated points in
selected graph charts and invertible rational/algebraic similarities. They
check exact root selection, closed algebraic trims, shared singular endpoints,
nearby distinct points, changed transforms, output-to-input intersections and
recovery after reached exhaustion. General rational image preimages and filled
polynomial arrangements remain outside this increment. Checked point definitions
here are in-memory replay, not fresh-process native archive qualification.

''';p.write_text(s.replace(marker,text+marker,1))
print('Added eight point-location witnesses; total 91.')
