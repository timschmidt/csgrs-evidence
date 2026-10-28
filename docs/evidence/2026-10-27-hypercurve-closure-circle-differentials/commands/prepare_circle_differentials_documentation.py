from pathlib import Path
import json
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-circle-differentials')
checks=json.loads((root/'circle-differentials-prototype8-results.json').read_text())
assert len(checks)==5 and all(x['exit_code']==0 and x['source_stable'] for x in checks)
assert json.loads((root/'circle-differentials-msrv-probe5.json').read_text())['exit_code']==0
p=checkout/'crates/hypercurve/README.md';s=p.read_text();old='''  similarities and native replay preserve the shared field. Arbitrary independent
  fields, other circle frames, public selected-circle derivatives and general
  region admission still have implementation gaps.''';assert old in s;s=s.replace(old,'''  similarities and native replay preserve the shared field. Circle derivatives
  in a represented unit frame reuse the rational chart evaluator. Represented
  parameters and incident points in a shared polynomial-point field keep exact
  derivative magnitude and all requested orders; restriction and reversal retain
  the source parameter. Arbitrary independent fields, other frame and point-image
  carriers, and general region admission still have implementation gaps.''');p.write_text(s)
p=checkout/'crates/hypercurve/src/curve.rs';s=p.read_text();old='''    /// limits remain typed blockers.
    pub fn derivatives_at(''';assert old in s;s=s.replace(old,'''    /// limits remain typed blockers. Selected circles with represented unit
    /// frames retain this same source-chart convention. Their represented or
    /// shared polynomial-point parameters return exact coordinate images,
    /// including derivative magnitude, without reconstructing an angular root.
    pub fn derivatives_at(''',1);p.write_text(s)
p=checkout/'crates/hypercurve/src/curve_evaluation.rs';s=p.read_text();old='''    /// chords their constant first derivative. Other carriers and orders
    /// report the unsupported capability rather than a guess.''';assert old in s;s=s.replace(old,'''    /// chords their constant first derivative. Represented circle frames reuse
    /// rational chart derivatives in the original selected point field. Other
    /// carriers and orders report the unsupported capability rather than a guess.''');p.write_text(s)
p=checkout/'docs/MIGRATIONS.md';s=p.read_text();marker='- **Selected circle points as angular authority (2026-10-27).**';assert marker in s;s=s.replace(marker,'''- **Selected circle chart derivatives (2026-10-27).** Public derivative queries
  consume represented angular parameters and incident points in a shared
  polynomial-point field when the circle has a represented unit frame. Exact
  coordinate images preserve magnitude and every requested derivative order.
  The center stays constant in the source chart even when its coordinates and
  the queried parameter share algebraic dependencies. Retained restrictions and
  reversal keep the source parameter; similarities apply their linear part to
  vectors. Inherited frame qualification survives center cancellation. Existing
  point definitions support replay and further line construction without a new
  wire version. Other frame and point-image carriers and general region admission
  remain open; these fixtures do not establish universal operation closure.

'''+marker,1);s=s.replace('''  is unavailable. Public selected-circle derivatives and general filled-region
  admission for correlated centers remain open.''','''  is unavailable. The later differential extension covers represented frames
  and shared polynomial-point images; general filled-region admission for
  correlated centers remains open.''');p.write_text(s)
p=checkout/'crates/hypercurve/qualification/README.md';s=p.read_text();old='''Separate positive probes preserve two open consumers: public derivative
queries report `Blocked(Unsupported)`, and a closed circle assembled from these
pieces reports `Blocked(Unsupported)` at filled-region admission, before its
round-offset chain can run.''';assert old in s;s=s.replace(old,'''On that preceding revision, separate positive probes report
`Blocked(Unsupported)` for public derivatives and for filled-region admission of
a closed circle assembled from these pieces, before its round-offset chain.
The following differential extension resolves the first probe within its stated
frame and point-image domain; region admission remains open.''');s+='''

Selected circle differentials reuse the existing rational Leibniz recurrence,
with the center omitted from the chart being differentiated. For a represented
unit normal `N`, signed radius `r`, and turn `s`, homogeneous controls are
`(r*N,1)`, `(r*s*perp(N),0)`, and `(-r*N,1)`. Original chart polynomials are
differentiated before any selected-field reduction. A retained incident point
supplies its already aligned radial forms `n=(P-C).N` and
`b=s*cross(N,P-C)`. The exact inverse `u=b/(r+n+b)` has a second chart
`u=(r-n)/(r-n+b)` at its excluded endpoint. Original radial denominators and the
chosen inverse denominator are checked before composing derivative images in
the same joint point field. The guarded angular point `(u,0)` is shared by all
derivative maps, preserving the original map chain instead of permanently
expanding the same inverse denominator into each derivative. Neither angular
roots nor coordinate roots are independently materialized. A frame's inherited qualification survives the
mathematical cancellation of its center.

The original degree-seven/five positive first-derivative assertion now succeeds
with exact magnitude. Independent higher-order expectations use the closed
complex formula `z^(k)=2i*k!*(1+i)^(k-1)/(1-(1+i)*u)^(k+1)`, rather than the
implementation's derivative recurrence. Fixtures exercise three orders at
nonconstant selected points, eight orders at both endpoints and the midpoint,
signed radii and turns, restriction and reversal, algebraic similarities,
point-definition replay, and a derivative image used to construct a line whose
native archive is replayed in another process before another exact split.

The retained derivative and an exact vector comparison complete at zero charged
refinements/promotions. Initial test assumptions requiring their exhaustion were
incorrect; both successful zero-budget assertions and the raw failed attempts
are retained. The complete incidence-to-derivative-to-comparison chain reaches
the actual zero limit and succeeds on repeated larger retries. These counters
are not a total arithmetic, expression-growth, memory or cancellation bound.
An unrepresentable requested output count returns a typed implementation blocker;
a reproduced capacity panic is corrected using checked allocation guards shared
with the rational derivative owner. No such blocker counts as completed geometry.

Retained point bounds preserve the same selected roots and rational-map guards.
An initial isolator can straddle a map pole even when the selected point is
finite; local refinement must resolve that enclosure before native display can
consume it. The minimized `1/(beta-4/5)` fixture checks exact endpoint containment
and native replay independently. Curve and path bounds retain one successful
strict enclosure per immutable owner through the existing thread-safe policy
cache. Errors are not retained, so an actually exhausted ZERO request can retry
with 4,096 refinements and no promotions; a later warm ZERO request reuses the
proved enclosure. The entry lives with its owner, has no global retention or
eviction, and a new transformed owner starts with its own cache.
Cardinal coordinate order also reuses the existing shared-field linear predicate
before materializing scalar images. Independent cancelling translations and
signed `2^-80` differences require zero charged promotions/refinements; the same
proof is consumed by affine-form equality and native chord-range replay.
Field alignment removes retained maps and similarities before comparing their
unmapped sources. Those source points already retain both scalar selections and
use the existing comparison path, ensuring normalization makes progress even
when the two selected fibers differ. A distinct-fiber regression preserves equal
base coordinates, strict positive fifth-root order and translated-point identity. This is an
entry-count contract, not a heap-byte or total-work bound.

This corpus demonstrates represented frames with represented or shared
polynomial-point angular authority. Other point-image fields, nonrepresented
frames, filled-region admission, repeated offsets and corner edits remain open.
The finite tests and local rational identities do not establish universal closure,
a uniform practical resource bound or a comparative speedup.
''';p.write_text(s)
p=checkout/'crates/hypercurve/qualification/capabilities.json';c=json.loads(p.read_text());assert len(c['fixtures'])==193
common={'target':'fiber_point_incidence','owner':'Hypercurve rational derivative recurrence, selected-circle source chart and shared point-field images','properties':['P15','P18','P19','P20','P25','P29'],'origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial','Line','CircularArc'],'policies':['STRICT'],'timeout_seconds':300,'semantics':'Differentiate the original center-free circle chart while holding its selected frame fixed. Retain exact magnitude, source-chart parameters, original denominator guards and qualified dependencies. These witnesses cover represented frames with represented or shared polynomial-point angular authority; other field carriers and region operations remain open.'}
rows=[
('selected_circle_exact_differential','selected_circle_point_derivative_keeps_joint_field_and_exact_magnitude','Degree-seven/five correlated center and independently authored circle point at u=beta.', [('differentials','exact_success','The first derivative equals an independently differentiated rational coordinate map, including magnitude.')],'Original positive assertion retained verbatim from the source-attributed Unsupported baseline.'),
('selected_circle_higher_differentials','selected_circle_derivatives_match_independent_complex_formula','Orders1..3 at u=beta/2+1/4 with positive/negative radii and both turns.', [('differentials','exact_success','Every derivative equals the independent complex closed-form expectation.'),('exact_replay','exact_success','Each joint vector image reenters checked point definitions and preserves its exact value.')],'Independent complex Mobius derivative formula, shared beta/gamma defining equations and exact point equality.'),
('selected_circle_endpoint_differentials','selected_circle_scalar_derivatives_keep_chart_endpoints_and_orders','Orders1..8 at zero, one half and one for both radius signs and turns; zero-order and out-of-domain requests.', [('differentials','exact_success','All derivative orders agree with independent complex-form expectations at each chart endpoint and midpoint.'),('evaluation','invalid','Out-of-domain parameters remain errors, including a zero-order request.')],'Independent exact endpoint values and closed-form derivatives, with explicit domain guards.'),
('selected_circle_differential_transport','selected_circle_derivatives_survive_restriction_reversal_and_similarity','Split at beta/2+1/4, reverse retained ranges, then rotate/scale and reflect with sqrt(2) coefficients and translations.', [('differentials','exact_success','Restriction and traversal reversal preserve source-chart derivatives, while similarities apply only their linear part.'),('exact_replay','exact_success','Replayed transformed pieces preserve the independently transformed derivative and deterministic complete archive.')],'Original chart convention and exact independent vector similarity, with translation excluded from vectors.'),
('selected_circle_differential_resource_recovery','selected_circle_derivatives_retry_and_keep_requested_policy_certainty','ZERO retained queries; ZERO and 4096-refinement/zero-promotion complete incidence/derivative/vector-query chains, then strict/approximate/strict.', [('resource_recovery','exact_success','Retained exact derivative and comparison succeed with zero charged work; larger complete-chain retries succeed without poisoning.'),('resource_recovery','exhausted','The complete incidence-to-derivative chain reaches the actual zero configured work limit.'),('differentials','exact_success','Requested approximate policy keeps Certified certainty when strict evidence suffices.')],'Reached counters are separate from successful uncharged exact arithmetic; independent vector sign and certainty receipts.'),
('selected_circle_differential_size_guard','selected_circle_derivative_size_guard','Derivative output count usize::MAX on an otherwise valid selected circle.', [('resource_recovery','unsupported','An unrepresentable output allocation is a typed implementation blocker, never a panic or a false work-budget exhaustion.')],'Checked output count and allocation failure semantics; original capacity panic retained as failed evidence.'),
('selected_circle_differential_cold_replay','selected_circle_derivative_points_replay_before_another_exact_split','The exact derivative point becomes a line endpoint; native export/import into a fresh process precedes another exact midpoint split.', [('differentials','exact_success','The vector image keeps its independent exact expected coordinates.'),('exact_replay','exact_success','A fresh process validates the line endpoints from defining relations and preserves deterministic complete archives.'),('restriction_reconstruction','exact_success','A separately defined midpoint splits the replayed line and both new endpoint identities remain exact.')],'Independent derivative coordinate map, exact translation and midpoint identities; fresh-process reconstruction excludes live caches.'),
('retained_point_local_bounds','retained_rational_point_bounds_refine_original_pole_guards','A retained point (1/(beta-4/5),gamma/(beta-4/5)) with beta initially isolated in [3/4,1], translated to a line endpoint.', [('evaluation','exact_success','Local refinement supplies a conservative exact enclosure despite the initial interval crossing the original map pole.'),('exact_replay','exact_success','The line archive validates defining relations on import and preserves deterministic serialization.')],'Independent exact endpoint comparisons against all four bounds; original nonzero denominator and selected beta/gamma relations.'),
('retained_point_bounds_resource_recovery','retained_point_bounds_retry_after_actual_exhaustion_without_cached_failure','Cold ZERO, retry with4096refinements and0promotions, then warm ZERO bounds on the same immutable curve/path; two fresh paths.', [('resource_recovery','exhausted','The initial query reaches an actual zero refinement limit and returns typed BudgetExhausted.'),('resource_recovery','exact_success','Failed curve/path bounds do not poison a larger-budget retry; a subsequent warm query reuses the exact enclosure with zero charged work.')],'Actual reached-work counters, exact equality of the retained successful enclosure and independent fresh-object retries.'),
('shared_field_cardinal_order','shared_field_coordinate_order_avoids_independent_projection','Two maps of a selected degree7/5 point related by cancelling rational translations, plus signed2^-80coordinate separations, under ZERO work limits.', [('incidence_order','exact_success','Both equal cardinal coordinates and both signed near-distinct comparisons follow the shared point-field relations.'),('resource_recovery','exact_success','Known shared-field coordinate identities and constant differences need no independent scalar promotion or root refinement.')],'Independent cancelling-translation identities and exact signed2^-80differences; actual refinement/promotion counters remain zero.'),
('shared_field_linear_identity','shared_field_linear_identity_zero_work_control','The same independent equal point definitions compared through public affine forms under ZERO work limits.', [('incidence_order','exact_success','The initial equality proof used by affine-form comparison consumes the retained coordinate relation.'),('resource_recovery','exact_success','Both cardinal affine forms compare equal with zero charged refinements/promotions.')],'Independent exact translation cancellation. This attempted baseline control also failed with an actual promotion request and remains a positive regression, not evidence reused from an earlier revision.'),
('shared_field_distinct_fiber_fallback','coordinate_order_keeps_distinct_selected_fiber_fallback','The same selected beta with positive fibers gamma_1^5+beta=2 and gamma_2^5+beta=3, before and after equal rational translations.', [('incidence_order','exact_success','The beta coordinates remain equal and positive fifth-root monotonicity gives strict gamma order in both directions, before and after equal translations; the points remain distinct without recursive source alignment.')],'Shared beta defining relation, gamma_2^5-gamma_1^5=1 and strict monotonicity on the positive branch; original and translated points are checked separately.'),
]
for ident,test,domain,claims,oracle in rows:
 assert 'fn '+test+'(' in (checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()
 row={**common,'id':ident,'test':test,'domain':domain,'claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':oracle}
 if ident=='selected_circle_differential_resource_recovery':row['policies']=['STRICT','APPROXIMATE_512']
 if ident.startswith('shared_field_'):
  row.update(owner='Hypercurve coordinate-order owner and existing shared point-field linear predicates', properties=['P18','P19','P20'], families=['ImplicitPolynomial','Line'], semantics='Consume a retained common-field cardinal linear relation before constructing independent coordinate scalars. Preserve original denominator guards, policy and fallback for unrelated fields.')
 if ident.startswith('retained_point_'):
  row.update(owner='Hypercurve retained point/chord enclosures and immutable curve/path bounds caches', properties=['P18','P19','P20','P29'], families=['ImplicitPolynomial','Line'], semantics='Refine the original selected root/fiber enclosure while preserving rational-map guards. Cache only successful strict bounds, with no independent coordinate materialization or permanent transient failures.')
 c['fixtures'].append(row)
assert len(c['fixtures'])==205
c['unqualified_targets'][1]='Native save/reload beyond demonstrated source, parallel, chord, selected-point and represented-frame circle definitions. General independent angular fields, other circle frames, other differential point-image carriers and region archives remain open. Correlated-center region admission remains a measured Unsupported consumer; its repeated-offset probe stops before offset execution.'
p.write_text(json.dumps(c,indent=2)+'\n')
print('Updated differential scope, independent expectations and explicit remaining gaps; matrix205.')
