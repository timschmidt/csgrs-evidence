use core::num::NonZeroU64;
use hyperreal::{Problem, Rational};

#[test]
fn unsigned_fraction_preserves_full_width_and_composes() {
    for n in [0, 1, 2, 17, i64::MAX as u64, 1_u64 << 63, u64::MAX] {
        for d in [1, 2, 17, 1_u64 << 63, u64::MAX] {
            let value = Rational::unsigned_fraction(n, NonZeroU64::new(d).unwrap());
            let expected: Rational = format!("{n}/{d}").parse().unwrap();
            assert_eq!(value, expected);
            assert_eq!(&value * &Rational::from(d), Rational::from(n));
            assert_eq!(&value - &value, Rational::zero());
            if let Ok(signed) = i64::try_from(n) {
                let old = Rational::fraction(signed, d).unwrap();
                assert_eq!(format!("{value:?}"), format!("{old:?}"));
            }
        }
    }
    assert_eq!(Rational::fraction(1, 0), Err(Problem::DivideByZero));
    assert_eq!(
        Rational::fraction(-1, 2).unwrap() + Rational::fraction(1, 2).unwrap(),
        Rational::zero()
    );
}
