#![cfg(feature = "svg")]

use hypercurve::{
    BezierParallel2, BezierParameter2, BezierParameterRange2, CubicBezier2, Curve2,
    CurveParameterRange2, CurvePath2, CurveRegion2, FillRule, LineSeg2, OffsetCornerStyle2, Point2,
    QuadraticBezier2, RationalQuadraticBezier2, Real, RegionPointLocation, SvgGeometry2,
    export_svg_document, import_svg_document,
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn point(x: i32, y: i32) -> Point2 {
    Point2::new(x.into(), y.into())
}

fn exact(value: Real) -> BezierParameter2 {
    BezierParameter2::Exact(value)
}

fn range(start: BezierParameter2, end: BezierParameter2) -> BezierParameterRange2 {
    BezierParameterRange2::try_new(start, end).unwrap()
}

fn unit_curve(parallel: BezierParallel2) -> Curve2 {
    Curve2::try_analytic_parallel(parallel, range(exact(Real::zero()), exact(Real::one()))).unwrap()
}

fn document(path: CurvePath2) -> String {
    export_svg_document(&SvgGeometry2::new(
        CurveRegion2::empty(),
        vec![],
        vec![path],
    ))
    .unwrap()
}

fn parabola() -> QuadraticBezier2 {
    QuadraticBezier2::new(point(0, 0), Point2::new(q(1, 2), 0.into()), point(1, 1))
}

#[test]
fn parallel_sources_replay_without_changing_their_family_or_normal_side() {
    let sqrt2 = Real::from(2).sqrt().unwrap();
    let sqrt5 = Real::from(5).sqrt().unwrap();
    let ellipse = RationalQuadraticBezier2::try_new(
        point(2, 0),
        point(2, 1),
        point(0, 1),
        Real::one(),
        (&sqrt2 / Real::from(2)).unwrap(),
        Real::one(),
    )
    .unwrap();
    // C(t)=(t-t^3/3,t^2), with exact speed 1+t^2.
    let ph = CubicBezier2::new(
        point(0, 0),
        Point2::new(q(1, 3), 0.into()),
        Point2::new(q(2, 3), q(1, 3)),
        Point2::new(q(2, 3), 1.into()),
    );
    let cases = [
        (
            parabola().parallel_left(q(-1, 4)).unwrap(),
            Point2::new(
                q(1, 2) + (q(1, 4) / &sqrt2).unwrap(),
                q(1, 4) - (q(1, 4) / &sqrt2).unwrap(),
            ),
        ),
        (
            ellipse.parallel_left(q(-1, 8)).unwrap(),
            Point2::new(
                &sqrt2 + (q(1, 8) / &sqrt5).unwrap(),
                (&sqrt2 / Real::from(2)).unwrap() + (q(1, 4) / &sqrt5).unwrap(),
            ),
        ),
        (
            ph.parallel_left(q(1, 4)).unwrap(),
            Point2::new(q(31, 120), q(2, 5)),
        ),
        (
            QuadraticBezier2::new(point(0, 0), point(0, 0), point(1, 1))
                .parallel_left(Real::zero())
                .unwrap(),
            Point2::new(q(1, 4), q(1, 4)),
        ),
    ];
    for (parallel, expected) in cases {
        let original = unit_curve(parallel.clone());
        let encoded = document(
            CurvePath2::try_new(vec![original.clone(), original.reversed().unwrap()]).unwrap(),
        );
        let replay = import_svg_document(&encoded).unwrap();
        let curves = replay.paths()[0].curves();
        let forward = curves[0].analytic_parallel().unwrap();
        let reverse = curves[1].analytic_parallel().unwrap();
        assert_eq!(forward.parallel().source(), parallel.source());
        assert_eq!(forward.parallel().distance(), parallel.distance());
        assert!(!forward.is_reversed() && reverse.is_reversed());
        assert!(std::ptr::eq(
            forward.parallel().distance(),
            reverse.parallel().distance()
        ));
        assert!(
            curves[0]
                .point_at(&q(1, 2).into())
                .unwrap()
                .coincides_with(&expected.into())
                .unwrap()
        );
        let contacts = curves[0].intersect_curve(&curves[1]).unwrap();
        assert!(contacts.is_complete());
        assert_eq!(contacts.overlaps().len(), 1);
        assert_eq!(document(replay.paths()[0].clone()), encoded);
    }
}

#[test]
fn cusp_split_replay_keeps_one_support_and_selected_boundary() {
    let parallel = parabola().parallel_left(Real::one()).unwrap();
    let analysis = parallel
        .singularity_analysis(&CurveParameterRange2::unit())
        .unwrap();
    let [cusp] = analysis.parallel_cusps() else {
        panic!("one selected cusp")
    };
    let first =
        Curve2::try_analytic_parallel(parallel.clone(), range(exact(Real::zero()), cusp.clone()))
            .unwrap();
    let second =
        Curve2::try_analytic_parallel(parallel.clone(), range(cusp.clone(), exact(Real::one())))
            .unwrap();
    let encoded = document(CurvePath2::try_new(vec![first, second]).unwrap());
    let replay = import_svg_document(&encoded).unwrap();
    let curves = replay.paths()[0].curves();
    let first = curves[0].analytic_parallel().unwrap();
    let second = curves[1].analytic_parallel().unwrap();
    assert!(std::ptr::eq(
        first.parallel().distance(),
        second.parallel().distance()
    ));
    assert_eq!(
        first.range().end().compare(&cusp.clone().into()).unwrap(),
        std::cmp::Ordering::Equal
    );
    assert_eq!(
        second.range().start().compare(first.range().end()).unwrap(),
        std::cmp::Ordering::Equal
    );
    assert!(curves[0].end().coincides_with(&curves[1].start()).unwrap());
    let first_parameter = first.range().end().as_bezier_parameter().unwrap();
    let second_parameter = second.range().start().as_bezier_parameter().unwrap();
    let (BezierParameter2::Algebraic(first_root), BezierParameter2::Algebraic(second_root)) =
        (first_parameter, second_parameter)
    else {
        panic!("selected algebraic cusp")
    };
    assert!(std::ptr::eq(
        first_root.polynomial(),
        second_root.polynomial()
    ));
    assert!(
        Curve2::try_analytic_parallel(parallel, range(exact(Real::zero()), exact(Real::one())))
            .is_err()
    );
}

fn cap_path() -> CurvePath2 {
    let parallel = QuadraticBezier2::new(point(0, 0), point(2, 2), point(4, 0))
        .parallel_left(Real::one())
        .unwrap();
    let left = parallel.point_at(&Real::zero()).unwrap();
    let right = parallel.point_at(&Real::one()).unwrap();
    let lower_left = Point2::new(left.x().clone(), (-2).into());
    let lower_right = Point2::new(right.x().clone(), (-2).into());
    CurvePath2::try_new(vec![
        unit_curve(parallel).reversed().unwrap(),
        LineSeg2::try_new(left, lower_left.clone()).unwrap().into(),
        LineSeg2::try_new(lower_left, lower_right.clone())
            .unwrap()
            .into(),
        LineSeg2::try_new(lower_right, right).unwrap().into(),
    ])
    .unwrap()
}

fn verify_cap(document: &str) {
    let replay = import_svg_document(document).unwrap();
    let path = &replay.paths()[0];
    let parallel = path.curves()[0].analytic_parallel().unwrap();
    assert!(parallel.is_reversed());
    assert_eq!(parallel.parallel().distance(), &Real::one());
    assert!(
        path.curves()[0]
            .point_at(&q(1, 2).into())
            .unwrap()
            .coincides_with(&point(2, 2).into())
            .unwrap()
    );
    let region = CurveRegion2::try_from_boundary_paths(replay.paths(), FillRule::NonZero).unwrap();
    assert_eq!(
        region.classify_point(&point(2, 0).into()).unwrap(),
        RegionPointLocation::Inside
    );
    assert_eq!(
        region.classify_point(&point(2, 3).into()).unwrap(),
        RegionPointLocation::Outside
    );
    assert!(
        region
            .boolean_regions(&region)
            .unwrap()
            .difference()
            .is_empty()
    );
    let expanded = region.offset(q(1, 16), &OffsetCornerStyle2::Round).unwrap();
    assert!(
        expanded
            .boolean_regions(&expanded)
            .unwrap()
            .difference()
            .is_empty()
    );
    assert_eq!(
        expanded.classify_point(&point(2, 0).into()).unwrap(),
        RegionPointLocation::Inside
    );
}

#[test]
fn fresh_process_replays_a_parallel_boundary_before_boolean_and_offset() {
    const INPUT: &str = "HYPERCURVE_PARALLEL_SVG_REPLAY_INPUT";
    if let Some(path) = std::env::var_os(INPUT) {
        verify_cap(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let encoded = document(cap_path());
    let path = std::env::temp_dir().join(format!(
        "hypercurve-parallel-svg-{}.svg",
        std::process::id()
    ));
    std::fs::write(&path, encoded).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args([
            "--exact",
            "fresh_process_replays_a_parallel_boundary_before_boolean_and_offset",
            "--nocapture",
        ])
        .env(INPUT, &path)
        .output()
        .unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(
        output.status.success(),
        "{}{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}
