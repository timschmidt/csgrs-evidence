#![cfg(feature = "rational")]
use core::num::NonZeroU64;
use hyperinterval::NonEmptyRationalInterval as I;
use hyperreal::{PositiveRational, Rational as R};

const fn borrowed_endpoints(value: &I) -> (&R, &R) {
    value.bounds()
}

#[test]
fn retained_bounds_scale_exactly_and_remain_subsequent_operands() {
    let source = I::new(R::fraction(-7, 13).unwrap(), R::fraction(5, 3).unwrap()).unwrap();
    let result =
        source.quotient_positive_scalar(PositiveRational::from(NonZeroU64::new(17).unwrap()));
    assert_eq!(
        borrowed_endpoints(&result),
        (&R::fraction(-7, 221).unwrap(), &R::fraction(5, 51).unwrap())
    );
    for divisor in [1, 2, 17, 1000, u32::MAX as u64, 1_u64 << 63, u64::MAX] {
        for (lo, hi) in [(-7, -3), (-7, 3), (0, 0), (0, 7), (3, 7)] {
            let input = I::new(R::from(lo), R::from(hi)).unwrap();
            let scaled = input.quotient_positive_scalar(PositiveRational::from(
                NonZeroU64::new(divisor).unwrap(),
            ));
            let (lower, upper) = borrowed_endpoints(&scaled);
            assert_eq!(lower * R::from(divisor), R::from(lo));
            assert_eq!(upper * R::from(divisor), R::from(hi));
            let repeated = scaled
                .quotient_positive_scalar(PositiveRational::from(NonZeroU64::new(3).unwrap()));
            assert_eq!(repeated.bounds().0 * R::from(3), *lower);
            assert_eq!(repeated.bounds().1 * R::from(3), *upper);
            assert_eq!(
                input.clone().into_interval().into_nonempty().unwrap(),
                input
            );
        }
    }
    let positive = I::new(R::from(2), R::from(3))
        .unwrap()
        .into_positive()
        .unwrap();
    assert_eq!(
        positive.into_nonempty().into_bounds(),
        (R::from(2), R::from(3))
    );
    assert_eq!(std::mem::size_of::<I>(), 2 * std::mem::size_of::<R>());
    assert_eq!(
        std::mem::size_of::<PositiveRational>(),
        std::mem::size_of::<R>()
    );
}

#[cfg(feature = "dispatch-trace")]
#[test]
fn one_conversion_and_nominal_lower_upper_division_keep_complete_dispatch() {
    use hyperreal::dispatch_trace;
    for divisor in [1, 2, 17, 1000, u32::MAX as u64, 1_u64 << 63, u64::MAX] {
        for (lo, hi) in [(-7, -3), (-7, 3), (0, 0), (0, 7), (3, 7)] {
            let nominal = R::fraction(lo + hi, 2).unwrap();
            let interval = I::new(R::from(lo), R::from(hi)).unwrap();
            for _warm in [false, true] {
                dispatch_trace::reset();
                dispatch_trace::reset_rational_stats();
                let old = dispatch_trace::with_recording(|| {
                    let divisor = R::from(divisor);
                    let nominal = &nominal / &divisor;
                    let lower = interval.bounds().0 / &divisor;
                    let upper = interval.bounds().1 / divisor;
                    (nominal, lower, upper)
                });
                let expected = dispatch_trace::take_trace();
                dispatch_trace::reset();
                dispatch_trace::reset_rational_stats();
                let new = dispatch_trace::with_recording(|| {
                    let divisor = PositiveRational::from(NonZeroU64::new(divisor).unwrap());
                    let nominal = &nominal / divisor.as_rational();
                    let (lower, upper) = interval.quotient_positive_scalar(divisor).into_bounds();
                    (nominal, lower, upper)
                });
                let actual = dispatch_trace::take_trace();
                assert_eq!(new, old);
                assert_eq!(actual, expected, "divisor={divisor}, [{lo},{hi}]");
            }
        }
    }
}

#[cfg(not(target_env = "msvc"))]
#[path = "support/rational_oracle.rs"]
mod rational_oracle;

#[cfg(not(target_env = "msvc"))]
#[test]
fn large_generated_bounds_divide_against_independent_gmp() {
    let magnitude: R = format!("1{}7/91", "0".repeat(1200)).parse().unwrap();
    let source = I::new(-&magnitude, &magnitude + R::fraction(11, 13).unwrap()).unwrap();
    for d in [1, 17, 1000, u64::MAX] {
        let result =
            source.quotient_positive_scalar(PositiveRational::from(NonZeroU64::new(d).unwrap()));
        let denominator = rug::Integer::from(d);
        let expected_lower = rational_oracle::mpq(source.bounds().0) / &denominator;
        let expected_upper = rational_oracle::mpq(source.bounds().1) / &denominator;
        assert_eq!(rational_oracle::mpq(result.bounds().0), expected_lower);
        assert_eq!(rational_oracle::mpq(result.bounds().1), expected_upper);
        let repeated =
            result.quotient_positive_scalar(PositiveRational::from(NonZeroU64::new(3).unwrap()));
        assert_eq!(
            rational_oracle::mpq(repeated.bounds().0),
            expected_lower / 3
        );
        assert_eq!(
            rational_oracle::mpq(repeated.bounds().1),
            expected_upper / 3
        );
    }
}
