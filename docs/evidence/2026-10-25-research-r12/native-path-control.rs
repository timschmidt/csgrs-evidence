#![cfg(feature = "dispatch-trace")]

use hypercurve::{Curve2, CurvePath2, CurveRegion2, FillRule, LineSeg2, OffsetCap,
    OffsetCornerStyle2, Point2, PredicatePolicy, QuadraticBezier2, Real, RegionPointLocation,
    CurveCertainty, evaluate_under};

fn p(x: i32, y: i32) -> Point2 { Point2::from_values(x, y) }

#[test]
fn smooth_quadratic_line_stroke_uses_joint_tangent_evidence() {
    for curved in [true, false] {
        let first: Curve2 = if curved {
            QuadraticBezier2::new(p(0, 0), p(1, 1), p(2, 1)).into()
        } else { LineSeg2::try_new(p(0, 1), p(2, 1)).unwrap().into() };
        let path = CurvePath2::try_new(vec![first, LineSeg2::try_new(p(2, 1), p(3, 1)).unwrap().into()]).unwrap();
        for reversed in [false, true] {
            let path = if reversed { path.reversed().unwrap() } else { path.clone() };
            for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
                eprintln!("R12_CASE curved={curved} reversed={reversed} policy={policy:?}");
                hyperreal::dispatch_trace::reset();
                let outcome = hyperreal::dispatch_trace::with_recording(|| evaluate_under(policy, || {
                    CurveRegion2::stroke_path(&path, (Real::one()/Real::from(10)).unwrap(), &OffsetCornerStyle2::Round, OffsetCap::Round)
                }));
                let trace = hyperreal::dispatch_trace::take_trace();
                eprintln!("R12_TOTAL joint_calls={} certainty={:?}", trace.path_count("r12", "joint", "parallel-vector"), outcome.certainty());
                assert_eq!(outcome.certainty(), CurveCertainty::Certified);
                let region = outcome.certified().unwrap().unwrap();
                for point in [path.start(), p(2, 1).into(), path.end()] {
                    assert_eq!(region.classify_point(&point).unwrap(), RegionPointLocation::Inside);
                }
                let rebuilt = CurveRegion2::try_from_boundary_paths(&region.boundary_paths().unwrap(), FillRule::NonZero).unwrap();
                assert_eq!(rebuilt.classify_point(&p(2, 1).into()).unwrap(), RegionPointLocation::Inside);
            }
        }
    }
}
