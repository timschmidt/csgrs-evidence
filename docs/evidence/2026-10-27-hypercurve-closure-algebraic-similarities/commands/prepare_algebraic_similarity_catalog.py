from pathlib import Path
import copy
import json

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-algebraic-similarities')
results = json.loads((root / 'algebraic-similarity-prototype1-results.json').read_text())
assert len(results) == 7 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
p = checkout / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(p.read_text())
assert len(catalog['fixtures']) == 91
template = next(row for row in catalog['fixtures'] if row['id'] == 'implicit_algebraic_mapped')
cases = [
    ('scale', 'polynomial_line_sections_consume_algebraic_scale',
     'The selected graph y^5+5y+5-x=0 under uniform sqrt(2) scaling, intersected with the image of x=0, both operand orders and both traversals.',
     [('transforms', 'exact_success', 'The original source equation is retained, the contact source parameter is zero, and the world point satisfies Y^5+20Y+20sqrt(2)-4X=0.'),
      ('incidence_order', 'exact_success', 'There is exactly one transverse contact with determinant/traversal-adjusted sign.'),
      ('restriction_reconstruction', 'exact_success', 'Both split parameter charts evaluate the contact and returned endpoint pieces intersect again without further splitting.'),
      ('evaluation', 'exact_success', 'The checked point definition replays the same contact in memory.')],
     'Independently expanded world quintic, unchanged original equation, exact source abscissa, cross signs and continuation topology.'),
    ('translation', 'polynomial_line_sections_consume_algebraic_translation',
     'The same selected quintic translated by (sqrt(3),sqrt(2)), with both operand orders and all line/branch traversal combinations.',
     [('transforms', 'exact_success', 'The world contact satisfies the independently expanded translated quintic and retains the original source equation and zero abscissa.'),
      ('incidence_order', 'exact_success', 'The complete intersection has one transverse contact and no overlap.'),
      ('restriction_reconstruction', 'exact_success', 'Both contact parameters and checked point replay remain exact; endpoint pieces re-enter intersection.')],
     'Expanded substitution x=X-sqrt(3), y=Y-sqrt(2), source-coordinate control, directed cross signs and exact endpoint reuse.'),
    ('higher_degree', 'polynomial_line_sections_keep_higher_degree_scale_and_reflection',
     'The selected quintic under uniform seventh-root-of-two scaling, with and without reflection, both operand orders and all line/branch traversal combinations.',
     [('transforms', 'exact_success', 'For s=2^(1/7), the image satisfies Y^5+5s^4Y+5s^5-s^4X=0, or the reflected plus-X equation, retaining its original source polynomial.'),
      ('incidence_order', 'exact_success', 'The source abscissa remains zero and reflected transverse signs agree with the determinant.'),
      ('restriction_reconstruction', 'exact_success', 'The returned pieces and checked point definition remain consumable by evaluation and another intersection.')],
     'A degree-seven coefficient rather than a degree restriction on the support; independently homogenized world equations, exact parameters and reflected orientation.'),
    ('oblique', 'polynomial_line_sections_keep_oblique_algebraic_images_and_tangency',
     'The parabola y=x^2 under X=sqrt(2)x-sqrt(3)y, Y=sqrt(3)x+sqrt(2)y, optionally reflected in X, with transverse x=1/2 and tangent y=0 line images.',
     [('transforms', 'exact_success', 'Contacts satisfy the expanded world parabola and independently constructed transformed (1/2,1/4) or (0,0).'),
      ('incidence_order', 'exact_success', 'Complete contact sets distinguish the zero tangent sign from orientation-adjusted transverse signs in both operand orders and branch traversals.'),
      ('restriction_reconstruction', 'exact_success', 'Split pieces intersect again at one retained endpoint without further splitting.')],
     'Expanded 5(-sqrt(3)X+sqrt(2)Y)-(sqrt(2)X+sqrt(3)Y)^2 and its reflected form, explicit rational source points and analytic tangent signs.'),
    ('selected_trims', 'polynomial_line_sections_preserve_selected_trim_boundaries_in_algebraic_images',
     'The selected quintic trimmed to [sqrt(2)/2,4/5], scaled by sqrt(3) and reflected, intersected at its retained first parameter and at an excluded source abscissa.',
     [('incidence_order', 'exact_success', 'Endpoint contacts retain the exact active boundary parameter and selected point in both operand orders and branch traversals.'),
      ('restriction_reconstruction', 'exact_success', 'Endpoint topology splits only the crossing line; in-memory point replay preserves incidence.'),
      ('incidence_order', 'successful_empty', 'The image of x=1/2 is disjoint because its source abscissa lies outside the active trim.')],
     'Closed exact interval membership, structural boundary parameter equality, selected endpoint identity and independent excluded abscissa.'),
    ('components', 'polynomial_line_components_keep_algebraic_image_overlap_and_distinct_neighbors',
     'The negative component of y^2-2 under reflected sqrt(3) scaling, overlapped on source x in [-1/2,1/2] and compared with source lines shifted by +-2^-80.',
     [('incidence_order', 'exact_success', 'Exactly one complete overlap retains the clipped branch and line domains in both operand orders and branch traversals.'),
      ('restriction_reconstruction', 'exact_success', 'The middle branch piece and line piece overlap again without further splitting.'),
      ('incidence_order', 'successful_empty', 'Both nonzero source ordinate shifts remain disjoint after the invertible image.')],
     'Two independently counted source components, selected negative root, exact clipped interval topology and nonzero algebraic image separation.'),
    ('retry', 'polynomial_algebraic_images_retry_after_reached_budget_and_retain_certainty',
     'A sloped selected quintic section after sqrt(2) scaling, with a zero counted allowance, a larger retry, source drop and STRICT/APPROXIMATE_512/STRICT continuation.',
     [('incidence_order', 'exhausted', 'A reached zero work allowance returns public BudgetExhausted, with positive requested work and zero used work.'),
      ('resource_recovery', 'exact_success', 'A 100000-refinement/100000-promotion retry completes with one selected contact.'),
      ('restriction_reconstruction', 'exact_success', 'Retained pieces and checked point replay survive dropping original objects and meet once under every policy, retaining Certified receipts.')],
     'Reached counter receipt, exact public failure category, checked point replay, contact completeness and policy certainty. Counters do not bound total arithmetic or memory.'),
]
for suffix, test, domain, claims, oracle in cases:
    row = copy.deepcopy(template)
    row.update({
        'id': 'implicit_algebraic_image_' + suffix,
        'target': 'polynomial_algebraic_similarities',
        'test': test,
        'owner': 'Hypercurve polynomial similarity pullback and existing exact native-line section authority',
        'domain': domain,
        'semantics': 'The nonsingular similarity is inverted for the query while the source equation, ordered fiber, active parameter domain and original image remain authoritative. Exact scalar and selected-field decisions retain typed failure. These fixtures do not complete general rational images, algebraic coefficient topology, independently transformed polynomial pairs, or native archive replay.',
        'claims': [{'stage': stage, 'outcome': outcome, 'assertion': assertion} for stage, outcome, assertion in claims],
        'oracle': oracle,
    })
    if suffix == 'retry':
        row['policies'] = ['STRICT', 'APPROXIMATE_512']
    catalog['fixtures'].append(row)
assert len(catalog['fixtures']) == 98
p.write_text(json.dumps(catalog, indent=2) + '\n')

p = checkout / 'crates/hypercurve/qualification/README.md'
text = p.read_text()
text = text.replace('chord carriers, broader transform coefficients and general branch pairs still\nneed separate qualification.', 'chord carriers and general branch pairs need their own qualification. Algebraic\nsimilarity coefficients are exercised separately below.')
marker = 'The driver obtains executables from Cargo\'s artifact messages'
assert marker in text
paragraph = '''The algebraic similarity witnesses extend native-line sections to retained
images with quadratic and seventh-root scale/translation coefficients and an
oblique map using both sqrt(2) and sqrt(3). Independently expanded world
equations, original source abscissas, reflection and traversal signs, tangency,
selected trim endpoints, overlap continuation and exact nearby separation are
checked. Reached counted exhaustion remains distinct from a larger successful
retry and Certified policy transitions. These are similarity pullbacks through
the existing section authority; general rational images, different-image
polynomial pairs and fresh-process native archive replay remain unqualified.

'''
p.write_text(text.replace(marker, paragraph + marker, 1))

driver = (root / 'run_polynomial_location_qualification.py').read_text()
driver = driver.replace('/tmp/hypercurve-closure-polynomial-locations', str(checkout))
driver = driver.replace('hypercurve-polynomial-chord-admission', 'hypercurve-algebraic-similarity-admission')
driver = driver.replace('polynomial-location', 'algebraic-similarity')
driver = driver.replace('09ce6777463e0e3464ce628fe038f4cc17bfda90', '5de7f0cb057a8143f87cd4b4b3a3f0875e86f7ec')
(root / 'run_algebraic_similarity_qualification.py').write_text(driver)
print('Prepared 98 capability rows and the separate full 15-command qualification driver.')
