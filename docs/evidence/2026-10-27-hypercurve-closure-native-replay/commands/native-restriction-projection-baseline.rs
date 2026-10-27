use hypercurve::{Curve2, CurveParameterRange2, CurvePath2, FiniteProjectionOptions, LineSeg2, Point2, Real};
fn q(n: i32, d: i32) -> Real { (Real::from(n) / Real::from(d)).unwrap() }
fn main() {
    let source: Curve2 = LineSeg2::try_new(Point2::new(0.into(), 0.into()), Point2::new(8.into(), 0.into())).unwrap().into();
    let curve = source.restrict_source(CurveParameterRange2::try_new(q(1,4).into(), q(3,4).into()).unwrap()).unwrap();
    let path = CurvePath2::try_new(vec![curve]).unwrap();
    let result = path.project_to_finite_polyline(&FiniteProjectionOptions::try_new(0.01).unwrap());
    println!("{result:?}");
    assert_eq!(result.unwrap().points(), &[[2.0, 0.0], [6.0, 0.0]]);
}
