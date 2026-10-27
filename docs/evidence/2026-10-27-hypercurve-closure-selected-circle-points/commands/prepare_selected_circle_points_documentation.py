from pathlib import Path
import json
checkout=Path('/tmp/hypercurve-closure-selected-circle-points')
p=checkout/'crates/hypercurve/README.md';s=p.read_text();a='''  through exact point location, subdivision, reversal and replay; general
  nonconstant angular selections still require their own supported chart.''';assert a in s
s=s.replace(a,'''  through exact point location, subdivision, reversal and replay. Nonconstant
  incident points in a shared rational/algebraic field now retain the point as
  their angular authority. A represented circle frame orders those points
  without reconstructing an independent angular scalar. Exact cuts, reversal,
  similarities and native replay preserve the shared field. Arbitrary independent
  fields, other circle frames, public selected-circle derivatives and general
  region admission still have implementation gaps.''');p.write_text(s)
p=checkout/'docs/MIGRATIONS.md';s=p.read_text();a='- **Correlated point predicates and frame replay (2026-10-27).**';assert a in s
s=s.replace(a,'''- **Selected circle points as angular authority (2026-10-27).** An exact point
  incident on a selected circle can retain its joint rational/algebraic field
  through point location, restriction, subdivision, reversal and similarities
  when the circle has a represented unit frame and both radial coordinates share
  a query field. Coordinate and angular roots need not be materialized.
  Existing circle incidence and signed half selection still gate admission.
  Native version 4 reuses its checked incident-point record and rebuilds the
  query authority from the point and circle; no new tag or version is added.
  Prior source/contact carriers retain their authority when the field pullback
  is unavailable. Public selected-circle derivatives and general filled-region
  admission for correlated centers remain open.

'''+a);p.write_text(s)
p=checkout/'crates/hypercurve/qualification/README.md';s=p.read_text();a='''heap use or cancellation. General independent point fields, nonconstant angular
inversion, other circle frames and the complete operation-closure target remain
open; no universal completion or performance claim follows from this corpus.''';assert a in s
s=s.replace(a,'''heap use or cancellation. General independent point fields, other circle frames
and the complete operation-closure target remain open. The following extension
covers nonconstant angular selections in a shared field; neither corpus proves
universal completion or a performance advantage.''')
s+='''

Selected circle-point parameters retain an independently defined point and its
original selected base/fiber instead of reconstructing a scalar angle. The
qualification center satisfies `2*beta^7=1` and `gamma^5+beta=2`; the independent
point uses the rational half chart at `u=beta`. For radius `r`, unit normal `N`,
and selected turn, let `n=(P-C).N` and `b=turn*cross(N,P-C)`. On the selected half,
comparison with a represented parameter `v` uses the exact sign of
`r*((1-2*v)*b-2*v*(1-v)*n)`. Two points on that same half are ordered by its strictly
monotone normal coordinate, accounting for the sign of `r`. Interior parameters
exclude diameter endpoints, which retain canonical zero/one ownership.

Both radial coordinates must share a valid field before publication. A prototype
that checked only one projection admitted an older fillet contact whose remaining
angular queries were unsupported; its unchanged fresh-process replay test caught
the error. The complete radial view shares the original immutable source.
Similarities transport both coordinates through their certified linear part.
Native replay reconstructs and checks point/circle incidence and the selected
half; the stored query view and live caches are not serialized proof.

Public fixtures cover independent definitions, cuts separated by `2^-80`, exact
restriction, split/reverse/replay, both signed radii and turns, algebraic rotation
and scaling, reflection, and another split after a fresh process imports the
archive. Private owner tests reject invalid incidence and complementary-half
records and preserve inherited frame and point qualification. Requesting an
approximate policy with strict dependencies does not itself consume approximation.
Actual zero work limits prevent completed queries; retries have 4096 counted
refinements available and zero promotions. These counters do not bound all
arithmetic or retained memory, and no new cancellation contract is claimed.

The close-cut prototype completes within its 300-second fixture envelope, but
ordinary point equality and display projection account for most of its runtime;
angular ordering uses the shared field. This is a cost frontier, not a speedup
claim. Separate positive probes preserve two open consumers: public derivative
queries report `Blocked(Unsupported)`, and a closed circle assembled from these
pieces reports `Blocked(Unsupported)` at filled-region admission, before its
round-offset chain can run. These are implementation gaps, not exact completion,
no-solution proofs, or resource exhaustion. Mixed regions, repeated offsets and
corner edits still require their own completion evidence.
''';p.write_text(s)
p=checkout/'crates/hypercurve/qualification/capabilities.json';c=json.loads(p.read_text());assert len(c['fixtures'])==188
common={'target':'fiber_point_incidence','owner':'Hypercurve selected-circle angular queries and shared point-field predicates; native replay rechecks their definitions','properties':['P15','P18','P19','P20','P26','P27','P29'],'origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial','Line','CircularArc'],'policies':['STRICT'],'timeout_seconds':300,'semantics':'Preserve the selected degree-seven/five point field and represented circle frame. Circle incidence, signed half selection and both radial-coordinate queries precede publication. Retain the point through ordered cuts, traversal, similarities and replay. This does not establish derivative or region closure. External timeout is containment, not a total-work contract.'}
rows=[
('selected_circle_point_angular_authority','nonconstant_angular_point_reenters_selected_circle','Circle center(beta,gamma) with 2*beta^7=1 and gamma^5+beta=2; independent rational half-circle point at u=beta in a 3-4-5 unit frame.', [('incidence_order','exact_success','Prove independent unit radius, select one interior location and evaluate the original joint point.'),('restriction_reconstruction','exact_success','Split at the nonconstant angular point and assemble the reversed pieces.'),('exact_replay','exact_success','Replay the reversed path with deterministic complete SVG and retained exact source definitions.')],'Independent rational circle identity and selected base/fiber relations; the unchanged original positive program fails Unsupported on the parent.'),
('selected_circle_point_close_cuts','selected_circle_points_order_independent_definitions_and_nearby_cuts','Independent points at beta-2^-80, beta, beta+2^-80 on one selected half.', [('incidence_order','exact_success','Order both pairs both ways, prove adjacent points distinct, and equate independently constructed identical points.'),('restriction_reconstruction','exact_success','Restrict between the outside cuts, split at the middle and reverse without merging any points.'),('exact_replay','exact_success','Reimport the reversed tiny arc and prove endpoint identities separately from deterministic SVG.')],'Strict monotonicity of the half-circle chart and exact dyadic separation; point inequality assertions are preserved despite their measured cost.'),
('selected_circle_point_signed_similarity','selected_circle_points_keep_signed_halves_and_similarity_transport','Both signed radii and turns at u=beta/2+1/4; opposite-half and 2^-80-displaced points, then sqrt(2) rotation/scaling and reflection.', [('incidence_order','exact_success','Accept the intended point and reject independent opposite-half and off-support points.'),('restriction_reconstruction','exact_success','Split and transform both pieces while retaining their common selected endpoint.'),('exact_replay','exact_success','Both replayed pieces locate the independently transformed endpoint and reproduce the complete archive.')],'Independent rational circle formula, exact similarity of its point and signed half-chart rules.'),
('selected_circle_point_cold_replay','selected_circle_points_replay_in_a_fresh_process_before_another_split','Reversed pieces split at u=beta, exported to a separate process without live source caches.', [('exact_replay','exact_success','Cold replay proves both copies of the shared endpoint and deterministic SVG.'),('restriction_reconstruction','exact_success','An independent u=beta/2 point splits a replayed piece; its new endpoints reenter another exact archive.')],'Independent base/fiber point definitions and exact endpoint relations; separate processes cannot rely on retained live proof state.'),
('selected_circle_point_budget_retry','selected_circle_point_queries_retry_without_promoting_requested_policy','Zero work limits and retries with 4096 refinements and zero promotions, followed by strict/approximate/strict split and replay.', [('resource_recovery','exhausted','A positive request reaches the actual zero work limit before publishing a completed location.'),('resource_recovery','exact_success','Repeated larger retries locate the same point without poisoned state.'),('exact_replay','exact_success','Every policy request keeps Certified certainty when strict defining relations suffice.')],'Reached counters, independently defined circle point and certainty receipts; counts do not bound total work or memory.'),
]
for ident,test,domain,claims,oracle in rows:
 assert 'fn '+test+'(' in (checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()
 row={**common,'id':ident,'test':test,'domain':domain,'claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':oracle}
 if ident=='selected_circle_point_budget_retry':row['policies']=['STRICT','APPROXIMATE_512']
 c['fixtures'].append(row)
assert len(c['fixtures'])==193
c['unqualified_targets'][1]='Native save/reload beyond demonstrated source, parallel, chord, selected-point and represented-frame circle definitions; general independent angular fields, other circle frames and region archives remain open. Selected-circle public derivatives and correlated-center region admission remain measured Unsupported consumers; the repeated-offset probe stops at that admission.'
p.write_text(json.dumps(c,indent=2)+'\n')
