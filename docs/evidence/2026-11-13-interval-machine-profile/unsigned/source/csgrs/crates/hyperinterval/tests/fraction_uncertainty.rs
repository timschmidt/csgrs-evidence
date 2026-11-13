#![cfg(feature = "rational")]

use core::num::NonZeroU64;
use hyperinterval::{IntervalError, RationalInterval as I};
use hyperreal::Rational as R;

#[test]
fn fraction_uncertainty_has_independent_exact_endpoints_and_composes() {
    for n in -8..=8_i64 {
        for d in 1..=7_u64 {
            for radius in 0..=8_i64 {
                for scale in 1..=7_u64 {
                    let nominal = R::fraction(n, d).unwrap();
                    let interval = I::from_nominal_unsigned_uncertainty(
                        &nominal,
                        radius as u64,
                        NonZeroU64::new(scale).unwrap(),
                    );
                    let low = R::fraction(n * scale as i64 - radius * d as i64, d * scale).unwrap();
                    let high =
                        R::fraction(n * scale as i64 + radius * d as i64, d * scale).unwrap();
                    assert_eq!(interval.bounds(), Some((&low, &high)));
                    assert!(interval.contains_point(&nominal));
                    assert_eq!(interval.add(&interval.neg()).lower(), Some(&(&low - &high)));
                    assert_eq!(interval.width(), Some(high - low));
                }
            }
        }
    }
}

#[test]
fn unsigned_radius_covers_full_width_and_signed_radius_stays_checked() {
    for numerator in [0, 1, i64::MAX as u64, 1_u64 << 63, u64::MAX] {
        let denominator = NonZeroU64::new(u64::MAX).unwrap();
        let radius: R = format!("{numerator}/{}", u64::MAX).parse().unwrap();
        let interval = I::from_nominal_unsigned_uncertainty(&R::one(), numerator, denominator);
        assert_eq!(
            interval,
            I::from_nominal_uncertainty(&R::one(), &radius).unwrap()
        );
        assert_eq!(interval.width(), Some(&radius + &radius));
    }
    assert_eq!(
        I::from_nominal_uncertainty(&R::one(), &R::minus_one()),
        Err(IntervalError::NegativeRadius)
    );
}

#[test]
fn arbitrary_nominal_and_large_fraction_remain_exact() {
    let nominal: R = format!("1{}7", "0".repeat(1200)).parse().unwrap();
    let interval = I::from_nominal_unsigned_uncertainty(
        &nominal,
        i64::MAX as u64,
        NonZeroU64::new(u64::MAX).unwrap(),
    );
    let radius = R::fraction(i64::MAX, u64::MAX).unwrap();
    assert_eq!(interval.lower(), Some(&(&nominal - &radius)));
    assert_eq!(interval.upper(), Some(&(&nominal + &radius)));
    assert_eq!(
        I::from_nominal_unsigned_uncertainty(&nominal, 0, NonZeroU64::new(17).unwrap()),
        I::point(nominal)
    );
}
