use super::Real;
use crate::{CertifiedRealOrdering, Rational};
use num::{BigInt, BigRational, One};
use std::cmp::Ordering;

#[test]
fn explicit_affine_subtraction_retains_exact_rational_results() {
    let bases = [
        Real::from(2).sqrt().unwrap(),
        Real::pi(),
        Real::one().sin(),
    ];
    for base in bases {
        for (n, d) in [(1, 1), (-1, 1), (-3, 1), (7, 11), (-1, 1024), (1024, 1)] {
            let scale = Rational::fraction(n, d).unwrap();
            // (5/8 - (-3/7)) * (n/d) = 59*n/(56*d), independently derived.
            let oracle = BigRational::new(BigInt::from(59 * n), BigInt::from(56 * d));
            let expected = Rational::from_bigint_fraction(
                oracle.numer().clone(), oracle.denom().magnitude().clone(),
            ).unwrap();
            for reverse_left in [false, true] {
                for reverse_right in [false, true] {
                    let affine = |offset: Rational, reversed| {
                        let offset = Real::new(offset);
                        let sum = if reversed { offset + &base } else { &base + offset };
                        sum * Real::new(scale.clone())
                    };
                    let left = affine(Rational::fraction(5, 8).unwrap(), reverse_left);
                    let right = affine(Rational::fraction(-3, 7).unwrap(), reverse_right);
                    assert_eq!((&left - &right).exact_rational(), Some(expected.clone()));
                    assert_eq!((&right - &left).exact_rational(), Some(-&expected));
                    let mut assigned = left.clone();
                    assigned -= &right;
                    assert_eq!(assigned.exact_rational(), Some(expected.clone()));
                    assert_eq!((left - right).exact_rational(), Some(expected.clone()));
                }
            }
        }
    }
}

#[test]
fn explicit_affine_subtraction_handles_bare_shared_bases() {
    let base = Real::from(7).sin();
    let delta = Rational::fraction(7, 11).unwrap();
    let shifted = &base + Real::new(delta.clone());
    assert_eq!((&shifted - &base).exact_rational(), Some(delta.clone()));
    assert_eq!((&base - &shifted).exact_rational(), Some(-delta));
}

#[test]
fn explicit_affine_subtraction_preserves_cold_and_warm_operands() {
    for warmed in [false, true] {
        let base = Real::from(7).sin();
        let left = &base + Real::from(100);
        let right = &base + Real::from(101);
        if warmed {
            left.certified_rational_interval(-32).unwrap();
            right.certified_rational_interval(-64).unwrap();
        }
        let before = (
            left.cached_rational_interval(-32),
            right.cached_rational_interval(-64),
        );
        for precision in [0, -128, 0] {
            assert_eq!((&left - &right).exact_rational(), Some(Rational::new(-1)));
            assert!(matches!(left.certified_cmp_until(&right, precision),
                CertifiedRealOrdering::Known { ordering: Ordering::Less, .. }));
        }
        assert_eq!(left.cached_rational_interval(-32), before.0);
        assert_eq!(right.cached_rational_interval(-64), before.1);
    }
}

#[test]
fn explicit_affine_subtraction_composes_without_a_symbolic_chain() {
    let base = Real::from(7).sin();
    let mut total = Real::zero();
    for i in 0..512 {
        let left = &base + Real::from(i + 1);
        let right = &base + Real::from(i);
        total += left - right;
        assert_eq!(total.exact_rational(), Some(Rational::new(i + 1)));
    }
    assert_eq!((total / Real::from(512)).unwrap().exact_rational(), Some(Rational::one()));
}

#[test]
fn explicit_affine_subtraction_keeps_unequal_symbolic_terms() {
    let sqrt_two = Real::from(2).sqrt().unwrap();
    let sqrt_three = Real::from(3).sqrt().unwrap();
    let left = &sqrt_two + Real::from(100);
    let right = &sqrt_three + Real::from(101);
    let difference = &left - &right;
    assert!(difference.exact_rational().is_none());
    assert!(matches!(difference.certified_cmp_until(&Real::zero(), -512),
        CertifiedRealOrdering::Known { ordering: Ordering::Less, .. }));
    let different_coefficient = &sqrt_two * Real::from(2) + Real::from(100);
    let difference = different_coefficient - left;
    assert!(difference.exact_rational().is_none());
    assert!(matches!(difference.certified_cmp_until(&Real::zero(), -512),
        CertifiedRealOrdering::Known { ordering: Ordering::Greater, .. }));
}

#[test]
fn explicit_affine_subtraction_declines_oversized_scale_recognition() {
    let base = Real::from(7).sin();
    let scale = Real::new(Rational::from_bigint((BigInt::one() << 8192_usize) + BigInt::one()));
    let left = (&base + Real::from(100)) * &scale;
    let right = (&base + Real::from(101)) * &scale;
    assert!((left - right).exact_rational().is_none());
}
