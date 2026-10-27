use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveCertainty, CurveCornerMode2, CurveError, CurveFillet2,
    CurveParameter2, CurvePath2, CurvePoint2, CurvePointDefinition2, CurvePointLocations2,
    CurveRegion2, ExactCurveError, Point2, PredicatePolicy, RationalMap2, Real, Similarity2,
    SvgError, SvgGeometry2, SvgOptions, export_svg_document, export_svg_document_with_options,
    import_svg_document, import_svg_document_with_options,
};
use hypersolve::{BivariatePolynomial, IsolatedRootInterval};
use std::cmp::Ordering;

fn polynomial(rows: &[&[i32]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter()
            .map(|r| r.iter().copied().map(Real::from).collect())
            .collect(),
    )
}
fn wire_real(bytes: &mut Vec<u8>, value: Real) {
    let value = value.to_bytes();
    bytes.extend_from_slice(&u32::try_from(value.len()).unwrap().to_be_bytes());
    bytes.extend(value);
}
fn wire_polynomial(bytes: &mut Vec<u8>, polynomial: &BivariatePolynomial) {
    bytes.extend_from_slice(
        &u32::try_from(polynomial.coefficients.len())
            .unwrap()
            .to_be_bytes(),
    );
    for row in &polynomial.coefficients {
        bytes.extend_from_slice(&u32::try_from(row.len()).unwrap().to_be_bytes());
        for value in row {
            wire_real(bytes, value.clone());
        }
    }
}
fn wire_point(x: i32, y: i32) -> Vec<u8> {
    let mut bytes = vec![7];
    wire_real(&mut bytes, x.into());
    wire_real(&mut bytes, y.into());
    bytes
}
fn wire_parameter(value: i32) -> Vec<u8> {
    let mut bytes = vec![1];
    wire_real(&mut bytes, value.into());
    bytes
}
fn wire_fiber(
    parameter: u32,
    equation: &BivariatePolynomial,
    lower: Real,
    upper: Real,
    exact: Option<Real>,
) -> Vec<u8> {
    let mut bytes = vec![14];
    bytes.extend_from_slice(&parameter.to_be_bytes());
    wire_polynomial(&mut bytes, equation);
    wire_real(&mut bytes, lower);
    wire_real(&mut bytes, upper);
    bytes.push(u8::from(exact.is_some()));
    if let Some(exact) = exact {
        wire_real(&mut bytes, exact);
    }
    bytes
}
fn wire_map(source: u32, map: &RationalMap2) -> Vec<u8> {
    let mut bytes = vec![15];
    bytes.extend_from_slice(&source.to_be_bytes());
    for p in map.numerators().iter().chain([map.denominator()]) {
        wire_polynomial(&mut bytes, p);
    }
    bytes
}
fn wire_similarity(source: u32, matrix: [i32; 6]) -> Vec<u8> {
    let mut bytes = vec![16];
    bytes.extend_from_slice(&source.to_be_bytes());
    for value in matrix {
        wire_real(&mut bytes, value.into());
    }
    bytes
}
fn wire_intersection(references: [u32; 4]) -> Vec<u8> {
    let mut bytes = vec![17];
    for r in references {
        bytes.extend_from_slice(&r.to_be_bytes());
    }
    bytes
}
fn wire_support(start: u32, end: u32) -> Vec<u8> {
    let mut bytes = vec![11];
    for r in [start, end] {
        bytes.extend_from_slice(&r.to_be_bytes());
    }
    bytes.extend([0, 1]);
    bytes
}
fn wire_range(support: u32, start: u32, end: u32) -> Vec<u8> {
    let mut bytes = vec![12];
    for r in [support, start, end] {
        bytes.extend_from_slice(&r.to_be_bytes());
    }
    bytes.extend([0, 1]);
    bytes
}
fn wire_endpoint(source: u32) -> Vec<u8> {
    let mut bytes = vec![13];
    bytes.extend_from_slice(&source.to_be_bytes());
    bytes.push(1);
    bytes
}
fn wire(nodes: Vec<Vec<u8>>, paths: &[u32]) -> String {
    use std::fmt::Write;
    let mut bytes = b"HCP4".to_vec();
    bytes.extend_from_slice(&u32::try_from(nodes.len()).unwrap().to_be_bytes());
    bytes.extend(nodes.into_iter().flatten());
    bytes.extend_from_slice(&u32::try_from(paths.len()).unwrap().to_be_bytes());
    for p in paths {
        bytes.extend_from_slice(&p.to_be_bytes());
    }
    let mut metadata = String::from("4:");
    for byte in bytes {
        write!(&mut metadata, "{byte:02x}").unwrap();
    }
    format!(
        r#"<svg xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="black" data-hypercurve-path="{metadata}" d="M0 0 L1 1"/></svg>"#
    )
}
fn main() {
 let exact=wire(vec![wire_parameter(0),wire_fiber(0,&polynomial(&[&[-1,1]]),0.into(),1.into(),Some(1.into()))],&[]);
 println!("exact witness / empty path: {:?}",import_svg_document(&exact).err());
 let nodes=vec![wire_point(0,0),wire_similarity(0,[1,0,0,1,1,0]),wire_point(2,0),wire_support(1,2),wire_range(3,1,2),wire_endpoint(4),wire_similarity(5,[1,0,0,1,1,0])];
 for paths in [&[][..],&[4][..]] {
  let input=wire(nodes.clone(),paths);
  println!("depth2 / path {paths:?}: {:?}",import_svg_document_with_options(&input,SvgOptions { max_point_definition_depth:2, ..SvgOptions::default() }).err());
 }
 let exact=wire(vec![wire_parameter(0),wire_fiber(0,&polynomial(&[&[-1,1]]),0.into(),1.into(),Some(1.into())),wire_point(1,2),wire_support(1,2),wire_range(3,1,2)],&[4]);
 println!("exact witness / valid path: {:?}",import_svg_document(&exact).err());
}
