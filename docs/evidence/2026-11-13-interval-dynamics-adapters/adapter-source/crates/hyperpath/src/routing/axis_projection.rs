//! Compatibility entry points for affine axis projection.
use super::RouteCertificationError;
pub use hyperdynamics::{
    AffineSpanAxisProjection, AxisMotionLimits, AxisProjectedMotionLimitsReport,
    AxisProjectionBottleneck, AxisProjectionRowReport, PlannedAxisProjectedMotionLimits,
};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;

/// Compatibility wrapper for [`hyperdynamics::plan_axis_projected_motion_limits`].
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::plan_axis_projected_motion_limits"
)]
#[inline]
pub fn plan_axis_projected_motion_limits(
    projections: &[AffineSpanAxisProjection],
    axis_limits: &[AxisMotionLimits],
    policy: PredicatePolicy,
) -> Result<PlannedAxisProjectedMotionLimits, RouteCertificationError> {
    hyperdynamics::plan_axis_projected_motion_limits(projections, axis_limits, policy)
        .map_err(Into::into)
}

/// Compatibility wrapper for [`hyperdynamics::certify_axis_projected_motion_limits`].
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_axis_projected_motion_limits"
)]
#[inline]
pub fn certify_axis_projected_motion_limits(
    projections: &[AffineSpanAxisProjection],
    axis_limits: &[AxisMotionLimits],
    maximum_path_feed: Real,
    maximum_path_acceleration: Real,
    maximum_path_jerk: Real,
    policy: PredicatePolicy,
) -> Result<AxisProjectedMotionLimitsReport, RouteCertificationError> {
    hyperdynamics::certify_axis_projected_motion_limits(
        projections,
        axis_limits,
        maximum_path_feed,
        maximum_path_acceleration,
        maximum_path_jerk,
        policy,
    )
    .map_err(Into::into)
}
