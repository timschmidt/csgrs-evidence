// TEMPORARY provenance probe (not for commit).
use super::*;
use crate::{BezierSplitFragment2, BooleanOp, CircularArc2, Curve2, CurveCornerMode2, CurveCornerSolutions2, CurveFamily2, CurvePath2, CurveRegion2, FillRule, LineSeg2, OffsetCornerStyle2};

fn q(n: i64, d: i64) -> Real { (Real::from(n) / Real::from(d)).unwrap() }
fn p(x: i64, y: i64) -> Point2 { Point2::new(Real::from(x), Real::from(y)) }
fn polygon(points: &[(i64, i64)]) -> CurvePath2 {
    CurvePath2::try_new((0..points.len()).map(|i| { let (a, b) = (points[i], points[(i + 1) % points.len()]); Curve2::from(LineSeg2::try_new(p(a.0, a.1), p(b.0, b.1)).unwrap()) }).collect()).unwrap()
}
fn kind(q: &CurvePoint2) -> String { format!("{:?}", q.0).split(['(', ' ', '{']).next().unwrap_or("").to_string() }
fn describe(chord: &BezierAlgebraicChord2) -> String {
    let mut chain = vec![];
    let mut current = chord;
    loop {
        chain.push(format!("{:p}[{}->{}]", Arc::as_ptr(&current.data), kind(current.start()), kind(current.end())));
        match current.data.source.as_ref() { Some(source) => current = source, None => break }
    }
    chain.join(" <- ")
}
fn dump(label: &str, region: &CurveRegion2) {
    let fragments = region.boundary_loops()[0].fragments();
    for (i, fragment) in fragments.iter().enumerate() {
        match fragment {
            BezierSplitFragment2::AlgebraicChord(chord) => eprintln!("PROBE {label} {i} chord {}", describe(chord)),
            other => { let d = format!("{other:?}"); eprintln!("PROBE {label} {i} {}", &d[..d.len().min(50)]); }
        }
    }
}

#[test]
#[ignore]
fn chamfer_dilation_provenance() {
    let circle = CurvePath2::try_new(vec![
        Curve2::from(CircularArc2::try_from_center(p(1, 0), p(-1, 0), p(0, 0), false).unwrap()),
        Curve2::from(CircularArc2::try_from_center(p(-1, 0), p(1, 0), p(0, 0), false).unwrap()),
    ]).unwrap();
    let disk = CurveRegion2::try_from_boundary_paths(&[circle], FillRule::NonZero).unwrap();
    let ellipse = disk.transform_affine(&Real::from(2), &Real::zero(), &Real::zero(), &Real::one(), &Real::zero(), &Real::zero()).unwrap();
    let dilated = ellipse.offset(q(1, 2), &OffsetCornerStyle2::Round).unwrap();
    let boxed = CurveRegion2::try_from_boundary_paths(&[polygon(&[(-10, -10), (1, -10), (1, 10), (-10, 10)])], FillRule::NonZero).unwrap();
    let cut = dilated.boolean_region(&boxed, BooleanOp::Intersection).unwrap();
    let curves = cut.boundary_loops()[0].curves();
    let k = curves.iter().position(|c| c.family() == CurveFamily2::Line).unwrap();
    let CurveCornerSolutions2::Unique(chamfered) = cut.chamfer_loop_vertex_by_setbacks(0, k, q(1, 8), q(1, 8), CurveCornerMode2::TrimOnly).unwrap() else { panic!() };
    dump("chamfered", &chamfered);
    let d1 = chamfered.offset(q(1, 16), &OffsetCornerStyle2::Round).unwrap();
    dump("dilated", &d1);
    let fragments = d1.boundary_loops()[0].curves();
    for i in 0..fragments.len() {
        let (end, start) = (fragments[i].end(), fragments[(i + 1) % fragments.len()].start());
        eprintln!("PROBE junction {i}->{}: end {} start {} shares {} equal {}", (i + 1) % fragments.len(), kind(&end), kind(&start), end.shares_storage(&start), end == start);
    }
}
