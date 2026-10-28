from pathlib import Path
import copy
import json
import subprocess
import time

root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = (root / 'empty-native-replay').resolve()
record = controls / 'empty-native-composition-integrated.json'
assert not record.exists()
rows = json.loads((controls / 'empty-native-composition-fix2/results.json').read_text())
assert len(rows) == 5 and all(row['exit_code'] == 0 and row['source_stable'] for row in rows)
tests = (controls / 'empty-native-composition-tests.rs').read_text()
needle = '''                assert_qualified_empty_successor(result, policy, &format!("Boolean {operation:?}"));'''
assert tests.count(needle) == 1
tests = tests.replace(needle, '''                if policy == PredicatePolicy::APPROXIMATE_512 {
                    let expected_empty = match operation {
                        BooleanOp::Union | BooleanOp::Xor => first.is_empty() && second.is_empty(),
                        BooleanOp::Intersection => true,
                        BooleanOp::Difference => first.is_empty(),
                    };
                    assert_eq!(result.as_unverified().as_ref().unwrap().is_empty(), expected_empty);
                }
''' + needle)
needle = '''                assert_qualified_empty_successor(result, policy, &format!("Boolean {operation:?}"));
            }
        }
    }
}'''
assert tests.count(needle) == 1
tests = tests.replace(needle, '''                assert_qualified_empty_successor(result, policy, &format!("Boolean {operation:?}"));
            }
        }
        // Sharing the unchanged boundary must not mutate the exact operand's receipt.
        assert_eq!(hypercurve::evaluate_under(PredicatePolicy::STRICT, || square.region().regularized_region()).certified().unwrap().unwrap(), *square.region());
    }
}''')
tests += '''
#[test]
fn qualified_empty_boolean_batches_keep_each_result_receipt() {
    let qualified = qualified_empty_region();
    let square = geometry(&[rectangle(-1, -1, 2, 2)]);
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for (first, second) in [(&qualified, square.region()), (square.region(), &qualified), (&qualified, &qualified)] {
            let outcome = hypercurve::evaluate_under(policy, || first.boolean_regions(second));
            if policy == PredicatePolicy::STRICT {
                assert!(matches!(outcome.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
                continue;
            }
            assert_eq!(outcome.certainty(), CurveCertainty::Approximate512Consumed);
            let batch = outcome.into_unverified().unwrap();
            let outputs = [batch.union(), batch.intersection(), batch.difference(), batch.xor()];
            let expected = [first.is_empty() && second.is_empty(), true, first.is_empty(), first.is_empty() && second.is_empty()];
            for (region, empty) in outputs.into_iter().zip(expected) {
                assert_eq!(region.is_empty(), empty);
                assert!(matches!(region.regularized_region(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
                let replay = hypercurve::evaluate_under(policy, || region.regularized_region());
                assert_eq!(replay.certainty(), CurveCertainty::Approximate512Consumed);
                assert!(replay.into_unverified().is_ok());
            }
        }
    }
}
'''
p = checkout / 'crates/hypercurve/tests/svg_region_replay.rs'
text = p.read_text()
assert 'fn qualified_empty_boolean_inputs_and_results_keep_topology_receipt' not in text
p.write_text(text + tests)
p = checkout / 'crates/hypercurve/tests/hypercurve_curve_region_boolean.rs'
text = p.read_text()
needle = '''        assert!(normalized.value.is_empty());
    }
    assert!(construct(&PredicatePolicy::STRICT).is_err());'''
assert text.count(needle) == 1
text = text.replace(needle, '''        assert!(normalized.value.is_empty());
        assert!(crate::support::under(&PredicatePolicy::STRICT, || normalized.value.regularized_region()).is_err());
        let replay = crate::support::under(&PredicatePolicy::APPROXIMATE_512, || normalized.value.regularized_region()).unwrap();
        assert_eq!(replay.certainty, CurveCertainty::Approximate512Consumed);
        assert!(replay.value.is_empty());
    }
    assert!(construct(&PredicatePolicy::STRICT).is_err());''')
p.write_text(text)
p = checkout / 'crates/hypercurve/qualification/capabilities.json'
catalog = json.loads(p.read_text())
base = next(row for row in catalog['fixtures'] if row['id'] == 'empty_region_topology_replay_observes_inherited_approximation')
cases = [
    ('qualified_empty_boolean_inputs_and_results_keep_topology_receipt', 'booleans', 'All four Boolean operations, both operand orders, exact empty and material operands, and an identical qualified operand.', 'Validate both operands before identities; each returned region keeps consumed topology and leaves the exact operand unchanged.'),
    ('qualified_empty_affine_images_keep_topology_receipt', 'restriction_reconstruction', 'Identity, translation, reflection and nonsingular shear of qualified empty topology.', 'Every transform observes admissibility before shortcuts and retains its source topology receipt.'),
    ('qualified_empty_offsets_keep_topology_receipt', 'repeated_offsets', 'Zero, positive and negative round offsets of qualified empty topology.', 'Existing empty offset behavior preserves strict blockers and authorized receipts through repeated replay.'),
    ('qualified_empty_boolean_batches_keep_each_result_receipt', 'booleans', 'Shared four-operation Boolean batches with qualified empty, exact square and identical qualified operands.', 'Each batch result retains the inherited requirement independently of the enclosing outcome; approximate replay cannot make it strict.'),
]
for name, stage, domain, assertion in cases:
    row = copy.deepcopy(base)
    row.update(id=name, test=name, owner='CurveRegion2 topology dependencies and Boolean/affine/offset consumers', domain=domain,
               claims=[{'stage':stage, 'outcome':'qualified_approximation', 'assertion':assertion}, {'stage':stage, 'outcome':'undecided', 'assertion':'STRICT preserves the inherited Predicate blocker before and after authorized consumption.'}],
               oracle='Independent empty/square Boolean expectations, every returned carrier reconsumed under STRICT and APPROXIMATE_512, unchanged exact source, and the separate positive-height symbolic collapse regression.')
    assert not any(other['id'] == name for other in catalog['fixtures'])
    catalog['fixtures'].append(row)
assert len(catalog['fixtures']) == 261
p.write_text(json.dumps(catalog, indent=2) + '\n')
subprocess.run(['cargo', '+1.99.1', 'fmt', '--all'], cwd=checkout, check=True)
record.write_text(json.dumps({'new_composition_tests':4, 'strengthened_positive_height_collapse_regression':True, 'expected_total_hypercurve':2921, 'expected_root':67, 'capability_rows':261, 'all_original_assertions_preserved':True, 'epoch':time.time()}, indent=2) + '\n')
print(record.read_text())
