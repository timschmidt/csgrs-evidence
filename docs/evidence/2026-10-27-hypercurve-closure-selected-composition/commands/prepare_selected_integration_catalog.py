from pathlib import Path
import copy
import json

root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-selected-integration')
results = json.loads((root / 'selected-integration-prototype7-results.json').read_text())
assert len(results) == 3 and all(row['exit_code'] == 0 and row['source_stable'] for row in results)
path = checkout / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(path.read_text())
assert len(catalog['fixtures']) == 120
template = next(row for row in catalog['fixtures'] if row['id'] == 'implicit_algebraic_image_scale')
cases = [
    ('closed_boundary_region_composition',
     'closed_domain_components_remain_filled_boundaries_after_boolean_reconstruction',
     'The two selected roots of y(y-1)=0 on the closed rectangle [-1,1]x[0,1], with native vertical connectors, both fill rules and both boundary traversals.',
     ['STRICT'],
     [('region_admission', 'exact_success', 'The selected horizontal domain components form one exact rectangular boundary with certified orientation.'),
      ('booleans', 'exact_success', 'Clipping to x in [-1/2,1/2] retains both original polynomial supports with exact root, source and trim identities; subtraction leaves two side components.'),
      ('restriction_reconstruction', 'exact_success', 'Every selected endpoint agrees with independently stated coordinates, checked point replay stays on the boundary, and reconstruction remains consumable.'),
      ('booleans', 'successful_empty', 'Self-difference and the intersection of the side components with the removed middle return canonical empty, which remains a union operand.')],
     'Exact four-edge census: two original selected constant roots and two independently checked vertical segments, precise source interval limits, orientation under reversal, both fill rules and regularized set identities.'),
    ('selected_axis_probe_composition',
     'selected_face_probes_keep_quintic_ordinates_and_policy_receipts',
     'The strip [-1,1]x[alpha,0], where alpha is the unique real root of y^5+5y+5, including generated vertical connectors, clipping, two remaining side components and the quarter-turn image T(x,y)=(3-y,4+x).',
     ['STRICT', 'APPROXIMATE_512'],
     [('classification', 'exact_success', 'The original and checked replayed selected point is outside the side components and on the middle boundary in both coordinate directions.'),
      ('booleans', 'successful_empty', 'The side components intersect the middle in a regularized empty result before and after the quarter turn.'),
      ('restriction_reconstruction', 'exact_success', 'Empty-union reconstruction keeps four boundary pieces, the original quintic equation, selected root and source sharing.'),
      ('transforms', 'exact_success', 'A quarter turn exchanges the available exact coordinate while the other coordinate remains selected; STRICT/APPROXIMATE_512/STRICT receipts remain Certified.')],
     'Strictly positive quintic derivative and p(-1)=-1,p(0)=5 select alpha uniquely; the point satisfies its original polynomial. Source/root assertions, four-piece topology, exact strip separation and the explicitly stated invertible map accompany the set identities.'),
    ('guarded_algebraic_image_composition',
     'guarded_rational_maps_compose_with_algebraic_similarity_sections',
     'The boundary graph y=-2 on [-2,2]^2, a retained identity quotient with guard 3+x, followed by sqrt(2) scaling, sqrt(3) horizontal translation and optional reflection.',
     ['STRICT'],
     [('transforms', 'exact_success', 'The rational map definition and its original denominator guard remain stored with the original equation and the explicit algebraic similarity.'),
      ('incidence_order', 'exact_success', 'Both operand orders and branch traversals retain one transverse contact at (sqrt(3),-2sqrt(2)), source parameter zero, and the independently determined signed crossing.'),
      ('restriction_reconstruction', 'exact_success', 'A common-line overlap splits the original mapped branch into three pieces; a further transverse section has exactly one contact across those pieces.'),
      ('evaluation', 'exact_success', 'Checked in-memory point definitions replay the independently specified algebraic contact.')],
     'Positive original guard 3+x on [-2,2], exact original map equality, explicit algebraic contact coordinates, determinant/traversal/exchange signs, source parameter zero and a three-piece continuation census.'),
]
for identifier, test, domain, policies, claims, oracle in cases:
    row = copy.deepcopy(template)
    row.update({
        'id': identifier, 'target': 'polynomial_closure_composition', 'test': test,
        'owner': 'Hypercurve existing region probes and selected polynomial composition',
        'properties': ['P4', 'P8', 'P9', 'P12', 'P13', 'P15', 'P17', 'P18', 'P19', 'P20'],
        'domain': domain, 'policies': policies,
        'origins': ['authored', 'generated'], 'families': ['ImplicitPolynomial', 'Line'],
        'semantics': 'Retain original source relations, selected roots and image definitions. Exact-coordinate exterior probes supplement existing candidates; complete incidence, transverse crossings and existing winding semantics still decide geometry. Polynomial/chord sections suppress terminals while retaining the caller replay policy. These witnesses are bounded composition cases, not arbitrary algebraic closure or fresh-process native replay.',
        'claims': [{'stage': stage, 'outcome': outcome, 'assertion': assertion} for stage, outcome, assertion in claims],
        'oracle': oracle, 'timeout_seconds': 300,
    })
    assert identifier not in {existing['id'] for existing in catalog['fixtures']}
    catalog['fixtures'].append(row)
assert len(catalog['fixtures']) == 123
path.write_text(json.dumps(catalog, indent=2) + '\n')

path = checkout / 'crates/hypercurve/qualification/README.md'
text = path.read_text()
marker = 'The driver obtains executables from Cargo'
assert marker in text
paragraph = '''The composition witnesses combine the independently qualified polynomial
regions, horizontal domain components and algebraic similarity sections. They
retain the original failing clip/reconstruct/subtract/intersect chain, exact
selected boundary coordinates, a selected quintic ordinate and its quarter-turn
image, plus a guarded rational map followed by an algebraic similarity. Existing
intersection and winding authorities consume exact-coordinate axis probes when
ordinary directions are unavailable. Polynomial/chord sections use the existing
strict-predicate scope with the original replay context. Both fill rules, traversal, source/root/map
identity, overlap continuation and Certified policy receipts are asserted within
the named cases. General algebraic closure, native archive replay and total
resource bounds remain unqualified.

'''
assert paragraph not in text
path.write_text(text.replace(marker, paragraph + marker, 1))

path = checkout / 'crates/hypercurve/FUTURE_WORK.md'
text = path.read_text()
old = '''- **Selected abscissas and broader maps (H06, milestones 2 and 3).** Rational
  similarity pullback and the recorded algebraic native lines are admitted
  above. Selected chord carriers, general algebraic similarities and nonlinear rational images still need
  their own section and source-domain proof; source-x monotonicity is not
  world-x monotonicity. Further pair images and selected coefficient fields
  require their own source-domain and incidence proofs.
'''
new = '''- **Selected abscissas and broader maps (H06, milestones 2 and 3).** Native-line
  sections now consume retained algebraic similarities and checked rational-map
  similarities where the original exact source decisions complete. Their
  composition has a separate witness. General selected chord supports, nonlinear
  rational images, further pair images and selected coefficient fields still
  need their own source-domain and incidence proofs; source-x monotonicity is
  not world-x monotonicity.
'''
assert text.count(old) == 1
path.write_text(text.replace(old, new, 1))
print('Prepared 123 capability witnesses; combined qualification remains pending.')
