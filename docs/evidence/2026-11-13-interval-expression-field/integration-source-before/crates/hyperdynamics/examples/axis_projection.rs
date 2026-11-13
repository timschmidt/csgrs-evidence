use hyperdynamics::{
    AffineSpanAxisProjection, AxisMotionLimits, plan_axis_projected_motion_limits,
};
fn main() {
    let p = AffineSpanAxisProjection {
        absolute_axis_derivatives: vec![2.into()],
    };
    let a = AxisMotionLimits {
        maximum_velocity: 6.into(),
        maximum_acceleration: 8.into(),
        maximum_jerk: 10.into(),
    };
    let r =
        plan_axis_projected_motion_limits(&[p], &[a], hyperlimit::PredicatePolicy::STRICT).unwrap();
    assert_eq!(r.maximum_path_feed, hyperreal::Real::from(3));
    assert!(r.all_satisfied());
}
