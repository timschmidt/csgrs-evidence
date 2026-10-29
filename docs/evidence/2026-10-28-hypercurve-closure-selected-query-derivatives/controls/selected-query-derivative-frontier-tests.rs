
fn selected_query_derivative_source() -> (Curve2, CurveParameter2) {
    let point = joint();
    let parameter = point.affine_form(q(1, 4), q(1, 4), Real::zero()).parameter().unwrap();
    let curve: Curve2 = RationalBezier2::try_new(
        vec![Point2::new(0.into(), 0.into()), Point2::new(q(1, 2), 0.into()), Point2::new(1.into(), 1.into())],
        vec![Real::one(); 3],
    ).unwrap().into();
    (curve, parameter)
}
fn verify_selected_query_parabola_derivatives(curve: &Curve2, parameter: &CurveParameter2) {
    let jet = curve.derivatives_at(parameter, 3).expect("generated selected query parameter must feed rational derivatives");
    assert_eq!(jet.len(), 3);
    let first = jet[0].coordinate_image().unwrap();
    assert_eq!(first.affine_form(Real::one(), Real::zero(), Real::zero()).compare_to_real(&Real::one()).unwrap(), Ordering::Equal);
    assert_eq!(first.affine_form(Real::zero(), q(1, 2), Real::zero()).parameter().unwrap().compare(parameter).unwrap(), Ordering::Equal);
    assert!(jet[1].coordinate_image().unwrap().coincides_with(&Point2::new(0.into(), 2.into()).into()).unwrap());
    assert!(jet[2].coordinate_image().unwrap().coincides_with(&Point2::new(0.into(), 0.into()).into()).unwrap());
    let replay = first.definition().unwrap().into_point().unwrap();
    assert!(replay.coincides_with(&first).unwrap());
}
#[test]
fn selected_query_derivative_native_control() {
    let (curve, parameter) = selected_query_derivative_source();
    assert_relation(&curve.point_at(&parameter).unwrap(), polynomial(&[&[0, -1], &[], &[1]]));
    verify_selected_query_parabola_derivatives(&curve, &CurveParameter2::from(q(2, 3)));
    let outside = parameter.affine_image(&4.into(), &Real::zero()).unwrap();
    assert!(matches!(curve.derivative_at(&outside), Err(ExactCurveError::Invalid { .. })));
}
#[test]
fn selected_query_derivative_native_parabola() {
    let (curve, parameter) = selected_query_derivative_source();
    verify_selected_query_parabola_derivatives(&curve, &parameter);
}
#[test]
fn selected_query_derivative_retained_parabola() {
    let (curve, parameter) = selected_query_derivative_source();
    let curve = curve.restrict_source(CurveParameterRange2::try_new(CurveParameter2::from(Real::zero()), parameter.clone()).unwrap()).unwrap();
    verify_selected_query_parabola_derivatives(&curve, &parameter);
}
#[test]
fn selected_query_derivative_rational_quotient() {
    let point = joint();
    let parameter = point.affine_form(q(1, 4), q(1, 4), Real::zero()).parameter().unwrap();
    let curve: Curve2 = RationalBezier2::try_new(
        vec![Point2::new(0.into(), 0.into()), Point2::new(q(1, 2), 0.into()), Point2::new(q(1, 2), q(1, 2))],
        vec![1.into(), 1.into(), 2.into()],
    ).unwrap().into();
    // C(t)=(t,t^2)/(1+t^2): independent quotient-rule expectations.
    let t = point.rational_form(polynomial(&[&[0, 1], &[1]]), polynomial(&[&[4]])).unwrap();
    let t2 = t.multiply(&t).unwrap();
    let one = constant(&point, 1);
    let denominator = one.add(&t2).unwrap();
    let denominator2 = denominator.multiply(&denominator).unwrap();
    let dx = one.subtract(&t2).unwrap().divide(&denominator2).unwrap();
    let dy = t.scaled(&2.into()).unwrap().divide(&denominator2).unwrap();
    let derivative = curve.derivative_at(&parameter).expect("rational quotient at generated exact parameter").coordinate_image().unwrap();
    for (axis, expected) in [(polynomial(&[&[0], &[1]]), dx), (polynomial(&[&[0, 1]]), dy)] {
        assert_eq!(derivative.rational_form(axis, polynomial(&[&[1]])).unwrap().compare(&expected).unwrap(), Ordering::Equal);
    }
}
