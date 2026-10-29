from pathlib import Path
w=Path('/home/tim/Documents/GitHub/workspace/csgrs-closure-work/selected-polynomial-points')
c=Path('/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-closure-work/controls')
s=(c/'polynomial-point-composition-tests.rs').read_text()
s+='''
fn q(a: i32, b: i32) -> Real { (Real::from(a) / Real::from(b)).unwrap() }
fn joint() -> CurvePoint2 { y(&cube_point(2)).add(&y(&cube_point(3))).unwrap().source().clone() }
fn assert_relation(point: &CurvePoint2, relation: BivariatePolynomial) {
    assert_eq!(point.rational_form(relation, polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
}

#[test]
fn independent_equal_selections_and_original_denominators_compose() {
    let a = y(&cube_point(2));
    let b = y(&cube_point(2));
    assert_eq!(a.subtract(&b).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
    let point = cube_point(3);
    let denominator = polynomial(&[&[-1, 1]]);
    let reciprocal = point.rational_form(polynomial(&[&[1]]), denominator.clone()).unwrap();
    let product = a.multiply(&reciprocal).unwrap();
    assert_eq!(product.multiply(&point.rational_form(denominator, polynomial(&[&[1]])).unwrap()).unwrap().compare(&a).unwrap(), Ordering::Equal);
    let CurvePointDefinition2::RationalQueryPair { sources, denominators, .. } = product.source().definition().unwrap() else { panic!("joint source") };
    assert!(sources[1].coincides_with(&point).unwrap());
    assert_eq!(denominators[1], polynomial(&[&[-1, 1]]));
}

#[test]
fn selected_query_parameters_feed_affine_and_rational_evaluation() {
    let point = joint();
    let sum = point.affine_form(1.into(), 1.into(), 0.into()).parameter().unwrap();
    assert!(sum.scalar().is_none());
    assert_eq!(sum.compare(&CurveParameter2::from(Real::from(2))).unwrap(), Ordering::Greater);
    assert_eq!(sum.compare(&CurveParameter2::from(Real::from(3))).unwrap(), Ordering::Less);
    let t = sum.affine_image(&q(1, 4), &Real::zero()).unwrap();
    let inverse = t.affine_image(&4.into(), &Real::zero()).unwrap();
    assert_eq!(inverse.compare(&sum).unwrap(), Ordering::Equal);
    let image = t.affine_point(4.into(), 0.into(), (-4).into(), 5.into()).unwrap();
    assert_relation(&image, polynomial(&[&[-5, 1], &[1]]));
    assert_eq!(image.affine_form(1.into(), 0.into(), 0.into()).parameter().unwrap().compare(&sum).unwrap(), Ordering::Equal);
    // Rational quadratic t -> (t, t^2), evaluated in the same retained field.
    let curve: Curve2 = RationalBezier2::try_new(vec![Point2::new(0.into(), 0.into()), Point2::new(q(1, 2), 0.into()), Point2::new(1.into(), 1.into())], vec![Real::one(); 3]).unwrap().into();
    let evaluated = curve.point_at(&t).unwrap();
    assert_relation(&evaluated, polynomial(&[&[0, -1], &[], &[1]]));
    assert_eq!(evaluated.affine_form(1.into(), 0.into(), 0.into()).parameter().unwrap().compare(&t).unwrap(), Ordering::Equal);
    let replay = evaluated.definition().unwrap().into_point().unwrap();
    assert!(replay.coincides_with(&evaluated).unwrap());
}

#[test]
fn mixed_algebraic_base_and_independent_fiber_keep_original_relations() {
    let base = BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
        BezierParameterPolynomial::try_new_power_basis(vec![(-2).into(), 0.into(), 0.into(), 0.into(), 0.into(), 0.into(), 0.into(), 1.into()]).unwrap(),
        BezierParameterInterval::try_new(1.into(), 2.into()).unwrap()).unwrap());
    let point = CurvePointDefinition2::PolynomialFiber {
        equation: polynomial(&[&[0, 0, 0, 1], &[-1]]), parameter: base,
        root: IsolatedRootInterval { lower: 1.into(), upper: 2.into(), exact_root: None, distinct_root_count: 1 },
    }.into_point().unwrap();
    let result = y(&point).add(&y(&cube_point(3))).unwrap();
    let mut relation = vec![vec![Real::zero()]; 22];
    relation[0][0] = (-2).into(); relation[21][0] = Real::one();
    assert_relation(result.source(), BivariatePolynomial::new(relation));
    assert_relation(result.source(), polynomial(&[&[-3, 0, 0, 1]]));
    assert!(result.source().definition().unwrap().into_point().unwrap().coincides_with(result.source()).unwrap());
}

#[test]
fn joint_query_replay_rejects_a_zero_original_guard() {
    let point = joint();
    let CurvePointDefinition2::RationalQueryPair { sources, numerators, mut denominators } = point.definition().unwrap() else { panic!("joint source") };
    denominators[1] = polynomial(&[&[-3, 0, 0, 1]]);
    assert!(matches!(CurvePointDefinition2::RationalQueryPair { sources, numerators, denominators }.into_point(), Err(ExactCurveError::Invalid { cause: CurveError::ZeroRationalPointDenominator, .. })));
}

#[test]
fn independent_query_budget_refusal_does_not_poison_retry() {
    use hypersolve::work_budget::{WorkBudget, with_budget};
    let a = y(&cube_point(2)); let b = y(&cube_point(3));
    let result = with_budget(WorkBudget { refinements: 4096, promotions: 0 }, || {
        assert!(matches!(a.add(&b), Err(ExactCurveError::Blocked(ref blocker)) if blocker.reason() == UncertaintyReason::BudgetExhausted));
    });
    assert!(result.result.is_err());
    let result = a.add(&b).unwrap();
    assert_eq!(result.compare_to_real(&2.into()).unwrap(), Ordering::Greater);
}

#[cfg(feature = "svg")]
#[test]
fn joint_point_native_replay_in_fresh_process_then_further_queries() {
    const INPUT: &str = "HYPERCURVE_JOINT_QUERY_REPLAY";
    fn verify(text: &str) {
        let replay = import_svg_document(text).unwrap();
        let line = &replay.paths()[0].curves()[0];
        let point = line.start();
        assert_relation(&point, polynomial(&[&[-2], &[], &[], &[1]]));
        assert_relation(&point, polynomial(&[&[-3, 0, 0, 1]]));
        let sum = point.rational_form(polynomial(&[&[0, 1], &[1]]), polynomial(&[&[1]])).unwrap();
        assert_eq!(sum.compare_to_real(&2.into()).unwrap(), Ordering::Greater);
        assert_eq!(sum.compare_to_real(&3.into()).unwrap(), Ordering::Less);
        assert_eq!(sum.add(&y(&cube_point(2))).unwrap().subtract(&sum).unwrap().compare(&y(&cube_point(2))).unwrap(), Ordering::Equal);
        let end = line.end();
        assert_eq!(end.affine_form(1.into(), 0.into(), (-1).into()).parameter().unwrap().compare(&point.affine_form(1.into(), 0.into(), 0.into()).parameter().unwrap()).unwrap(), Ordering::Equal);
        assert_eq!(export_svg_document(&replay).unwrap(), text);
    }
    if let Some(path) = std::env::var_os(INPUT) { verify(&std::fs::read_to_string(path).unwrap()); return; }
    let point = joint();
    let end = point.rational_image(&RationalMap2::new([polynomial(&[&[1], &[1]]), polynomial(&[&[0, 1]])], polynomial(&[&[1]]))).unwrap();
    let line = Curve2::try_line(point, end).unwrap();
    let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![line]).unwrap()]);
    let text = export_svg_document(&geometry).unwrap();
    verify(&text);
    let path = std::env::temp_dir().join(format!("hypercurve-joint-query-{}-{}.svg", std::process::id(), std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos()));
    std::fs::write(&path, text).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap()).args(["--exact", "joint_point_native_replay_in_fresh_process_then_further_queries", "--nocapture"]).env(INPUT, &path).output().unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}
'''
p=w/'crates/hypercurve/tests/selected_polynomial_points.rs';assert not p.exists();p.write_text(s)
