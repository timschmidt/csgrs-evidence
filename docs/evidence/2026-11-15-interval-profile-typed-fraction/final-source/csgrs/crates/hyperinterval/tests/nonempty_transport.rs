#![cfg(feature = "rational")]
use hyperinterval::NonEmptyRationalInterval;
use hyperreal::Rational;
#[test]
fn construction_nonemptiness_survives_native_transport() {
    let interval = NonEmptyRationalInterval::new(Rational::from(-2), Rational::from(3)).unwrap();
    assert_eq!(
        interval.into_bounds(),
        (Rational::from(-2), Rational::from(3))
    );
}

#[test]
fn nonempty_refinement_preserves_empty_and_order_failure_distinctions() {
    use hyperinterval::{IntervalError, RationalInterval};
    assert_eq!(
        NonEmptyRationalInterval::new(Rational::from(3), Rational::from(-2)),
        Err(IntervalError::ReversedEndpoints)
    );
    assert!(RationalInterval::empty().into_nonempty().is_none());
    for (lo, hi) in [(-2, 3), (0, 0), (0, 3), (2, 3)] {
        let source = RationalInterval::new(Rational::from(lo), Rational::from(hi)).unwrap();
        let nonempty = source.clone().into_nonempty().unwrap();
        assert_eq!(nonempty.clone().into_interval(), source);
        assert_eq!(nonempty.clone().into_positive().is_some(), lo > 0);
        if let Some(positive) = nonempty.into_positive() {
            assert_eq!(positive.into_interval(), source);
        }
    }
}

#[test]
fn unsigned_radius_retains_nonempty_endpoints_and_subsequent_arithmetic() {
    use core::num::NonZeroU64;
    for nominal in -5_i64..=5 {
        for radius in 0_u64..=7 {
            for denominator in 1_u64..=5 {
                let interval = NonEmptyRationalInterval::from_nominal_unsigned_uncertainty(
                    &Rational::fraction(nominal, 3).unwrap(),
                    radius,
                    NonZeroU64::new(denominator).unwrap(),
                );
                let lo = Rational::fraction(
                    nominal * denominator as i64 - 3 * radius as i64,
                    3 * denominator,
                )
                .unwrap();
                let hi = Rational::fraction(
                    nominal * denominator as i64 + 3 * radius as i64,
                    3 * denominator,
                )
                .unwrap();
                assert_eq!(interval.bounds(), (&lo, &hi));
                let general = interval.into_interval();
                assert_eq!(
                    general.add(&general).into_nonempty().unwrap().into_bounds(),
                    (&lo + &lo, &hi + &hi)
                );
            }
        }
    }
}
