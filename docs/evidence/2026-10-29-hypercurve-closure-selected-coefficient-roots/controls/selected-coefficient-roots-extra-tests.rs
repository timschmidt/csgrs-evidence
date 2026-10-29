
fn constant(value: Real) -> CurvePointRationalForm2 {
    form(&Point2::from_values(0, 0).into(), BivariatePolynomial::new(vec![vec![value]]))
}
fn select(
    coefficients: Vec<CurvePointRationalForm2>,
    lower: Real,
    upper: Real,
    exact_root: Option<Real>,
) -> ExactCurveResult<CurvePoint2> {
    CurvePointDefinition2::SelectedPolynomialRoot {
        coefficients,
        root: IsolatedRootInterval { lower, upper, exact_root, distinct_root_count: 999 },
    }.into_point()
}
fn simple_root() -> CurvePoint2 {
    let a = form(&source(), x());
    select(vec![a.scaled(&(-1).into()).unwrap(), constant(0.into()), constant(1.into())], q(1, 2), q(3, 4), None).unwrap()
}

#[test]
fn selected_coefficient_roots_keep_repeated_factors_and_opposite_selections() {
    let a = form(&source(), x());
    let coefficients = vec![a.multiply(&a).unwrap(), constant(0.into()), a.scaled(&(-2).into()).unwrap(), constant(0.into()), constant(1.into()), constant(0.into())];
    let positive = select(coefficients.clone(), q(1, 2), q(3, 4), None).unwrap();
    let negative = select(coefficients.clone(), q(-3, 4), q(-1, 2), None).unwrap();
    for point in [&positive, &negative] {
        let z = form(point, x());
        assert_eq!(z.multiply(&z).unwrap().compare(&a).unwrap(), Ordering::Equal);
        let CurvePointDefinition2::SelectedPolynomialRoot { coefficients, root } = point.definition().unwrap() else { panic!("selected relation lost") };
        assert_eq!(coefficients.len(), 6);
        assert_eq!(root.distinct_root_count, 1);
        assert!(select(coefficients, root.lower, root.upper, root.exact_root).unwrap().coincides_with(point).unwrap());
    }
    assert!(!positive.coincides_with(&negative).unwrap());
    assert_eq!(form(&positive, x()).add(&form(&negative, x())).unwrap().compare_to_real(&0.into()).unwrap(), Ordering::Equal);
    assert!(matches!(select(coefficients, (-1).into(), 1.into(), None), Err(ExactCurveError::Invalid { .. })));
}

#[test]
fn selected_coefficient_roots_keep_degree_seventeen_and_nonmonic_relations() {
    let a = form(&source(), x());
    let mut coefficients = vec![constant(0.into()); 18];
    coefficients[0] = a.scaled(&(-1).into()).unwrap();
    coefficients[17] = constant(3.into());
    let point = select(coefficients, 0.into(), 1.into(), None).unwrap();
    let mut power = vec![vec![]; 18];
    power[17] = vec![3.into()];
    assert_eq!(form(&point, BivariatePolynomial::new(power)).compare(&a).unwrap(), Ordering::Equal);
    let parameter = form(&point, x()).parameter().unwrap();
    let image = parameter.affine_point(2.into(), 1.into(), 3.into(), (-1).into()).unwrap();
    zero(&image, p(&[&[-5, -2], &[3]]));
    assert_eq!(image.affine_form(q(1, 2), 0.into(), q(-1, 2)).parameter().unwrap().compare(&parameter).unwrap(), Ordering::Equal);
}

#[test]
fn selected_coefficient_roots_check_exact_roots_and_invalid_selectors() {
    let a = form(&source(), x());
    let linear = vec![a.scaled(&(-1).into()).unwrap(), a.clone()];
    let exact = select(linear.clone(), 1.into(), 1.into(), Some(1.into())).unwrap();
    assert_eq!(form(&exact, x()).compare_to_real(&1.into()).unwrap(), Ordering::Equal);
    for result in [
        select(linear.clone(), 0.into(), 0.into(), Some(0.into())),
        select(linear.clone(), 0.into(), 2.into(), Some(1.into())),
        select(linear.clone(), 1.into(), 2.into(), None),
        select(linear.clone(), 2.into(), 0.into(), None),
        select(linear, 2.into(), 3.into(), None),
        select(vec![], 0.into(), 1.into(), None),
        select(vec![a.subtract(&a).unwrap()], 0.into(), 0.into(), Some(0.into())),
        select(vec![constant(1.into())], 0.into(), 1.into(), None),
    ] {
        assert!(matches!(result, Err(ExactCurveError::Invalid { .. })));
    }
}

#[test]
fn selected_coefficient_roots_distinguish_close_roots_without_tolerance() {
    let a = form(&source(), x());
    let epsilon = q(1, 1_000_000) * q(1, 1_000_000);
    let quarter = &epsilon * q(1, 4);
    let coefficients = vec![a.scaled(&(Real::one() + &epsilon)).unwrap(), a.scaled(&(Real::from(-2) - &epsilon)).unwrap(), a];
    let first = select(coefficients.clone(), Real::one() - &quarter, Real::one() + &quarter, None).unwrap();
    let second = select(coefficients, Real::one() + &epsilon - &quarter, Real::one() + &epsilon + &quarter, None).unwrap();
    assert_eq!(form(&first, x()).compare_to_real(&Real::one()).unwrap(), Ordering::Equal);
    assert_eq!(form(&second, x()).subtract(&form(&first, x())).unwrap().compare_to_real(&epsilon).unwrap(), Ordering::Equal);
    assert!(!first.coincides_with(&second).unwrap());
}

#[test]
fn selected_coefficient_roots_retain_zero_coefficient_guards_and_retry_after_exhaustion() {
    use hypersolve::work_budget::{WorkBudget, with_budget};
    let source: CurvePoint2 = Point2::from_values(0, 2).into();
    let guarded = source.rational_form(p(&[&[0]]), p(&[&[-1, 0, 1]])).unwrap();
    let coefficients = vec![constant((-1).into()), guarded, constant(1.into())];
    let point = select(coefficients.clone(), q(1, 2), q(3, 2), None).unwrap();
    let CurvePointDefinition2::SelectedPolynomialRoot { coefficients: retained, .. } = point.definition().unwrap() else { panic!("lost coefficient definitions") };
    assert_eq!(retained[1].denominator(), coefficients[1].denominator());
    assert!(Point2::from_values(0, 1).to_curve_point().rational_form(retained[1].numerator().clone(), retained[1].denominator().clone()).is_err());
    let limited = with_budget(WorkBudget::ZERO, || {
        assert!(matches!(select(coefficients.clone(), q(1, 2), q(3, 2), None), Err(ExactCurveError::Blocked(blocker)) if blocker.reason() == UncertaintyReason::BudgetExhausted));
    });
    assert!(limited.result.is_err());
    assert!(select(coefficients, q(1, 2), q(3, 2), None).unwrap().coincides_with(&point).unwrap());
}

#[cfg(feature = "svg")]
#[test]
fn selected_coefficient_roots_replay_in_a_fresh_process_and_feed_derivatives() {
    const INPUT: &str = "HYPERCURVE_SELECTED_COEFFICIENT_ROOT_REPLAY";
    fn verify(text: &str) {
        let geometry = import_svg_document(text).unwrap();
        let point = geometry.paths()[0].curves()[0].start();
        // z²=a and 8a²=1; the positive selector determines the fourth root.
        zero(&point, p(&[&[-1], &[], &[], &[], &[8]]));
        assert_eq!(form(&point, x()).compare_to_real(&0.into()).unwrap(), Ordering::Greater);
        let parameter = form(&point, x()).parameter().unwrap();
        let curve = PolynomialBezier2::try_new(vec![Point2::from_values(0, 0), Point2::new(q(1, 2), 0.into()), Point2::from_values(1, 1)]).unwrap();
        let derivative = Curve2::from(curve).derivative_at(&parameter).unwrap();
        assert_eq!(form(&derivative, x()).compare_to_real(&1.into()).unwrap(), Ordering::Equal);
        assert_eq!(form(&derivative, y()).scaled(&q(1, 2)).unwrap().compare(&form(&point, x())).unwrap(), Ordering::Equal);
        assert_eq!(export_svg_document(&geometry).unwrap(), text);
    }
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let point = simple_root();
    let line = Curve2::try_line(point, Point2::from_values(1, 1).into()).unwrap();
    let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![line]).unwrap()]);
    let text = export_svg_document(&geometry).unwrap();
    verify(&text);
    let limited = SvgOptions { max_point_definition_depth: 0, ..SvgOptions::default() };
    assert!(matches!(import_svg_document_with_options(&text, limited), Err(SvgError::SizeOverflow { .. })));
    assert!(matches!(export_svg_document_with_options(&geometry, limited), Err(SvgError::SizeOverflow { .. })));
    let path = std::env::temp_dir().join(format!("hypercurve-coefficient-roots-{}.svg", std::process::id()));
    std::fs::write(&path, &text).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap()).args(["--exact", "selected_coefficient_roots_replay_in_a_fresh_process_and_feed_derivatives", "--nocapture"]).env(INPUT, &path).output().unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}
