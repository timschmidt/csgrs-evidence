//! Certified predicate filters.
//!
//! Filters in this module are exact, policy-visible shortcuts. They may decide
//! a predicate before expensive refinement, or return explicit uncertainty.
//! They are not primitive-float tolerances. Approximate or interval information is useful only
//! when it produces a certificate or a bounded non-decision.

use crate::predicate::PredicatePolicy;
use core::cmp::Ordering;

use hyperreal::Real;

use crate::predicate::{Certainty, Escalation, PredicateOutcome, RefinementNeed, Sign};
use crate::predicates::order::compare_reals_with_policy;

// Experimental native stage: only reached after structural and signed-term
// facts decline in the orientation callback. An inconclusive local budget is
// not the predicate's final outcome; the unchanged resolver may still decide.
pub(crate) fn native_interval_difference(
    left: &Real,
    right: &Real,
) -> Option<PredicateOutcome<Sign>> {
    use hyperinterval::{DyadicBudget, DyadicInterval, IntervalError, SignSet};
    crate::trace_dispatch!("hyperlimit", "native_interval_difference", "start");
    let mut budget = DyadicBudget::new(4096, 1_000_000);
    let result = (|| {
        let a = DyadicInterval::from_real(left, -16, &mut budget)?;
        let b = DyadicInterval::from_real(right, -16, &mut budget)?;
        a.sub(&b, &mut budget)
    })();
    match result {
        Ok(interval) => match interval.signs() {
            SignSet::Positive => {
                crate::trace_dispatch!("hyperlimit", "native_interval_difference", "positive");
                Some(filtered(Sign::Positive, Certainty::Filtered))
            }
            SignSet::Negative => {
                crate::trace_dispatch!("hyperlimit", "native_interval_difference", "negative");
                Some(filtered(Sign::Negative, Certainty::Filtered))
            }
            _ => {
                crate::trace_dispatch!("hyperlimit", "native_interval_difference", "inconclusive");
                None
            }
        },
        Err(IntervalError::WorkExhausted | IntervalError::SizeExhausted) => {
            crate::trace_dispatch!("hyperlimit", "native_interval_difference", "local-exhaustion");
            None
        }
        Err(_) => {
            crate::trace_dispatch!("hyperlimit", "native_interval_difference", "unavailable");
            None
        }
    }
}

/// Classify a closed ball enclosure, preserving invalid-radius uncertainty.
pub fn classify_ball_sign_with_policy(
    center: &Real,
    radius: &Real,
    policy: PredicatePolicy,
) -> PredicateOutcome<Sign> {
    match certified_ball_sign_outcome_with_policy(center, radius, policy) {
        BallFilterResult::Decided(outcome) => outcome,
        BallFilterResult::Uncertain => {
            PredicateOutcome::unknown(RefinementNeed::RealRefinement, Escalation::Filter)
        }
        BallFilterResult::InvalidRadius => {
            PredicateOutcome::unknown(RefinementNeed::Unsupported, Escalation::Filter)
        }
    }
}

/// Try to certify a sign from an exact closed ball enclosure with policy.
///
/// Returns `Some` only when the nonnegative ball certifies a sign. Use
/// [`classify_ball_sign_with_policy`] when invalid-radius and inconclusive
/// outcomes must remain distinct.
pub fn certified_ball_sign_with_policy(
    center: &Real,
    radius: &Real,
    policy: PredicatePolicy,
) -> Option<PredicateOutcome<Sign>> {
    match certified_ball_sign_outcome_with_policy(center, radius, policy) {
        BallFilterResult::Decided(outcome) => Some(outcome),
        BallFilterResult::Uncertain | BallFilterResult::InvalidRadius => None,
    }
}

/// Try to certify a sign from an exact closed interval enclosure with policy.
///
/// Returns `Some` only when the interval proves a sign. This shape is intended
/// for predicate filter callbacks such as `resolve_real_sign(..., || {
/// certified_interval_sign_with_policy(...) }, ...)`.
pub fn certified_interval_sign_with_policy(
    first: &Real,
    second: &Real,
    policy: PredicatePolicy,
) -> Option<PredicateOutcome<Sign>> {
    crate::trace_dispatch!("hyperlimit", "certified_interval_sign", "start");
    let zero = Real::from(0);

    // Endpoint comparisons are themselves exact predicates. Use their
    // report-bearing forms so trace/report users can audit the sub-decisions
    // that fed this interval certificate, keeping endpoint ordering inside the
    // certified-filter layer rather than treating it as anonymous scalar work.
    let (first_cmp, first_certainty) =
        ordering_and_certainty(compare_reals_with_policy(first, &zero, policy))?;
    let (second_cmp, second_certainty) =
        ordering_and_certainty(compare_reals_with_policy(second, &zero, policy))?;
    let certainty = filter_certainty(first_certainty, second_certainty);
    let lower_cmp = min_ordering(first_cmp, second_cmp);
    let upper_cmp = max_ordering(first_cmp, second_cmp);

    match (lower_cmp, upper_cmp) {
        (Ordering::Greater, Ordering::Greater) => {
            crate::trace_dispatch!("hyperlimit", "certified_interval_sign", "positive");
            Some(filtered(Sign::Positive, certainty))
        }
        (Ordering::Less, Ordering::Less) => {
            crate::trace_dispatch!("hyperlimit", "certified_interval_sign", "negative");
            Some(filtered(Sign::Negative, certainty))
        }
        (Ordering::Equal, Ordering::Equal) => {
            crate::trace_dispatch!("hyperlimit", "certified_interval_sign", "zero");
            Some(filtered(Sign::Zero, certainty))
        }
        _ => {
            crate::trace_dispatch!("hyperlimit", "certified_interval_sign", "crosses-zero");
            None
        }
    }
}

#[derive(Clone, Copy, Debug, Eq, PartialEq)]
enum BallFilterResult {
    Decided(PredicateOutcome<Sign>),
    Uncertain,
    InvalidRadius,
}

fn certified_ball_sign_outcome_with_policy(
    center: &Real,
    radius: &Real,
    policy: PredicatePolicy,
) -> BallFilterResult {
    crate::trace_dispatch!("hyperlimit", "certified_ball_sign", "start");
    let zero = Real::from(0);
    let radius_certainty = match compare_reals_with_policy(radius, &zero, policy) {
        PredicateOutcome::Decided {
            value: Ordering::Less,
            ..
        } => {
            crate::trace_dispatch!("hyperlimit", "certified_ball_sign", "invalid-radius");
            return BallFilterResult::InvalidRadius;
        }
        PredicateOutcome::Decided {
            value: Ordering::Equal | Ordering::Greater,
            certainty,
            ..
        } => certainty,
        PredicateOutcome::Unknown { .. } => {
            crate::trace_dispatch!("hyperlimit", "certified_ball_sign", "radius-unknown");
            return BallFilterResult::Uncertain;
        }
    };

    let lower = center - radius;
    let upper = center + radius;
    match certified_interval_sign_with_policy(&lower, &upper, policy) {
        Some(PredicateOutcome::Decided {
            value,
            certainty,
            stage,
        }) => {
            crate::trace_dispatch!("hyperlimit", "certified_ball_sign", "decided");
            BallFilterResult::Decided(PredicateOutcome::decided(
                value,
                weaker_certainty(radius_certainty, certainty),
                stage,
            ))
        }
        Some(PredicateOutcome::Unknown { .. }) | None => {
            crate::trace_dispatch!("hyperlimit", "certified_ball_sign", "uncertain");
            BallFilterResult::Uncertain
        }
    }
}

#[inline(always)]
fn filtered(sign: Sign, certainty: Certainty) -> PredicateOutcome<Sign> {
    PredicateOutcome::decided(sign, certainty, Escalation::Filter)
}

#[inline(always)]
fn ordering_and_certainty(outcome: PredicateOutcome<Ordering>) -> Option<(Ordering, Certainty)> {
    match outcome {
        PredicateOutcome::Decided {
            value, certainty, ..
        } => Some((value, certainty)),
        PredicateOutcome::Unknown { .. } => None,
    }
}

#[inline(always)]
const fn filter_certainty(left: Certainty, right: Certainty) -> Certainty {
    match weaker_certainty(left, right) {
        Certainty::Approximate => Certainty::Approximate,
        Certainty::Exact | Certainty::Filtered => Certainty::Filtered,
    }
}

#[inline(always)]
const fn weaker_certainty(left: Certainty, right: Certainty) -> Certainty {
    match (left, right) {
        (Certainty::Approximate, _) | (_, Certainty::Approximate) => Certainty::Approximate,
        (Certainty::Filtered, _) | (_, Certainty::Filtered) => Certainty::Filtered,
        (Certainty::Exact, Certainty::Exact) => Certainty::Exact,
    }
}

#[inline(always)]
fn min_ordering(left: Ordering, right: Ordering) -> Ordering {
    if ordering_rank(left) <= ordering_rank(right) {
        left
    } else {
        right
    }
}

#[inline(always)]
fn max_ordering(left: Ordering, right: Ordering) -> Ordering {
    if ordering_rank(left) >= ordering_rank(right) {
        left
    } else {
        right
    }
}

#[inline(always)]
fn ordering_rank(ordering: Ordering) -> i8 {
    match ordering {
        Ordering::Less => -1,
        Ordering::Equal => 0,
        Ordering::Greater => 1,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const APPROX: PredicatePolicy = PredicatePolicy::APPROXIMATE_512;

    fn terminally_unresolved_zero() -> Real {
        let sine = Real::e().sin();
        let cosine = Real::e().cos();
        let original = &sine * &sine + &cosine * &cosine - Real::one();
        // Preserve the original identity as a newly certified proof case.
        assert_eq!(
            original.exact_rational_normal_form(),
            Some(hyperreal::Rational::zero())
        );
        // A separate angle-addition identity retains the terminal-policy control.
        crate::test_support::terminally_unresolved_zero()
    }

    #[test]
    fn certified_interval_sign_decides_strict_and_zero_enclosures() {
        assert_eq!(
            crate::certified_interval_sign(&Real::from(1), &Real::from(3), APPROX),
            Some(PredicateOutcome::decided(
                Sign::Positive,
                Certainty::Filtered,
                Escalation::Filter
            ))
        );
        assert_eq!(
            crate::certified_interval_sign(&Real::from(-7), &Real::from(-2), APPROX),
            Some(PredicateOutcome::decided(
                Sign::Negative,
                Certainty::Filtered,
                Escalation::Filter
            ))
        );
        assert_eq!(
            crate::certified_interval_sign(&Real::from(0), &Real::from(0), APPROX),
            Some(PredicateOutcome::decided(
                Sign::Zero,
                Certainty::Filtered,
                Escalation::Filter
            ))
        );
        assert_eq!(
            crate::certified_interval_sign(&Real::from(-1), &Real::from(1), APPROX),
            None
        );
    }

    #[test]
    fn certified_ball_sign_decides_strict_zero_and_crossing_balls() {
        assert_eq!(
            crate::certified_ball_sign(&Real::from(5), &Real::from(2), APPROX),
            Some(PredicateOutcome::decided(
                Sign::Positive,
                Certainty::Filtered,
                Escalation::Filter
            ))
        );
        assert_eq!(
            crate::certified_ball_sign(&Real::from(-5), &Real::from(2), APPROX),
            Some(PredicateOutcome::decided(
                Sign::Negative,
                Certainty::Filtered,
                Escalation::Filter
            ))
        );
        assert_eq!(
            crate::certified_ball_sign(&Real::from(0), &Real::from(0), APPROX),
            Some(PredicateOutcome::decided(
                Sign::Zero,
                Certainty::Filtered,
                Escalation::Filter
            ))
        );
        assert_eq!(
            crate::certified_ball_sign(&Real::from(1), &Real::from(2), APPROX),
            None
        );
    }

    #[test]
    fn interval_and_ball_filters_preserve_terminal_approximation_certainty() {
        let undecidable = terminally_unresolved_zero();

        assert_eq!(
            certified_interval_sign_with_policy(
                &undecidable,
                &undecidable,
                PredicatePolicy::STRICT
            ),
            None
        );
        assert_eq!(
            certified_interval_sign_with_policy(&undecidable, &undecidable, APPROX,),
            Some(PredicateOutcome::decided(
                Sign::Zero,
                Certainty::Approximate,
                Escalation::Filter,
            ))
        );
        assert_eq!(
            classify_ball_sign_with_policy(&undecidable, &Real::zero(), APPROX,),
            PredicateOutcome::decided(Sign::Zero, Certainty::Approximate, Escalation::Filter,)
        );
        assert_eq!(
            classify_ball_sign_with_policy(&Real::zero(), &undecidable, PredicatePolicy::STRICT,),
            PredicateOutcome::unknown(RefinementNeed::RealRefinement, Escalation::Filter)
        );
        assert_eq!(
            classify_ball_sign_with_policy(&Real::zero(), &Real::from(-1), APPROX),
            PredicateOutcome::unknown(RefinementNeed::Unsupported, Escalation::Filter)
        );
        assert_eq!(
            certified_ball_sign_with_policy(&Real::zero(), &Real::from(-1), APPROX),
            None
        );

        assert_eq!(
            min_ordering(Ordering::Greater, Ordering::Less),
            Ordering::Less
        );
    }
}
