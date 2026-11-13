impl Rational {
    /// The exact nonnegative fraction with a nonzero denominator.
    ///
    /// The input types establish the sign and exclude division by zero. The
    /// fraction is reduced using the same representation as [`Self::fraction`].
    #[inline]
    pub fn unsigned_fraction(numerator: u64, denominator: core::num::NonZeroU64) -> Self {
        Self::from_fraction_parts_reduced(
            Plus,
            BigUint::from(numerator),
            BigUint::from(denominator.get()),
        )
    }
}
