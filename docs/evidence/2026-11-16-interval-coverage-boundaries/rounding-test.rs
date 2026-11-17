
#[cfg(not(target_env = "msvc"))]
#[test]
fn near_dyadic_output_boundaries_refine_and_retry_without_publishing_partial_bounds() {
    use hyperinterval::{DomainCoverage, IntervalError};
    use rug::Integer;

    // Directed MPFR brackets pi/6 and pi/3 independently of the native
    // reduction/series. Adjacent dyadic sources straddle sin(x)=1/2 and
    // cos(x)=1/2, far from extrema or poles but very close to an output grid.
    let half_pi = oracle::half_pi();
    for cosine in [false, true] {
        let multiplier = if cosine { 2 } else { 1 };
        let lower = half_pi.0.clone() * multiplier / 3;
        let upper = half_pi.1.clone() * multiplier / 3;
        for bits in [64_i32, 256, 512] {
            let scale = Integer::from(1) << bits as u32;
            let floor = (lower.clone() * &scale).floor().numer().clone();
            assert_eq!(floor, (upper.clone() * &scale).floor().numer().clone());
            for offset in [0, 1] {
                let mantissa = floor.clone() + offset;
                let source = DyadicInterval::point(
                    mantissa.to_string().parse().unwrap(),
                    -bits,
                )
                .unwrap();
                let evaluate = |work: &mut DyadicBudget| {
                    if cosine {
                        source.cos(-8, work)
                    } else {
                        source.sin(-8, work)
                    }
                };
                let mut work = budget();
                let available = work.remaining_work();
                let result = evaluate(&mut work).unwrap();
                assert_eq!(result.domain, DomainCoverage::Complete);
                let above_half = cosine == (offset == 0);
                assert_eq!(
                    result.range,
                    if above_half { d(128, 129, -8) } else { d(127, 128, -8) }
                );
                let point = oracle::q(&mantissa, -bits);
                oracle::verify(&result.range, &point, &point, -8, cosine);

                let consumed = available - work.remaining_work();
                assert!(consumed > 0);
                assert_eq!(
                    evaluate(&mut DyadicBudget::new(32768, consumed - 1)),
                    Err(IntervalError::WorkExhausted)
                );
                let mut retry = DyadicBudget::new(32768, consumed);
                assert_eq!(evaluate(&mut retry).unwrap(), result);
                assert_eq!(retry.remaining_work(), 0);
                // The newly generated enclosure remains a valid next operand.
                assert!(!result.range.square(&mut budget()).unwrap().is_empty());
            }
        }
    }
}
