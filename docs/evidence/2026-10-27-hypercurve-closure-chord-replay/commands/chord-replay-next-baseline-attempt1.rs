use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveParameter2, CurvePath2, CurvePointDefinition2,
    CurvePointLocations2, CurveRegion2, Real, SvgGeometry2, export_svg_document,
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn main() {
    let mut coefficients = vec![Real::zero(); 8];
    coefficients[0] = (-1).into();
    coefficients[7] = 2.into();
    let beta: CurveParameter2 = BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(coefficients).unwrap(),
            BezierParameterInterval::try_new(q(3, 4), Real::one()).unwrap(),
        )
        .unwrap(),
    )
    .into();
    let at = |y| beta.affine_point(1.into(), 0.into(), 0.into(), Real::from(y)).unwrap();
    let start = at(0);
    let end = at(2);
    assert!(start.coordinates().is_none() && end.coordinates().is_none());
    assert!(matches!(start.definition().unwrap(), CurvePointDefinition2::RationalExpression { .. }));
    let chord = Curve2::try_line(start, end).unwrap();
    assert!(chord.geometry().is_none());
    let CurvePointLocations2::Locations(locations) = chord.point_locations(&at(1)).unwrap() else {
        panic!("one selected chord midpoint")
    };
    assert_eq!(locations.len(), 1);
    let (first, second) = chord.split_at(locations[0].parameter().unwrap().clone()).unwrap();
    assert!(first.end().coincides_with(&second.start()).unwrap());
    let path = CurvePath2::try_new(vec![first, second]).unwrap();
    let result = export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![path]));
    println!("selected degree-seven chord export: {result:?}");
    assert!(result.is_ok(), "exact generated chords must retain their selected endpoints and support through replay");
}
