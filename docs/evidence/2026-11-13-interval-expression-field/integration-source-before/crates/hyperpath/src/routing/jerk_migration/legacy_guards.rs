use super::RouteCertificationError;
use hyperlimit::{PredicatePolicy, Sign, classify_real_sign};
use hyperreal::Real;

pub(crate) fn require_nonnegative_feed(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), RouteCertificationError> {
    match classify_real_sign(value, policy).value() {
        Some(Sign::Negative) => Err(RouteCertificationError::NegativeFeedRate),
        Some(Sign::Zero | Sign::Positive) => Ok(()),
        None => Err(RouteCertificationError::PredicateUnresolved),
    }
}

pub(crate) fn require_positive_feed(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), RouteCertificationError> {
    match classify_real_sign(value, policy).value() {
        Some(Sign::Negative) => Err(RouteCertificationError::NegativeFeedRate),
        Some(Sign::Zero) => Err(RouteCertificationError::ZeroFeedRate),
        Some(Sign::Positive) => Ok(()),
        None => Err(RouteCertificationError::PredicateUnresolved),
    }
}

pub(crate) fn require_positive_acceleration(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), RouteCertificationError> {
    match classify_real_sign(value, policy).value() {
        Some(Sign::Negative) => Err(RouteCertificationError::NegativeAcceleration),
        Some(Sign::Zero) => Err(RouteCertificationError::ZeroAcceleration),
        Some(Sign::Positive) => Ok(()),
        None => Err(RouteCertificationError::PredicateUnresolved),
    }
}

pub(crate) fn require_positive_jerk(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), RouteCertificationError> {
    match classify_real_sign(value, policy).value() {
        Some(Sign::Negative) => Err(RouteCertificationError::NegativeJerk),
        Some(Sign::Zero) => Err(RouteCertificationError::ZeroJerk),
        Some(Sign::Positive) => Ok(()),
        None => Err(RouteCertificationError::PredicateUnresolved),
    }
}
