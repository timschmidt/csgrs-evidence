//! Policy replay failures remain distinct from malformed boundaries.

use hypercurve::{
    BooleanOp, CurveCertainty, CurvePath2, CurvePoint2, CurveRegion2, ExactCurveError, FillRule,
    LineSeg2, Point2, PredicatePolicy, Real, RegionPointLocation, evaluate_under,
};

fn square_path(final_x: Real) -> CurvePath2 {
    let points = [
        Point2::from_values(0, 0),
        Point2::from_values(1, 0),
        Point2::from_values(1, 1),
        Point2::from_values(0, 1),
        Point2::new(final_x, Real::zero()),
    ];
    CurvePath2::try_new(
        points
            .windows(2)
            .map(|pair| {
                LineSeg2::try_new(pair[0].clone(), pair[1].clone())
                    .unwrap()
                    .into()
            })
            .collect(),
    )
    .unwrap()
}

fn qualified_square(reversed: bool) -> CurveRegion2 {
    // The addition formula proves z = 0 independently of the predicate kernel.
    // Its current strict evaluation cannot establish that identity.
    let z = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let path = square_path(z);
    let path = if reversed {
        path.reversed().unwrap()
    } else {
        path
    };
    assert!(matches!(
        CurveRegion2::try_from_boundary_paths(&[path.clone()], FillRule::NonZero),
        Err(ExactCurveError::Blocked(_))
    ));
    let outcome = evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        CurveRegion2::try_from_boundary_paths(&[path], FillRule::NonZero)
    });
    assert_eq!(outcome.certainty(), CurveCertainty::Approximate512Consumed);
    assert!(outcome.clone().certified().is_none());
    outcome.into_unverified().unwrap()
}

#[test]
fn stricter_replay_of_a_qualified_loop_is_blocked_not_invalid() {
    let half = (Real::one() / Real::from(2)).unwrap();
    let inside: CurvePoint2 = Point2::new(half.clone(), half).into();
    let square =
        CurveRegion2::try_from_boundary_paths(&[square_path(Real::zero())], FillRule::NonZero)
            .unwrap();
    for reversed in [false, true] {
        let region = qualified_square(reversed);
        for _ in 0..2 {
            for error in [
                region.classify_point(&inside).unwrap_err(),
                region
                    .boolean_region(&square, BooleanOp::Intersection)
                    .unwrap_err(),
                region
                    .transform_affine(
                        &Real::one(),
                        &Real::zero(),
                        &Real::zero(),
                        &Real::one(),
                        &3.into(),
                        &4.into(),
                    )
                    .unwrap_err(),
            ] {
                assert!(
                    matches!(error, ExactCurveError::Blocked(_)),
                    "a valid qualified source must remain retryable: {error:?}"
                );
            }
            let outcome = evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
                region.classify_point(&inside)
            });
            assert_eq!(outcome.certainty(), CurveCertainty::Approximate512Consumed);
            assert_eq!(outcome.into_unverified().unwrap(), RegionPointLocation::Inside);
        }
    }
}

#[test]
fn replay_does_not_relabel_an_open_loop_or_weaken_a_strict_square() {
    let gap = (Real::one() / Real::from(100)).unwrap();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let invalid = evaluate_under(policy, || {
            CurveRegion2::try_from_boundary_paths(&[square_path(gap.clone())], FillRule::NonZero)
        });
        assert!(matches!(
            invalid.into_unverified(),
            Err(ExactCurveError::Invalid { .. })
        ));
        let valid = evaluate_under(policy, || {
            CurveRegion2::try_from_boundary_paths(&[square_path(Real::zero())], FillRule::NonZero)
        });
        assert!(valid.certified().unwrap().is_ok());
    }
}
