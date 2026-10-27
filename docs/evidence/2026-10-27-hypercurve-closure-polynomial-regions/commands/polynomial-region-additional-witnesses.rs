
#[test]
fn polynomial_region_clips_open_authored_and_generated_curves() {
    let region = parabola_region();
    let line = Curve2::from(LineSeg2::try_new(Point2::from_values(-1, 0), Point2::from_values(1, 0)).unwrap());
    let pieces = line.trim_inside_region(&region).unwrap();
    assert_eq!(pieces.len(), 1);
    assert!(pieces[0].start().coincides_with(&Point2::from_values(0, 0).into()).unwrap());
    assert!(pieces[0].end().coincides_with(&Point2::new(q(1, 4), 0.into()).into()).unwrap());
    let clip = rectangle(q(1, 16), q(1, 8), (-1).into(), 1.into());
    for source in parabola_path().curves().iter().filter(|curve| curve.polynomial_branch().is_some()) {
        let pieces = source.trim_inside_region_with_parameters(&clip).unwrap();
        assert_eq!(pieces.len(), 1);
        let curve = pieces[0].curve();
        assert_eq!(curve.parameter_domain().start().compare(&q(1, 16).into()).unwrap(), std::cmp::Ordering::Equal);
        assert_eq!(curve.parameter_domain().end().compare(&q(1, 8).into()).unwrap(), std::cmp::Ordering::Equal);
        assert_eq!(curve.polynomial_branch().unwrap().root_index(), source.polynomial_branch().unwrap().root_index());
        assert!(curve.trim_inside_region(&region).unwrap()[0].polynomial_branch().is_some());
    }
}

#[test]
fn polynomial_region_mixed_circular_boolean_retains_original_supports() {
    let source = parabola_region();
    let right = Point2::new(q(1, 2), 0.into());
    let left = Point2::new(q(-1, 2), 0.into());
    let center = Point2::from_values(0, 0);
    let circle = CurvePath2::try_new(vec![
        hypercurve::CircularArc2::try_from_center(right.clone(), left.clone(), center.clone(), false).unwrap().into(),
        hypercurve::CircularArc2::try_from_center(left, right, center, false).unwrap().into(),
    ]).unwrap();
    let disk = CurveRegion2::try_from_boundary_paths(&[circle], FillRule::NonZero).unwrap();
    let common = source.boolean_region(&disk, BooleanOp::Intersection).unwrap();
    // The two parabola/circle contacts obey x²+x=1/4; the positive root is alpha.
    let alpha = (Real::from(2).sqrt().unwrap() - Real::one()) * q(1, 2);
    let paths = common.boundary_paths().unwrap();
    assert_eq!(paths.len(), 1);
    assert_eq!(paths[0].curves().len(), 5);
    let mut branches = 0;
    let mut circular = 0;
    let mut lines = 0;
    for curve in paths[0].curves() {
        if curve.polynomial_branch().is_some() {
            branches += 1;
            assert_eq!(curve.parameter_domain().start().compare(&Real::zero().into()).unwrap(), std::cmp::Ordering::Equal);
            assert_eq!(curve.parameter_domain().end().compare(&alpha.clone().into()).unwrap(), std::cmp::Ordering::Equal);
        } else if curve.family() == CurveFamily2::Line {
            lines += 1;
            for point in [curve.start(), curve.end()] {
                assert_eq!(point.affine_form(1.into(), 0.into(), 0.into()).compare_to_real(&q(1, 4)).unwrap(), std::cmp::Ordering::Equal);
            }
        } else {
            circular += 1;
            for point in [curve.start(), curve.end()] {
                assert_eq!(point.rational_form(BivariatePolynomial::new(vec![vec![q(-1, 4), 0.into(), 1.into()], vec![], vec![1.into()]]), BivariatePolynomial::new(vec![vec![1.into()]])).unwrap().compare_to_real(&Real::zero()).unwrap(), std::cmp::Ordering::Equal);
            }
        }
    }
    assert_eq!((branches, circular, lines), (2, 2, 1));
    for (x, y, expected) in [
        (q(1, 8), Real::zero(), RegionPointLocation::Inside),
        (q(1, 4), q(7, 16), RegionPointLocation::Outside),
        (q(1, 16), q(3, 8), RegionPointLocation::Outside),
        (q(1, 4), q(3, 8), RegionPointLocation::Boundary),
    ] {
        assert_eq!(common.classify_point(&Point2::new(x, y).into()).unwrap(), expected);
    }
    let rebuilt = CurveRegion2::try_from_boundary_paths(&paths, FillRule::EvenOdd).unwrap();
    assert!(rebuilt.boolean_region(&common, BooleanOp::Xor).unwrap().is_empty());
}

#[test]
fn polynomial_region_zero_offset_keeps_sources_and_remaining_gaps_are_typed() {
    let source = parabola_region();
    let zero = source.offset(Real::zero(), &hypercurve::OffsetCornerStyle2::Round).unwrap();
    assert!(zero.boolean_region(&source, BooleanOp::Xor).unwrap().is_empty());
    let paths = zero.boundary_paths().unwrap();
    assert_eq!(paths[0].curves().iter().filter(|curve| curve.polynomial_branch().is_some()).count(), 2);
    for error in [
        source.offset(q(1, 64), &hypercurve::OffsetCornerStyle2::Round).unwrap_err(),
        source.chamfer_loop_vertex_by_setbacks(0, 1, q(1, 64), q(1, 64), hypercurve::CurveCornerMode2::TrimOnly).unwrap_err(),
        source.fillet_loop_vertex(0, 1, &hypercurve::CurveFillet2::new(q(1, 64)), hypercurve::CurveCornerMode2::TrimOnly).unwrap_err(),
        source.project_to_finite_profiles(&hypercurve::FiniteProjectionOptions::try_new(0.001).unwrap()).unwrap_err(),
    ] {
        assert!(matches!(&error, hypercurve::ExactCurveError::Blocked(blocker) if blocker.reason() == hypercurve::UncertaintyReason::Unsupported), "{error:?}");
    }
}

#[test]
fn polynomial_region_budget_retry_and_policy_transitions_keep_exact_results() {
    use hypersolve::work_budget::{self, WorkBudget};
    let source = parabola_region();
    let clip = rectangle(q(1, 16), q(1, 8), (-1).into(), 1.into());
    let denied = work_budget::with_budget(WorkBudget::ZERO, || {
        assert!(matches!(source.boolean_region(&clip, BooleanOp::Intersection), Err(hypercurve::ExactCurveError::Blocked(blocker)) if blocker.reason() == hypercurve::UncertaintyReason::BudgetExhausted));
    });
    let reached = denied.result.unwrap_err();
    assert_eq!((reached.limit, reached.used), (0, 0));
    assert!(reached.requested > 0);
    let retry = work_budget::with_budget(WorkBudget { refinements: 100_000, promotions: 100_000 }, || source.boolean_region(&clip, BooleanOp::Intersection).unwrap());
    let expected = retry.result.unwrap();
    assert_eq!(expected.boundary_paths().unwrap()[0].curves().len(), 4);
    for policy in [hypercurve::PredicatePolicy::STRICT, hypercurve::PredicatePolicy::APPROXIMATE_512, hypercurve::PredicatePolicy::STRICT] {
        let outcome = hypercurve::evaluate_under(policy, || source.boolean_region(&clip, BooleanOp::Intersection).unwrap());
        assert_eq!(outcome.certainty(), hypercurve::CurveCertainty::Certified);
        let result = outcome.certified().unwrap();
        assert!(result.boolean_region(&expected, BooleanOp::Xor).unwrap().is_empty());
    }
}
