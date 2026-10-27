#![allow(unused_imports)]

use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, BooleanOp, Curve2, CurveCornerMode2, CurveFamily2, CurveFillet2,
    CurveParameter2, CurvePath2, CurvePoint2, CurvePointDefinition2, CurvePointLocations2,
    CurveRegion2, ExactCurveError, FillRule, Point2, Real, RegionPointLocation, Similarity2,
    SvgError, SvgGeometry2, SvgOptions, export_svg_document, export_svg_document_with_options,
    import_svg_document, import_svg_document_with_options,
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn selected() -> CurveParameter2 {
    let mut coefficients = vec![Real::zero(); 8];
    coefficients[0] = (-1).into();
    coefficients[7] = 2.into();
    BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(coefficients).unwrap(),
            BezierParameterInterval::try_new(q(3, 4), 1.into()).unwrap(),
        )
        .unwrap(),
    )
    .into()
}
fn at(beta: &CurveParameter2, x: Real, y: Real) -> CurvePoint2 {
    beta.affine_point(1.into(), x, 0.into(), y).unwrap()
}
fn encode(path: CurvePath2) -> String {
    export_svg_document(&SvgGeometry2::new(
        CurveRegion2::empty(),
        vec![],
        vec![path],
    ))
    .unwrap()
}
fn fillet() -> CurvePath2 {
    let beta = selected();
    let path = CurvePath2::try_new(vec![
        Curve2::try_line(at(&beta, 0.into(), 0.into()), at(&beta, 1.into(), 0.into())).unwrap(),
        Curve2::try_line(at(&beta, 1.into(), 0.into()), at(&beta, 1.into(), 1.into())).unwrap(),
    ])
    .unwrap();
    let mut solutions = path
        .fillet_vertex(1, &CurveFillet2::new(q(1, 4)), CurveCornerMode2::TrimOnly)
        .unwrap()
        .into_solutions();
    assert_eq!(solutions.len(), 1);
    solutions.pop().unwrap()
}

fn main() {
    let path=fillet();
    let path=if std::env::args().any(|s|s=="--replay") {import_svg_document(&encode(path)).unwrap().paths()[0].clone()} else {path};
    let circle=&path.curves()[1];
    let beta=selected();
    let start=at(&beta,q(3,4),0.into());
    let second=at(&beta,q(19,20),q(1,10));
    let changed_neighbor=Curve2::try_line(at(&beta,q(7,4),q(1,2)),start.clone()).unwrap();
    for (first,other) in [(circle,&changed_neighbor),(&changed_neighbor,circle)] {
        let result=first.intersect_curve(other).unwrap();
        assert!(result.is_complete(),"both contacts must be consumed despite the original tangent construction");
        assert_eq!(result.contacts().len(),2);
        assert!(result.overlaps().is_empty());
        for point in [&start,&second] {assert!(result.contacts().iter().any(|c|c.point().coincides_with(point).unwrap()));}
        assert!(result.contacts().iter().all(|c|c.is_certified_transverse()));
    }
    println!("changed-neighbor endpoint and interior transverse contacts pass in both orders");
}
