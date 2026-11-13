//! Compatibility entry points for exact jerk scheduling.
use super::{RouteCertificationError, feed::FeedPathElement};
pub use hyperdynamics::{
    JerkRampElementPhaseReport, JerkRampFeedScheduleReport, JerkRampPhaseProposal,
    JerkRampPhaseReport, JerkRampSpanProposal, JerkRampSpanReport,
    MultiPhaseJerkRampFeedScheduleReport, PlannedMonotonicJerkTransition,
};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;

/// Compatibility wrapper for [`hyperdynamics::plan_monotonic_jerk_transition`].
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::plan_monotonic_jerk_transition"
)]
#[inline]
pub fn plan_monotonic_jerk_transition(
    element: &FeedPathElement,
    start_feed: Real,
    end_feed: Real,
    max_feed_rate: Real,
    max_acceleration: Real,
    max_jerk: Real,
    policy: PredicatePolicy,
) -> Result<PlannedMonotonicJerkTransition, RouteCertificationError> {
    hyperdynamics::plan_monotonic_jerk_transition(
        element,
        start_feed,
        end_feed,
        max_feed_rate,
        max_acceleration,
        max_jerk,
        policy,
    )
    .map_err(Into::into)
}

/// Compatibility wrapper for [`hyperdynamics::certify_jerk_ramp_feed_schedule`].
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_jerk_ramp_feed_schedule"
)]
#[inline]
pub fn certify_jerk_ramp_feed_schedule(
    route: &[FeedPathElement],
    proposals: &[JerkRampSpanProposal],
    max_feed_rate: Real,
    max_acceleration: Real,
    max_jerk: Real,
    policy: PredicatePolicy,
) -> Result<JerkRampFeedScheduleReport, RouteCertificationError> {
    hyperdynamics::certify_jerk_ramp_feed_schedule(
        route,
        proposals,
        max_feed_rate,
        max_acceleration,
        max_jerk,
        policy,
    )
    .map_err(Into::into)
}

/// Compatibility wrapper for [`hyperdynamics::certify_multi_phase_jerk_ramp_feed_schedule`].
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_multi_phase_jerk_ramp_feed_schedule"
)]
#[inline]
pub fn certify_multi_phase_jerk_ramp_feed_schedule(
    route: &[FeedPathElement],
    phases: &[Vec<JerkRampPhaseProposal>],
    max_feed_rate: Real,
    max_acceleration: Real,
    max_jerk: Real,
    policy: PredicatePolicy,
) -> Result<MultiPhaseJerkRampFeedScheduleReport, RouteCertificationError> {
    hyperdynamics::certify_multi_phase_jerk_ramp_feed_schedule(
        route,
        phases,
        max_feed_rate,
        max_acceleration,
        max_jerk,
        policy,
    )
    .map_err(Into::into)
}
