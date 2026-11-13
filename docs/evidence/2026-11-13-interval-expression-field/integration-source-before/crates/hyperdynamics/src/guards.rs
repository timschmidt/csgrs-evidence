//! Shared dynamics input checks retaining predicate evidence.
use crate::DynamicsError;
use hyperlimit::{PredicateOutcome, PredicatePolicy, Sign, classify_real_sign};
use hyperreal::Real;

#[inline]
pub(crate) fn check_sign(
    value: &Real,
    policy: PredicatePolicy,
    negative: DynamicsError,
    zero: Result<(), DynamicsError>,
) -> PredicateOutcome<Result<(), DynamicsError>> {
    match classify_real_sign(value, policy) {
        PredicateOutcome::Decided {
            value,
            certainty,
            stage,
        } => PredicateOutcome::Decided {
            value: match value {
                Sign::Negative => Err(negative),
                Sign::Zero => zero,
                Sign::Positive => Ok(()),
            },
            certainty,
            stage,
        },
        PredicateOutcome::Unknown { needed, stage } => PredicateOutcome::Unknown { needed, stage },
    }
}

/// Check a nonnegative feed rate, retaining certainty and decision stage.
///
/// A decided invalid sign retains its predicate evidence too. Unknown signs
/// retain their original refinement requirement; no false validity is inferred.
#[inline]
pub fn check_nonnegative_feed(
    value: &Real,
    policy: PredicatePolicy,
) -> PredicateOutcome<Result<(), DynamicsError>> {
    check_sign(value, policy, DynamicsError::NegativeFeedRate, Ok(()))
}

// Legacy scheduler contract: unresolved signs remain a typed domain failure.
#[inline]
pub(crate) fn require_nonnegative_feed(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), DynamicsError> {
    check_nonnegative_feed(value, policy)
        .value()
        .unwrap_or(Err(DynamicsError::PredicateUnresolved))
}

/// Check a positive feed rate, retaining certainty and decision stage.
///
/// A decided invalid sign retains its predicate evidence too. Unknown signs
/// retain their original refinement requirement; no false validity is inferred.
#[inline]
pub fn check_positive_feed(
    value: &Real,
    policy: PredicatePolicy,
) -> PredicateOutcome<Result<(), DynamicsError>> {
    check_sign(
        value,
        policy,
        DynamicsError::NegativeFeedRate,
        Err(DynamicsError::ZeroFeedRate),
    )
}

// Legacy scheduler contract: unresolved signs remain a typed domain failure.
#[inline]
pub(crate) fn require_positive_feed(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), DynamicsError> {
    check_positive_feed(value, policy)
        .value()
        .unwrap_or(Err(DynamicsError::PredicateUnresolved))
}

/// Check a positive acceleration limit, retaining certainty and decision stage.
///
/// A decided invalid sign retains its predicate evidence too. Unknown signs
/// retain their original refinement requirement; no false validity is inferred.
#[inline]
pub fn check_positive_acceleration(
    value: &Real,
    policy: PredicatePolicy,
) -> PredicateOutcome<Result<(), DynamicsError>> {
    check_sign(
        value,
        policy,
        DynamicsError::NegativeAcceleration,
        Err(DynamicsError::ZeroAcceleration),
    )
}

// Legacy scheduler contract: unresolved signs remain a typed domain failure.
#[inline]
pub(crate) fn require_positive_acceleration(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), DynamicsError> {
    check_positive_acceleration(value, policy)
        .value()
        .unwrap_or(Err(DynamicsError::PredicateUnresolved))
}

/// Check a positive jerk limit, retaining certainty and decision stage.
///
/// A decided invalid sign retains its predicate evidence too. Unknown signs
/// retain their original refinement requirement; no false validity is inferred.
#[inline]
pub fn check_positive_jerk(
    value: &Real,
    policy: PredicatePolicy,
) -> PredicateOutcome<Result<(), DynamicsError>> {
    check_sign(
        value,
        policy,
        DynamicsError::NegativeJerk,
        Err(DynamicsError::ZeroJerk),
    )
}

// Legacy scheduler contract: unresolved signs remain a typed domain failure.
#[inline]
pub(crate) fn require_positive_jerk(
    value: &Real,
    policy: PredicatePolicy,
) -> Result<(), DynamicsError> {
    check_positive_jerk(value, policy)
        .value()
        .unwrap_or(Err(DynamicsError::PredicateUnresolved))
}
