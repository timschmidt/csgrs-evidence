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
fn wire_real(bytes: &mut Vec<u8>, value: Real) {
    let value = value.to_bytes();
    bytes.extend_from_slice(&u32::try_from(value.len()).unwrap().to_be_bytes());
    bytes.extend(value);
}
fn record(tag: u8, references: &[u32]) -> Vec<u8> {
    let mut bytes = vec![tag];
    for reference in references {
        bytes.extend_from_slice(&reference.to_be_bytes());
    }
    bytes
}
fn point(x: i32, y: i32) -> Vec<u8> {
    let mut bytes = vec![7];
    wire_real(&mut bytes, x.into());
    wire_real(&mut bytes, y.into());
    bytes
}
fn chord(tag: u8, references: &[u32]) -> Vec<u8> {
    let mut bytes = record(tag, references);
    bytes.extend([0, 1]);
    bytes
}
fn circle(center: u32, anchor: u32, radius: i32) -> Vec<u8> {
    let mut bytes = record(20, &[center, anchor]);
    wire_real(&mut bytes, radius.into());
    bytes.push(1); // clockwise from the left normal, hence the right half circle
    bytes
}
fn parameter(support: u32, value: Real) -> Vec<u8> {
    let mut bytes = record(21, &[support]);
    wire_real(&mut bytes, value);
    bytes
}
fn range(support: u32, start: u32, end: u32) -> Vec<u8> {
    let mut bytes = record(23, &[support, start, end]);
    bytes.push(0);
    bytes
}
fn unit_tangent(source: u32, x: Real, y: Real) -> Vec<u8> {
    let mut bytes = record(25, &[source]);
    wire_real(&mut bytes, x);
    wire_real(&mut bytes, y);
    bytes
}
fn base() -> Vec<Vec<u8>> {
    vec![
        point(0, 0),
        point(1, 0),
        chord(11, &[0, 1]),
        chord(12, &[2, 0, 1]),
        circle(0, 3, 1),
    ]
}
fn wire(nodes: Vec<Vec<u8>>, paths: &[u32]) -> String {
    use std::fmt::Write;
    let mut bytes = b"HCP4".to_vec();
    bytes.extend_from_slice(&u32::try_from(nodes.len()).unwrap().to_be_bytes());
    bytes.extend(nodes.into_iter().flatten());
    bytes.extend_from_slice(&u32::try_from(paths.len()).unwrap().to_be_bytes());
    for path in paths {
        bytes.extend_from_slice(&path.to_be_bytes());
    }
    let mut metadata = String::from("4:");
    for byte in bytes {
        write!(&mut metadata, "{byte:02x}").unwrap();
    }
    format!(
        r#"<svg xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="black" data-hypercurve-path="{metadata}" d="M0 0 L1 1"/></svg>"#
    )
}
fn invalid(nodes: Vec<Vec<u8>>) {
    let error = import_svg_document(&wire(nodes, &[])).err();
    assert!(
        matches!(
            error,
            Some(SvgError::Exact(ExactCurveError::Invalid { .. }))
        ),
        "expected a proved invalid construction, received {error:?}"
    );
}


fn polynomial(rows:&[&[i32]])->hypercurve::BivariatePolynomial {
    hypercurve::BivariatePolynomial::new(rows.iter().map(|row|row.iter().copied().map(Real::from).collect()).collect())
}
fn main() {
    let equation=polynomial(&[&[-2,0,0,0,0,1],&[1]]);
    let center=CurvePointDefinition2::PolynomialFiber {equation:equation.clone(),parameter:selected(),root:hypercurve::IsolatedRootInterval {lower:1.into(),upper:2.into(),exact_root:None,distinct_root_count:1}}.into_point().unwrap();
    let mut root=vec![2];root.extend_from_slice(&8_u32.to_be_bytes());
    for i in 0..8 {wire_real(&mut root,if i==0 {(-1).into()} else if i==7 {2.into()} else {0.into()});}
    wire_real(&mut root,q(3,4));wire_real(&mut root,1.into());
    let mut fiber=record(14,&[0]);fiber.extend_from_slice(&u32::try_from(equation.coefficients.len()).unwrap().to_be_bytes());
    for row in &equation.coefficients {fiber.extend_from_slice(&u32::try_from(row.len()).unwrap().to_be_bytes());for value in row {wire_real(&mut fiber,value.clone());}}
    wire_real(&mut fiber,1.into());wire_real(&mut fiber,2.into());fiber.push(0);
    let nodes=vec![root,fiber,point(0,0),point(3,4),chord(11,&[2,3]),chord(12,&[4,2,3]),circle(1,5,1),parameter(6,0.into()),parameter(6,1.into()),range(6,7,8)];
    let replay=import_svg_document(&wire(nodes,&[9])).unwrap();
    let translate=|x:Real,y:Real|center.rational_image(&hypercurve::RationalMap2::new([
        hypercurve::BivariatePolynomial::new(vec![vec![x],vec![1.into()]]),
        hypercurve::BivariatePolynomial::new(vec![vec![y,1.into()]])],polynomial(&[&[1]]))).unwrap();
    let curve=&replay.paths()[0].curves()[0];
    assert!(curve.start().coincides_with(&translate(q(-4,5),q(3,5))).unwrap());
    assert!(curve.end().coincides_with(&translate(q(4,5),q(-3,5))).unwrap());
    let CurvePointLocations2::Locations(locations)=curve.point_locations(&translate(q(3,5),q(4,5))).unwrap() else {panic!("one midpoint")};assert_eq!(locations.len(),1);
    let text=encode(replay.paths()[0].clone());
    assert_eq!(encode(import_svg_document(&text).unwrap().paths()[0].clone()),text);
    println!("correlated degree-seven/five fiber circle center survives incidence and native replay");
}
