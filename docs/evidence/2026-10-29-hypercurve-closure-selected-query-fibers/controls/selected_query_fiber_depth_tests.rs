
#[test]
fn complete_discovery_enforces_local_depth_without_partial_roots_or_poisoning_retry() {
    use hypersolve::{OrderedFieldRootIsolationConfig, OrderedFieldRootIsolationStatus as Status};
    let field = base();
    let policy = TestContext::strict();
    let run = |values: &[i32], lower, upper, depth, refinements| {
        let mut context = hypersolve::selected_polynomial_field::SelectedPolynomialContext {
            field: field.clone(), policy: &policy,
        };
        hypersolve::isolate_ordered_field_polynomial_roots_complete_with_config(
            coefficients(&field, values), &real(lower), &real(upper),
            OrderedFieldRootIsolationConfig { max_subdivision_depth: depth, refinement_steps: refinements },
            &mut context,
        ).unwrap()
    };
    for (values, lower, upper, depth, refinements, steps) in [
        (&[-2, 0, 1][..], -2, 2, 0, 0, 0),
        (&[-2, 0, 1][..], -2, 2, 1, 2, 1),
        (&[0, -2, 0, 1][..], 0, 2, 0, 0, 0),
    ] {
        let report = run(values, lower, upper, depth, refinements);
        assert_eq!(report.status, Status::BudgetExhausted);
        assert!(report.intervals.is_empty());
        assert_eq!(report.subdivision_steps, steps);
    }
    let separated = run(&[-2, 0, 1], -2, 2, 1, 0);
    assert_eq!(separated.status, Status::Isolated);
    assert_eq!(separated.intervals.len(), 2);
    assert_eq!(separated.subdivision_steps, 1);
    for root in separated.intervals {
        let selected = decided(field.select(coefficients(&field, &[-2, 0, 1]), root.lower, root.upper, &policy).unwrap());
        let value = selected.generator().unwrap();
        is_zero(&value.multiply(&value).unwrap().subtract(&selected.constant(real(2)).unwrap()).unwrap());
    }
    let exact = run(&[0, -2, 0, 1], 0, 2, 32, 3);
    assert_eq!(exact.status, Status::Isolated);
    assert_eq!(exact.intervals.len(), 2);
    assert_eq!(exact.intervals[0].exact_root, Some(real(0)));
    assert!(exact.intervals[1].lower > real(0));
    let control = discover(&field, coefficients(&field, &[-2, 0, 1]), &real(-2), &real(2), 0, &policy);
    assert_eq!(control.status, Status::Isolated);
    assert_eq!(control.intervals.len(), 2);
}
