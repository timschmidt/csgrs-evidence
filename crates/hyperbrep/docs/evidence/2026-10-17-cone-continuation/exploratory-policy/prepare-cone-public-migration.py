"""Prepare public fixture migrations, retaining original constructor inputs."""
import hashlib
import json
from pathlib import Path

ROOT = Path('/mnt/development/csgrs')
OUT = Path('/tmp/hyperbrep-cone-public-proposals')
OUT.mkdir(exist_ok=True)
records = []


def keep(relative, after):
    before = (ROOT / relative).read_bytes()
    target = OUT / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(after)
    records.append(dict(path=relative, before=hashlib.sha256(before).hexdigest(),
                        after=hashlib.sha256(target.read_bytes()).hexdigest()))


relative = 'crates/hypercurve/tests/support/scalars.rs'
s = (ROOT / relative).read_text()
old = '    &sine * &sine + &cosine * &cosine - Real::one()\n'
assert s.count(old) == 1
s = s.replace(old, '''    let original = &sine * &sine + &cosine * &cosine - Real::one();
    // Preserve the original identity as a newly certified proof case.
    assert_eq!(original.exact_rational_normal_form(), Some(hyperreal::Rational::zero()));
    // Angle addition keeps a separate exact zero outside the current proof frontier.
    (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
''')
keep(relative, s)

relative = 'crates/hyperlimit/tests/real_representations.rs'
s = (ROOT / relative).read_text()
old = '''    assert!(matches!(
        classify_real_sign(&terminal_zero, STRICT),'''
assert s.count(old) == 1
s = s.replace(old, '''    // Preserve the original opaque representation and its newly certified zero.
    for policy in [STRICT, APPROX, STRICT] {
        assert!(matches!(classify_real_sign(&terminal_zero, policy),
            PredicateOutcome::Decided {
                value: Sign::Zero,
                certainty: hyperlimit::Certainty::Exact | hyperlimit::Certainty::Filtered,
                ..
            }));
    }
    // This independent exact angle-addition zero retains terminal-path coverage.
    let terminal_zero = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    assert_eq!(terminal_zero.detailed_facts().symbolic.kind, StructuralKind::ComputableOpaque);
    assert!(matches!(
        classify_real_sign(&terminal_zero, STRICT),''')
keep(relative, s)

relative = 'crates/hypercurve/tests/marching_squares.rs'
s = (ROOT / relative).read_text()
old = '    let unknown = &sine * &sine + &cosine * &cosine - Real::one();\n'
assert s.count(old) == 1
s = s.replace(old, old + '''    // The original boundary sample now has an exact zero proof. Keep the
    // original grid as a certified invalid-boundary check in every policy.
    let mut original_values = vec![Real::one(); 9];
    original_values[0] = unknown;
    let original_grid = MarchingSquaresGrid {
        x: &axis,
        y: &axis,
        values: &original_values,
    };
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = evaluate_under(policy, || marching_squares(&original_grid));
        assert!(matches!(result.certified().unwrap(),
            Err(MarchingSquaresError::BoundaryNotExterior { sample: [0, 0] })));
    }
    // A separate angle-addition zero preserves the unresolved/terminal cases.
    let unknown = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
''')
keep(relative, s)

(OUT / 'proposal.json').write_text(json.dumps(dict(files=records), indent=2)+'\n')
print('prepared', len(records), 'public proposals; no repository tests edited')
