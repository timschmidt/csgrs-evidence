#![cfg(feature = "rational")]

use hyperinterval::{IntervalError, PositiveRationalInterval, RationalInterval};
use hyperreal::Rational;

#[cfg(not(target_env = "msvc"))]
#[path = "support/rational_oracle.rs"]
mod rational_oracle;

#[test]
fn retained_positive_product_and_quotient_consumes_generated_results() {
    let first = RationalInterval::new(Rational::from(2), Rational::from(3))
        .unwrap()
        .into_positive()
        .unwrap();
    let second = RationalInterval::new(Rational::from(5), Rational::from(7))
        .unwrap()
        .into_positive()
        .unwrap();
    let result = PositiveRationalInterval::product(&[&first, &second]).quotient(&first);
    assert_eq!(
        result.bounds(),
        (
            &(Rational::from(10) / Rational::from(3)),
            &(Rational::from(21) / Rational::from(2))
        )
    );
    assert_eq!(
        PositiveRationalInterval::product(&[]).into_bounds(),
        (Rational::one(), Rational::one())
    );
    assert_eq!(PositiveRationalInterval::product(&[&result]), result);
    assert_eq!(
        RationalInterval::empty().into_positive(),
        Err(IntervalError::EmptyDomain)
    );
    assert_eq!(
        RationalInterval::point(Rational::zero()).into_positive(),
        Err(IntervalError::NonPositiveLowerBound)
    );
}

#[test]
fn four_factor_transmission_chain_matches_independent_integer_extrema() {
    for a in 1_i64..=5 {
        for b in 1_i64..=5 {
            for c in 1_i64..=5 {
                for d in 1_i64..=5 {
                    let numerators = [a, b, c, d];
                    let denominators = [2_u64, 3, 5, 7];
                    let factors: [_; 4] = std::array::from_fn(|i| {
                        RationalInterval::new(
                            Rational::fraction(numerators[i], denominators[i]).unwrap(),
                            Rational::fraction(numerators[i] + 1, denominators[i]).unwrap(),
                        )
                        .unwrap()
                        .into_positive()
                        .unwrap()
                    });
                    let divisor = RationalInterval::new(
                        Rational::fraction(11, 13).unwrap(),
                        Rational::fraction(17, 13).unwrap(),
                    )
                    .unwrap()
                    .into_positive()
                    .unwrap();
                    let result =
                        PositiveRationalInterval::product(&factors.each_ref()).quotient(&divisor);
                    let mut extrema = Vec::new();
                    for corner in 0..16 {
                        let product: i64 = numerators
                            .iter()
                            .enumerate()
                            .map(|(i, n)| n + ((corner >> i) & 1))
                            .product();
                        extrema.push(product);
                    }
                    let lower =
                        Rational::fraction(*extrema.iter().min().unwrap() * 13, 210 * 17).unwrap();
                    let upper =
                        Rational::fraction(*extrema.iter().max().unwrap() * 13, 210 * 11).unwrap();
                    assert_eq!(result.bounds(), (&lower, &upper));
                    assert_eq!(
                        result.clone().into_interval().into_positive().unwrap(),
                        result
                    );
                }
            }
        }
    }
}

#[test]
fn refinement_rejects_empty_nonpositive_and_reversed_inputs() {
    for (lo, hi) in [(-7, -3), (-7, 3), (0, 0), (0, 7)] {
        assert_eq!(
            RationalInterval::new(Rational::from(lo), Rational::from(hi))
                .unwrap()
                .into_positive(),
            Err(IntervalError::NonPositiveLowerBound)
        );
    }
    assert_eq!(
        RationalInterval::empty().into_positive(),
        Err(IntervalError::EmptyDomain)
    );
    assert_eq!(
        RationalInterval::new(Rational::from(2), Rational::from(1)),
        Err(IntervalError::ReversedEndpoints)
    );
    // The general empty carrier and its arithmetic retain their existing domain.
    assert!(
        RationalInterval::empty()
            .positive_product(&RationalInterval::point(Rational::one()))
            .unwrap()
            .is_empty()
    );
}

#[cfg(not(target_env = "msvc"))]
#[test]
fn arbitrary_rational_coefficients_match_independent_gmp_products() {
    let large: Rational = format!("1{}7/91", "0".repeat(1200)).parse().unwrap();
    let values = [
        large.clone(),
        Rational::fraction(11, 13).unwrap(),
        Rational::fraction(7, 29).unwrap(),
        large,
    ];
    let factors = values.each_ref().map(|lower| {
        RationalInterval::new(lower.clone(), lower + Rational::one())
            .unwrap()
            .into_positive()
            .unwrap()
    });
    let product = PositiveRationalInterval::product(&factors.each_ref());
    let actual = product.quotient(&factors[2]);
    let mut expected_lower = rug::Rational::from(1);
    let mut expected_upper = rug::Rational::from(1);
    for factor in &factors {
        expected_lower *= rational_oracle::mpq(factor.bounds().0);
        expected_upper *= rational_oracle::mpq(factor.bounds().1);
    }
    expected_lower /= rational_oracle::mpq(factors[2].bounds().1);
    expected_upper /= rational_oracle::mpq(factors[2].bounds().0);
    assert_eq!(rational_oracle::mpq(actual.bounds().0), expected_lower);
    assert_eq!(rational_oracle::mpq(actual.bounds().1), expected_upper);
}

#[cfg(feature = "dispatch-trace")]
#[test]
fn retained_proof_chain_preserves_original_dispatch_in_fresh_processes() {
    use hyperreal::dispatch_trace;
    const KEY: &str = "POSITIVE_PRODUCT_TRACE_SIDE";
    const TEST: &str = "retained_proof_chain_preserves_original_dispatch_in_fresh_processes";
    if let Ok(side) = std::env::var(KEY) {
        assert!(side == "original" || side == "shared" || side == "nonempty");
        for large in [false, true] {
            let offset: Rational = if large {
                "123456789012345678901234567890123456789/9876543210987654321"
                    .parse()
                    .unwrap()
            } else {
                Rational::zero()
            };
            let input: [_; 5] = std::array::from_fn(|i| {
                RationalInterval::new(
                    &offset + Rational::fraction(2 * i as i64 + 1, 13).unwrap(),
                    &offset + Rational::fraction(2 * i as i64 + 2, 13).unwrap(),
                )
                .unwrap()
            });
            for warm in [false, true] {
                dispatch_trace::reset();
                dispatch_trace::reset_rational_stats();
                let result = dispatch_trace::with_recording(|| {
                    let owned = input.clone();
                    if side == "original" {
                        for factor in &owned {
                            let nonpositive = factor.lower().unwrap() <= &Rational::zero();
                            assert!(!nonpositive, "positive source");
                        }
                        let [a, b, c, d, e] = owned;
                        let lower = a.lower().unwrap()
                            * b.lower().unwrap()
                            * c.lower().unwrap()
                            * d.lower().unwrap();
                        let upper = a.upper().unwrap()
                            * b.upper().unwrap()
                            * c.upper().unwrap()
                            * d.upper().unwrap();
                        (lower / e.upper().unwrap(), upper / e.lower().unwrap())
                    } else {
                        let factors = if side == "nonempty" {
                            owned.map(|factor| {
                                factor.into_nonempty().unwrap().into_positive().unwrap()
                            })
                        } else {
                            owned.map(|factor| factor.into_positive().unwrap())
                        };
                        PositiveRationalInterval::product(&factors.each_ref()[..4])
                            .quotient(&factors[4])
                            .into_bounds()
                    }
                });
                println!(
                    "TRACE large={large} warm={warm} {:?} {result:?}",
                    dispatch_trace::take_trace()
                );
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
        assert!(
            child.status.success(),
            "{}",
            String::from_utf8_lossy(&child.stderr)
        );
        String::from_utf8(child.stdout)
            .unwrap()
            .lines()
            .filter(|line| line.starts_with("TRACE "))
            .map(str::to_owned)
            .collect::<Vec<_>>()
    };
    let original = run("original");
    let shared = run("shared");
    assert_eq!(original.len(), 4);
    assert_eq!(shared, original);
    assert_eq!(run("nonempty"), original);
}
