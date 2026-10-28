from pathlib import Path
import json
import sys

root = Path(__file__).resolve().parents[1]
checkout = root / 'selected-circle-corners'
probe = root / 'controls' / sys.argv[1]
rows = json.loads((probe / 'results.json').read_text())
assert len(rows) == 11 and all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
target = checkout / 'crates/hypercurve/tests/fiber_point_incidence.rs'
assert 'fn selected_circle_diameter_chamfer_reconstructs_replays_and_offsets()' not in target.read_text()
source = (probe / 'original.rs').read_text()
old = '            assert!(point.rational_form(polynomial(&[&[1]]), polynomial(&[&[0]])).is_err());'
assert source.count(old) == 1
source = source.replace(old, '''            assert!(matches!(
                point.rational_form(polynomial(&[&[1]]), polynomial(&[&[0]])),
                Err(hypercurve::ExactCurveError::Invalid {
                    cause: hypercurve::CurveError::ZeroRationalPointDenominator, ..
                })
            ));''')
target.write_text(source)

catalog_path = checkout / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(catalog_path.read_text())
assert len(catalog['fixtures']) == 239
domain = ('Joint center C=(beta,gamma), 2*beta^7=1 and gamma^5+beta=2, selected by the original isolators; '
          'unit frame N=(-4/5,3/5), T=(3/5,4/5). ')
rows = []
def add(identifier, test, extra_domain, claims, oracle, policies=None):
    rows.append(dict(id=identifier, target='fiber_point_incidence', test=test,
        owner='Hypercurve retained points, selected-circle contacts and the existing CurveRegion2 arrangement',
        properties=['P12','P14','P15','P17','P18','P19','P20'],
        domain=domain + extra_domain, origins=['authored','generated'],
        families=['Line','CircularArc','RationalBezier'],
        policies=policies or ['STRICT'],
        semantics='Original source, selected halves, finite domains and traversal remain authoritative. No display approximation participates in exact decisions.',
        claims=[dict(stage=stage, outcome=outcome, assertion=assertion) for stage,outcome,assertion in claims],
        oracle=oracle, timeout_seconds=300))

for kind, expected in [
    ('chamfer', 'The circle cut is C-(31/32)N+(sqrt(63)/32)T and line cut C-(3/4)N.'),
    ('constrained_fillet', 'For s=sqrt(1/2), center C-sN+T/4 and contacts C-(4s/3)N+T/3 and C-sN are explicitly constrained.'),
]:
    add('selected_circle_' + kind + '_chain',
        'selected_circle_diameter_' + kind + '_reconstructs_replays_and_offsets',
        'Unit clockwise semicircle closed by its diameter; edit vertex C-N with TrimOnly, chord setbacks or circular radius 1/4. ' + expected,
        [('corner_edits','exact_success','One selected solution has both independently derived contacts and preserves the original outer endpoints.'),
         ('restriction_reconstruction','exact_success','The three retained boundary curves reconstruct one filled component with no holes.'),
         ('classification','exact_success','Both contacts are boundary, the original corner is outside and C+T/4 is inside.'),
         ('exact_replay','exact_success','Native path and filled-region replay are deterministic and semantically equal by empty XOR.'),
         ('repeated_offsets','exact_success','Round dilation by 1/16 followed by erosion by 1/16 completes.'),
         ('booleans','successful_empty','The final restored region XOR the independently checked edited region is empty.')],
        expected + ' Exact point identities, topology roles, membership and regularized-set XOR are separate assertions.')
add('selected_circle_pair_roots',
    'selected_circle_shared_center_pair_contacts_preserve_exact_points_and_cross_signs',
    'Unit supports centered at C and C+T, with opposite selected halves and all four traversal combinations.',
    [('incidence_order','exact_success','Both contacts have exact parameters on both operands and the independently derived transverse sign.'),
     ('exact_replay','exact_success','Every returned contact point definition replays to the same point.')],
    'Contacts C+T/2 +/- sqrt(3)N/2; derivative cross signs change with each traversal reversal.')
add('selected_circle_pair_tangent_gap',
    'selected_circle_shared_center_pair_contacts_keep_tangency_halves_and_separation',
    'Unit supports separated by 2T, (2+2^-80)T or T with the complementary selected half.',
    [('incidence_order','exact_success','One tangent contact at separation two, in both operand orders, with zero tangent cross sign.'),
     ('incidence_order','proved_no_solution','The strictly separated supports and wrong selected halves have no contacts or overlaps.')],
    'The tangent is C+T; exact radius/separation and half selection distinguish the 2^-80 gap.')
add('selected_circle_line_nonincident',
    'selected_circle_shared_center_nonincident_chords_keep_roots_and_clipping',
    'Chord C+T/2+nN for n in [-2,2] or [0,2], with both chord traversals.',
    [('incidence_order','exact_success','Return exactly two or one contacts after finite clipping, with both operand parameters and transverse signs.')],
    'Independent n=+/-sqrt(3)/2 roots, finite interval membership, point definition replay and oriented cross signs.')
add('selected_circle_line_tangent_gap',
    'selected_circle_shared_center_nonincident_chords_keep_tangency_and_small_gaps',
    'Nonincident chord endpoints on C+dT+nN, n in [-2,2], d=1 or 1+2^-80.',
    [('incidence_order','exact_success','At d=1 the unique contact is C+T, with zero tangent cross sign and exact replayable parameters.'),
     ('incidence_order','proved_no_solution','At d=1+2^-80 there are no contacts or overlaps.')],
    'Independent circle-line distance and tangent equations; no tolerance merging.')
add('selected_circle_generated_point_queries',
    'selected_circle_shared_center_generated_endpoint_queries_keep_the_original_field',
    'Both endpoints of circles with signed radius +/-1.',
    [('evaluation','exact_success','Rational coordinate differences from the original center have exact expected signs and singleton bounds.')],
    'Offsets +/-N and unchanged retained point sources; zero-denominator queries are rejected. This control already passed on the qualified parent.')
add('selected_circle_pair_policy_retry',
    'selected_circle_shared_center_contacts_retry_and_keep_certainty',
    'The two-contact translated-circle case under ZERO then 4096 refinements with zero promotions; strict/approximate-requested/strict policies.',
    [('resource_recovery','exact_success','A larger-budget retry returns both fully evaluated and replayable contacts; zero-budget completion or actual exhaustion is distinguished.'),
     ('exact_replay','exact_success','Strict definition replay succeeds after each requested policy and every complete outcome is certified.')],
    'Complete contact/parameter assertions after every successful attempt; actual reached counters for exhausted attempts; no total-work claim.',
    ['STRICT','APPROXIMATE_512'])
add('selected_circle_pair_fresh_replay',
    'selected_circle_shared_center_contact_replays_before_further_intersection',
    'Split a selected semicircle at its upper contact with the translated complementary semicircle.',
    [('restriction_reconstruction','exact_success','The split preserves the independently derived contact endpoint.'),
     ('exact_replay','exact_success','Native replay in a fresh child process is deterministic.'),
     ('incidence_order','exact_success','Both reloaded pieces intersect the other support with complete, evaluable and replayable contacts.')],
    'C+T/2+sqrt(3)N/2 endpoint identity, fresh process, native bytes and further exact incidence checks.')
add('selected_circle_corner_reversal',
    'selected_circle_corner_reversal_preserves_set_and_constraints',
    'Original and reversed diameter corners, both chord-setback chamfer and fully constrained circular fillet.',
    [('booleans','successful_empty','Each reversed edited region XOR its original traversal result is empty.'),
     ('corner_edits','proved_no_solution','Wrong center and wrong contact requests return no candidate.')],
    'Set equality after traversal reversal and explicit impossible center/contact constraints.')
add('selected_corner_offset_queries',
    'selected_corner_offset_queries_retain_mapped_endpoint_domains',
    'Chamfered half disk after round dilation by 1/16.',
    [('classification','exact_success','C+T/4 is inside, C+17T/16 is boundary and C+2T is outside.')],
    'Independent radial expectations; this control already passed before the circle-ray endpoint fix.')
add('selected_circle_rotated_overlap',
    'selected_circle_shared_center_rotated_frames_keep_partial_overlap',
    'Coincident unit-circle supports with quarter-turned normal frames, all four traversal combinations, plus unequal concentric radii.',
    [('incidence_order','exact_success','One partial overlap has correct orientation and included endpoints C+N and C+T; unequal radii have no contacts.'),
     ('restriction_reconstruction','exact_success','Each overlap range restricts its original curve with exact endpoints.'),
     ('exact_replay','exact_success','Each restricted arc replays deterministically with unchanged start and end point identities.')],
    'Independent quarter-circle endpoint identities, overlap orientation and concentric radius separation.')
assert len(rows) == 12
catalog['fixtures'].extend(rows)
catalog['unqualified_targets'][1] = (
    'Native save/reload beyond the demonstrated source and selected generated carriers remains open. '
    'Version 5 preserves the named filled-region chains. The selected-circle corner fixtures now complete '
    'chamfer or constrained fillet, reconstruction, exact replay and round dilation/contraction; named '
    'translated-circle and nonincident-line contacts and rotated overlaps also complete. General independent '
    'angular/coefficient fields, other circle frames and arbitrary implicit regions remain open.')
catalog_path.write_text(json.dumps(catalog, indent=2) + '\n')
print('Integrated 12 public fixtures and capability rows; no qualification claim made.')
