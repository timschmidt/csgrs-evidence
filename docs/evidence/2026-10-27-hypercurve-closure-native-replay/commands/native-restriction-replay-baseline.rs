use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveParameterRange2, CurvePath2, CurveRegion2,
    Point2, QuadraticBezier2, Real, SvgGeometry2, export_svg_document,
};
fn q(n: i32, d: i32) -> Real { (Real::from(n) / Real::from(d)).unwrap() }
fn point(x: i32, y: i32) -> Point2 { Point2::new(x.into(), y.into()) }
fn main() {
    let source = Curve2::from(QuadraticBezier2::new(point(0,0), point(1,2), point(2,0)));
    let beta = BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
        BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(), 0.into(), 2.into()]).unwrap(),
        BezierParameterInterval::try_new(q(1,2), q(3,4)).unwrap(),
    ).unwrap());
    let trimmed = source.restrict_source(CurveParameterRange2::try_new(Real::zero().into(), beta.into()).unwrap()).unwrap();
    assert!(trimmed.source_restriction().is_some());
    let reversed = trimmed.reversed().unwrap();
    assert!(reversed.source_restriction().is_some());
    for (name, curve) in [("authored", source), ("trimmed", trimmed), ("reversed", reversed)] {
        let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![curve]).unwrap()]);
        let result = export_svg_document(&geometry);
        match &result {
            Ok(document) => println!("{name}: exact export completed, {} bytes", document.len()),
            Err(error) => println!("{name}: {error:?}"),
        }
        if name == "authored" { assert!(result.is_ok()); }
        else { assert!(result.is_ok(), "retained exact restriction must be exportable: {name}"); }
    }
}
