#![cfg(all(feature = "rational", feature = "dyadic"))]
use hyperinterval::{IntervalError, rational_sqrt_bound};
use hyperreal::Rational;

#[test]
fn one_sided_root_preserves_domain_order_and_exact_grid_squares() {
    for lower in [true, false] {
        for precision in [i32::MIN, -32, 0, i32::MAX] {
            assert_eq!(
                rational_sqrt_bound(&Rational::from(-1), precision, lower),
                Err(IntervalError::EmptyDomain)
            );
        }
        for precision in [1, i32::MAX] {
            assert_eq!(
                rational_sqrt_bound(&Rational::zero(), precision, lower),
                Err(IntervalError::InvalidScale)
            );
        }
        for precision in [-512, -32, -1] {
            assert_eq!(
                rational_sqrt_bound(&Rational::fraction(9, 4).unwrap(), precision, lower),
                Ok(Rational::fraction(3, 2).unwrap())
            );
            assert_eq!(
                rational_sqrt_bound(&Rational::zero(), precision, lower),
                Ok(Rational::zero())
            );
        }
    }
    assert_eq!(rational_sqrt_bound(&2.into(), 0, true), Ok(1.into()));
    assert_eq!(rational_sqrt_bound(&2.into(), 0, false), Ok(2.into()));
}

#[cfg(not(target_env = "msvc"))]
#[path = "../../hyperreal/tests/support/mpfr.rs"]
mod mpfr_cache;
#[cfg(not(target_env = "msvc"))]
#[path = "support/sqrt_oracle.rs"]
mod sqrt_oracle;

#[cfg(not(target_env = "msvc"))]
#[test]
fn one_sided_bounds_are_tight_by_independent_squared_inequalities() {
    use hyperinterval::{DyadicBudget, RationalInterval};
    use rug::Rational as Q;
    let mut cases = 0;
    for numerator in 0..=64 {
        for denominator in 1..=17 {
            for precision in [-40, -8, 0] {
                let input = Rational::fraction(numerator, denominator).unwrap();
                let lo = rational_sqrt_bound(&input, precision, true).unwrap();
                let hi = rational_sqrt_bound(&input, precision, false).unwrap();
                let bounds = RationalInterval::new(lo, hi).unwrap();
                let mut budget = DyadicBudget::new(16384, 100_000_000_000);
                let dyadic = bounds.to_dyadic(precision, &mut budget).unwrap();
                // Conversion cannot hide an off-grid result from the tightness oracle.
                assert_eq!(dyadic.to_rational(&mut budget).unwrap(), bounds);
                sqrt_oracle::verify(
                    &dyadic,
                    Q::from((numerator, denominator)),
                    Q::from((numerator, denominator)),
                    precision,
                );
                // Generated one-sided outputs form an interval consumable by
                // the existing two-sided operation without changing authority.
                let square = dyadic.square(&mut budget).unwrap();
                assert!(square.to_rational(&mut budget).unwrap().contains_point(&input));
                cases += 1;
            }
        }
    }
    assert_eq!(cases, 3315);
}
