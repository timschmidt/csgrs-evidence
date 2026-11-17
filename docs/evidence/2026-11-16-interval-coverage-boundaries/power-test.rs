
#[cfg(feature = "rational")]
#[test]
fn rational_empty_and_zero_power_keep_domain_validation_and_compose() {
    use hyperinterval::RationalInterval;
    use hyperreal::Rational;

    let empty = RationalInterval::empty();
    for (n, q) in [(1, 3), (-1, 3), (0, 7)] {
        let mut no_work = DyadicBudget::new(0, 0);
        let result = empty
            .pow_rational(&n.into(), &q.into(), i32::MIN, &mut no_work)
            .unwrap();
        assert!(result.range.is_empty());
        assert_eq!(result.domain, DomainCoverage::Complete);
        assert_eq!(
            result.range.exp(i32::MIN, &mut no_work).unwrap(),
            result
        );
        assert_eq!(no_work.remaining_work(), 0);
    }
    for n in [0, 1, -1] {
        assert_eq!(
            empty.pow_rational(
                &n.into(), &0.into(), i32::MIN, &mut DyadicBudget::new(0, 0)
            ),
            Err(IntervalError::ContainsZero)
        );
    }
    let source = RationalInterval::new(
        Rational::fraction(-2, 3).unwrap(),
        Rational::fraction(5, 7).unwrap(),
    )
    .unwrap();
    for (precision, expected) in [(-16, d(1, 1, 0)), (4, d(0, 1, 4))] {
        let result = source
            .pow_rational(&0.into(), &7.into(), precision, &mut budget())
            .unwrap();
        assert_eq!(result.domain, DomainCoverage::Complete);
        assert_eq!(result.range.components(), &[E::from_finite(expected)]);
    }
}
