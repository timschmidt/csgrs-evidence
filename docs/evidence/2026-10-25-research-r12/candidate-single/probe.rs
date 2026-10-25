#![cfg(feature = "dispatch-trace")]

use hypercurve::{Curve2, CurvePath2, CurveRegion2, FillRule, LineSeg2, OffsetCap,
    OffsetCornerStyle2, Point2, PredicatePolicy, QuadraticBezier2, Real, RegionPointLocation,
    CurveCertainty, evaluate_under};

fn p(x: i32, y: i32) -> Point2 { Point2::from_values(x, y) }

#[test]
fn smooth_quadratic_line_stroke_uses_joint_tangent_evidence() {
    for source_kind in [0, 1, 2, 3] {
        let source = QuadraticBezier2::new(p(0, 0), p(1, 1), p(2, 1));
        let distance = if source_kind == 3 { -(Real::one()/Real::from(10)).unwrap() } else { Real::zero() };
        let join = Point2::new(2.into(), Real::one() + &distance);
        let end = Point2::new(3.into(), Real::one() + &distance);
        let first: Curve2 = match source_kind {
            0 => LineSeg2::try_new(p(0, 1), p(2, 1)).unwrap().into(),
            1 => source.into(),
            _ => Curve2::try_analytic_parallel(source.parallel_left(distance.clone()).unwrap(), hypercurve::BezierParameterRange2::try_new(hypercurve::BezierParameter2::Exact(Real::zero()), hypercurve::BezierParameter2::Exact(Real::one())).unwrap()).unwrap(),
        };
        let mut curves = Vec::new();
        if source_kind >= 2 {
            // Keep stroke-cap centers represented while the internal source
            // remains an analytic parallel. Its normal at t=0 is (-1,1)/sqrt(2).
            let dy = (&distance / Real::from(2).sqrt().unwrap()).unwrap();
            let start = Point2::new(-dy.clone(), dy);
            let lead = Point2::new(start.x() - Real::one(), start.y() - Real::one());
            curves.push(LineSeg2::try_new(lead, start).unwrap().into());
        }
        curves.push(first);
        curves.push(LineSeg2::try_new(join.clone(), end).unwrap().into());
        let path = CurvePath2::try_new(curves).unwrap();
        for reversed in [false, true] {
            let path = if reversed { path.reversed().unwrap() } else { path.clone() };
            for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
                eprintln!("R12_CASE source_kind={source_kind} reversed={reversed} policy={policy:?}");
                hyperreal::dispatch_trace::reset();
                let outcome = hyperreal::dispatch_trace::with_recording(|| evaluate_under(policy, || {
                    CurveRegion2::stroke_path(&path, (Real::one()/Real::from(10)).unwrap(), &OffsetCornerStyle2::Round, OffsetCap::Round)
                }));
                let trace = hyperreal::dispatch_trace::take_trace();
                eprintln!("R12_TOTAL joint_calls={} certainty={:?}", trace.path_count("r12", "joint", "parallel-vector"), outcome.certainty());
                assert_eq!(outcome.certainty(), CurveCertainty::Certified);
                let region = outcome.certified().unwrap().unwrap();
                for point in [path.start(), join.clone().into(), path.end()] {
                    assert_eq!(region.classify_point(&point).unwrap(), RegionPointLocation::Inside);
                }
                let rebuilt = CurveRegion2::try_from_boundary_paths(&region.boundary_paths().unwrap(), FillRule::NonZero).unwrap();
                assert_eq!(rebuilt.classify_point(&join.clone().into()).unwrap(), RegionPointLocation::Inside);
            }
        }
    }
}
