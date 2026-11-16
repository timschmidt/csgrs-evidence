//! Transport of a proved nonempty rational interval through native constructions.
use super::{Bounds, IntervalError, PositiveRationalInterval, Rational, RationalInterval};

/// A nonempty closed real interval with exact rational endpoints.
///
/// This refinement retains nonemptiness across constructors that establish it
/// algebraically. It shares the general carrier's endpoint authority and does
/// not add scalar decisions when converted back. Arithmetic retains the general
/// rational backend's resource exclusions.
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct NonEmptyRationalInterval {
    pub(super) bounds: Bounds<Rational>,
}

impl NonEmptyRationalInterval {
    /// Checks endpoint order without changing either exact endpoint.
    pub fn new(lower: Rational, upper: Rational) -> Result<Self, IntervalError> {
        Ok(Self {
            bounds: Bounds::new(lower, upper)?,
        })
    }

    /// Exact nonempty set `nominal ± numerator/denominator`.
    ///
    /// Unsigned numerator and nonzero denominator establish nonnegative radius.
    /// No sign or order predicate is repeated on the converted radius/endpoints.
    pub fn from_nominal_unsigned_uncertainty(
        nominal: &Rational,
        numerator: u64,
        denominator: core::num::NonZeroU64,
    ) -> Self {
        let uncertainty = Rational::from((numerator, denominator));
        Self::centered(nominal, &uncertainty)
    }

    // Callers establish a nonnegative uncertainty before endpoint arithmetic.
    pub(super) fn centered(nominal: &Rational, uncertainty: &Rational) -> Self {
        Self {
            bounds: Bounds::ordered(nominal - uncertainty, nominal + uncertainty),
        }
    }

    /// Borrow the exact ordered endpoints.
    pub fn bounds(&self) -> (&Rational, &Rational) {
        self.bounds.as_refs().endpoints()
    }

    /// Transfer both exact endpoints without cloning or revalidation.
    pub fn into_bounds(self) -> (Rational, Rational) {
        self.bounds.endpoints()
    }

    /// Return the same set in the general carrier, without new decisions.
    pub fn into_interval(self) -> RationalInterval {
        RationalInterval {
            bounds: Some(self.bounds),
        }
    }

    /// Refine strict positivity with one exact comparison of the lower bound.
    ///
    /// `None` means the lower endpoint is nonpositive. Empty input is impossible
    /// for this carrier and needs neither an error branch nor a fresh proof.
    pub fn into_positive(self) -> Option<PositiveRationalInterval> {
        PositiveRationalInterval::from_bounds(self.bounds)
    }
}

impl RationalInterval {
    /// Preserve the existing ordered endpoints when the set is nonempty.
    /// `None` denotes exactly the empty set; no scalar predicate is evaluated.
    pub fn into_nonempty(self) -> Option<NonEmptyRationalInterval> {
        self.bounds
            .map(|bounds| NonEmptyRationalInterval { bounds })
    }
}
