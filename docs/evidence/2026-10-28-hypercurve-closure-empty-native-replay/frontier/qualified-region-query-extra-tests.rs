
#[test]
fn qualified_empty_side_and_fact_queries_retain_topology_receipts() {
    let (_, region) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let side = hypercurve::evaluate_under(policy, || region.filled_side_is_left().map(|sides| sides.len()));
        if let Some(count) = check_qualified_region_query(side, policy) {
            assert_eq!(count, 0);
        }
        let facts = hypercurve::evaluate_under(policy, || region.structural_facts());
        check_qualified_region_query(facts, policy);
    }
}

#[test]
fn qualified_empty_bounds_keep_topology_receipts() {
    let (_, region) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = hypercurve::evaluate_under(policy, || region.bounds());
        if let Some(bounds) = check_qualified_region_query(result, policy) {
            assert_eq!(bounds, None);
        }
    }
}

#[test]
fn qualified_empty_similarity_keeps_native_lowering_receipt() {
    let (_, region) = positive_height_qualified_empty_region();
    let transform = hypercurve::Similarity2::try_from_real_affine(
        Real::one(), Real::zero(), Real::zero(), Real::one(), Real::from(3), Real::from(-2),
    ).unwrap();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = hypercurve::evaluate_under(policy, || region.transform_similarity(&transform));
        if let Some(result) = check_qualified_region_query(result, policy) {
            assert!(result.is_empty());
            assert!(matches!(result.regularized_region(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
        }
    }
}

