
#[test]
fn selected_query_fibers_keep_opposite_roots_repeated_equations_and_exact_events() {
    let parameter = form(&source(), y()).parameter().unwrap();
    let repeated = p(&[&[0, 0, 0, 0, 1], &[0, 0, -2], &[1]]);
    let make = |equation, lower, upper, exact| CurvePointDefinition2::PolynomialFiber {
        equation, parameter: parameter.clone(), root: IsolatedRootInterval {
            lower, upper, exact_root: exact, distinct_root_count: 99,
        },
    }.into_point();
    let positive = make(repeated.clone(), q(1, 2), q(3, 4), None).unwrap();
    let negative = make(repeated.clone(), q(-3, 4), q(-1, 2), None).unwrap();
    for point in [&positive, &negative] {
        zero(point, repeated.clone());
        zero(point, p(&[&[0, 0, 1], &[-1]]));
    }
    assert!(!positive.coincides_with(&negative).unwrap());
    assert_eq!(form(&positive, y()).add(&form(&negative, y())).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
    let exact = make(p(&[&[-1, 2]]), q(1, 2), q(1, 2), Some(q(1, 2))).unwrap();
    assert_eq!(form(&exact, y()).compare_to_real(&q(1, 2)).unwrap(), Ordering::Equal);
    for result in [
        make(repeated, (-1).into(), 1.into(), None),
        make(p(&[&[1, 0, 1]]), 0.into(), 1.into(), None),
        make(p(&[&[0]]), 0.into(), 0.into(), Some(0.into())),
        make(p(&[&[-1, 2]]), 0.into(), 0.into(), Some(0.into())),
        make(p(&[&[-1, 2]]), 0.into(), 1.into(), Some(q(1, 2))),
        make(p(&[&[-1, 2]]), 1.into(), 0.into(), None),
    ] {
        assert!(matches!(result, Err(ExactCurveError::Invalid { .. })));
    }
}

#[test]
fn selected_query_fibers_admit_degree_seventeen_and_feed_rational_geometry() {
    let parameter = form(&source(), y()).parameter().unwrap();
    let mut row = vec![Real::zero(); 18]; row[17] = Real::one();
    let equation = BivariatePolynomial::new(vec![row, vec![Real::from(-1)]]);
    let point = CurvePointDefinition2::PolynomialFiber {
        equation: equation.clone(), parameter, root: IsolatedRootInterval {
            lower: 0.into(), upper: 1.into(), exact_root: None, distinct_root_count: 1,
        },
    }.into_point().unwrap();
    zero(&point, equation);
    let root = form(&point, y()).parameter().unwrap();
    let next = root.affine_point(2.into(), 1.into(), 3.into(), (-1).into()).unwrap();
    // X=1+2r, Y=3r-1, so 3X-2Y=5 independently of r's degree.
    zero(&next, p(&[&[-5, -2], &[3]]));
    assert_eq!(next.affine_form(q(1, 2), 0.into(), q(-1, 2)).parameter().unwrap().compare(&root).unwrap(), Ordering::Equal);
    assert!(point.definition().unwrap().into_point().unwrap().coincides_with(&point).unwrap());
}

#[test]
fn selected_query_fibers_preserve_trim_reversal_transform_and_certainty() {
    let source = source();
    // A quotient consumes both coordinates of the retained cubic fiber.
    let query = source.rational_form(p(&[&[0, 1], &[1]]), p(&[&[2], &[1]])).unwrap();
    let parameter = query.parameter().unwrap();
    let equation = p(&[&[0, 0, 1], &[-1]]);
    let set = curves(equation.clone());
    let branch = &set.curves()[1];
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let outcome = evaluate_under(policy, || {
            let point = branch.point_at(&parameter).unwrap();
            zero(&point, equation.clone());
            assert_eq!(form(&point, x()).compare(&query).unwrap(), Ordering::Equal);
            let restricted = branch.restrict_source(CurveParameterRange2::try_new(parameter.clone(), q(3, 4).into()).unwrap()).unwrap();
            assert!(restricted.start().coincides_with(&point).unwrap());
            assert!(restricted.reversed().unwrap().end().coincides_with(&point).unwrap());
            let negative = set.curves()[0].point_at(&parameter).unwrap();
            let CurvePointLocations2::Locations(locations) = branch.point_locations(&negative).unwrap() else { panic!("finite preimages") };
            assert!(locations.is_empty());
            let transform = Similarity2::try_from_real_affine(0.into(), (-2).into(), 2.into(), 0.into(), 1.into(), 3.into()).unwrap();
            let transformed = CurvePointDefinition2::Similarity { source: point.clone(), transform }.into_point().unwrap();
            assert_eq!(transformed.affine_form(0.into(), q(1, 2), q(-3, 2)).parameter().unwrap().compare(&parameter).unwrap(), Ordering::Equal);
            let moved = point.rational_image(&RationalMap2::new([p(&[&[1], &[1]]), y()], p(&[&[1]]))).unwrap();
            assert!(!moved.coincides_with(&point).unwrap());
            assert_eq!(form(&moved, p(&[&[-1], &[1]])).compare(&query).unwrap(), Ordering::Equal);
        });
        assert_eq!(outcome.certainty(), CurveCertainty::Certified);
    }
}

#[test]
fn selected_query_fibers_share_work_limits_and_retry_after_exhaustion() {
    use hypersolve::work_budget::{WorkBudget, with_budget};
    let parameter = form(&source(), y()).parameter().unwrap();
    let equation = p(&[&[0, 0, 1], &[-1]]);
    let set = curves(equation.clone());
    let limited = with_budget(WorkBudget::ZERO, || {
        let result = set.curves()[1].point_at(&parameter);
        assert!(matches!(result, Err(ExactCurveError::Blocked(blocker)) if blocker.reason() == UncertaintyReason::BudgetExhausted));
    });
    assert!(limited.result.is_err());
    let retry = set.curves()[1].point_at(&parameter).unwrap();
    zero(&retry, equation);
}

#[test]
fn selected_query_fibers_consume_mixed_authored_and_generated_sources() {
    let generated = form(&source(), y());
    let authored: CurvePoint2 = Point2::new(q(1, 3).sqrt().unwrap(), Real::zero()).into();
    let term = form(&authored, x()).scaled(&q(1, 4)).unwrap();
    let mixed = generated.add(&term).unwrap();
    assert!(mixed.operands().is_some());
    let parameter = mixed.parameter().unwrap();
    let set = curves(p(&[&[0, 0, 1], &[-1]]));
    let point = set.curves()[1].point_at(&parameter).unwrap();
    zero(&point, p(&[&[0, 0, 1], &[-1]]));
    assert_eq!(form(&point, x()).compare(&mixed).unwrap(), Ordering::Equal);
    let remainder = form(&point, x()).subtract(&generated).unwrap();
    assert_eq!(remainder.multiply(&remainder).unwrap().compare_to_real(&q(1, 48)).unwrap(), Ordering::Equal);
    assert!(point.definition().unwrap().into_point().unwrap().coincides_with(&point).unwrap());
}

#[cfg(feature = "svg")]
#[test]
fn selected_query_fibers_replay_in_a_fresh_process_and_remain_consumable() {
    const INPUT: &str = "HYPERCURVE_SELECTED_QUERY_FIBER_REPLAY";
    fn verify(text: &str) {
        let geometry = import_svg_document(text).unwrap();
        let line = &geometry.paths()[0].curves()[0];
        let point = line.start();
        zero(&point, p(&[&[0, 0, 1], &[-1]]));
        zero(&point, p(&[&[-1], &[], &[], &[], &[], &[], &[2048]]));
        assert_eq!(form(&point, y()).compare_to_real(&Real::zero()).unwrap(), Ordering::Greater);
        let next = curves(p(&[&[0, 1], &[], &[-1]]));
        let root = form(&point, y()).parameter().unwrap();
        let result = next.curves()[0].point_at(&root).unwrap();
        assert_eq!(form(&result, y()).compare(&form(&point, x())).unwrap(), Ordering::Equal);
        assert_eq!(export_svg_document(&geometry).unwrap(), text);
    }
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let parameter = form(&source(), y()).parameter().unwrap();
    let set = curves(p(&[&[0, 0, 1], &[-1]]));
    let point = set.curves()[1].point_at(&parameter).unwrap();
    let end = point.rational_image(&RationalMap2::new([p(&[&[1], &[1]]), y()], p(&[&[1]]))).unwrap();
    let line = Curve2::try_line(point, end).unwrap();
    let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![line]).unwrap()]);
    let text = export_svg_document(&geometry).unwrap();
    verify(&text);
    let limited = SvgOptions { max_point_definition_depth: 0, ..SvgOptions::default() };
    assert!(matches!(import_svg_document_with_options(&text, limited), Err(SvgError::SizeOverflow { .. })));
    assert!(matches!(export_svg_document_with_options(&geometry, limited), Err(SvgError::SizeOverflow { .. })));
    let path = std::env::temp_dir().join(format!("hypercurve-query-fiber-{}.svg", std::process::id()));
    std::fs::write(&path, &text).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap()).args([
        "--exact", "selected_query_fibers_replay_in_a_fresh_process_and_remain_consumable", "--nocapture",
    ]).env(INPUT, &path).output().unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}
