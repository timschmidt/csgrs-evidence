//! Frozen pre-refactor arithmetic at 4d4e22a31, used only as a differential oracle.
use super::*;

fn legacy_scaled_quotient(
    n: &BigInt,
    d: &BigInt,
    shift: i64,
    budget: &mut DyadicBudget,
) -> Result<(BigInt, BigInt), IntervalError> {
    if d.is_zero() {
        return Err(IntervalError::ContainsZero);
    }
    let n_bits = n
        .bits()
        .saturating_add(if shift >= 0 { shift as u64 } else { 0 });
    let d_bits = d
        .bits()
        .saturating_add(if shift < 0 { shift.unsigned_abs() } else { 0 });
    budget.reserve(n_bits.max(d_bits).saturating_add(1), 4, true)?;
    let amount = usize::try_from(shift.unsigned_abs()).map_err(|_| IntervalError::Overflow)?;
    let (n, d) = if shift >= 0 {
        (n << amount, d.clone())
    } else {
        (n.clone(), d << amount)
    };
    Ok((n.div_floor(&d), n.div_ceil(&d)))
}

fn compare(n: &BigInt, d: &BigInt, shift: i64, bits: u64, work: u64) {
    let mut before = DyadicBudget::new(bits, work);
    let mut after = before.clone();
    let expected = legacy_scaled_quotient(n, d, shift, &mut before);
    let actual = scaled_quotient(n, d, shift, &mut after);
    assert_eq!(actual, expected, "n={n}, d={d}, shift={shift}");
    assert_eq!(after, before);
}

#[test]
fn directed_quotient_matches_legacy_and_independent_small_integer_oracle() {
    for n in -33i128..=33 {
        for d in -17i128..=17 {
            for shift in [-12i64, -3, 0, 1, 12] {
                compare(&n.into(), &d.into(), shift, 4096, 1_000_000_000);
                if d == 0 {
                    continue;
                }
                let (a, b) = if shift >= 0 {
                    (n << shift, d)
                } else {
                    (n, d << (-shift))
                };
                let (q, r) = (a / b, a % b);
                let floor = q - i128::from(r != 0 && (a < 0) != (b < 0));
                let ceil = q + i128::from(r != 0 && (a < 0) == (b < 0));
                let mut budget = DyadicBudget::new(4096, 1_000_000_000);
                assert_eq!(
                    scaled_quotient(&n.into(), &d.into(), shift, &mut budget).unwrap(),
                    (floor.into(), ceil.into())
                );
                // Independent inequalities characterize the unique directed integers.
                let (a, b) = if b < 0 { (-a, -b) } else { (a, b) };
                assert!(floor * b <= a && a < (floor + 1) * b);
                assert!((ceil - 1) * b < a && a <= ceil * b);
            }
        }
    }
}

#[test]
fn limb_boundaries_and_resource_precedence_match_legacy() {
    for bits in [1usize, 31, 32, 63, 64, 65, 127, 128, 129, 256, 1024] {
        let denominator: BigInt = (BigInt::one() << bits) + 3;
        let numerators: [BigInt; 4] = [
            &denominator - 1,
            &denominator + 1,
            &denominator * 17,
            &denominator * 17 + 1,
        ];
        for numerator in numerators {
            for n in [numerator.clone(), -&numerator].iter() {
                for d in [denominator.clone(), -&denominator].iter() {
                    for shift in [-65, -1, 0, 1, 65] {
                        compare(n, d, shift, 4096, 1_000_000_000);
                    }
                }
            }
        }
    }
    for n in [-7i64, 0, 8] {
        for d in [-3i64, 0, 2] {
            for shift in [
                i64::MIN,
                i64::from(i32::MIN),
                -9,
                0,
                9,
                i64::from(i32::MAX),
                i64::MAX,
            ] {
                for bits in [0, 4, 64, 4096] {
                    for work in [0, 63, 64, 100_000] {
                        compare(&n.into(), &d.into(), shift, bits, work);
                    }
                }
            }
        }
    }
}

#[cfg(all(feature = "rational", feature = "dispatch-trace"))]
#[test]
fn directed_quotient_never_enters_real_dispatch() {
    use hyperreal::dispatch_trace;
    for n in [-7, 0, 8] {
        for d in [-3, 0, 2] {
            dispatch_trace::reset();
            dispatch_trace::with_recording(|| {
                compare(&BigInt::from(n), &BigInt::from(d), -9, 4096, 1_000_000);
            });
            assert!(dispatch_trace::take_trace().dispatch.is_empty());
        }
    }
}
