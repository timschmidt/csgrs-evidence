
fn assert_qualified_empty_successor(
    outcome: hypercurve::Provisional<hypercurve::ExactCurveResult<CurveRegion2>>,
    policy: PredicatePolicy,
    context: &str,
) {
    if policy == PredicatePolicy::STRICT {
        assert!(
            matches!(outcome.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate),
            "{context}: strict consumption lost inherited topology: {:?}",
            outcome.as_unverified()
        );
    } else {
        assert_eq!(outcome.certainty(), CurveCertainty::Approximate512Consumed, "{context}");
        let result = outcome.into_unverified().unwrap();
        assert!(
            matches!(result.regularized_region(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate),
            "{context}: returned region lost its dependency"
        );
    }
}

#[test]
fn qualified_empty_boolean_inputs_and_results_keep_topology_receipt() {
    let qualified = qualified_empty_region();
    let empty = CurveRegion2::empty();
    let square = geometry(&[rectangle(-1, -1, 2, 2)]);
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for (first, second) in [
            (&qualified, &empty), (&empty, &qualified),
            (&qualified, square.region()), (square.region(), &qualified),
            (&qualified, &qualified),
        ] {
            for operation in [BooleanOp::Union, BooleanOp::Intersection, BooleanOp::Difference, BooleanOp::Xor] {
                let result = hypercurve::evaluate_under(policy, || first.boolean_region(second, operation));
                assert_qualified_empty_successor(result, policy, &format!("Boolean {operation:?}"));
            }
        }
    }
}

#[test]
fn qualified_empty_affine_images_keep_topology_receipt() {
    let qualified = qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for matrix in [[1, 0, 0, 1, 0, 0], [1, 0, 0, 1, 3, -2], [-1, 0, 0, 1, 0, 0], [1, 2, 0, 1, 0, 0]] {
            let [m00, m01, m10, m11, tx, ty] = matrix.map(Real::from);
            let result = hypercurve::evaluate_under(policy, || qualified.transform_affine(&m00, &m01, &m10, &m11, &tx, &ty));
            assert_qualified_empty_successor(result, policy, &format!("Affine {matrix:?}"));
        }
    }
}

#[test]
fn qualified_empty_offsets_keep_topology_receipt() {
    let qualified = qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for distance in [0, 1, -1] {
            let result = hypercurve::evaluate_under(policy, || qualified.offset(Real::from(distance), &OffsetCornerStyle2::Round));
            assert_qualified_empty_successor(result, policy, &format!("Offset {distance}"));
        }
    }
}
