use crate::IntervalError;

// Every caller establishes a positive denominator. Division cannot meet
// i128::MIN / -1. A nonzero remainder implies the quotient is below i128::MAX,
// so the ceiling increment cannot overflow, even for full-width numerators.
#[inline]
pub(crate) fn positive_quotient_bounds(numerator: i128, denominator: i128) -> (i128, i128) {
    let lower = numerator.div_euclid(denominator);
    // The bound above proves this addition cannot wrap. Expressing that fact
    // allows a caller needing only the floor to discard the unused ceiling
    // computation, including its otherwise redundant overflow panic path.
    let upper = lower.wrapping_add(i128::from(numerator.rem_euclid(denominator) != 0));
    (lower, upper)
}

/// Exact integer floor and ceiling of the rational value `numerator / denominator`.
///
/// Returns `(floor, ceiling)`, equal precisely for an integral quotient. These
/// are numerical bounds on the rational value, not a claim that a discrete
/// integer set contains a noninteger value. Neither endpoint is selected as a
/// replacement for the exact ratio.
///
/// A zero denominator returns [`IntervalError::ContainsZero`]. The sole
/// unrepresentable quotient, `i128::MIN / -1`, returns [`IntervalError::Overflow`].
/// Both denominator signs and signed extremes are supported without allocating,
/// changing rounding state or requiring arbitrary precision.
///
/// ```
/// use hyperinterval::integer_quotient_bounds;
/// assert_eq!(integer_quotient_bounds(-7, 3).unwrap(), (-3, -2));
/// assert_eq!(integer_quotient_bounds(-7, -3).unwrap(), (2, 3));
/// ```
#[inline]
pub fn integer_quotient_bounds(
    numerator: i128,
    denominator: i128,
) -> Result<(i128, i128), IntervalError> {
    if denominator > 0 {
        return Ok(positive_quotient_bounds(numerator, denominator));
    }
    if denominator == 0 {
        return Err(IntervalError::ContainsZero);
    }
    // Do not negate a signed minimum merely to normalize the denominator.
    let quotient = numerator
        .checked_div(denominator)
        .ok_or(IntervalError::Overflow)?;
    let inexact = numerator % denominator != 0;
    Ok((
        quotient - i128::from(inexact && numerator > 0),
        quotient + i128::from(inexact && numerator < 0),
    ))
}
