#![cfg(feature = "rational")]

use hyperinterval::{IntervalError, RationalInterval as I};
use hyperreal::{Problem, Rational as R};

#[test]
fn fraction_uncertainty_has_independent_exact_endpoints_and_composes() {
    for n in -8..=8_i64 {
        for d in 1..=7_u64 {
            for radius in 0..=8_i64 {
                for scale in 1..=7_u64 {
                    let nominal = R::fraction(n, d).unwrap();
                    let interval =
                        I::from_nominal_fraction_uncertainty(&nominal, radius, scale).unwrap();
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
fn fraction_validation_preserves_scalar_failure_and_negative_radius() {
    for numerator in [i64::MIN, -1, 0, 1, i64::MAX] {
        assert_eq!(
            I::from_nominal_fraction_uncertainty(&R::zero(), numerator, 0),
            Err(IntervalError::Scalar(Problem::DivideByZero))
        );
        let result = I::from_nominal_fraction_uncertainty(&R::one(), numerator, u64::MAX);
        if numerator < 0 {
            assert_eq!(result, Err(IntervalError::NegativeRadius));
        } else {
            let radius = R::fraction(numerator, u64::MAX).unwrap();
            assert_eq!(
                result.unwrap(),
                I::from_nominal_uncertainty(&R::one(), &radius).unwrap()
            );
        }
    }
}

#[test]
fn arbitrary_nominal_and_large_fraction_remain_exact() {
    let nominal: R = format!("1{}7", "0".repeat(1200)).parse().unwrap();
    let interval = I::from_nominal_fraction_uncertainty(&nominal, i64::MAX, u64::MAX).unwrap();
    let radius = R::fraction(i64::MAX, u64::MAX).unwrap();
    assert_eq!(interval.lower(), Some(&(&nominal - &radius)));
    assert_eq!(interval.upper(), Some(&(&nominal + &radius)));
    assert_eq!(
        I::from_nominal_fraction_uncertainty(&nominal, 0, 17).unwrap(),
        I::point(nominal)
    );
}
