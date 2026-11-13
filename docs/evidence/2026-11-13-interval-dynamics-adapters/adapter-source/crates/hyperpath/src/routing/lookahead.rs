//! One-release exact lookahead compatibility with native tangent receipts.
use super::RouteCertificationError;
use super::feed::FeedPathElement;
use crate::tangent::{TangentJoinReport, TangentSpan};
pub use hyperdynamics::{
    JerkFeasibleNodeComponent, LookaheadFeedPlanningLimits, LookaheadFeedSchedule,
    LookaheadSpanTransitionReport,
};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;
/// Dynamics report retaining the native complete tangent receipt.
pub type PlannedLookaheadFeedSchedule =
    hyperdynamics::PlannedLookaheadFeedSchedule<TangentJoinReport>;
/// Dynamics report retaining the native complete tangent receipt.
pub type PlannedJerkFeasibleLookaheadSchedule =
    hyperdynamics::PlannedJerkFeasibleLookaheadSchedule<TangentJoinReport>;
/// Dynamics report retaining the native complete tangent receipt.
pub type LookaheadFeedScheduleReport =
    hyperdynamics::LookaheadFeedScheduleReport<TangentJoinReport>;

/// Plan and certify an exact forward/reverse lookahead schedule.
///
/// The proposer uses the standard squared-speed reachability relation
/// `v_next^2 <= v_current^2 + 2*a_max*length`. The forward pass propagates
/// acceleration reachability and the reverse pass propagates deceleration
/// reachability. At each true corner, the effective node limit also includes
/// `v^2 <= a_max*radius`; exact G1 joins need no geometric corner reduction,
/// while a reversal is fixed at zero. Caller-owned node limits can impose
/// additional stops or process caps.
///
/// This function constructs a candidate and then invokes
/// [`certify_lookahead_feed_schedule`] as an independent replay. No sampled
/// time step, floating proposal, or firmware behavior participates.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::plan_lookahead_feed_schedule"
)]
#[inline]
pub fn plan_lookahead_feed_schedule(
    route: &[FeedPathElement],
    spans: &[TangentSpan],
    limits: &LookaheadFeedPlanningLimits,
    max_feed_rate: Real,
    max_acceleration: Real,
    policy: PredicatePolicy,
) -> Result<PlannedLookaheadFeedSchedule, RouteCertificationError> {
    hyperdynamics::plan_lookahead_feed_schedule(
        route,
        spans,
        limits,
        max_feed_rate,
        max_acceleration,
        policy,
    )
    .map_err(Into::into)
}

/// Plan exact lookahead nodes and conservatively refine them until every
/// nonzero-boundary monotonic jerk transition certifies.
///
/// The acceleration-only forward/reverse result is partitioned into maximal
/// contiguous positive-node components separated by exact zero stops. For one
/// component at a time, the planner tries the exact two-phase monotonic
/// transition on every adjacent retained span. If any replay fails only because
/// the proposal exceeds a dynamic limit, every node in that component is
/// divided by two exactly and the complete component is replayed again.
/// Relative node feeds inside the component are therefore retained and no zero
/// node can become positive. The caller bounds the refinement count; exhausting
/// it fails instead of returning an uncertified schedule.
///
/// This is deliberately conservative rather than time-optimal. It couples the
/// current monotonic transition primitive to lookahead without solving a
/// floating cubic, sampling a controller trajectory, or treating a sharp
/// corner as retained blend geometry.
#[allow(clippy::too_many_arguments)]
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::plan_jerk_feasible_lookahead_schedule"
)]
#[inline]
pub fn plan_jerk_feasible_lookahead_schedule(
    route: &[FeedPathElement],
    spans: &[TangentSpan],
    limits: &LookaheadFeedPlanningLimits,
    max_feed_rate: Real,
    max_acceleration: Real,
    max_jerk: Real,
    maximum_component_halvings: u32,
    policy: PredicatePolicy,
) -> Result<PlannedJerkFeasibleLookaheadSchedule, RouteCertificationError> {
    hyperdynamics::plan_jerk_feasible_lookahead_schedule(
        route,
        spans,
        limits,
        max_feed_rate,
        max_acceleration,
        max_jerk,
        maximum_component_halvings,
        policy,
    )
    .map_err(Into::into)
}

/// Certify a local lookahead feed schedule for a retained mixed path.
///
/// The route and tangent spans must describe the same path elements. For each
/// internal join, exact tangent predicates select whether the proposed corner
/// feed is straight-through, radius-limited, or a required stop. For each path
/// element, exact length plus endpoint speeds replay the squared-speed
/// acceleration bound. Erkorkmaz and Altintas, "High speed CNC system design.
/// Part I" (2001), discuss jerk-limited controller trajectories; this function
/// deliberately stays one layer lower by certifying the lookahead speed nodes
/// that such a trajectory generator would later consume.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_lookahead_feed_schedule"
)]
#[inline]
pub fn certify_lookahead_feed_schedule(
    route: &[FeedPathElement],
    spans: &[TangentSpan],
    schedule: &LookaheadFeedSchedule,
    max_feed_rate: Real,
    max_acceleration: Real,
    policy: PredicatePolicy,
) -> Result<LookaheadFeedScheduleReport, RouteCertificationError> {
    hyperdynamics::certify_lookahead_feed_schedule(
        route,
        spans,
        schedule,
        max_feed_rate,
        max_acceleration,
        policy,
    )
    .map_err(Into::into)
}
