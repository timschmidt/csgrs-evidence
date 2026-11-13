//! Geometry-owned metric input and lossless legacy error conversion.
use super::{
    RouteCertificationError,
    feed::{FeedPathElement, element_length},
};
use hyperdynamics::{DynamicsError, MetricSpan, SpanDynamicsClass};
use hyperlimit::PredicatePolicy;
use hyperreal::Real;

impl From<DynamicsError> for RouteCertificationError {
    fn from(error: DynamicsError) -> Self {
        match error {
            DynamicsError::EmptyRoute => Self::EmptyRoute,
            DynamicsError::UnsupportedRouteGeometry => Self::UnsupportedRouteGeometry,
            DynamicsError::NegativeFeedRate => Self::NegativeFeedRate,
            DynamicsError::ZeroFeedRate => Self::ZeroFeedRate,
            DynamicsError::NegativeAcceleration => Self::NegativeAcceleration,
            DynamicsError::ZeroAcceleration => Self::ZeroAcceleration,
            DynamicsError::NegativeTime => Self::NegativeTime,
            DynamicsError::ZeroTime => Self::ZeroTime,
            DynamicsError::UnknownFeedProfile => Self::UnknownFeedProfile,
            DynamicsError::NegativeJerk => Self::NegativeJerk,
            DynamicsError::ZeroJerk => Self::ZeroJerk,
            DynamicsError::UnsupportedDivision => Self::UnsupportedDivision,
            DynamicsError::NegativeCornerRadius => Self::NegativeCornerRadius,
            DynamicsError::ZeroCornerRadius => Self::ZeroCornerRadius,
            DynamicsError::ScheduleShapeMismatch => Self::ScheduleShapeMismatch,
            DynamicsError::UnsupportedRadical => Self::UnsupportedRadical,
            DynamicsError::LookaheadProposalUncertified => Self::LookaheadProposalUncertified,
            DynamicsError::ZeroBoundaryFeeds => Self::ZeroBoundaryFeeds,
            DynamicsError::JerkProposalUncertified => Self::JerkProposalUncertified,
            DynamicsError::JerkRefinementBudgetExceeded => Self::JerkRefinementBudgetExceeded,
            DynamicsError::EmptyAxisProjection => Self::EmptyAxisProjection,
            DynamicsError::AxisProjectionShapeMismatch => Self::AxisProjectionShapeMismatch,
            DynamicsError::NegativeAxisProjection => Self::NegativeAxisProjection,
            DynamicsError::DegenerateAxisProjection => Self::DegenerateAxisProjection,
            DynamicsError::AxisProjectionProposalUncertified => {
                Self::AxisProjectionProposalUncertified
            }
            DynamicsError::PredicateUnresolved => Self::PredicateUnresolved,
        }
    }
}

impl From<RouteCertificationError> for DynamicsError {
    fn from(error: RouteCertificationError) -> Self {
        match error {
            RouteCertificationError::EmptyRoute => Self::EmptyRoute,
            RouteCertificationError::UnsupportedRouteGeometry => Self::UnsupportedRouteGeometry,
            RouteCertificationError::NegativeFeedRate => Self::NegativeFeedRate,
            RouteCertificationError::ZeroFeedRate => Self::ZeroFeedRate,
            RouteCertificationError::NegativeAcceleration => Self::NegativeAcceleration,
            RouteCertificationError::ZeroAcceleration => Self::ZeroAcceleration,
            RouteCertificationError::NegativeTime => Self::NegativeTime,
            RouteCertificationError::ZeroTime => Self::ZeroTime,
            RouteCertificationError::UnknownFeedProfile => Self::UnknownFeedProfile,
            RouteCertificationError::NegativeJerk => Self::NegativeJerk,
            RouteCertificationError::ZeroJerk => Self::ZeroJerk,
            RouteCertificationError::UnsupportedDivision => Self::UnsupportedDivision,
            RouteCertificationError::NegativeCornerRadius => Self::NegativeCornerRadius,
            RouteCertificationError::ZeroCornerRadius => Self::ZeroCornerRadius,
            RouteCertificationError::ScheduleShapeMismatch => Self::ScheduleShapeMismatch,
            RouteCertificationError::UnsupportedRadical => Self::UnsupportedRadical,
            RouteCertificationError::LookaheadProposalUncertified => {
                Self::LookaheadProposalUncertified
            }
            RouteCertificationError::ZeroBoundaryFeeds => Self::ZeroBoundaryFeeds,
            RouteCertificationError::JerkProposalUncertified => Self::JerkProposalUncertified,
            RouteCertificationError::JerkRefinementBudgetExceeded => {
                Self::JerkRefinementBudgetExceeded
            }
            RouteCertificationError::EmptyAxisProjection => Self::EmptyAxisProjection,
            RouteCertificationError::AxisProjectionShapeMismatch => {
                Self::AxisProjectionShapeMismatch
            }
            RouteCertificationError::NegativeAxisProjection => Self::NegativeAxisProjection,
            RouteCertificationError::DegenerateAxisProjection => Self::DegenerateAxisProjection,
            RouteCertificationError::AxisProjectionProposalUncertified => {
                Self::AxisProjectionProposalUncertified
            }
            RouteCertificationError::PredicateUnresolved => Self::PredicateUnresolved,
        }
    }
}

impl MetricSpan for FeedPathElement {
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        element_length(self, policy).map_err(Into::into)
    }
    fn dynamics_class(&self) -> SpanDynamicsClass {
        match self {
            Self::Line(_) => SpanDynamicsClass::Affine,
            Self::ExplicitArc(_) | Self::CubicPh(_) | Self::QuinticPh(_) => {
                SpanDynamicsClass::General
            }
        }
    }
}

impl hyperdynamics::JoinSpan for crate::tangent::TangentSpan {
    type Receipt = crate::tangent::TangentJoinReport;
    fn classify_join(
        &self,
        outgoing: &Self,
        policy: PredicatePolicy,
    ) -> hyperdynamics::ClassifiedJoin<Self::Receipt> {
        use crate::tangent::{TangentJoinClass, classify_tangent_join};
        use hyperdynamics::CornerLookaheadJoinClass;
        let receipt = classify_tangent_join(
            &self.end,
            &self.end_tangent,
            &outgoing.start,
            &outgoing.start_tangent,
            policy,
        );
        let classification = match receipt.class {
            TangentJoinClass::G1Continuous => Ok(CornerLookaheadJoinClass::StraightThrough),
            TangentJoinClass::Corner => Ok(CornerLookaheadJoinClass::RadiusLimitedCorner),
            TangentJoinClass::ReversedTangent => Ok(CornerLookaheadJoinClass::ReversalStop),
            TangentJoinClass::DegenerateTangent
            | TangentJoinClass::EndpointMismatch
            | TangentJoinClass::Unknown => Err(DynamicsError::UnsupportedRouteGeometry),
        };
        hyperdynamics::ClassifiedJoin {
            classification,
            receipt,
        }
    }
}
