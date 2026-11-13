//! Owned vector fields with explicit time/state interpretation and native enclosures.
//!
//! Hyperdynamics assigns field semantics. Hypersolve validates symbolic source,
//! derivatives and images; Hyperlattice carries Cartesian sets; Hyperinterval
//! owns scalar enclosure arithmetic. Validated ODE integration remains open.
#![forbid(unsafe_code)]
#![deny(missing_docs)]

/// Owned dyadic vector fields with validated expression/Jacobian association.
#[cfg(feature = "field")]
pub mod field;

mod axis_projection;
pub use axis_projection::*;

mod feed;
mod guards;
mod jerk_schedule;
mod join;
mod lookahead;
mod metric;
pub use feed::{
    AccelerationLimitedFeedProfileClass, AccelerationLimitedFeedTimeReport, ConstantFeedTimeReport,
    CornerLookaheadJoinClass, CornerLookaheadJoinReport, CornerLookaheadLimitReport,
    JerkLimitedFeedTimeReport, certify_acceleration_limited_feed_time, certify_constant_feed_time,
    certify_corner_lookahead_limits, certify_symmetric_jerk_limited_feed_time,
    constant_feed_time_equation, symmetric_jerk_limited_feed_time_equation,
};
pub use guards::{
    check_nonnegative_feed, check_positive_acceleration, check_positive_feed, check_positive_jerk,
};
pub use jerk_schedule::*;
pub use join::{ClassifiedJoin, JoinSpan};
pub use lookahead::*;
pub use metric::{MetricPath, MetricSpan, SpanDynamicsClass};

/// A rejected or undecided exact dynamics construction.
///
/// These distinctions preserve legacy route failures. They do not imply a new
/// cumulative work, memory, or cancellation contract.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum DynamicsError {
    /// At least one route had no retained path segments to measure.
    EmptyRoute,
    /// A segment could not provide a certified axis-aligned length.
    UnsupportedRouteGeometry,
    /// Feed rate was structurally negative.
    NegativeFeedRate,
    /// Feed rate was structurally zero.
    ZeroFeedRate,
    /// Acceleration limit was structurally negative.
    NegativeAcceleration,
    /// Acceleration limit was structurally zero.
    ZeroAcceleration,
    /// Candidate traversal time was structurally negative.
    NegativeTime,
    /// Candidate traversal time was structurally zero where positive time is required.
    ZeroTime,
    /// Exact comparison could not choose the acceleration-limited profile.
    UnknownFeedProfile,
    /// Jerk limit was structurally negative.
    NegativeJerk,
    /// Jerk limit was structurally zero.
    ZeroJerk,
    /// Exact scalar division failed while deriving feed-profile facts.
    UnsupportedDivision,
    /// Corner radius was structurally negative.
    NegativeCornerRadius,
    /// Corner radius was structurally zero.
    ZeroCornerRadius,
    /// Lookahead schedule vectors do not match the retained route shape.
    ScheduleShapeMismatch,
    /// An exact square-root construction failed during lookahead planning.
    UnsupportedRadical,
    /// Independent replay rejected the internally generated lookahead proposal.
    LookaheadProposalUncertified,
    /// Both boundary feeds were zero for a transition that requires motion.
    ZeroBoundaryFeeds,
    /// Independent replay rejected an internally generated jerk proposal.
    JerkProposalUncertified,
    /// Exact power-of-two jerk refinement exhausted its caller-owned bound.
    JerkRefinementBudgetExceeded,
    /// No affine spans or no dense axis limits were supplied for projection.
    EmptyAxisProjection,
    /// An affine projection vector did not match the dense axis-limit count.
    AxisProjectionShapeMismatch,
    /// An absolute affine axis derivative was structurally negative.
    NegativeAxisProjection,
    /// An affine span had no structurally positive machine-axis derivative.
    DegenerateAxisProjection,
    /// Independent replay rejected internally selected affine axis limits.
    AxisProjectionProposalUncertified,
    /// The selected predicate policy could not certify a scalar sign.
    PredicateUnresolved,
}

impl core::fmt::Display for DynamicsError {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        match self {
            Self::EmptyRoute => {
                f.write_str("At least one route had no retained path segments to measure")
            }
            Self::UnsupportedRouteGeometry => {
                f.write_str("A segment could not provide a certified axis-aligned length")
            }
            Self::NegativeFeedRate => f.write_str("Feed rate was structurally negative"),
            Self::ZeroFeedRate => f.write_str("Feed rate was structurally zero"),
            Self::NegativeAcceleration => {
                f.write_str("Acceleration limit was structurally negative")
            }
            Self::ZeroAcceleration => f.write_str("Acceleration limit was structurally zero"),
            Self::NegativeTime => f.write_str("Candidate traversal time was structurally negative"),
            Self::ZeroTime => f.write_str(
                "Candidate traversal time was structurally zero where positive time is required",
            ),
            Self::UnknownFeedProfile => {
                f.write_str("Exact comparison could not choose the acceleration-limited profile")
            }
            Self::NegativeJerk => f.write_str("Jerk limit was structurally negative"),
            Self::ZeroJerk => f.write_str("Jerk limit was structurally zero"),
            Self::UnsupportedDivision => {
                f.write_str("Exact scalar division failed while deriving feed-profile facts")
            }
            Self::NegativeCornerRadius => f.write_str("Corner radius was structurally negative"),
            Self::ZeroCornerRadius => f.write_str("Corner radius was structurally zero"),
            Self::ScheduleShapeMismatch => {
                f.write_str("Lookahead schedule vectors do not match the retained route shape")
            }
            Self::UnsupportedRadical => {
                f.write_str("An exact square-root construction failed during lookahead planning")
            }
            Self::LookaheadProposalUncertified => f.write_str(
                "Independent replay rejected the internally generated lookahead proposal",
            ),
            Self::ZeroBoundaryFeeds => {
                f.write_str("Both boundary feeds were zero for a transition that requires motion")
            }
            Self::JerkProposalUncertified => {
                f.write_str("Independent replay rejected an internally generated jerk proposal")
            }
            Self::JerkRefinementBudgetExceeded => {
                f.write_str("Exact power-of-two jerk refinement exhausted its caller-owned bound")
            }
            Self::EmptyAxisProjection => {
                f.write_str("No affine spans or no dense axis limits were supplied for projection")
            }
            Self::AxisProjectionShapeMismatch => {
                f.write_str("An affine projection vector did not match the dense axis-limit count")
            }
            Self::NegativeAxisProjection => {
                f.write_str("An absolute affine axis derivative was structurally negative")
            }
            Self::DegenerateAxisProjection => {
                f.write_str("An affine span had no structurally positive machine-axis derivative")
            }
            Self::AxisProjectionProposalUncertified => {
                f.write_str("Independent replay rejected internally selected affine axis limits")
            }
            Self::PredicateUnresolved => {
                f.write_str("The selected predicate policy could not certify a scalar sign")
            }
        }
    }
}

impl core::error::Error for DynamicsError {}
