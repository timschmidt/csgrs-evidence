use super::*;

// Frozen conversion body from the source parent, before borrowed promotion.
fn original_promotion(curve: RationalQuadraticBezier2) -> RationalBezier2 {
    let control_points = curve.control_points().into_iter().cloned().collect();
    let weights = curve.weights().into_iter().cloned().collect();
    let implicit_quadratic_conic = curve.retained_implicit_quadratic_conic().cloned();
    let circular_conic = curve.retained_circular_conic().cloned();
    match implicit_quadratic_conic {
        Some(implicit_quadratic_conic) => RationalBezier2::try_new(control_points, weights).map(|curve| {
            curve.with_implicit_quadratic_conic(implicit_quadratic_conic, circular_conic)
        }),
        None => RationalBezier2::try_new(control_points, weights),
    }
    .expect("validated rational-quadratic controls remain valid after promotion")
}

#[test]
fn borrowed_quadratic_promotion_preserves_values_provenance_and_dispatch() {
    let point = |x: i32, y: i32| Point2::new(Real::from(x), Real::from(y));
    let mut sources = Vec::new();
    for weight in [Real::one(), Real::from(-2_i32), Real::from(2_i32).sqrt().unwrap()] {
        sources.push(RationalQuadraticBezier2::try_unit_end_weights(
            point(1, 0), point(1, 1), point(0, 1), weight,
        ).unwrap());
    }
    let circle = crate::CircularArc2::try_from_center(point(2, 0), point(2, 0), point(0, 0), false).unwrap();
    for span in circle.rational_bezier_decomposition_with_policy(&CurveContext::STRICT).unwrap().into_value().spans() {
        sources.push(span.curve().clone());
    }
    for policy in [crate::PredicatePolicy::STRICT, crate::PredicatePolicy::APPROXIMATE_512] {
        for source in &sources {
            let outcome = crate::evaluate_under(policy, || {
                #[cfg(feature = "dispatch-trace")]
                hyperreal::dispatch_trace::reset();
                #[cfg(feature = "dispatch-trace")]
                let expected = hyperreal::dispatch_trace::with_recording(|| original_promotion(source.clone()));
                #[cfg(not(feature = "dispatch-trace"))]
                let expected = original_promotion(source.clone());
                #[cfg(feature = "dispatch-trace")]
                let expected_trace = hyperreal::dispatch_trace::take_trace();
                #[cfg(feature = "dispatch-trace")]
                let actual = hyperreal::dispatch_trace::with_recording(|| RationalBezier2::from(source));
                #[cfg(not(feature = "dispatch-trace"))]
                let actual = RationalBezier2::from(source);
                #[cfg(feature = "dispatch-trace")]
                {
                    let actual_trace = hyperreal::dispatch_trace::take_trace();
                    assert_eq!(actual_trace.dispatch, expected_trace.dispatch);
                    assert_eq!(actual_trace.rational, expected_trace.rational);
                }
                assert_eq!(actual, expected);
                assert_eq!(actual.start(), source.start());
                assert_eq!(actual.end(), source.end());
                for ((control, point), weight) in actual.homogeneous_controls().iter().zip(source.control_points()).zip(source.weights()) {
                    assert_eq!(control.x(), &(point.x() * weight));
                    assert_eq!(control.y(), &(point.y() * weight));
                    assert_eq!(control.weight(), weight);
                }
                match (source.retained_circular_conic(), actual.retained_circular_conic()) {
                    (Some(source), Some(actual)) => assert!(Arc::ptr_eq(source, actual)),
                    (None, None) => {},
                    _ => panic!("circle provenance changed"),
                }
                match (source.retained_implicit_quadratic_conic(), actual.retained_implicit_quadratic_conic()) {
                    (Some(source), Some(actual)) => assert!(Arc::ptr_eq(source, actual)),
                    (None, None) => {},
                    _ => panic!("implicit provenance changed"),
                }
                assert_eq!(RationalBezier2::from(source.clone()), actual);
            });
            assert_eq!(outcome.certainty(), crate::CurveCertainty::Certified);
        }
    }
}
