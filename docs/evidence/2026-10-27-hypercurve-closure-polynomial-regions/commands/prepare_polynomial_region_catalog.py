from pathlib import Path
import json
checkout=Path('/tmp/hypercurve-closure-polynomial-regions')
p=checkout/'crates/hypercurve/qualification/capabilities.json'
catalog=json.loads(p.read_text());assert len(catalog['fixtures'])==91
frontier=next(row for row in catalog['fixtures'] if row['id']=='implicit_frontier')
assert frontier['test']=='polynomial_pair_sections_and_region_blockers'
frontier['test']='polynomial_pair_sections_and_region_admission'
frontier['semantics']='The original disjoint pair retains exact empty incidence. The unchanged H08 parabola boundary now enters the shared filled arrangement; broader implicit-region closure is not implied.'
frontier['claims'][1]={'stage':'region_admission','outcome':'exact_success','assertion':'The unchanged two-branch parabola and vertical-line path has counterclockwise orientation and one three-piece filled boundary.'}
frontier['oracle']='The selected quintic has negative y while the positive parabola has nonnegative y; the original region represents 0<=x<=1/4 and y²<=x, with its two ordered roots and closing line.'
rows=[
('orientation','original_parabola_path_has_exact_loop_orientation','The original H08 parabola cap and its reversed path.','classification','Exact loop orientation reverses from counterclockwise to clockwise.','The traversal of y=-sqrt(x), the vertical cap, and y=+sqrt(x) encloses material on its left.'),
('admission','original_parabola_path_is_admitted_to_the_shared_region','The unchanged H08 cap under NonZero and EvenOdd.','region_admission','Both fill rules publish one boundary with two selected polynomial branches and one line.','The exact region is 0<=x<=1/4 and y²<=x; all original pieces remain.'),
('points','polynomial_region_classifies_native_and_retained_points','Independent native points and evaluated selected points on both parabola branches.','classification','Inside, outside and boundary locations remain exact, including selected branch points.','Independent inequalities 0<=x<=1/4 and y²<=x; exact cap and cusp-axis boundary points.'),
('reconstruction','polynomial_region_boolean_reconstruction_keeps_selected_supports','The cap clipped to 1/16<=x<=1/8, rebuilt with EvenOdd, subtracted from itself and accumulated from empty.','booleans','One four-piece boundary retains both source roots and their exact domains; reconstruction and empty identities compose.','Original defining equation, slab/root identities, exact parameter endpoints, retained line supports and canonical empty results.'),
('path_points','reconstructed_polynomial_path_classifies_native_and_selected_points','A boundary path reconstructed from the polynomial region.','classification','Native inside/outside points and selected branch points classify after reconstruction.','Independent native points and incidence of each retained boundary branch.'),
('holes','polynomial_region_holes_follow_both_fill_rules_and_boolean_operations','A rational rectangle strictly inside the cap, all four Boolean operations, both fill rules and reversed authored boundaries.','booleans','Subtraction/Xor creates a hole with opposite orientation; reversal and reconstruction preserve it; union restores the cap.','The entire hole obeys y²<=1/64<1/16<=x; two loop orientations, independent point roles and set identities.'),
('similarities','polynomial_regions_keep_disconnected_components_under_similarity','Two caps translated three units apart, then quarter-rotated, scaled by three and translated.','transforms','Two material components retain source equations and image transforms; transformed composition and reconstruction agree semantically.','Disjoint source x-intervals, inverse of T(x,y)=(2-3y,-1+3x), exact point roles, four retained branches and Xor identities.'),
('nearby','polynomial_region_regularizes_contact_but_keeps_nearby_distinct_boundaries','A cap sharing only its vertical boundary with a rectangle, and a second rectangle starting exactly 2^-80 inside it.','booleans','The contact-only intersection is empty; the nearby cut retains a positive-width four-piece region.','Exact distinct parameter endpoints, positive width 2^-80, independent interior point and subsequent empty-set composition.'),
('quintic','polynomial_region_boolean_reuses_generic_quintic_trim_and_replay','The strictly increasing graph y=x^5+x²+5x-5 capped at y=3, clipped by y>=0 and then x>=3/4 and x>=7/8.','restriction_reconstruction','The degree-five selected trim survives checked point replay and reconstruction; later cuts below and above the root retain the correct five- and four-piece boundaries.','Independent degree-five root isolation; f(3/4)=-461/1024 and f(7/8)=21415/32768; original equation, exact parameter bounds and selected boundary classification.'),
('authored_trim','polynomial_region_clips_open_authored_curves','An authored horizontal segment from (-1,0) to (1,0), clipped by the polynomial cap.','restriction_reconstruction','The retained segment has exact endpoints (0,0) and (1/4,0).','The intersection of y=0 with 0<=x<=1/4 and y²<=x is independently the closed interval [0,1/4].'),
('generated_trim','polynomial_region_clips_open_generated_curves','Both selected cap branches clipped by a rational rectangle and then consumed by the original polynomial region.','restriction_reconstruction','Open generated curves retain their source roots and [1/16,1/8] domains, including reversed traversal.','Original root identity, exact source-domain endpoints and further closed-set clipping.'),
('circle','polynomial_region_mixed_circular_boolean_retains_original_supports','The cap intersected with the radius-1/2 disk centered at the origin, then reconstructed.','booleans','Two selected polynomial pieces, two circular pieces and one line remain consumable exact boundaries.','Polynomial/circle contacts satisfy x²+x=1/4 with alpha=(sqrt(2)-1)/2; source domains, circle equations, cap x-coordinate and independent filled-set points.'),
('limits','polynomial_region_zero_offset_keeps_sources_and_remaining_gaps_are_typed','The cap at zero offset and attempted nonzero round offset, chord-setback chamfer, circular fillet and finite projection.','offsets','Zero offset retains the original branch supports and exact set.','Source root inventory and symmetric-difference identity; unsupported operations retain their actual public typed outcomes.'),
('retry','polynomial_region_budget_retry_and_policy_transitions_keep_exact_results','A cap/rectangle clip under zero counted work, a larger retry, and STRICT/APPROXIMATE_512/STRICT.','resource_recovery','Actual exhaustion precedes publication; a 100000-refinement/100000-promotion retry succeeds and all policy receipts remain Certified.','Reached limit/used/requested counters, exact topology and symmetric-difference identities.'),
('cusp','polynomial_region_cusp_keeps_one_sided_branch_incidence','The cusp cap 0<=x<=1,y²<=x³, clipped and reconstructed.','booleans','Its singular endpoint remains Boundary; both one-sided source branches survive exact clipping and reconstruction.','Independent cusp equation and point roles; exact [1/4,1/2] source restrictions and retained defining equation.'),
('node','polynomial_region_node_keeps_two_material_lobes_at_shared_vertex','Both material lobes of y²<=x², -1<=x<=1, meeting only at the origin, under both fill rules.','region_admission','The arrangement keeps two material loops at the shared node and preserves them under clipping.','Independent two-lobe inequalities, exact shared origin incidence, point roles and subtraction identity.'),
]
for suffix,test,domain,stage,assertion,oracle in rows:
 claims=[{'stage':stage,'outcome':'exact_success','assertion':assertion}]
 if suffix=='limits':
  claims.extend([
   {'stage':'offsets','outcome':'unsupported','assertion':'The nonzero polynomial-support offset returns Unsupported.'},
   {'stage':'corner_edits','outcome':'unsupported','assertion':'Polynomial-support fillet and chord-setback chamfer return Unsupported without panic or unchanged-input success.'},
   {'stage':'evaluation','outcome':'unsupported','assertion':'The finite projection adapter reports Unsupported; no fitted output replaces the exact source.'}])
 if suffix=='retry':claims.insert(0,{'stage':'booleans','outcome':'exhausted','assertion':'A zero counted allowance is reached and returns BudgetExhausted.'})
 catalog['fixtures'].append({'id':'implicit_region_'+suffix,'target':'polynomial_region_admission','test':test,'owner':'Hypercurve retained polynomial supports and shared CurveRegion2 arrangement','properties':['P12','P13','P15','P17','P18','P19','P20'],'domain':domain,'origins':['authored','selected_implicit','generated'],'families':['ImplicitPolynomial','Line']+(['CircularArc'] if suffix=='circle' else []),'policies':['STRICT','APPROXIMATE_512'] if suffix=='retry' else ['STRICT'],'semantics':'Selected graph slabs retain their source equations, root choices, exact domains and traversal in the existing arrangement. Booleans introduce no new supports; winding and the declared fill rule own material and holes. Complete pair incidence and exact selected-field decisions remain prerequisites. General coefficient fields, rational image preimages, nonzero offsets/corners and fresh-process native replay remain open. Counted work and external timeouts are not total arithmetic or memory bounds.','claims':claims,'oracle':oracle,'timeout_seconds':300})
assert len(catalog['fixtures'])==107
p.write_text(json.dumps(catalog,indent=2)+'\n')
p=checkout/'crates/hypercurve/qualification/README.md';s=p.read_text()
s=s.replace('In particular, the\npolynomial frontier test retains a filled-region implementation gap alongside\nthe original disjoint pair\'s completed incidence. Authored SVG','The polynomial frontier test now preserves both the original disjoint pair\nand the unchanged H08 boundary as positive incidence/admission witnesses.\nAuthored SVG')
s=s.replace('Different image transforms, broader coefficient domains and filled polynomial\nregions remain unqualified or explicitly blocked. Point-definition replay','Those pair witnesses do not qualify different image transforms, broader\ncoefficient domains or filled polynomial regions. Point-definition replay')
marker="The driver obtains executables from Cargo's artifact messages";assert marker in s
text='''Selected polynomial region witnesses now retain graph supports in the shared
arrangement. They qualify the original H08 cap, native and selected point
classification, all four Booleans, holes, disconnected components, reversal,
similarity transport, exact contact-only empty results, `2^-80` separation,
degree-five trims, open-curve clipping, mixed circular boundaries, cusp and node
incidence, and output reconstruction followed by further operations. Independent
equations and source/root/domain assertions accompany topology and set identities.
Zero offset succeeds; nonzero offsets, corner edits and finite projection retain
explicit implementation gaps. Reached exhaustion, larger retry and certainty
transitions are separate claims. This does not establish the entire algebraic
region domain, total resource bounds or fresh-process native replay.

'''
s=s.replace(marker,text+marker,1);p.write_text(s)
print('Promoted the original H08 witness and added 16 region witnesses; total 107.')
