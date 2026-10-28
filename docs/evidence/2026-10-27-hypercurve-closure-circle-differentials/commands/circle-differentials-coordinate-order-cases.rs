
fn independently_rebuilt_equal_point_pair() -> (CurvePoint2, CurvePoint2) {
    let first = center().rational_image(&RationalMap2::new(
        [polynomial(&[&[0, 1], &[1]]), polynomial(&[&[0, -1], &[1]])],
        polynomial(&[&[1]]),
    )).unwrap();
    let second = translate(&translate(&first, Real::one(), -Real::one()), -Real::one(), Real::one());
    (first, second)
}

#[test]
fn shared_field_linear_identity_zero_work_control() {
    let (first, second) = independently_rebuilt_equal_point_pair();
    for (a,b) in [(Real::one(),Real::zero()),(Real::zero(),Real::one())] {
        let result=hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, ||
            first.affine_form(a.clone(),b.clone(),Real::zero()).compare(&second.affine_form(a,b,Real::zero())));
        assert_eq!(result.result.unwrap().unwrap(), Ordering::Equal);
        assert_eq!((result.usage.refinements,result.usage.promotions),(0,0));
    }
}

#[test]
fn shared_field_coordinate_order_avoids_independent_projection() {
    let (first, second) = independently_rebuilt_equal_point_pair();
    for axis in [hypercurve::Axis2::X,hypercurve::Axis2::Y] {
        let result=hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, ||first.compare_coordinate(&second,axis));
        assert_eq!(result.result.unwrap().unwrap(), Ordering::Equal);
        assert_eq!((result.usage.refinements,result.usage.promotions),(0,0));
    }
    let mut epsilon=Real::one();
    for _ in 0..80 { epsilon=(epsilon/Real::from(2)).unwrap(); }
    let near=translate(&second,epsilon.clone(),-epsilon);
    for (axis,expected) in [(hypercurve::Axis2::X,Ordering::Less),(hypercurve::Axis2::Y,Ordering::Greater)] {
        let result=hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, ||first.compare_coordinate(&near,axis));
        assert_eq!(result.result.unwrap().unwrap(),expected);
        assert_eq!((result.usage.refinements,result.usage.promotions),(0,0));
    }
}
