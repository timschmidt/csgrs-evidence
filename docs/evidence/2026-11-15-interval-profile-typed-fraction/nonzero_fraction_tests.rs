use super::*;
use core::num::NonZeroU64;

const VALUES: [u64; 16] = [
    0, 1, 2, 3, 6, 17, 64, 96, 257, 65_536,
    (1_u64 << 32) - 1, 1_u64 << 32, i64::MAX as u64,
    1_u64 << 63, u64::MAX - 1, u64::MAX,
];

#[test]
fn nonzero_fraction_full_unsigned_domain_matches_independent_canonical_oracle() {
    for n in VALUES {
        for d in VALUES.into_iter().filter_map(NonZeroU64::new) {
            let actual = Rational::from((n, d));
            let expected = num::BigRational::new(BigInt::from(n), BigInt::from(d.get()));
            assert_eq!(actual.numerator(), expected.numer().magnitude(), "{n}/{d}");
            assert_eq!(actual.denominator(), expected.denom().magnitude(), "{n}/{d}");
            assert_eq!(actual.sign(), expected.numer().sign(), "{n}/{d}");
            assert_eq!(&actual * Rational::from(d.get()), Rational::from(n));
            assert_eq!(&actual - &actual, Rational::zero());
            if let Ok(signed) = i64::try_from(n) {
                let old = Rational::fraction(signed, d.get()).unwrap();
                assert_eq!(actual, old);
                assert_eq!(format!("{actual:?}"), format!("{old:?}"));
                assert_eq!(actual.to_string(), old.to_string());
                #[cfg(feature = "serde")]
                assert_eq!(serde_json::to_vec(&actual).unwrap(), serde_json::to_vec(&old).unwrap());
            }
        }
    }
    for signed in [i64::MIN, -1, 0, 1, i64::MAX] {
        assert_eq!(Rational::fraction(signed, 0), Err(Problem::DivideByZero));
    }
    assert_eq!(Rational::fraction(i64::MIN, 1_u64 << 63).unwrap(), Rational::from(-1));
}

#[cfg(feature = "dispatch-trace")]
#[test]
fn nonzero_fraction_preserves_complete_historical_dispatch() {
    use crate::dispatch_trace;
    const KEY: &str = "HYPERREAL_NONZERO_FRACTION_TRACE_SIDE";
    const TEST: &str = "rational::arithmetic::nonzero_fraction_tests::nonzero_fraction_preserves_complete_historical_dispatch";
    if let Ok(side) = std::env::var(KEY) {
        assert!(side == "original" || side == "typed");
        for warm in [false, true] {
            for n in VALUES.into_iter().filter(|n| *n <= i64::MAX as u64) {
                for d in VALUES.into_iter().filter_map(NonZeroU64::new) {
                    dispatch_trace::reset();
                    dispatch_trace::reset_rational_stats();
                    let value = dispatch_trace::with_recording(|| {
                        if side == "original" {
                            Rational::fraction(n as i64, d.get()).unwrap()
                        } else {
                            Rational::from((n, d))
                        }
                    });
                    let trace = dispatch_trace::take_trace();
                    println!("TRACE warm={warm} n={n} d={d} {value:?} {trace:?}");
                }
            }
        }
        return;
    }
    let run = |side| {
        let child = std::process::Command::new(std::env::current_exe().unwrap())
            .args(["--exact", TEST, "--nocapture"])
            .env(KEY, side)
            .output()
            .unwrap();
        assert!(child.status.success(), "{}", String::from_utf8_lossy(&child.stderr));
        String::from_utf8(child.stdout).unwrap().lines()
            .filter(|line| line.starts_with("TRACE ")).map(str::to_owned).collect::<Vec<_>>()
    };
    let original = run("original");
    assert_eq!(original.len(), 2 * 13 * 15);
    assert_eq!(run("typed"), original);
}
