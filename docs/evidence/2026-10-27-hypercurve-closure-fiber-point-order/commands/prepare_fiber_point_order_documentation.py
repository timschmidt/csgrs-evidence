from pathlib import Path
import json
checkout=Path('/tmp/hypercurve-closure-fiber-point-order')
p=checkout/'crates/hypercurve/README.md';s=p.read_text();a='  A circle frame adds one dependency level to the point-depth limit.';assert a in s
s=s.replace(a,'''  Correlated point queries reuse the original rational-map and fiber fields for
  oblique linear comparison and circle incidence. When a certified point's
  displacement from a represented circle frame reduces to exact constants, the
  existing half chart inverts those displacements without solving another
  line-circle intersection. The degree-seven/five center witness continues
  through exact point location, subdivision, reversal and replay; general
  nonconstant angular selections still require their own supported chart.
  Transported unit directions are omitted only when reconstruction retains the
  same serialized scalar definitions; value equality alone is insufficient for
  deterministic display projection.
'''+a);p.write_text(s)
p=checkout/'docs/MIGRATIONS.md';s=p.read_text();a='- **Selected-circle graph replay (2026-10-27).**';assert a in s
s=s.replace(a,'''- **Correlated point predicates and frame replay (2026-10-27).** Shared rational
  point-field pullbacks now serve oblique linear comparison and selected-circle
  incidence. A proved constant displacement in a represented circle frame uses
  the existing exact half-chart inverse, preserving signed radius, traversal and
  complementary-half ownership. The original degree-seven/five fiber-center
  midpoint case now continues through splitting and native replay. This does not
  provide general angular inversion in independent selected fields.
  Version 4 uses its existing checked unit-direction record when an ordinary
  endpoint normalization would reconstruct a different scalar definition.
  Readers retain the checked incoming components even if another vector has
  equal values. Reconstructible identical definitions keep their old encoding;
  affected transformed frames may gain an existing tag25 record. Geometry is
  unchanged and no format tag or version is added.

'''+a);p.write_text(s)
p=checkout/'crates/hypercurve/qualification/README.md';s=p.read_text();a='''probe with a correlated degree-seven/five fiber center imports and evaluates its
endpoints, but its exact midpoint query returns `Blocked(Ordering)`; that result
is an implementation gap, not geometric completion or resource exhaustion.''';assert a in s
s=s.replace(a,'''probe with a correlated degree-seven/five fiber center originally imported and
evaluated its endpoints but failed its midpoint query with `Blocked(Ordering)`.
The following common-field witnesses close that retained case; the original
positive failure remains in the evidence record.''')
s+='''

The common-field point witnesses reuse the rational-query source pullback for
oblique linear comparison and selected-circle residuals. Their center retains
`2*beta^7-1=0` with `3/4<beta<1` and the correlated fiber
`gamma^5+beta-2=0` with `1<gamma<2`. The independently defined displacement
`(3/5,4/5)` is exactly on the unit circle. Its midpoint query now continues
through evaluation, subdivision, reversal and a second native archive. Negative
radii, both traversal directions, diameter endpoints, an interior quarter point,
the opposite half and a `2^-80` displacement verify chart selection separately
from support incidence. Negative denominator maps retain their signs, and a
vanishing original denominator remains invalid even with a cancellable quotient.

Algebraic rotation/scaling and reflection retain independent point incidence and
complete SVG determinism. A reflected oblique frame originally lost its compact
rational unit direction during replay; an equal radical expression changed one
display coordinate. The direction record now preserves its checked definition
when the ordinary constructor would rebuild different scalar bytes. Byte
identity controls omission only; exact value predicates still prove validity.
The original comparison, source/cold/warm diagnostic, and older replay corpus
are retained.

A reached zero solver-work budget prevents a completed point query; retries on
the same objects succeed within 512 counted root refinements and zero algebraic
promotions. Strict/approximate/strict requests remain certified when these exact
proofs suffice. These counters do not bound total arithmetic, coefficient growth,
heap use or cancellation. General independent point fields, nonconstant angular
inversion, other circle frames and the complete operation-closure target remain
open; no universal completion or performance claim follows from this corpus.
''';p.write_text(s)
p=checkout/'crates/hypercurve/qualification/capabilities.json';c=json.loads(p.read_text());assert len(c['fixtures'])==181
common={'target':'fiber_point_incidence','owner':'Hypercurve common rational point-field queries, selected-circle chart and retained chord direction evidence','properties':['P15','P18','P19','P20','P27','P29','P30'],'origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial','Line','CircularArc'],'policies':['STRICT'],'timeout_seconds':300,'semantics':'Preserve the jointly selected degree-seven base and degree-five fiber through rational point images. Shared exact predicates precede independent refinement; proved constant circle-frame displacements use the existing half chart. Checked unit definitions remain replay authority. This is finite qualification, not general independent-field or angular closure; external timeout is containment only.'}
rows=[
('fiber_point_radius_control','common_field_rational_queries_certify_the_independent_radius','The existing public rational-query path on a degree-seven/five center translated by (3/5,4/5).',[('incidence_order','exact_success','Shared-field subtraction, squaring and addition prove radius squared exactly one.')],'The rational identity 9/25+16/25=1; this control already passes on the unchanged parent source.'),
('fiber_point_linear_cancellation','oblique_linear_queries_retain_correlated_fiber_cancellation','Two independent rational point images separated by (3/5,4/5), queried along (-4,3), (3,4) and (-3,-4).',[('incidence_order','exact_success','Both operand orders prove exact zero, positive and negative linear differences without separate coordinate-root reconstruction.')],'Independent dot products 0,5,-5; original positive equality fails Ordering on the parent.'),
('fiber_circle_replay','correlated_fiber_circle_midpoint_reenters_native_replay','A chord-normal unit half circle centered at the degree-seven/five fiber point, with a 3-4-5 frame and independently defined midpoint.', [('incidence_order','exact_success','Locate and evaluate the independently defined midpoint and both exact endpoints.'),('restriction_reconstruction','exact_success','Split at the midpoint, reverse both pieces and reassemble the reversed path.'),('exact_replay','exact_success','The original and reconstructed reversed path reimport with exact endpoints and deterministic complete SVG.')],'Independent unit-circle coordinates and endpoint differences; original full positive source is retained separately and rerun unchanged.'),
('fiber_circle_half_selection','correlated_circle_queries_preserve_radius_sign_half_and_exact_separation','Both signed unit radii and both traversal directions, diameter endpoints, quarter and midpoint, center, complementary-half point and a 2^-80 displacement.', [('incidence_order','exact_success','Admit only points on the finite selected half; evaluate every accepted parameter and keep nearby unequal points separate.')],'Independent rational half-circle coordinates, known opposite side and nonzero radius residual.'),
('fiber_circle_similarity','correlated_circle_queries_survive_algebraic_similarity_and_replay','Rotation/scaling and reflection with sqrt(2) coefficients applied to the correlated center and oblique 3-4-5 frame.', [('incidence_order','exact_success','Independently transformed interior point and every endpoint retain exact incidence.'),('exact_replay','exact_success','Checked transported unit definitions preserve complete SVG after cold replay and subsequent query.')],'Exact similarity of the independent circle point; geometric equality and document bytes are separate assertions.'),
('fiber_circle_denominator_guards','common_field_circle_queries_keep_negative_denominators_and_original_poles','A negative-denominator rational translation and a denominator equal to the selected fiber relation.', [('incidence_order','exact_success','The negative-denominator point retains exact perpendicular equality and circle incidence.'),('representation','invalid','The original zero denominator is rejected even when numerator and denominator could cancel.')],'Exact translation and the defining equation gamma^5+beta-2=0 prove the respective nonzero and zero guards.'),
('fiber_circle_budget_retry','correlated_circle_queries_retry_after_counted_exhaustion_without_policy_upgrade','The same retained circle and point under zero work budgets and 512-refinement/zero-promotion retries, then strict/approximate/strict requests.', [('resource_recovery','exhausted','A positive request actually reaches the configured zero work limit before a completed result.'),('resource_recovery','exact_success','Repeated larger retries return one point without cached refusal.'),('incidence_order','exact_success','Every policy sequence reports Certified with exact common-field evidence.')],'Reached counters, independent midpoint and certainty receipts; counts do not bound uninstrumented total work or memory.'),
]
for ident,test,domain,claims,oracle in rows:
 assert 'fn '+test+'(' in (checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()
 row={**common,'id':ident,'test':test,'domain':domain,'claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':oracle}
 if ident=='fiber_circle_budget_retry':row['policies']=['STRICT','APPROXIMATE_512']
 c['fixtures'].append(row)
assert len(c['fixtures'])==188
c['unqualified_targets'][1]='Native save/reload beyond the demonstrated source, parallel, chord, selected-point and chord-normal-circle definitions; general independent angular fields, nonconstant chart inversions, other circle frames and filled-region archives remain open.'
p.write_text(json.dumps(c,indent=2)+'\n')
