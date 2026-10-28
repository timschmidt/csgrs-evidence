from pathlib import Path
import json
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-rational-point-images')
ready=json.loads((root/'rational-point-images-focused-accepted.json').read_text())
assert ready['focused_passed'] and ready['msrv_passed']
p=checkout/'docs/MIGRATIONS.md';s=p.read_text();marker='- **Selected circle chart derivatives (2026-10-27).**';assert marker in s
s=s.replace(marker,'''- **Rational images of selected rational-curve points (2026-10-27).**
  `CurvePoint2::rational_image` accepts native selected rational-curve point
  images and repeated rational maps. Each immutable image shares its original
  point and keeps the original map and denominator. Exact point queries,
  similarities, line construction and native replay consume those definitions.
  Original poles remain invalid after algebraic cancellation. Native replay
  remains strict inside a provisional scope, and identity and constant queries
  preserve retained qualification. An actually reached work limit is reported
  before a new image is published. Existing point definitions and wire records
  suffice; no new public carrier or format version is required. Other point
  fields and general region/operation closure remain open.

'''+marker,1);p.write_text(s)
p=checkout/'crates/hypercurve/README.md';s=p.read_text();marker='  Point dependencies also retain polynomial fibers, rational maps, exact';assert marker in s
s=s.replace(marker,'''  Selected rational-curve points accept shared rational images and repeated
  maps. Predicates pull queries into their original parameter field and retain
  original denominator guards; independent coordinate projection is optional.
  Checked definitions, similarities and native line replay consume these images.
  Point dependencies also retain polynomial fibers, rational maps, exact''',1);p.write_text(s)
p=checkout/'crates/hypercurve/qualification/README.md';s=p.read_text();s+='''

Rational point images retain the original selected point and one immutable map
per node. Both coordinates share that point; their original denominator is
checked before admission and again before a pulled-back query is consumed.
For a polynomial query of total degree `d`, homogeneous substitution uses the
same `d` in its numerator and denominator. These temporary predicate forms do
not replace the original map graph or authorize cancellation at an original
pole. The existing recursive projective field consumes the same homogeneous
image and proves its denominator orientation. Native rational-point predicates
read the original chart polynomials before optional coordinate materialization.
No additional cache is introduced for the shared map node.

The `rational_point_images` target keeps the original degree-seven positive
witness: a rational parabola point `(a,a²)`, `2*a^7=1`, maps to
`(2*a/(1+a²),(1-a²)/(1+a²))`. An independently authored rational Bernstein circle
supplies its expected point. Checked replay and the inverse map recover the
parabola. Additional cases retain negative denominators, nearby distinct
points, original and downstream removable poles, exact bounds, similarities,
and a generated line whose fresh-process native replay precedes another exact
midpoint split and rational map. Geometric identities and deterministic native
serialization are checked separately.

A source-attributed positive witness requires map construction and independent
point comparison with 4,096 refinements and zero coordinate promotions. Actual
ZERO exhaustion is separately checked both inside the constructor and at the
outer shared-budget boundary; larger retries on the same source must succeed.
Private owner cases cover qualified identity and constant queries, as well as
strict native replay inside a provisional scope. The original unsupported
construction, unnecessary promotion request, incomplete exhaustion propagation,
policy failures and harness compiler failures remain in the evidence record.
These counters do not bound total polynomial arithmetic, coefficient growth,
expression size, retained memory, wall time or cancellation. Other selected
point fields, general region admission, offsets and corner chains remain open;
this corpus is not a proof of universal algebraic operation closure.
''';p.write_text(s)
p=checkout/'crates/hypercurve/qualification/capabilities.json';c=json.loads(p.read_text());assert len(c['fixtures'])==205
common={'target':'rational_point_images','owner':'Hypercurve retained point images, rational query pullbacks and native selected-parameter predicates','properties':['P15','P18','P19','P20','P26','P29'],'origins':['authored','generated'],'families':['RationalBezier','Line'],'policies':['STRICT'],'timeout_seconds':300,'semantics':'Retain the original selected point and map, validate original denominator guards, and consume its rational image through existing point, line and native replay owners. Optional coordinate materialization never replaces the source definition. General point fields and filled-region operation closure remain unqualified.'}
rows=[
('native_scalar_map_query_control','native_scalar_image_rational_query_control','The degree-seven parabola point and independently authored rational Bernstein circle.', [('incidence_order','exact_success','Existing scalar rational queries equal the independently authored circle coordinates.')], 'Independent exact rational parametrization of the unit circle.'),
('native_scalar_map_composition','native_scalar_point_image_replays_and_reenters_another_rational_map','Map(a,a²) to(2a/(1+a²),(1-a²)/(1+a²)) at the positive selected root 2a^7=1.', [('representation','exact_success','The generated point equals the independently authored circle and has zero circle residual.'),('exact_replay','exact_success','Checked replay preserves the map and a further inverse map recovers the original point.')], 'Independent Bernstein circle data, unit-circle relation and rational inverse identity; original positive baseline unchanged.'),
('native_scalar_map_original_pole','native_scalar_point_map_rejects_the_original_pole','A map with the same original numerator/denominator 2a^7-1 at its selected root.', [('representation','invalid','The original 0/0 is rejected as ZeroRationalPointDenominator despite formal cancellation.')], 'The selected defining equation makes the original denominator exactly zero.'),
('native_scalar_map_signed_order','native_scalar_point_images_preserve_negative_denominators_and_order','Negated homogeneous map, independent point shifted by 1/1000000, similarities, enclosures and a downstream zero circle residual used as denominator.', [('incidence_order','exact_success','Both order directions and equal ordinate remain exact, while near-distinct points remain unequal.'),('evaluation','exact_success','All four exact bound comparisons enclose the retained point.'),('exact_replay','exact_success','Checked mapped and transformed point definitions preserve geometry.'),('representation','invalid','A later removable circle-residual pole remains invalid.')], 'Independent rational circle, signed exact translation and original pole equations.'),
('native_scalar_map_cold_replay','native_scalar_point_images_replay_in_a_fresh_process_before_exact_split','A mapped point and its translated counterpart become a line; a fresh process reloads it before another midpoint split and map.', [('exact_replay','exact_success','The fresh process validates both endpoints against independent exact definitions and preserves deterministic serialization.'),('restriction_reconstruction','exact_success','An independent midpoint splits the replayed line and both reconstructed endpoint identities remain exact.')], 'Independent Bernstein circle and exact translation/midpoint identities; fresh process excludes live caches.'),
('native_scalar_map_no_projection','native_scalar_point_map_uses_no_independent_coordinate_promotion','The original map-and-independent-comparison chain with4,096 refinements / 0 promotions.', [('resource_recovery','exact_success','The complete exact point chain consumes no coordinate-promotion attempts.'),('incidence_order','exact_success','The image equals the independent circle point in its original parameter field.')], 'Independent Bernstein data and actual shared work counters; the original positive promotion failure is retained.'),
('native_scalar_map_reached_limit','native_scalar_point_image_does_not_publish_after_reached_exhaustion','A fresh native source enters image construction with ZERO work budget.', [('resource_recovery','exhausted','An actually reached refinement limit produces typed BudgetExhausted before a point is published; the outer budget also reports the reached limit.')], 'Inner typed result and actual reached-work counters, independently asserted.'),
('native_scalar_map_retry','native_scalar_point_images_retry_after_actual_exhaustion','Two fresh sources, each queried with ZERO then4,096 refinements / 0 promotions, followed by strict/approximate/strict requests.', [('resource_recovery','exhausted','The fresh ZERO request reaches its actual configured refinement limit.'),('resource_recovery','exact_success','Larger retries on the same source succeed without coordinate promotion or cached failure.'),('representation','exact_success','An approximate policy request remains Certified when all consumed evidence is exact.')], 'Independent circle equality, actual reached counters and policy receipts; no timeout is counted as exhaustion.'),
]
for ident,test,domain,claims,oracle in rows:
 assert 'fn '+test+'(' in (checkout/'crates/hypercurve/tests/rational_point_images.rs').read_text()
 row={**common,'id':ident,'test':test,'domain':domain,'claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':oracle}
 if ident=='native_scalar_map_retry':row['policies']=['STRICT','APPROXIMATE_512']
 c['fixtures'].append(row)
assert len(c['fixtures'])==213
p.write_text(json.dumps(c,indent=2)+'\n')
print('Updated scope, exact expectations and eight capability fixtures. Full final qualification still required.')
