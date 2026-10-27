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
    let scale=Real::from(2).sqrt().unwrap();
    let transform=Similarity2::try_from_real_affine(scale.clone(),-scale.clone(),scale.clone(),scale,3.into(),(-2).into()).unwrap();
    let path=fillet().transform_similarity(&transform).unwrap();
    let options=hypercurve::FiniteProjectionOptions::try_new(0.1).unwrap();
    let before=path.project_to_finite_polyline(&options).unwrap();
    let again=path.project_to_finite_polyline(&options).unwrap();
    println!("initial {:?}",before.points());
    println!("repeat {:?}",again.points());
    println!("repeated equal: {}",before.points()==again.points());
    if std::env::args().any(|s|s=="--replay") {
        let text=encode(path.clone());
        let replay=import_svg_document(&text).unwrap();
        let replay_cold=replay.paths()[0].project_to_finite_polyline(&options).unwrap();
        println!("replay cold {:?}",replay_cold.points());
        println!("replay equal: {}",before.points()==replay_cold.points());
        let interior=CurvePointDefinition2::Similarity {source:at(&selected(),q(9,10),q(1,20)),transform}.into_point().unwrap();
        let _=replay.paths()[0].curves()[1].point_locations(&interior).unwrap();
        let warm=replay.paths()[0].project_to_finite_polyline(&options).unwrap();
        println!("replay warm {:?}",warm.points());
        println!("query equal: {}",warm.points()==replay_cold.points());
        assert_eq!(encode(replay.paths()[0].clone()),text,"complete transformed-circle SVG must be deterministic");
    }
}
