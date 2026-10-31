// TEMPORARY encoding probe (not for commit).
use super::*;
use crate::{CurveCornerMode2, CurveCornerSolutions2, CurveFamily2, OffsetCornerStyle2};

fn p(x: i64, y: i64) -> Point2 { Point2::new(Real::from(x), Real::from(y)) }
fn polygon(points: &[(i64, i64)]) -> CurvePath2 {
    CurvePath2::try_new((0..points.len()).map(|i| { let (a, b) = (points[i], points[(i + 1) % points.len()]); Curve2::from(LineSeg2::try_new(p(a.0, a.1), p(b.0, b.1)).unwrap()) }).collect()).unwrap()
}

#[test]
#[ignore]
fn chamfer_encoding_probe() {
    let circle = CurvePath2::try_new(vec![
        Curve2::from(CircularArc2::try_from_center(p(1, 0), p(-1, 0), p(0, 0), false).unwrap()),
        Curve2::from(CircularArc2::try_from_center(p(-1, 0), p(1, 0), p(0, 0), false).unwrap()),
    ]).unwrap();
    let disk = CurveRegion2::try_from_boundary_paths(&[circle], FillRule::NonZero).unwrap();
    let ellipse = disk.transform_affine(&Real::from(2), &Real::zero(), &Real::zero(), &Real::one(), &Real::zero(), &Real::zero()).unwrap();
    let boxed = CurveRegion2::try_from_boundary_paths(&[polygon(&[(-10, -10), (1, -10), (1, 10), (-10, 10)])], FillRule::NonZero).unwrap();
    let cut = ellipse.boolean_region(&boxed, BooleanOp::Intersection).unwrap();
    let curves = cut.boundary_loops()[0].curves();
    eprintln!("PROBE cut families {:?}", curves.iter().map(|c| c.family()).collect::<Vec<_>>());
    let k = curves.iter().position(|c| c.family() == CurveFamily2::Line).unwrap();
    let CurveCornerSolutions2::Unique(chamfered) = cut.chamfer_loop_vertex_by_setbacks(0, k, (Real::one() / Real::from(8)).unwrap(), (Real::one() / Real::from(8)).unwrap(), CurveCornerMode2::TrimOnly).unwrap() else { panic!() };
    let options = SvgOptions::default();
    for (i, curve) in chamfered.boundary_loops()[0].curves().iter().enumerate() {
        let fragment = curve.retained_fragment().map(|f| { let d = format!("{f:?}"); d[..d.len().min(70)].to_string() });
        let path = CurvePath2::try_new_raw(vec![curve.clone()], &CurveContext::STRICT);
        let encoded = path.map(|path| exact::encode_paths(&[path], options.max_extension_bytes, options.max_point_definition_depth).map(|_| ()));
        eprintln!("PROBE {i} {:?} native {} restriction {} parallel {} fragment {:?} -> {:?}", curve.family(), curve.geometry().is_some(), curve.source_restriction().is_some(), curve.analytic_parallel().is_some(), fragment, encoded.map(|r| r.err().map(|e| e.to_string())));
    }
    let _ = OffsetCornerStyle2::Round;
}
