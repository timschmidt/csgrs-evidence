use hyperdynamics::{
    AffineSpanAxisProjection, AxisMotionLimits, DynamicsError,
    certify_axis_projected_motion_limits, plan_axis_projected_motion_limits,
};
use hyperlimit::PredicatePolicy;
use hyperreal::{Rational, Real};
fn q(n: i64, d: i64) -> Real {
    Real::new(Rational::new(n) / Rational::new(d))
}
#[test]
fn independent_exact_minima_and_replay() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        for a in 1..=7 {
            for b in 1..=7 {
                let spans = vec![
                    AffineSpanAxisProjection {
                        absolute_axis_derivatives: vec![a.into(), b.into()],
                    },
                    AffineSpanAxisProjection {
                        absolute_axis_derivatives: vec![0.into(), b.into()],
                    },
                ];
                let axes = vec![
                    AxisMotionLimits {
                        maximum_velocity: 12.into(),
                        maximum_acceleration: 18.into(),
                        maximum_jerk: 30.into(),
                    },
                    AxisMotionLimits {
                        maximum_velocity: 20.into(),
                        maximum_acceleration: 10.into(),
                        maximum_jerk: 15.into(),
                    },
                ];
                let plan = plan_axis_projected_motion_limits(&spans, &axes, policy).unwrap();
                for (actual, bottleneck, (x, y)) in [
                    (&plan.maximum_path_feed, plan.feed_bottleneck, (12, 20)),
                    (
                        &plan.maximum_path_acceleration,
                        plan.acceleration_bottleneck,
                        (18, 10),
                    ),
                    (&plan.maximum_path_jerk, plan.jerk_bottleneck, (30, 15)),
                ] {
                    let first = x * b <= y * a;
                    assert_eq!(*actual, if first { q(x, a) } else { q(y, b) });
                    assert_eq!(bottleneck.span_index, 0);
                    assert_eq!(bottleneck.axis_index, u64::from(!first));
                }
                assert!(plan.all_satisfied());
                assert_eq!(plan.certification.rows.len(), 4);
                assert_eq!(
                    plan.certification
                        .rows
                        .iter()
                        .map(|r| (r.span_index, r.axis_index))
                        .collect::<Vec<_>>(),
                    vec![(0, 0), (0, 1), (1, 0), (1, 1)]
                );
                let unsafe_plan = certify_axis_projected_motion_limits(
                    &spans,
                    &axes,
                    Real::from(100),
                    Real::from(100),
                    Real::from(100),
                    policy,
                )
                .unwrap();
                assert!(!unsafe_plan.all_satisfied());
                assert!(unsafe_plan.rows[0].certification.has_certified_violation());
            }
        }
    }
}
#[test]
fn typed_invalid_inputs_and_precedence() {
    let axes = vec![AxisMotionLimits {
        maximum_velocity: 1.into(),
        maximum_acceleration: 2.into(),
        maximum_jerk: 3.into(),
    }];
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        assert_eq!(
            plan_axis_projected_motion_limits(&[], &axes, policy),
            Err(DynamicsError::EmptyAxisProjection)
        );
        for (derivatives, error) in [
            (vec![], DynamicsError::AxisProjectionShapeMismatch),
            (vec![0.into()], DynamicsError::DegenerateAxisProjection),
            (vec![(-1).into()], DynamicsError::NegativeAxisProjection),
        ] {
            assert_eq!(
                plan_axis_projected_motion_limits(
                    &[AffineSpanAxisProjection {
                        absolute_axis_derivatives: derivatives
                    }],
                    &axes,
                    policy
                ),
                Err(error)
            );
        }
    }
}

#[test]
fn unresolved_sign_does_not_become_zero_under_strict_policy() {
    let value = (Real::pi() * Real::e()).ln().unwrap()
        - (Real::pi().ln().unwrap() + Real::e().ln().unwrap());
    let axes = [AxisMotionLimits {
        maximum_velocity: 1.into(),
        maximum_acceleration: 2.into(),
        maximum_jerk: 3.into(),
    }];
    assert_eq!(
        plan_axis_projected_motion_limits(
            &[AffineSpanAxisProjection {
                absolute_axis_derivatives: vec![value]
            }],
            &axes,
            PredicatePolicy::STRICT
        ),
        Err(DynamicsError::PredicateUnresolved)
    );
}
