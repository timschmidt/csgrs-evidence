from pathlib import Path
import json
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-horizontal-boundaries')
catalog=json.loads((checkout/'crates/hypercurve/qualification/capabilities.json').read_text())
assert len(catalog['fixtures'])==91
cases=[
('boundary_selected_trim','boundary_line_consumes_selected_trims_and_contacts','The original y+2 boundary graph on [-2,2]^2, trimmed at the degree-five root of t^5+t^2+5t-5 and at x=1.',[
('representation','Retain the original topology allocation and polynomial branch through selected restriction and reversal.'),
('evaluation','Evaluate selected points and derivatives in the original source chart.'),
('incidence_order','Locate the selected endpoint and intersect the trimmed graph with x=1; the exact contact is (1,-2).'),
('restriction_reconstruction','Consume the selected trim and its reversal in a later intersection.'),
('exact_replay','Replay the selected point definition in memory; no full native curve archive is claimed.')], 'Original source identity, independently defined ordinate and tangent, exact contact coordinates and unique original parameter.'),
('boundary_distinct_components','both_boundary_lines_distinguish_points_and_overlaps','The two distinct components of y^2-4=0 on the closed boundary of [-2,2]^2.',[
('representation','Keep both ordered components of the original equation.'),
('classification','Each native point (0,+/-2) belongs only to its selected branch.'),
('incidence_order','Retain each exact horizontal overlap and the distinct vertical-line contacts.'),
('restriction_reconstruction','Split into three source-preserving pieces and intersect every reconstructed piece again.')], 'Exact ordinates, separate branch selection, overlap counts and source/domain-preserving reconstruction.'),
('boundary_singular_incidence','boundary_contact_retains_all_incident_branch_endpoints','The two components of y(y-x^2)=0 on [-1,1] by [0,2], sharing a tangency at (0,0).',[
('representation','Retain all four slab branches and the original product equation.'),
('incidence_order','Both incident branches on each side meet only at the original origin and have no interval overlap.'),
('classification','Locate the shared origin on all four branches and their reversals.'),
('exact_replay','Checked point definitions retain the origin on each selected branch.')], 'Four independently expected incident arcs, original equation, exact origin, no common interval between the two components.'),
('boundary_similarity','boundary_graph_similarity_preserves_parameter_and_incidence','The horizontal boundary graph y=-2 under T(x,y)=(2-3y,-1+3x), with reversed traversal and a selected degree-five source parameter.',[
('transforms','The vertical image retains its original source abscissa and traversal.'),
('classification','A transformed selected point locates at the original parameter.'),
('incidence_order','A horizontal cutter has the exact point (8,-1) at source parameter zero.')], 'Independent transformed line equation x=8, exact cutter contact and original parameter equality.'),
('boundary_source_replay','boundary_graph_replays_source_in_fresh_process','Rational equation/domain records for both boundary components of y^2-4=0, decoded in a child process.',[
('exact_replay','Reconstruct checked topology from rational coefficients and bounds without serialized adjacency or live caches; this diagnostic encoding is not a public native Hypercurve format.'),
('incidence_order','The fresh process intersects both reconstructed branches with x=0 and locates the exact points.'),
('restriction_reconstruction','Further selected restrictions preserve evaluable exact endpoints after fresh reconstruction.')], 'Fresh process success includes exact ordinate/parameter assertions, complete contact counts and further selected trimming; serialized byte equality alone is not the oracle.'),
]
for ident,test,domain,claims,oracle in cases:
 catalog['fixtures'].append({'id':ident,'target':'polynomial_boundary_components','test':test,'owner':'Hypersolve closed-fiber topology; Hypercurve selected graph consumers','properties':['P11','P15','P17','P18','P19','P20'],'domain':domain,'origins':['authored','generated'],'families':['ImplicitPolynomial','Line'],'policies':['STRICT'],'semantics':'Original polynomial and closed rectangle remain authoritative. Root ordinals, exact domains and directed source charts are retained. Generic repeated and vertical components remain outside this increment.','claims':[{'stage':stage,'outcome':'exact_success','assertion':assertion} for stage,assertion in claims],'oracle':oracle,'timeout_seconds':300})
assert len(catalog['fixtures'])==96
(root/'horizontal-boundary-prepared-capabilities.json').write_text(json.dumps(catalog,indent=2)+'\n')
print('Prepared catalog only; not applied to frozen checkout')
