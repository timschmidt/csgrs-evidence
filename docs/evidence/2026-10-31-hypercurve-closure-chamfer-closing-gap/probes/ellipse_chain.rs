
use hypercurve::{CurveCornerMode2, CurveCornerSolutions2, CurveFamily2, CurveFillet2};

fn ellipse() -> CurveRegion2 {
    let unit_disk = region(&[circle(0, 0, 1, false)]);
    support::under(&STRICT, || unit_disk.transform_affine(&Real::from(2), &Real::zero(), &Real::zero(), &Real::one(), &Real::zero(), &Real::zero())).unwrap().into_value()
}

fn cut_line(region: &CurveRegion2) -> usize {
    let curves = region.boundary_loops()[0].curves();
    let one = hypercurve::CurvePoint2::from(Point2::new(Real::one(), Real::zero()));
    let on_cut = |q: hypercurve::CurvePoint2| support::under(&STRICT, || q.compare_coordinate(&one, hypercurve::Axis2::X)).unwrap().into_value() == std::cmp::Ordering::Equal;
    let lines: Vec<usize> = curves.iter().enumerate().filter(|(_, c)| c.family() == CurveFamily2::Line && on_cut(c.start()) && on_cut(c.end())).map(|(i, _)| i).collect();
    eprintln!("PROBE families {:?}", curves.iter().map(|c| c.family()).collect::<Vec<_>>());
    assert_eq!(lines.len(), 1, "one cut line");
    lines[0]
}

fn unique(label: &str, solutions: CurveCornerSolutions2<CurveRegion2>) -> CurveRegion2 {
    match solutions {
        CurveCornerSolutions2::Unique(region) => region,
        other => panic!("{label}: {} solutions", other.solutions().len()),
    }
}

#[test]
#[ignore]
fn ellipse_chain_probe() {
    let t = std::time::Instant::now();
    let dilated = offset(&ellipse(), fraction(1, 2));
    eprintln!("PROBE dilated loops {} ({:?})", dilated.boundary_loops().len(), t.elapsed());
    let cut = boolean(&dilated, &region(&[polygon(&[(-10, -10), (1, -10), (1, 10), (-10, 10)])]), BooleanOp::Intersection);
    eprintln!("PROBE cut loops {} ({:?})", cut.boundary_loops().len(), t.elapsed());
    let k = cut_line(&cut);
    let n = cut.boundary_loops()[0].curves().len();
    let chamfered = unique("chamfer", support::under(&STRICT, || cut.chamfer_loop_vertex_by_setbacks(0, k, fraction(1, 8), fraction(1, 8), CurveCornerMode2::TrimOnly)).unwrap().into_value());
    eprintln!("PROBE chamfered ({:?})", t.elapsed());
    let k2 = cut_line(&chamfered);
    let n2 = chamfered.boundary_loops()[0].curves().len();
    let filleted = unique("fillet", support::under(&STRICT, || chamfered.fillet_loop_vertex(0, (k2 + 1) % n2, &CurveFillet2::new(fraction(1, 8)), CurveCornerMode2::TrimOnly)).unwrap().into_value());
    eprintln!("PROBE filleted ({:?}) n {n} n2 {n2}", t.elapsed());
    let _ = cut_line(&filleted);
    let d1 = offset(&filleted, fraction(1, 16));
    eprintln!("PROBE dilated again ({:?})", t.elapsed());
    let closing = offset(&d1, -fraction(1, 16));
    eprintln!("PROBE closing computed ({:?})", t.elapsed());
    eprintln!("PROBE closing equal {}", boolean(&closing, &filleted, BooleanOp::Xor).is_empty());
    eprintln!("PROBE done ({:?})", t.elapsed());
}
