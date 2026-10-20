use hyperbrep::{ArchiveLimits, RawModel, builder};
use hypercurve::{
    BezierParameter2, BezierParameterRange2, BooleanOp, Curve2, CurveCertainty, CurvePath2,
    CurveRegion2, CurveRegionLoopRole, FillRule, LineSeg2, Point2, PredicatePolicy,
    QuadraticBezier2, Real, RegionPointLocation,
};
use std::fmt::Debug;

fn exact<T, E: Debug>(label: &str, operation: impl FnOnce() -> Result<T, E>) -> T {
    let result = hypercurve::evaluate_under(PredicatePolicy::STRICT, operation);
    assert_eq!(result.certainty(), CurveCertainty::Certified, "{label}");
    result
        .into_unverified()
        .unwrap_or_else(|error| panic!("{label}: {error:?}"))
}

fn p(x: i32, y: i32) -> Point2 {
    Point2::from_values(x, y)
}

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn line(a: Point2, b: Point2) -> Curve2 {
    LineSeg2::try_new(a, b).unwrap().into()
}

fn path_region(path: CurvePath2) -> CurveRegion2 {
    exact("path region", || {
        CurveRegion2::try_from_boundary_paths_with_loop_semantics(
            &[path],
            &[CurveRegionLoopRole::Material],
            &[FillRule::EvenOdd],
        )
    })
}

fn rectangle(x0: i32, y0: i32, x1: i32, y1: i32) -> CurvePath2 {
    let points = [p(x0, y0), p(x1, y0), p(x1, y1), p(x0, y1)];
    CurvePath2::try_new(
        (0..4)
            .map(|i| line(points[i].clone(), points[(i + 1) % 4].clone()))
            .collect(),
    )
    .unwrap()
}

fn parabola_case(operation: Option<BooleanOp>, affine: bool) -> (CurveRegion2, Real) {
    let first = CurvePath2::try_new(vec![
        QuadraticBezier2::new(p(-2, 4), p(0, -4), p(2, 4)).into(),
        line(p(2, 4), p(-2, 4)),
    ])
    .unwrap();
    let mut region = path_region(first);
    let mut area = q(32, 3);
    if let Some(operation) = operation {
        let clip = path_region(rectangle(-3, 2, 3, 5));
        region = exact("original Boolean", || {
            region.boolean_region(&clip, operation)
        });
        assert!(region.has_algebraic_fragments());
        for (point, expected) in [
            (p(0, 1), RegionPointLocation::Inside),
            (p(0, 3), RegionPointLocation::Outside),
            (p(0, 0), RegionPointLocation::Boundary),
        ] {
            assert_eq!(
                exact("original classification", || region
                    .classify_point(&point.into())),
                expected,
            );
        }
        let root = Real::from(2).sqrt().unwrap();
        area = match operation {
            BooleanOp::Difference => q(8, 3) * root,
            BooleanOp::Xor => q(22, 3) + q(16, 3) * root,
            _ => unreachable!(),
        };
    }
    if affine {
        region = exact("original affine image", || {
            region.transform_affine(
                &Real::from(-2),
                &Real::zero(),
                &Real::zero(),
                &Real::from(3),
                &Real::from(7),
                &Real::from(-1),
            )
        });
        for (point, expected) in [
            (p(7, 2), RegionPointLocation::Inside),
            (p(7, 8), RegionPointLocation::Outside),
            (p(7, -1), RegionPointLocation::Boundary),
        ] {
            assert_eq!(
                exact("original affine classification", || region
                    .classify_point(&point.into())),
                expected,
            );
        }
        area *= Real::from(6);
    }
    (region, area)
}

fn range(start: i32, end: i32) -> BezierParameterRange2 {
    exact("parallel range", || {
        BezierParameterRange2::try_new(
            BezierParameter2::Exact(start.into()),
            BezierParameter2::Exact(end.into()),
        )
    })
}

fn analytic_square() -> CurveRegion2 {
    let curves = [
        (p(0, 0), p(2, 0), p(4, 0)),
        (p(4, 0), p(4, 2), p(4, 4)),
        (p(4, 4), p(2, 4), p(0, 4)),
        (p(0, 4), p(0, 2), p(0, 0)),
    ]
    .into_iter()
    .map(|(a, b, c)| {
        let parallel = QuadraticBezier2::new(a, b, c)
            .parallel_left(Real::zero())
            .unwrap();
        exact("zero parallel", || {
            Curve2::try_analytic_parallel(parallel, range(0, 1))
        })
    })
    .collect();
    let path = exact("parallel square path", || CurvePath2::try_new(curves));
    exact("parallel square region", || {
        CurveRegion2::try_from_boundary_paths_with_loop_semantics(
            &[path],
            &[CurveRegionLoopRole::Material],
            &[FillRule::NonZero],
        )
    })
}

fn quadratic_line(a: Point2, b: Point2) -> Curve2 {
    let midpoint = a.lerp(&b, q(1, 2));
    QuadraticBezier2::new(a, midpoint, b).into()
}

fn parallel_cap() -> CurveRegion2 {
    let parallel = QuadraticBezier2::new(p(0, 0), p(2, 2), p(4, 0))
        .parallel_left(Real::one())
        .unwrap();
    let right = exact("parallel right", || parallel.point_at(&Real::one()));
    let left = exact("parallel left", || parallel.point_at(&Real::zero()));
    let analytic = exact("parallel cap", || {
        Curve2::try_analytic_parallel(parallel, range(1, 0))
    });
    let lower_left = Point2::new(left.x().clone(), Real::from(-2));
    let lower_right = Point2::new(right.x().clone(), Real::from(-2));
    let path = exact("parallel cap path", || {
        CurvePath2::try_new(vec![
            analytic,
            quadratic_line(left, lower_left.clone()),
            quadratic_line(lower_left, lower_right.clone()),
            quadratic_line(lower_right, right),
        ])
    });
    exact("parallel cap region", || {
        CurveRegion2::try_from_boundary_paths_with_loop_semantics(
            &[path],
            &[CurveRegionLoopRole::Material],
            &[FillRule::NonZero],
        )
    })
}

fn main() {
    let case = std::env::args().nth(1).expect("case");
    println!("case={case}");
    let (region, expected_area) = match case.as_str() {
        "uncut" => {
            let (region, area) = parabola_case(None, false);
            (region, Some(area))
        }
        "difference" | "affine_difference" | "xor" | "affine_xor" => {
            let op = if case.ends_with("difference") {
                BooleanOp::Difference
            } else {
                BooleanOp::Xor
            };
            let (region, area) = parabola_case(Some(op), case.starts_with("affine_"));
            (region, Some(area))
        }
        "parallel_square" => (analytic_square(), Some(Real::from(16))),
        "parallel_cap" => (parallel_cap(), None),
        _ => panic!("unknown case"),
    };
    println!("loops={}", region.boundary_loops().len());
    println!("algebraic={}", region.has_algebraic_fragments());
    for (i, boundary) in region.boundary_loops().iter().enumerate() {
        for (j, curve) in boundary.curves().iter().enumerate() {
            println!(
                "curve={i}/{j} family={:?} native={} source={} start_coordinates={} end_coordinates={} scalar_range={}",
                curve.family(),
                curve.geometry().is_some(),
                curve.source_restriction().is_some(),
                curve.start().coordinates().is_some(),
                curve.end().coordinates().is_some(),
                curve.parameter_domain().start().scalar().is_some()
                    && curve.parameter_domain().end().scalar().is_some(),
            );
        }
    }
    let area = hypercurve::evaluate_under(PredicatePolicy::STRICT, || region.signed_area());
    println!("area_certainty={:?}", area.certainty());
    match area.into_unverified() {
        Ok(Some(area)) => {
            println!("area=available");
            if let Some(expected) = &expected_area {
                let comparison =
                    hyperlimit::compare_reals(&area, expected, PredicatePolicy::STRICT);
                println!("independent_area={comparison:?}");
                assert_eq!(comparison.value(), Some(std::cmp::Ordering::Equal));
            }
        }
        Ok(None) => println!("area=unsupported"),
        Err(error) => println!("area_error={error:?}"),
    }
    let result = hypercurve::evaluate_under(PredicatePolicy::STRICT, || {
        builder::extrude_curve_region(&region, Real::zero(), Real::from(3))
    });
    println!("extrusion_certainty={:?}", result.certainty());
    let bodies = match result.into_unverified() {
        Ok(bodies) => bodies,
        Err(error) => {
            println!("extrusion_error={error:?}");
            return;
        }
    };
    println!("bodies={}", bodies.len());
    let volume: Result<Real, _> = bodies.model().solids().map(|s| s.volume()).sum();
    match volume {
        Ok(volume) => {
            println!("volume=available");
            if let Some(area) = expected_area {
                let comparison = hyperlimit::compare_reals(
                    &volume,
                    &(area * Real::from(3)),
                    PredicatePolicy::STRICT,
                );
                println!("independent_volume={comparison:?}");
                assert_eq!(comparison.value(), Some(std::cmp::Ordering::Equal));
            }
        }
        Err(error) => println!("volume_error={error:?}"),
    }
    match bodies.model().to_json() {
        Ok(text) => {
            println!("archive_bytes={}", text.len());
            match RawModel::from_json(&text, &ArchiveLimits::default()).and_then(RawModel::validate)
            {
                Ok(model) => {
                    assert_eq!(model.to_json().unwrap(), text);
                    println!("cold_replay=identical");
                }
                Err(error) => println!("cold_replay_error={error:?}"),
            }
        }
        Err(error) => println!("archive_error={error:?}"),
    }
}
