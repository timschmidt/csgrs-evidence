
#[path = "support/selected_polynomial_replay.rs"]
mod codec;

fn discover(
    field: &SelectedPolynomialField,
    polynomial: Vec<SelectedPolynomialValue>,
    lower: &Real,
    upper: &Real,
    steps: usize,
    policy: &TestContext,
) -> hypersolve::OrderedFieldRootIsolationReport {
    let mut context = hypersolve::selected_polynomial_field::SelectedPolynomialContext {
        field: field.clone(),
        policy,
    };
    hypersolve::isolate_ordered_field_polynomial_roots_complete(
        polynomial, lower, upper, steps, &mut context,
    ).unwrap()
}

fn product(
    field: &SelectedPolynomialField,
    first: &[SelectedPolynomialValue],
    second: &[SelectedPolynomialValue],
) -> Vec<SelectedPolynomialValue> {
    let mut result = vec![field.constant(real(0)).unwrap(); first.len() + second.len() - 1];
    for (i, a) in first.iter().enumerate() {
        for (j, b) in second.iter().enumerate() {
            result[i + j] = result[i + j].add(&a.multiply(b).unwrap()).unwrap();
        }
    }
    result
}

#[test]
fn complete_discovery_keeps_original_multiplicities_and_excludes_exact_roots() {
    use hypersolve::OrderedFieldRootIsolationStatus as Status;
    let q = base();
    // -3(t+2)(t-2)^2 t(t^2-2): endpoints, midpoint and two irrational roots.
    let mut polynomial = coefficients(&q, &[-3]);
    for factor in [&[2, 1][..], &[-2, 1], &[-2, 1], &[0, 1], &[-2, 0, 1]] {
        polynomial = product(&q, &polynomial, &coefficients(&q, factor));
    }
    polynomial.extend(coefficients(&q, &[0, 0]));
    let policy = TestContext::strict();
    for steps in [0, 4] {
        let report = discover(&q, polynomial.clone(), &real(-2), &real(2), steps, &policy);
        assert_eq!(report.status, Status::Isolated);
        assert_eq!(report.intervals.len(), 5);
        for (index, root) in report.intervals.iter().enumerate() {
            if let Some(exact) = &root.exact_root {
                assert_eq!(exact, &real(match index { 0 => -2, 2 => 0, 4 => 2, _ => panic!("unexpected exact root") }));
            } else {
                assert!(index == 1 || index == 3);
                assert!(root.lower > real(-2) && root.upper < real(2));
                assert!(root.upper < real(0) || root.lower > real(0));
                let field = decided(q.select(polynomial.clone(), root.lower.clone(), root.upper.clone(), &policy).unwrap());
                // The selection stores the original relation, including t-2's multiplicity.
                assert_eq!(field.defining_polynomial().unwrap().len(), polynomial.len());
                let value = field.generator().unwrap();
                is_zero(&power(&value, 2).subtract(&field.constant(real(2)).unwrap()).unwrap());
                assert_sign(value.sign(&policy), if index == 1 { RealSign::Negative } else { RealSign::Positive });
            }
        }
    }
}

#[test]
fn complete_discovery_resolves_field_degree_drop_and_independent_roots() {
    use hypersolve::OrderedFieldRootIsolationStatus as Status;
    let q = base();
    let parent = select(&q, coefficients(&q, &[-2, 0, 0, 1]), 1, 2);
    let a = parent.generator().unwrap();
    let zero = power(&a, 3).subtract(&parent.constant(real(2)).unwrap()).unwrap();
    let polynomial = vec![a.scale(&real(-1)).unwrap(), parent.constant(real(0)).unwrap(), parent.constant(real(1)).unwrap(), zero];
    for policy in [TestContext::strict(), TestContext::approximate()] {
        let report = discover(&parent, polynomial.clone(), &real(-2), &real(2), 3, &policy);
        assert_eq!(report.status, Status::Isolated);
        assert_eq!(report.intervals.len(), 2);
        let values: Vec<_> = report.intervals.iter().map(|root| {
            let field = decided(parent.select(polynomial.clone(), root.lower.clone(), root.upper.clone(), &policy).unwrap());
            let value = field.generator().unwrap();
            is_zero(&power(&value, 2).subtract(&field.lift(&a).unwrap()).unwrap());
            is_zero(&power(&value, 6).subtract(&field.constant(real(2)).unwrap()).unwrap());
            value
        }).collect();
        let join = decided(values[0].field().joined_with(values[1].field(), &policy).unwrap());
        is_zero(&join.embed(&values[0]).unwrap().add(&join.embed(&values[1]).unwrap()).unwrap());
        assert_eq!(policy.approximations(), 0);
    }
}

#[test]
fn complete_discovery_separates_near_roots_and_refuses_without_partial_success() {
    use hypersolve::OrderedFieldRootIsolationStatus as Status;
    let q = base();
    let small = fraction(1, 1_u64 << 40);
    let small = &small * &small;
    let small = &small * &small;
    let second = real(1) + &small;
    let polynomial = vec![q.constant(second.clone()).unwrap(), q.constant(-(real(1) + &second)).unwrap(), q.constant(real(1)).unwrap()];
    let policy = TestContext::strict();
    let run = || discover(&q, polynomial.clone(), &real(0), &real(2), 0, &policy);
    let expected = run();
    assert_eq!(expected.status, Status::Isolated);
    assert_eq!(expected.intervals.len(), 2);
    assert!(expected.subdivision_steps >= 160);
    for (interval, value) in expected.intervals.iter().zip([real(1), second]) {
        if let Some(root) = &interval.exact_root {
            assert_eq!(root, &value);
        } else {
            assert!(interval.lower <= value && value <= interval.upper);
            let field = decided(q.select(polynomial.clone(), interval.lower.clone(), interval.upper.clone(), &policy).unwrap());
            is_zero(&field.generator().unwrap().subtract(&field.constant(value).unwrap()).unwrap());
        }
    }
    assert!(expected.intervals[0].upper < expected.intervals[1].lower);
    for _ in 0..2 {
        for limit in [0, 1, 8] {
            let refusal = with_budget(WorkBudget { refinements: limit, promotions: 0 }, || {
                let report = run();
                assert_eq!(report.status, Status::BudgetExhausted);
                assert!(report.intervals.is_empty());
                report
            });
            assert_eq!(refusal.result.unwrap_err().kind, WorkKind::RootRefinement);
            assert_eq!(refusal.usage.refinements, limit);
        }
        let retry = with_budget(WorkBudget { refinements: 1024, promotions: 0 }, run);
        assert_eq!(retry.result.unwrap(), expected);
    }
}

#[test]
fn complete_discovery_keeps_zero_rootless_and_invalid_outcomes_distinct() {
    use hypersolve::OrderedFieldRootIsolationStatus as Status;
    let q = base();
    let policy = TestContext::strict();
    for (p, status) in [(vec![], Status::IdenticallyZero), (vec![0, 0], Status::IdenticallyZero), (vec![1], Status::Isolated), (vec![1, 0, 1], Status::Isolated)] {
        let report = discover(&q, coefficients(&q, &p), &real(-2), &real(2), 0, &policy);
        assert_eq!(report.status, status);
        assert!(report.intervals.is_empty());
    }
    for (lower, upper) in [(1, 1), (2, 1)] {
        let report = discover(&q, coefficients(&q, &[-2, 0, 1]), &real(lower), &real(upper), 0, &policy);
        assert_eq!(report.status, Status::InvalidInterval);
        assert!(report.intervals.is_empty());
    }
    let rational = discover(&q, coefficients(&q, &[0, 0, 0, 1]), &real(0), &real(1), 0, &policy);
    assert_eq!(rational.status, Status::Isolated);
    assert_eq!(rational.intervals.len(), 1);
    assert_eq!(rational.intervals[0].exact_root, Some(real(0)));
    let bounded = hypersolve::isolate_ordered_field_polynomial_roots(coefficients(&q, &[4, 0, -4, 0, 1]), &real(1), &real(2), hypersolve::OrderedFieldRootIsolationConfig { max_subdivision_depth: 12, refinement_steps: 0 }, &mut hypersolve::selected_polynomial_field::SelectedPolynomialContext { field: q, policy: &policy }).unwrap();
    assert_eq!(bounded.status, Status::CompleteFallbackRequired);
    assert!(bounded.intervals.is_empty());
}

fn discovered_root(value: &SelectedPolynomialValue, degree: usize) -> SelectedPolynomialValue {
    let parent = value.field();
    let mut equation = vec![parent.constant(real(0)).unwrap(); degree + 1];
    equation[0] = value.scale(&real(-1)).unwrap();
    equation[degree] = parent.constant(real(1)).unwrap();
    let policy = TestContext::strict();
    let report = discover(parent, equation.clone(), &real(1), &real(2), 0, &policy);
    assert_eq!(report.status, hypersolve::OrderedFieldRootIsolationStatus::Isolated);
    assert_eq!(report.intervals.len(), 1);
    let interval = &report.intervals[0];
    decided(parent.select(equation, interval.lower.clone(), interval.upper.clone(), &policy).unwrap()).generator().unwrap()
}

#[test]
fn discovered_roots_replay_in_a_fresh_process_and_feed_further_discovery() {
    use hypersolve::selected_polynomial_field::SelectedPolynomialDefinition;
    let q = base();
    let a = discovered_root(&q.constant(real(2)).unwrap(), 3);
    let b = discovered_root(&a, 7);
    is_zero(&power(&b, 21).subtract(&b.field().constant(real(2)).unwrap()).unwrap());
    let graph = SelectedPolynomialDefinition::from_values(&[a, b], 10000).unwrap();
    let wire = codec::encode(&graph);
    assert_eq!(codec::encode(&codec::decode(&wire)), wire);
    let path = std::env::temp_dir().join(format!("hypersolve-root-discovery-{}-{}.json", std::process::id(), std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos()));
    std::fs::write(&path, wire).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap()).args(["--exact", "discovered_root_replay_child", "--nocapture"]).env("HYPERSOLVE_ROOT_DISCOVERY_REPLAY", &path).output();
    std::fs::remove_file(path).unwrap();
    let child = child.unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}

#[test]
fn discovered_root_replay_child() {
    let Some(path) = std::env::var_os("HYPERSOLVE_ROOT_DISCOVERY_REPLAY") else { return; };
    let graph = codec::decode(&std::fs::read_to_string(path).unwrap());
    let values = decided(graph.replay(10000, &TestContext::strict()).unwrap());
    let [a, b] = values.as_slice() else { panic!("two discovered roots") };
    is_zero(&power(a, 3).subtract(&a.field().constant(real(2)).unwrap()).unwrap());
    is_zero(&power(b, 7).subtract(a).unwrap());
    let c = discovered_root(b, 3);
    is_zero(&power(&c, 3).subtract(b).unwrap());
    is_zero(&power(&c, 63).subtract(&c.field().constant(real(2)).unwrap()).unwrap());
}
