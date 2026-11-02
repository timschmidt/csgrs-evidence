
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
    assert_eq!(lines.len(), 1, "one cut line");
    lines[0]
}

fn unique(label: &str, solutions: CurveCornerSolutions2<CurveRegion2>) -> CurveRegion2 {
    match solutions {
        CurveCornerSolutions2::Unique(region) => region,
        other => panic!("{label}: {} solutions", other.solutions().len()),
    }
}

fn cut() -> CurveRegion2 {
    let dilated = offset(&ellipse(), fraction(1, 2));
    boolean(&dilated, &region(&[polygon(&[(-10, -10), (1, -10), (1, 10), (-10, 10)])]), BooleanOp::Intersection)
}

fn chamfer(source: &CurveRegion2) -> CurveRegion2 {
    let k = cut_line(source);
    unique("chamfer", support::under(&STRICT, || source.chamfer_loop_vertex_by_setbacks(0, k, fraction(1, 8), fraction(1, 8), CurveCornerMode2::TrimOnly)).unwrap().into_value())
}

fn fillet(source: &CurveRegion2) -> CurveRegion2 {
    let k = cut_line(source);
    let n = source.boundary_loops()[0].curves().len();
    unique("fillet", support::under(&STRICT, || source.fillet_loop_vertex(0, (k + 1) % n, &CurveFillet2::new(fraction(1, 8)), CurveCornerMode2::TrimOnly)).unwrap().into_value())
}

fn closing(label: &str, source: &CurveRegion2) {
    let t = std::time::Instant::now();
    let dilated = offset(source, fraction(1, 16));
    eprintln!("PROBE {label} dilated ({:?})", t.elapsed());
    let closed = offset(&dilated, -fraction(1, 16));
    eprintln!("PROBE {label} closed ({:?})", t.elapsed());
    eprintln!("PROBE {label} equal {} ({:?})", boolean(&closed, source, BooleanOp::Xor).is_empty(), t.elapsed());
}

#[test] #[ignore] fn variant_cut() { closing("cut", &cut()); }
#[test] #[ignore] fn variant_chamfer() { closing("chamfer", &chamfer(&cut())); }
#[test] #[ignore] fn variant_fillet() { closing("fillet", &fillet(&cut())); }
#[test] #[ignore] fn variant_both() { closing("both", &fillet(&chamfer(&cut()))); }

fn circle_cut() -> CurveRegion2 {
    let disk = region(&[circle(0, 0, 1, false)]);
    let dilated = offset(&disk, fraction(1, 2));
    boolean(&dilated, &region(&[polygon(&[(-10, -10), (1, -10), (1, 10), (-10, 10)])]), BooleanOp::Intersection)
}
#[test] #[ignore] fn variant_circle_cut() { closing("circle-cut", &circle_cut()); }
#[test] #[ignore] fn variant_circle_chamfer() { closing("circle-chamfer", &chamfer(&circle_cut())); }
#[test] #[ignore] fn variant_circle_both() { closing("circle-both", &fillet(&chamfer(&circle_cut()))); }

fn plain_ellipse_cut() -> CurveRegion2 {
    boolean(&ellipse(), &region(&[polygon(&[(-10, -10), (1, -10), (1, 10), (-10, 10)])]), BooleanOp::Intersection)
}
#[test] #[ignore] fn variant_plain_cut() { closing("plain-cut", &plain_ellipse_cut()); }
#[test] #[ignore] fn variant_plain_chamfer() { closing("plain-chamfer", &chamfer(&plain_ellipse_cut())); }
