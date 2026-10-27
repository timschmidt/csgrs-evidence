use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, BezierParameterRange2, Curve2, CurvePath2,
    CurvePointLocations2, FiniteProjectionOptions, Point2, QuadraticBezier2, Real,
};
fn q(n: i32, d: i32) -> Real { (Real::from(n) / Real::from(d)).unwrap() }
fn main() {
    let beta = BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
        BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(), 0.into(), 2.into()]).unwrap(),
        BezierParameterInterval::try_new(q(1,2), q(3,4)).unwrap(),
    ).unwrap());
    let source = QuadraticBezier2::new(Point2::from_values(0,0),Point2::new(q(1,2),0.into()),Point2::from_values(1,1));
    let curve = Curve2::try_analytic_parallel(source.parallel_left(q(-1,4)).unwrap(),BezierParameterRange2::try_new(BezierParameter2::Exact(Real::zero()),beta).unwrap()).unwrap();
    let endpoint = curve.end();
    endpoint.definition().unwrap();
    let chord = Curve2::try_line(endpoint,Point2::from_values(2,0).into()).unwrap();
    let path = CurvePath2::try_new(vec![curve,chord]).unwrap();
    let options = FiniteProjectionOptions::try_new(0.01).unwrap();
    let first = path.project_to_finite_polyline(&options).unwrap();
    let t=q(1,2).sqrt().unwrap();let speed=Real::from(3).sqrt().unwrap();
    let expected = Point2::new(&t+(&t/(Real::from(2)*&speed)).unwrap(),q(1,2)-(q(1,4)/speed).unwrap()).into();
    assert!(path.curves()[1].start().coincides_with(&expected).unwrap());
    let CurvePointLocations2::Locations(locations)=path.curves()[1].point_locations(&expected).unwrap() else { panic!("one shared endpoint") };
    assert_eq!(locations.len(),1);
    let second=path.project_to_finite_polyline(&options).unwrap();
    println!("exact point queries pass; projection sizes: {} then {}",first.points().len(),second.points().len());
    println!("before: {:?}\nafter: {:?}",first.points(),second.points());
    assert_eq!(first.points(),second.points(),"exact queries must not alter deterministic finite serialization");
}
