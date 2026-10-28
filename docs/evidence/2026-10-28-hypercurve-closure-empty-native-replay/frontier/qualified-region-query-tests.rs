
fn positive_height_qualified_empty_region() -> (Real, CurveRegion2) {
    let height = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
        + Real::from(2).powi_i64(-1024).unwrap();
    let path = CurvePath2::try_new(vec![
        QuadraticBezier2::new(point(0, 0), Point2::new(Real::one(), height.clone()), point(2, 0)).into(),
        Curve2::try_line(point(2, 0).into(), point(0, 0).into()).unwrap(),
    ]).unwrap();
    let constructed = hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        CurveRegion2::try_from_boundary_paths_with_loop_semantics(
            &[path], &[hypercurve::CurveRegionLoopRole::Material], &[FillRule::EvenOdd],
        ).unwrap()
    });
    assert_eq!(constructed.certainty(), CurveCertainty::Approximate512Consumed);
    let region = constructed.into_unverified();
    assert!(region.is_empty());
    // The source cap has positive area 2*height/3. Prove the independent
    // sign after construction so this check does not warm its decision path.
    assert_eq!(height.certified_sign_until(-2048).sign(), Some(hypercurve::RealSign::Positive));
    (height, region)
}

fn check_qualified_region_query<T: std::fmt::Debug>(
    result: hypercurve::Provisional<hypercurve::ExactCurveResult<T>>,
    policy: PredicatePolicy,
) -> Option<T> {
    if policy == PredicatePolicy::STRICT {
        assert!(matches!(result.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate),
            "strict query lost inherited topology: {:?}", result.as_unverified());
        None
    } else {
        assert_eq!(result.certainty(), CurveCertainty::Approximate512Consumed, "{:?}", result.as_unverified());
        Some(result.into_unverified().unwrap())
    }
}

#[test]
fn qualified_empty_membership_queries_retain_topology_receipts() {
    let (height, region) = positive_height_qualified_empty_region();
    let points = [Point2::new(Real::one(), (height / Real::from(4)).unwrap()).into(), point(3, 1).into()];
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let one = hypercurve::evaluate_under(policy, || region.classify_point(&points[0]));
        if let Some(value) = check_qualified_region_query(one, policy) {
            assert_eq!(value, RegionPointLocation::Outside);
        }
        let batch = hypercurve::evaluate_under(policy, || region.classify_points(&points));
        if let Some(values) = check_qualified_region_query(batch, policy) {
            assert_eq!(values, vec![RegionPointLocation::Outside; 2]);
        }
    }
}

#[test]
fn qualified_empty_area_queries_retain_topology_receipts() {
    let (_, region) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for result in [
            hypercurve::evaluate_under(policy, || region.signed_area()),
            hypercurve::evaluate_under(policy, || region.filled_area()),
        ] {
            if let Some(area) = check_qualified_region_query(result, policy) {
                assert_eq!(area, Some(Real::zero()));
            }
        }
    }
}

#[test]
fn qualified_empty_role_queries_retain_topology_receipts() {
    let (_, region) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for result in [
            hypercurve::evaluate_under(policy, || region.loop_roles().map(|roles| roles.len())),
            hypercurve::evaluate_under(policy, || region.loop_role_counts().map(|(material, holes)| material + holes)),
            hypercurve::evaluate_under(policy, || region.boundary_profiles().map(|profiles| profiles.len())),
        ] {
            if let Some(count) = check_qualified_region_query(result, policy) {
                assert_eq!(count, 0);
            }
        }
    }
}

#[test]
fn qualified_empty_native_view_retain_topology_receipts() {
    let (_, region) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = hypercurve::evaluate_under(policy, || region.native_contours_fast_path().map(|view| view.map(|view| view.is_empty())));
        if let Some(view) = check_qualified_region_query(result, policy) {
            assert_eq!(view, Some(true));
        }
    }
}

#[test]
fn qualified_empty_material_components_retain_topology_receipts() {
    let (_, region) = positive_height_qualified_empty_region();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = hypercurve::evaluate_under(policy, || region.material_components());
        if let Some(components) = check_qualified_region_query(result, policy) {
            assert!(components.is_empty());
        }
    }
}

