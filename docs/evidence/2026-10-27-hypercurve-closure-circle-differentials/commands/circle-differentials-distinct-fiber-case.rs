
#[test]
fn coordinate_order_keeps_distinct_selected_fiber_fallback() {
    let first=center();
    let CurvePointDefinition2::PolynomialFiber {parameter,root,..}=first.definition().unwrap() else {panic!("original selected fiber");};
    let second=CurvePointDefinition2::PolynomialFiber {
        equation:polynomial(&[&[-3,0,0,0,0,1],&[1]]), parameter,root,
    }.into_point().unwrap();
    // The same beta is shared; gamma_2^5-gamma_1^5=1 and both are positive.
    // These are distinct fibers, so a common-point source cannot be assumed.
    for (a,b) in [
        (first.clone(),second.clone()),
        (translate(&first,Real::one(),-Real::one()),translate(&second,Real::one(),-Real::one())),
    ] {
        assert_eq!(a.compare_coordinate(&b,hypercurve::Axis2::X).unwrap(),Ordering::Equal);
        assert_eq!(a.compare_coordinate(&b,hypercurve::Axis2::Y).unwrap(),Ordering::Less);
        assert_eq!(b.compare_coordinate(&a,hypercurve::Axis2::Y).unwrap(),Ordering::Greater);
        assert!(!a.coincides_with(&b).unwrap());
    }
}
