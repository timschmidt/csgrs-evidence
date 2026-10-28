from pathlib import Path
import importlib.util
import json
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = root / 'qualified-region-queries'
run = controls / 'qualified-region-queries-qualification-query3'
rows = json.loads((run / 'results.json').read_text())
assert rows[-1]['name'] == 'full-suite' and rows[-1]['exit_code'] == 101
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
before, files, patch = e.source_snapshot()
assert before == json.loads((run / 'source-after.json').read_text())
(controls / 'qualified-region-query-migration-before.patch').write_bytes(patch)
p = checkout / 'crates/hypercurve/tests/hypercurve_curve_region_boolean.rs'
s = p.read_text()
old_s = s
cases = {
    'circular_conic_batch_obeys_the_approximate_512_terminal':1,
    'approximate_policy_reports_a_consumed_terminal_instead_of_relabeling_it_exact':2,
    'general_curve_batch_obeys_the_approximate_512_terminal':3,
    'line_general_batch_obeys_the_approximate_512_terminal':2,
    'conic_general_batch_obeys_the_approximate_512_terminal':2,
}
for name, count in cases.items():
    start = s.index('fn ' + name + '(')
    end = s.find('\n#[test]', start)
    if end < 0: end = len(s)
    old = s[start:end]
    assert old.count('assert_location(') == count
    new = old.replace('assert_location(', 'assert_qualified_location(')
    assert new.replace('assert_qualified_location(', 'assert_location(') == old
    s = s[:start] + new + s[end:]
needle = 'fn native_segment_counts('
helper = '''// Approximate construction is still approximate when a later query can
// locally classify its retained boundary. Require the inherited receipt as
// well as every original geometric expectation.
fn assert_qualified_location(region: &CurveRegion2, point: Point2, expected: RegionPointLocation) {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let outcome = crate::support::under(&policy, || region.classify_point(&point.clone().into()));
        if policy == PredicatePolicy::STRICT {
            assert!(matches!(outcome, Err(ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
        } else {
            let outcome = outcome.expect("authorized readback must retain the geometry and its qualification");
            assert_eq!(outcome.certainty, CurveCertainty::Approximate512Consumed);
            assert_eq!(outcome.into_value(), expected);
        }
    }
}

'''
assert s.count(needle) == 1
s = s.replace(needle, helper + needle)
assert s.count('fn assert_location(') == 1
p.write_text(s)
p = checkout / 'crates/hypercurve/tests/hypercurve_curve_region_promotion.rs'
s = p.read_text()
old = '''    assert_eq!(
        decided(
            crate::support::under(&PredicatePolicy::STRICT, || approximate.value.filled_area())
                .unwrap()
        ),
        Some(Real::from(34))
    );'''
new = '''    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let area = crate::support::under(&policy, || approximate.value.filled_area());
        if policy == PredicatePolicy::STRICT {
            assert!(matches!(area, Err(ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
        } else {
            let area = area.expect("authorized area readback must retain its topology receipt");
            assert_eq!(area.certainty, CurveCertainty::Approximate512Consumed);
            assert_eq!(decided(area), Some(Real::from(34)));
        }
    }'''
assert s.count(old) == 1
p.write_text(s.replace(old,new))
p = checkout / 'crates/hypercurve/tests/hypercurve_curve_region_stroke.rs'
s = p.read_text()
old = '''    assert_eq!(
        location(&stroke.value, p(1, 0)),
        RegionPointLocation::Inside
    );'''
new = '''    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let location = crate::support::under(&policy, || stroke.value.classify_point(&p(1, 0).into()));
        if policy == PredicatePolicy::STRICT {
            assert!(matches!(location, Err(ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
        } else {
            let location = location.expect("authorized stroke readback must retain its connectivity receipt");
            assert_eq!(location.certainty, CurveCertainty::Approximate512Consumed);
            assert_eq!(location.into_value(), RegionPointLocation::Inside);
        }
    }'''
assert s.count(old) == 1
p.write_text(s.replace(old,new))
p = checkout / 'docs/MIGRATIONS.md'
s = p.read_text()
needle = '## Exact empty SVG documents\n'
addition = '''## Region query certainty after approximate construction

Geometric queries on `CurveRegion2` retain the policy required by its
normalization. Earlier membership, area, role, bounds and native-view queries
could report a strict result after an explicitly approximate construction had
removed or changed topology. These queries now return
`ExactCurveError::Blocked(Predicate)` under `STRICT` when that inherited
requirement has no strict proof. A cached value or an empty boundary does not
establish fidelity to the original source.

An explicitly authorized `evaluate_under(PredicatePolicy::APPROXIMATE_512, ...)`
readback keeps its `Approximate512Consumed` receipt and the retained geometry's
query value. Callers should keep that receipt through subsequent operations;
obtaining a strict source claim requires a new proof or strict reconstruction
from the original inputs. Exact constructions remain certified even when the
caller requests the approximate policy.

The existing approximate Boolean, miter-option and stroke-connectivity
fixtures retain their inputs, construction policies and geometric expectations.
Their readback assertions now require strict rejection followed by authorized
qualified success, then strict rejection again. The independent positive-height
cap regression prevents treating a disappeared boundary as proof of the source
empty set.

'''
assert s.count(needle)==1 and '## Region query certainty after approximate construction' not in s
p.write_text(s.replace(needle,addition+needle))
subprocess.run(['cargo','+1.99.1','fmt','--all'],cwd=checkout,check=True)
after, new_files, _ = e.source_snapshot()
old_map = {r[0]:r[1:] for r in files}
changed = sorted(r[0] for r in new_files if old_map.get(r[0]) != r[1:])
assert changed == ['crates/hypercurve/tests/hypercurve_curve_region_boolean.rs','crates/hypercurve/tests/hypercurve_curve_region_promotion.rs','crates/hypercurve/tests/hypercurve_curve_region_stroke.rs','docs/MIGRATIONS.md']
e.save_json(controls/'qualified-region-query-migration-applied.json', {
    'before':before,'after':after,'changed_paths':changed,'epoch':time.time(),
    'production_bytes_unchanged':True,
    'migration':'Seven obsolete strict readback expectations on explicitly approximate constructions now require strict Predicate rejection, the same authorized geometric value with Approximate512Consumed, and strict rejection on reentry.',
    'preserved':'Original construction inputs, construction policies, strict modeling blockers, numeric geometry expectations, exact-input helpers and all unrelated tests.',
    'reason':'The strict readback expectations conflict with P9/P19 and the independently positive source cap. This is documented as a certainty/API correction, not credited as exact success of those approximate fixtures.',
})
print(json.dumps(after,sort_keys=True))
