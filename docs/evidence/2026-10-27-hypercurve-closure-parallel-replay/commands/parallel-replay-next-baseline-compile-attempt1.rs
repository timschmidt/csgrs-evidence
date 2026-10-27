use hypercurve::{
    BezierParameterRange2, Curve2, CurvePath2, CurveRegion2, Point2, QuadraticBezier2,
    Real, SvgGeometry2, export_svg_document,
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn main() {
    // C(t)=(t,t^2), d=-1/4: a regular outward parallel on [0,1].
    let source = QuadraticBezier2::new(
        Point2::new(0.into(), 0.into()),
        Point2::new(q(1, 2), 0.into()),
        Point2::new(1.into(), 1.into()),
    );
    let parallel = source.parallel_left(q(-1, 4)).unwrap();
    let range = BezierParameterRange2::try_new(Real::zero().into(), Real::one().into()).unwrap();
    let curve = Curve2::try_analytic_parallel(parallel, range).unwrap();
    let view = curve.analytic_parallel().expect("retained normal-parallel definition");
    assert_eq!(view.parallel().distance(), &q(-1, 4));
    let path = CurvePath2::try_new(vec![curve]).unwrap();
    let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![path]);
    let result = export_svg_document(&geometry);
    match &result {
        Ok(document) => println!("parallel exact export completed: {} bytes", document.len()),
        Err(error) => println!("parallel exact export failed: {error:?}"),
    }
    assert!(result.is_ok(), "a selected normal parallel must retain its exact definition through native replay");
}
