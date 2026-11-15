use crate::IntervalError;
use hyperreal::Rational;
use num_bigint::{BigInt, BigUint, Sign};
use num_integer::Integer;
use num_traits::{One, Zero};

/// One tight rational bound for `sqrt(value)` on a fractional binary grid.
///
/// `precision <= 0` selects spacing `2^precision`; `lower` chooses the floor
/// when true and ceiling otherwise. Negative values return `EmptyDomain`, and
/// positive precisions return `InvalidScale`, in that validation order.
///
/// This exact integer-arithmetic adapter preserves the one-bound contract of
/// rational proof consumers. Input construction, integer division/root work,
/// coefficient growth and heap usage have no separate budget or cancellation
/// bound. The caller must admit the input size and requested precision. The
/// existing interval `sqrt` operations retain their caller-owned budgets.
#[inline]
pub fn rational_sqrt_bound(
    value: &Rational,
    precision: i32,
    lower: bool,
) -> Result<Rational, IntervalError> {
    if value.sign() == Sign::Minus {
        return Err(IntervalError::EmptyDomain);
    }
    if precision > 0 {
        return Err(IntervalError::InvalidScale);
    }
    let shift = usize::try_from(precision.unsigned_abs()).map_err(|_| IntervalError::Overflow)?;
    let scaled = value.numerator() << shift.checked_mul(2).ok_or(IntervalError::Overflow)?;
    let (quotient, remainder) = scaled.div_rem(value.denominator());
    let root = quotient.sqrt();
    let exact = remainder.is_zero() && &root * &root == quotient;
    let grid = if lower || exact {
        root
    } else {
        root + BigUint::one()
    };
    Rational::from_bigint_fraction(
        BigInt::from_biguint(Sign::Plus, grid),
        BigUint::one() << shift,
    )
    .map_err(IntervalError::Scalar)
}
