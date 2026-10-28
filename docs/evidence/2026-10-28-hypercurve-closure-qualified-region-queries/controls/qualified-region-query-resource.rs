
#[test]
fn region_query_receipts_under_zero_instrumented_budget() {
    let (_, qualified) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let exact = hypercurve::evaluate_with_budget(policy, hypercurve::WorkBudget::ZERO, || {
            exact_region_queries_remain_certified_across_policy_changes();
        });
        eprintln!("exact query policy {policy:?} usage {:?}", exact.usage);
        assert_eq!(exact.usage.refinements, 0);
        assert_eq!(exact.usage.promotions, 0);
        assert_eq!(exact.result.unwrap().certainty(), CurveCertainty::Certified);

        let attempt = hypercurve::evaluate_with_budget(policy, hypercurve::WorkBudget::ZERO, || {
            let location = hypercurve::evaluate_under(policy, || qualified.classify_point(&point(0, 0).into()));
            if let Some(location) = check_qualified_region_query(location, policy) {
                assert_eq!(location, RegionPointLocation::Outside);
            }
            let area = hypercurve::evaluate_under(policy, || qualified.filled_area());
            if let Some(area) = check_qualified_region_query(area, policy) { assert_eq!(area, Some(Real::zero())); }
            let roles = hypercurve::evaluate_under(policy, || qualified.loop_role_counts());
            if let Some(roles) = check_qualified_region_query(roles, policy) { assert_eq!(roles, (0, 0)); }
            let bounds = hypercurve::evaluate_under(policy, || qualified.bounds());
            if let Some(bounds) = check_qualified_region_query(bounds, policy) { assert_eq!(bounds, None); }
            let native = hypercurve::evaluate_under(policy, || qualified.native_contours_fast_path().map(|view| view.unwrap().is_empty()));
            if let Some(empty) = check_qualified_region_query(native, policy) { assert!(empty); }
        });
        eprintln!("qualified query policy {policy:?} usage {:?}", attempt.usage);
        assert_eq!(attempt.usage.refinements, 0);
        assert_eq!(attempt.usage.promotions, 0);
        let certainty = attempt.result.unwrap().certainty();
        assert_eq!(certainty, if policy == PredicatePolicy::STRICT {
            CurveCertainty::Certified // Certified handling of blockers, not certified geometry.
        } else {
            CurveCertainty::Approximate512Consumed
        });
    }
}
