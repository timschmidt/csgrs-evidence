from pathlib import Path
import json
checkout = Path('/tmp/hypercurve-closure-polynomial-chords')
p = checkout / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(p.read_text())
assert len(catalog['fixtures']) == 46

def claim(stage, assertion, outcome='exact_success'):
    return {'stage': stage, 'outcome': outcome, 'assertion': assertion}

rows = [
('rational', 'generated_rational_line_reuses_polynomial_sections',
 'The monotone quintic y^5+5y+5-x=0 versus x=0 with rational endpoints (0,+-2), through native and generated line carriers.',
 [claim('incidence_order', 'Both operand orders have one contact satisfying the original quintic and x=0.'), claim('restriction_reconstruction', 'Both parameter charts evaluate the contact; returned split pieces meet again once without further subdivision.')],
 'Independent polynomial and line relations, exact contact counts, source evaluations and split/requery topology.'),
('selected_endpoints', 'generated_selected_endpoint_line_reuses_polynomial_sections',
 'The original quintic versus a vertical generated chord whose endpoints retain selected y=+-sqrt(2) fibers with no represented Cartesian coordinates; original endpoint collections are dropped.',
 [claim('representation', 'Selected endpoint points remain unmaterialized when the generated line is constructed.'), claim('incidence_order', 'Both orders produce one selected quintic contact, also checked through an exact native control.'), claim('restriction_reconstruction', 'Both original parameters and the split/requery pieces retain the contact.')],
 'Original quintic and x=0 relations, endpoint representation assertions, independent native control and exact topology counts.'),
('component', 'generated_selected_line_retains_common_component_overlap',
 'The selected negative branch of y^2-2=0 and a generated chord through its retained endpoints, with an exact native algebraic-coordinate control.',
 [claim('incidence_order', 'Both orders produce one common-line overlap and no isolated contacts.'), claim('evaluation', 'Both overlap endpoint correspondences evaluate to the same selected points.'), claim('restriction_reconstruction', 'Topology retains one piece per operand.')],
 'The known constant negative branch, its independently represented native support, endpoint correspondence and exact piece counts.'),
('orientation_replay', 'generated_polynomial_contacts_keep_orientation_and_replay',
 'Cold selected-endpoint quintic/vertical-chord contacts with both traversals reversed independently, both operand orders, and original collections dropped.',
 [claim('incidence_order', 'The one transverse contact has the independently predicted sign under traversal and operand reversal.'), claim('evaluation', 'Checked in-memory point replay satisfies the original equations and is located on the generated line.'), claim('restriction_reconstruction', 'Returned pieces have distinct endpoints.')],
 'Explicit quintic and x=0 equations, reversal-adjusted cross sign, in-memory point replay and nonzero-piece checks.'),
('overlap_restrictions', 'generated_polynomial_overlaps_keep_restrictions_and_reversal',
 'Selected y=-sqrt(2) branch/chord overlaps in both orders and all traversal combinations, clipped with source interval [-3/4,-1/4] and chord points at x=-1/2 and x=0.',
 [claim('incidence_order', 'Overlap orientation matches the two traversals.'), claim('restriction_reconstruction', 'Clipping yields exactly [-1/2,-1/4], cannot be enlarged by a later request, excludes a zero-length overlap, and remains a one-piece overlap after source restriction/requery.'), claim('evaluation', 'Both correspondence endpoints satisfy y^2=2 with negative y.')],
 'Independent interval intersection endpoints, selected sign and polynomial relation, both parameter correspondences and repeated restriction behavior.'),
('distinct_components', 'generated_constant_components_remain_distinct_and_clip_endpoints',
 'Selected constant branches y=+-sqrt(2), disjoint finite subintervals, endpoint-only contact, and a generated parallel shifted by 2^-80.',
 [claim('incidence_order', 'Opposite branches, disjoint subintervals and the tiny translated support remain distinct.', 'successful_empty'), claim('incidence_order', 'Closed adjacent intervals meet at one nontransverse endpoint with zero cross sign.'), claim('restriction_reconstruction', 'The singleton contact retains one piece per operand.')],
 'Exact constant-root selections, interval endpoints, positive dyadic separation and topology counts.'),
('point_location', 'generated_constant_line_point_locations_use_selected_coordinate_evidence',
 'The generated chord from (-1,-sqrt(2)) to (1,-sqrt(2)) and the selected query at x=-1/2, without invoking polynomial-pair intersection.',
 [claim('incidence_order', 'The construction-certified horizontal line consumes exact coordinate equality and locates the interior selected point.'), claim('evaluation', 'The returned chord parameter evaluates to that same point.')],
 'Independent selected Y equality and strict X bounds are checked before the public point-location call.'),
('similarities', 'generated_polynomial_sections_keep_similarity_charts',
 'Selected-endpoint quintic/line contacts and constant-branch overlaps under a quarter rotation/translation, reflection/translation and the oblique scale-five similarity (3x-4y,4x+3y).',
 [claim('transforms', 'Contacts satisfy independently expanded world polynomials and line equations, with determinant-adjusted cross signs.'), claim('restriction_reconstruction', 'Transformed contact splits are consumed by another intersection; reversed constant supports keep a one-piece reversed overlap.'), claim('evaluation', 'Both source parameters evaluate the contact; common-line endpoints satisfy the independently transformed constant-branch equation.')],
 'Explicit substitutions expanded into world quintics and constant-support quadratics, independent affine line equations and determinant signs.'),
('finite_tangency', 'generated_polynomial_sections_clip_finite_contacts_and_tangency',
 'The graph y=x^2 versus generated horizontal finite segments at y=0, 1/4 and -2^-20, including one- and two-root segments and segments excluding all roots.',
 [claim('incidence_order', 'The origin is a tangency, while retained roots at x=+-1/2 are transverse and obey the finite line domain.'), claim('incidence_order', 'Negative ordinates and segments outside both candidate roots give complete empty intersections.', 'successful_empty'), claim('restriction_reconstruction', 'Exact split counts agree with the retained interior contacts.')],
 'The explicit parabola relation, chosen line ordinate, independent contact counts, tangent classification and piece counts.'),
('retry', 'generated_polynomial_sections_retry_and_keep_certainty',
 'The selected-endpoint quintic/vertical chord under zero counted allowance, a 100000-refinement/100000-promotion retry, and STRICT/APPROXIMATE_512/STRICT after original objects are dropped.',
 [claim('incidence_order', 'A reached zero allowance yields the public BudgetExhausted reason.', 'exhausted'), claim('resource_recovery', 'A larger retry completes and its retained endpoint pieces meet again once with Certified certainty under all three policies.'), claim('evaluation', 'In-memory point replay remains on the original quintic and line and can be located by the generated line.'), claim('representation', 'A repeated identical endpoint is rejected as a zero-length generated line.', 'invalid')],
 'Reached work counters, public failure reason, independent defining equations, retained source parameters, certainty receipts and invalid constructor result.'),
]
for suffix, test, domain, claims, oracle in rows:
    catalog['fixtures'].append({
        'id': 'implicit_generated_line_' + suffix, 'target': 'polynomial_generated_lines', 'test': test,
        'owner': 'Hypercurve polynomial sections, retained chord parameters, source-chart correspondences and shared line predicates',
        'properties': ['P15', 'P17', 'P18', 'P19', 'P20'], 'domain': domain,
        'origins': ['authored', 'selected_implicit', 'generated'], 'families': ['Line', 'ImplicitPolynomial'],
        'policies': ['STRICT', 'APPROXIMATE_512'] if suffix == 'retry' else ['STRICT'],
        'semantics': 'The polynomial retains its source-abscissa chart and selected fiber; generated lines retain their endpoint definitions and chord-owned point parameters. Support proofs do not replace finite containment. These are named fixtures, not universal generated-line or region closure. Point-definition replay is in memory; counted work does not bound total arithmetic or memory.',
        'claims': claims, 'oracle': oracle, 'timeout_seconds': 300,
    })
assert len(catalog['fixtures']) == 56
p.write_text(json.dumps(catalog, indent=2) + '\n')
p = checkout / 'crates/hypercurve/qualification/README.md'
s=p.read_text();marker='The driver obtains executables from Cargo\'s artifact messages'
assert marker in s
paragraph='''The generated-line witnesses retain polynomial-fiber endpoints and chord-owned
point parameters. They exercise finite sections, constant selected components,
reversal, repeated overlap clipping, exact nearby separation, tangency, rational
similarities and a reached zero-budget retry. Construction-certified axis
supports also qualify public point location independently of pair dispatch.
The original native-line controls and failing generated inputs remain in the
corpus. General oblique lines with unrelated selected endpoints and broader
coefficient/transform domains remain unqualified. These checks do not complete
polynomial filled regions or fresh-process generated archive replay.

'''
p.write_text(s.replace(marker,paragraph+marker,1))
print('Added ten generated-line capability rows; total 56.')
