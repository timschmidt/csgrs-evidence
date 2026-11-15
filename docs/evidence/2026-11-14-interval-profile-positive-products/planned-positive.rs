//! Retained nonempty positivity for monotone rational interval arithmetic.
use super::{Bounds, IntervalError, Rational, RationalInterval};

/// A nonempty exact rational interval whose lower endpoint is strictly positive.
///
/// Construction validates this refinement once. Products and quotients preserve
/// it algebraically and do not repeat sign predicates. This is a specialization;
/// the general [`RationalInterval`] retains its empty and signed domains.
/// Arbitrary-precision arithmetic has the same resource exclusions as that type.
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct PositiveRationalInterval {
    bounds: Bounds<Rational>,
}

impl RationalInterval {
    /// Refine a nonempty interval to a retained strict-positivity proof.
    ///
    /// Empty is [`IntervalError::EmptyDomain`]; a nonpositive lower endpoint is
    /// [`IntervalError::NonPositiveLowerBound`]. The lower bound is compared to
    /// exact zero once, preserving this decision separately from sign-bit tests.
    pub fn into_positive(self) -> Result<PositiveRationalInterval, IntervalError> {
        let bounds = self.bounds.ok_or(IntervalError::EmptyDomain)?;
        if bounds.as_refs().endpoints().0 <= &Rational::zero() {
            return Err(IntervalError::NonPositiveLowerBound);
        }
        Ok(PositiveRationalInterval { bounds })
    }
}

impl PositiveRationalInterval {
    /// Borrow the exact ordered endpoints of this nonempty interval.
    pub fn bounds(&self) -> (&Rational, &Rational) {
        self.bounds.as_refs().endpoints()
    }

    /// Transfer the exact endpoints without cloning or revalidation.
    pub fn into_bounds(self) -> (Rational, Rational) {
        self.bounds.endpoints()
    }

    /// Return the same set in the general interval carrier without revalidation.
    pub fn into_interval(self) -> RationalInterval {
        RationalInterval { bounds: Some(self.bounds) }
    }

    /// Exact product of a finite sequence of positive interval sets.
    ///
    /// Zero factors give `[1,1]`; one factor is copied. Otherwise lower products
    /// run in input order, followed by upper products in input order. No sign
    /// predicate or extra multiplication by one is performed. Input factors are
    /// independently ranged; repeated references do not assert correlation.
    pub fn product(factors: &[&Self]) -> Self {
        let Some((first, rest)) = factors.split_first() else {
            return Self { bounds: Bounds::point(Rational::one()) };
        };
        let Some((second, tail)) = rest.split_first() else {
            return (*first).clone();
        };
        let lower = tail.iter().fold(first.bounds().0 * second.bounds().0, |value, factor| value * factor.bounds().0);
        let upper = tail.iter().fold(first.bounds().1 * second.bounds().1, |value, factor| value * factor.bounds().1);
        Self { bounds: Bounds::ordered(lower, upper) }
    }

    /// Exact quotient by a positive interval, retaining the nonempty proof.
    ///
    /// The divisor's positive lower endpoint excludes zero. The numerator is
    /// consumed; lower/upper divisions run in that order with no new predicates.
    pub fn div(self, divisor: &Self) -> Self {
        let (lower, upper) = self.into_bounds();
        let (denominator_lower, denominator_upper) = divisor.bounds();
        Self { bounds: Bounds::ordered(lower / denominator_upper, upper / denominator_lower) }
    }
}
