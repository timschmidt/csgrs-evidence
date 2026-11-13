//! Native feed metric inputs and one-release dynamics compatibility.
use super::{AccelerationLimitedFeedTimeReport, ConstantFeedTimeReport, RouteCertificationError};
use crate::arc::ExplicitCircularArc;
use crate::ph::{CubicPythagoreanHodograph, QuinticPythagoreanHodograph};
use crate::segment::LinePathSegment;
use crate::tangent::{TangentJoinReport, TangentSpan};
pub use hyperdynamics::{CornerLookaheadJoinClass, JerkLimitedFeedTimeReport};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;
/// Native tangent receipts retained by the dynamics report.
pub type CornerLookaheadJoinReport = hyperdynamics::CornerLookaheadJoinReport<TangentJoinReport>;
/// Native tangent receipts retained for every adjacent join.
pub type CornerLookaheadLimitReport = hyperdynamics::CornerLookaheadLimitReport<TangentJoinReport>;

/// Retained feed-replay path element for exact mixed line/arc routes.
///
/// This is a metric carrier, not a topology materializer. Lines contribute
/// exact Euclidean length, and explicit circular arcs contribute
/// [`ExplicitCircularArc::certified_sweep_length`]. That keeps Farouki's
/// curve-length and path-parameterization view compatible with Yap's exact
/// object/predicate boundary: no finite coordinate approximation participates,
/// and undecidable arc sweep lengths reject before any feed residual is replayed.
#[derive(Clone, Debug, PartialEq)]
pub enum FeedPathElement {
    /// Exact line path segment in any retained direction.
    Line(LinePathSegment),
    /// Exact explicit circular arc with a certified symbolic sweep length.
    ExplicitArc(ExplicitCircularArc),
    /// Exact cubic PH span with native polynomial arc length.
    CubicPh(CubicPythagoreanHodograph),
    /// Exact quintic PH span with native polynomial arc length.
    QuinticPh(QuinticPythagoreanHodograph),
}

/// Certify constant-feed traversal time for a retained mixed line/arc route.
///
/// This is the curved-segment counterpart of
/// [`super::certify_constant_feed_time`]. The route length is first replayed
/// from retained path objects: lines use exact Euclidean square-root lengths,
/// while explicit circular arcs use symbolic `pi`/`acos` sweep lengths when
/// the arc sweep class is certified. The feed residual remains
/// `length - feed * time = 0`, so invalid process parameters and unsupported
/// geometry are reported before solver replay.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_constant_feed_time"
)]
pub fn certify_constant_feed_time_for_path(
    route: &[FeedPathElement],
    feed_rate: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<ConstantFeedTimeReport, RouteCertificationError> {
    hyperdynamics::certify_constant_feed_time(route, feed_rate, target_time, policy)
        .map_err(Into::into)
}

/// Certify symmetric acceleration-limited traversal for a mixed line/arc route.
///
/// The profile classification is still the exact comparison
/// `acceleration * length` versus `max_feed^2`; the only change from the
/// line-only API is that `length` may include certified circular-arc sweep
/// terms. No sampling, chord approximation, or controller lookahead is
/// introduced.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_acceleration_limited_feed_time"
)]
pub fn certify_acceleration_limited_feed_time_for_path(
    route: &[FeedPathElement],
    max_feed_rate: Real,
    acceleration: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<AccelerationLimitedFeedTimeReport, RouteCertificationError> {
    hyperdynamics::certify_acceleration_limited_feed_time(
        route,
        max_feed_rate,
        acceleration,
        target_time,
        policy,
    )
    .map_err(Into::into)
}

/// Certify a symmetric four-phase jerk-limited feed profile for a mixed route.
///
/// The S-curve equations are identical to
/// [`certify_symmetric_jerk_limited_feed_time`], but retained explicit arcs may
/// contribute exact symbolic sweep length. This directly addresses curved
/// route feed replay without converting arcs to polylines.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_symmetric_jerk_limited_feed_time"
)]
pub fn certify_symmetric_jerk_limited_feed_time_for_path(
    route: &[FeedPathElement],
    max_feed_rate: Real,
    max_acceleration: Real,
    jerk: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<JerkLimitedFeedTimeReport, RouteCertificationError> {
    hyperdynamics::certify_symmetric_jerk_limited_feed_time(
        route,
        max_feed_rate,
        max_acceleration,
        jerk,
        target_time,
        policy,
    )
    .map_err(Into::into)
}

/// Certify a symmetric four-phase jerk-limited feed traversal time.
///
/// The retained route is measured as exact axis-aligned length. The candidate
/// time is then certified against the jerk-limited S-curve residual
/// `j*T^3 - 32*L = 0`; peak feed and peak acceleration are checked as exact
/// inequality rows `16*v_max - j*T^2 >= 0` and `4*a_max - j*T >= 0`.
///
/// A report may therefore be returned with certified violations when the
/// supplied time or limits are inconsistent. Structural input failures, such as
/// negative limits or non-axis-aligned retained geometry, are returned as
/// [`RouteCertificationError`] values before building the replay problem.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_symmetric_jerk_limited_feed_time"
)]
pub fn certify_symmetric_jerk_limited_feed_time(
    route: &[LinePathSegment],
    max_feed_rate: Real,
    max_acceleration: Real,
    jerk: Real,
    target_time: Real,
    policy: PredicatePolicy,
) -> Result<JerkLimitedFeedTimeReport, RouteCertificationError> {
    hyperdynamics::certify_symmetric_jerk_limited_feed_time(
        &AxisMetricPath(route),
        max_feed_rate,
        max_acceleration,
        jerk,
        target_time,
        policy,
    )
    .map_err(Into::into)
}

/// Certify exact lookahead corner-speed limits for retained tangent spans.
///
/// This is a process-constraint report for a path chain, not a mesh or stock
/// boolean. Adjacent [`TangentSpan`] values are classified by exact endpoint
/// and tangent predicates. G1 joins replay only the global feed cap; true
/// corners additionally replay `a_max * r_corner - v_corner^2 >= 0`; reversed
/// tangents replay an exact stop row `v_corner = 0`. The constraints are kept
/// denominator-free and algebraic so `hypersolve` can audit the caller's
/// candidate speed under Yap's "construct then certify" model.
///
/// The caller supplies one retained corner radius for this chain. A future
/// richer scheduler can call this function per corner with locally selected
/// radii, but the certification model remains the same: geometry decides the
/// join class, and exact replay decides whether the proposed process speed is
/// admissible.
#[deprecated(
    since = "0.3.0",
    note = "use hyperdynamics::certify_corner_lookahead_limits"
)]
pub fn certify_corner_lookahead_limits(
    spans: &[TangentSpan],
    candidate_corner_feed: Real,
    max_feed_rate: Real,
    max_acceleration: Real,
    corner_radius: Real,
    policy: PredicatePolicy,
) -> Result<CornerLookaheadLimitReport, RouteCertificationError> {
    hyperdynamics::certify_corner_lookahead_limits(
        spans,
        candidate_corner_feed,
        max_feed_rate,
        max_acceleration,
        corner_radius,
        policy,
    )
    .map_err(Into::into)
}

pub(crate) fn element_length(
    element: &FeedPathElement,
    _policy: PredicatePolicy,
) -> Result<Real, RouteCertificationError> {
    match element {
        FeedPathElement::Line(segment) => segment
            .euclidean_length()
            .map_err(|_| RouteCertificationError::UnsupportedRouteGeometry),
        FeedPathElement::ExplicitArc(arc) => arc
            .certified_sweep_length()
            .ok_or(RouteCertificationError::UnsupportedRouteGeometry),
        FeedPathElement::CubicPh(curve) => Ok(curve.exact_length()),
        FeedPathElement::QuinticPh(curve) => Ok(curve.exact_length()),
    }
}

pub(crate) struct AxisMetricPath<'a>(pub(crate) &'a [LinePathSegment]);
impl hyperdynamics::MetricPath for AxisMetricPath<'_> {
    fn is_empty(&self) -> bool {
        self.0.is_empty()
    }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, hyperdynamics::DynamicsError> {
        super::route_axis_length(self.0, policy)
            .ok_or(hyperdynamics::DynamicsError::UnsupportedRouteGeometry)
    }
}
