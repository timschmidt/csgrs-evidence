
#[test]
fn canonical_empty_document_replays_before_further_operations() {
    let source = SvgGeometry2::empty();
    let text = export_svg_document(&source).expect("canonical empty geometry has an exact SVG document");
    let mut expected = b"HCP5".to_vec();
    expected.extend_from_slice(&0_u32.to_be_bytes());
    expected.extend_from_slice(&0_u32.to_be_bytes());
    assert_eq!(decoded(&text), expected);
    assert!(text.contains("viewBox=\"0.00000000000000000 0.00000000000000000 1.00000000000000000 1.00000000000000000\""));
    let restored = import_svg_document(&text).unwrap();
    assert!(restored.is_empty());
    assert_eq!(export_svg_document(&restored).unwrap(), text);
    let square = geometry(&[rectangle(-1, -1, 2, 2)]);
    assert_same_set(
        &restored.region().boolean_region(square.region(), BooleanOp::Union).unwrap(),
        square.region(),
    );
    for operation in [BooleanOp::Intersection, BooleanOp::Difference] {
        assert!(restored.region().boolean_region(square.region(), operation).unwrap().is_empty());
    }
    assert!(restored.region().offset(Real::one(), &OffsetCornerStyle2::Round).unwrap().is_empty());
    let changed_display = text.replace("d=\"\"", "d=\"M0 0 L4 0 L4 4 Z\"");
    assert!(import_svg_document(&changed_display).unwrap().is_empty());
}

#[test]
fn generated_empty_document_replays_with_valid_options_and_policy() {
    let square = geometry(&[rectangle(0, 0, 2, 2)]);
    let empty = square.region().boolean_region(square.region(), BooleanOp::Difference).unwrap();
    assert!(empty.is_empty());
    let source = SvgGeometry2::new(empty, vec![], vec![]);
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let outcome = hypercurve::evaluate_under(policy, || {
            let options = SvgOptions { max_extension_bytes: 64, max_point_definition_depth: 0, ..SvgOptions::default() };
            let text = export_svg_document_with_options(&source, options).unwrap();
            let restored = import_svg_document_with_options(&text, options).unwrap();
            assert!(restored.is_empty());
            assert_eq!(export_svg_document_with_options(&restored, options).unwrap(), text);
        });
        assert_eq!(outcome.certainty(), CurveCertainty::Certified);
    }
    for options in [
        SvgOptions { curve_tolerance: f64::NAN, ..SvgOptions::default() },
        SvgOptions { max_extension_bytes: 63, ..SvgOptions::default() },
        SvgOptions { max_curve_segments: 7, ..SvgOptions::default() },
    ] {
        assert!(matches!(export_svg_document_with_options(&source, options), Err(SvgError::MalformedInput(_))));
    }
}

#[test]
fn empty_region_export_keeps_inherited_topology_qualification_with_a_stroke() {
    // This symbolic control preserves behavior outside the algebraic envelope.
    let zero = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let qualified = hypercurve::provisional(|| {
        let start = Point2::new(Real::e().sin(), Real::zero());
        let end = Point2::new(Real::e().sin() + zero, Real::zero());
        let path = CurvePath2::try_new(vec![QuadraticBezier2::new(start, point(0, 1), end).into()]).unwrap();
        CurveRegion2::try_from_boundary_paths(&[path], FillRule::EvenOdd).unwrap()
    });
    assert_eq!(qualified.certainty(), CurveCertainty::Approximate512Consumed);
    let region = qualified.into_unverified();
    assert!(region.is_empty());
    let stroke = CurvePath2::try_new(vec![QuadraticBezier2::new(point(0, 0), point(1, 1), point(2, 0)).into()]).unwrap();
    for paths in [vec![stroke], vec![]] {
        let source = SvgGeometry2::new(region.clone(), vec![], paths);
        for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
            let result = hypercurve::evaluate_under(policy, || export_svg_document(&source));
            assert!(matches!(result.as_unverified(), Err(SvgError::Exact(hypercurve::ExactCurveError::Blocked(reason))) if reason.reason() == hypercurve::UncertaintyReason::Predicate), "strict native export must preserve an inherited empty-set qualification: {:?}", result.as_unverified());
        }
    }
}

#[test]
fn empty_region_projection_keeps_inherited_topology_qualification() {
    let zero = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let qualified = hypercurve::provisional(|| {
        let start = Point2::new(Real::e().sin(), Real::zero());
        let end = Point2::new(Real::e().sin() + zero, Real::zero());
        let path = CurvePath2::try_new(vec![QuadraticBezier2::new(start, point(0, 1), end).into()]).unwrap();
        CurveRegion2::try_from_boundary_paths(&[path], FillRule::EvenOdd).unwrap()
    });
    assert_eq!(qualified.certainty(), CurveCertainty::Approximate512Consumed);
    let region = qualified.into_unverified();
    let options = hypercurve::FiniteProjectionOptions::try_new(0.1).unwrap();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = hypercurve::evaluate_under(policy, || region.project_to_finite_profiles(&options));
        if policy == PredicatePolicy::STRICT {
            assert!(matches!(result.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate), "strict projection must keep the inherited empty-set qualification: {:?}", result.as_unverified());
        } else {
            assert!(result.as_unverified().as_ref().unwrap().is_empty());
            assert_eq!(result.certainty(), CurveCertainty::Approximate512Consumed);
        }
    }
}

#[test]
fn empty_region_topology_replay_observes_inherited_approximation() {
    let zero = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let qualified = hypercurve::provisional(|| {
        let start = Point2::new(Real::e().sin(), Real::zero());
        let end = Point2::new(Real::e().sin() + zero, Real::zero());
        let path = CurvePath2::try_new(vec![QuadraticBezier2::new(start, point(0, 1), end).into()]).unwrap();
        CurveRegion2::try_from_boundary_paths(&[path], FillRule::EvenOdd).unwrap()
    });
    assert_eq!(qualified.certainty(), CurveCertainty::Approximate512Consumed);
    let region = qualified.into_unverified();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let normalized = hypercurve::evaluate_under(policy, || region.regularized_region());
        let paths = hypercurve::evaluate_under(policy, || region.boundary_paths());
        if policy == PredicatePolicy::STRICT {
            assert!(matches!(normalized.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
            assert!(matches!(paths.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate));
        } else {
            assert!(normalized.as_unverified().as_ref().unwrap().is_empty());
            assert!(paths.as_unverified().as_ref().unwrap().is_empty());
            assert_eq!(normalized.certainty(), CurveCertainty::Approximate512Consumed);
            assert_eq!(paths.certainty(), CurveCertainty::Approximate512Consumed);
        }
    }
}

#[test]
fn empty_region_exact_projection_keeps_inherited_topology_qualification() {
    let zero = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let qualified = hypercurve::provisional(|| {
        let start = Point2::new(Real::e().sin(), Real::zero());
        let end = Point2::new(Real::e().sin() + zero, Real::zero());
        let path = CurvePath2::try_new(vec![QuadraticBezier2::new(start, point(0, 1), end).into()]).unwrap();
        CurveRegion2::try_from_boundary_paths(&[path], FillRule::EvenOdd).unwrap()
    });
    assert_eq!(qualified.certainty(), CurveCertainty::Approximate512Consumed);
    let region = qualified.into_unverified();
    let options = hypercurve::FiniteProjectionOptions::try_new(0.1).unwrap();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let result = hypercurve::evaluate_under(policy, || region.project_to_finite_profiles_exact(&options));
        if policy == PredicatePolicy::STRICT {
            assert!(matches!(result.as_unverified(), Err(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason() == hypercurve::UncertaintyReason::Predicate), "strict projection must keep the inherited empty-set qualification: {:?}", result.as_unverified());
        } else {
            assert!(result.as_unverified().as_ref().unwrap().is_empty());
            assert_eq!(result.certainty(), CurveCertainty::Approximate512Consumed);
        }
    }
}
