impl Rational {
    /// The exact nonnegative fraction with a nonzero denominator.
    ///
    /// The input types establish the sign and exclude division by zero. Both
    /// numerator ranges use the existing exact fraction constructors.
    #[inline]
    pub fn unsigned_fraction(numerator: u64, denominator: core::num::NonZeroU64) -> Self {
        if let Ok(numerator) = i64::try_from(numerator) {
            Self::fraction(numerator, denominator.get()).expect("nonzero denominator")
        } else {
            Self::from_bigint_fraction(BigInt::from(numerator), BigUint::from(denominator.get()))
                .expect("nonzero denominator")
        }
    }
}
