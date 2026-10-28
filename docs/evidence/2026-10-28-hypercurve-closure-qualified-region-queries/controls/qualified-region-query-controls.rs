
fn exact_square_region() -> CurveRegion2 {
    let points = [point(4, 4), point(6, 4), point(6, 6), point(4, 6)];
    let boundary = CurvePath2::try_new((0..4).map(|i| {
        Curve2::try_line(points[i].clone().into(), points[(i + 1) % 4].clone().into()).unwrap()
    }).collect()).unwrap();
    CurveRegion2::try_from_boundary_paths(&[boundary], FillRule::NonZero).unwrap()
}

#[test]
fn exact_region_queries_remain_certified_across_policy_changes() {
    for region in [CurveRegion2::default(), exact_square_region()] {
        let empty = region.is_empty();
        for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
            let result = hypercurve::evaluate_under(policy, || {
                let count = usize::from(!empty);
                let area = if empty { Real::zero() } else { Real::from(4) };
                let inside = if empty { RegionPointLocation::Outside } else { RegionPointLocation::Inside };
                let points = [point(5, 5).into(), point(9, 9).into()];
                assert_eq!(region.classify_point(&points[0]).unwrap(), inside);
                assert_eq!(region.classify_points(&points).unwrap(), vec![inside, RegionPointLocation::Outside]);
                assert_eq!(region.signed_area().unwrap(), Some(area.clone()));
                assert_eq!(region.filled_area().unwrap(), Some(area));
                assert_eq!(region.loop_roles().unwrap().len(), count);
                assert_eq!(region.loop_role_counts().unwrap(), (count, 0));
                assert_eq!(region.boundary_profiles().unwrap().len(), count);
                assert_eq!(region.filled_side_is_left().unwrap(), vec![true; count]);
                let facts = region.structural_facts().unwrap();
                assert_eq!((facts.material_contour_count, facts.hole_contour_count), (count, 0));
                assert_eq!(region.native_contours_fast_path().unwrap().unwrap().len(), count);
                assert_eq!(region.bounds().unwrap(), if empty { None } else {
                    Some(hypercurve::Aabb2::new_unchecked(point(4, 4), point(6, 6)))
                });
                let components = region.material_components().unwrap();
                assert_eq!(components.len(), count);
                for component in components {
                    assert_eq!(component.filled_area().unwrap(), Some(Real::from(4)));
                }
                let transform = hypercurve::Similarity2::try_from_real_affine(
                    Real::one(), Real::zero(), Real::zero(), Real::one(), Real::from(3), Real::from(-2),
                ).unwrap();
                let transformed = region.transform_similarity(&transform).unwrap();
                assert_eq!(transformed.is_empty(), empty);
                assert_eq!(transformed.classify_point(&point(8, 3).into()).unwrap(), inside);
                assert!(transformed.regularized_region().is_ok());
            });
            assert_eq!(result.certainty(), CurveCertainty::Certified);
        }
    }
}

#[test]
fn qualified_nonempty_queries_and_components_retain_topology_receipts() {
    let (height, collapsed) = positive_height_qualified_empty_region();
    let square = exact_square_region();
    let result = hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        collapsed.boolean_region(&square, hypercurve::BooleanOp::Union).unwrap()
    });
    assert_eq!(result.certainty(), CurveCertainty::Approximate512Consumed);
    let region = result.into_unverified();
    assert!(!region.is_empty());
    // The intended union also contains the disjoint positive-height cap;
    // its source area is 4 + 2*height/3, strictly greater than the retained 4.
    let cap_point = Point2::new(Real::one(), (height / Real::from(4)).unwrap());
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT,
                   PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        for (p, expected) in [(point(5, 5), RegionPointLocation::Inside), (cap_point.clone(), RegionPointLocation::Outside)] {
            if let Some(location) = check_qualified_region_query(hypercurve::evaluate_under(policy, || region.classify_point(&p.into())), policy) {
                assert_eq!(location, expected);
            }
        }
        for result in [
            hypercurve::evaluate_under(policy, || region.signed_area()),
            hypercurve::evaluate_under(policy, || region.filled_area()),
        ] {
            if let Some(area) = check_qualified_region_query(result, policy) {
                assert_eq!(area, Some(Real::from(4)));
            }
        }
        for result in [
            hypercurve::evaluate_under(policy, || region.loop_roles().map(|r| r.len())),
            hypercurve::evaluate_under(policy, || region.boundary_profiles().map(|r| r.len())),
            hypercurve::evaluate_under(policy, || region.filled_side_is_left().map(|r| r.len())),
        ] {
            if let Some(count) = check_qualified_region_query(result, policy) { assert_eq!(count, 1); }
        }
        if let Some(facts) = check_qualified_region_query(hypercurve::evaluate_under(policy, || region.structural_facts()), policy) {
            assert_eq!((facts.material_contour_count, facts.hole_contour_count), (1, 0));
        }
        if let Some(count) = check_qualified_region_query(hypercurve::evaluate_under(policy, || region.native_contours_fast_path().map(|r| r.unwrap().len())), policy) {
            assert_eq!(count, 1);
        }
        if let Some(bounds) = check_qualified_region_query(hypercurve::evaluate_under(policy, || region.bounds()), policy) {
            assert_eq!(bounds, Some(hypercurve::Aabb2::new_unchecked(point(4, 4), point(6, 6))));
        }
        if let Some(components) = check_qualified_region_query(hypercurve::evaluate_under(policy, || region.material_components()), policy) {
            assert_eq!(components.len(), 1);
            for component in components {
                assert!(matches!(component.regularized_region(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
                let area = hypercurve::evaluate_under(policy, || component.filled_area());
                assert_eq!(check_qualified_region_query(area, policy), Some(Some(Real::from(4))));
            }
        }
        // Consuming the qualified union does not alter the exact operand.
        assert_eq!(square.filled_area().unwrap(), Some(Real::from(4)));
    }
}
