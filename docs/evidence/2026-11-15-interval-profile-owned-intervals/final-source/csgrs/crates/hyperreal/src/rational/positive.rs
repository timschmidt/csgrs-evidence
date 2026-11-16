use super::Rational;
use core::num::NonZeroU64;

/// An exact rational value with a retained strict-positivity proof.
///
/// Construction from a nonzero unsigned integer establishes positivity without
/// a scalar predicate. Borrowing and consumption preserve that exact value.
/// This witness has the same arbitrary-precision resource exclusions as Rational.
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct PositiveRational(Rational);

impl From<NonZeroU64> for PositiveRational {
    fn from(value: NonZeroU64) -> Self {
        Self(Rational::from(value.get()))
    }
}

impl PositiveRational {
    /// Borrow the positive exact value without revalidation.
    pub const fn as_rational(&self) -> &Rational {
        &self.0
    }

    /// Transfer the exact value without cloning or revalidation.
    pub fn into_rational(self) -> Rational {
        self.0
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn nonzero_integer_witness_preserves_full_width_canonical_components() {
        for n in [1, 2, 17, 1000, u32::MAX as u64, 1_u64 << 63, u64::MAX] {
            let value = PositiveRational::from(NonZeroU64::new(n).unwrap());
            assert_eq!(value.as_rational().numerator(), &num::BigUint::from(n));
            assert_eq!(value.as_rational().denominator(), &num::BigUint::from(1_u8));
            assert!(value.as_rational().is_positive());
            assert_eq!(value.clone().into_rational(), Rational::from(n));
            assert_eq!(value.as_rational().to_string(), n.to_string());
        }
    }
}
