use alumina_interface_core::{BoundaryError, BoundedMeasurement, Millimetres, Seconds};
use hyperinterval::{IntervalError, RationalInterval};
use hyperlimit::{PredicatePolicy, compare_reals};
use hyperreal::{Rational, Real};
use interval_measurement_conformance::sample;

#[test]
fn independent_fraction_grid_preserves_units_bounds_and_replay() {
    for nominal in -16_i64..=16 {
        for uncertainty in -4_i64..=8 {
            for denominator in [1, 2, 3, 7, 31] {
                let n = Rational::fraction(nominal, denominator).unwrap();
                let u = Rational::fraction(uncertainty, denominator).unwrap();
                let actual = BoundedMeasurement::<Millimetres>::from_nominal_uncertainty(
                    n.clone(),
                    u.clone(),
                );
                let shared = RationalInterval::from_nominal_uncertainty(&n, &u);
                if uncertainty < 0 {
                    assert_eq!(actual, Err(BoundaryError::NegativeUncertainty));
                    assert_eq!(shared, Err(IntervalError::NegativeRadius));
                    continue;
                }
                let actual = actual.unwrap();
                let shared = shared.unwrap();
                // Independent common-denominator expectations: no call to the
                // endpoint implementation or arithmetic in RationalInterval.
                let lo = Rational::fraction(nominal - uncertainty, denominator).unwrap();
                let hi = Rational::fraction(nominal + uncertainty, denominator).unwrap();
                assert_eq!((actual.lower(), actual.upper()), (&lo, &hi));
                assert_eq!(shared.bounds(), Some((&lo, &hi)));
                let encoded = serde_json::to_string(&shared).unwrap();
                let replay: RationalInterval = serde_json::from_str(&encoded).unwrap();
                assert_eq!(shared, replay);
                assert_eq!(serde_json::to_string(&replay).unwrap(), encoded);
                let reused = replay.add(&RationalInterval::point(1.into()));
                assert_eq!(
                    reused.bounds(),
                    Some((&(&lo + Rational::from(1)), &(&hi + Rational::from(1))))
                );
                assert_eq!(BoundedMeasurement::<Millimetres>::unit_symbol(), "mm");
                let seconds =
                    BoundedMeasurement::<Seconds>::from_nominal_uncertainty(n, u).unwrap();
                assert_eq!((seconds.lower(), seconds.upper()), (&lo, &hi));
                assert_eq!(BoundedMeasurement::<Seconds>::unit_symbol(), "s");
            }
        }
    }
}

#[test]
fn large_representations_and_policy_consumption_match() {
    for index in 0..8 {
        let (n, u) = sample(index);
        let actual =
            BoundedMeasurement::<Millimetres>::from_nominal_uncertainty(n.clone(), u.clone());
        if index == 7 {
            assert_eq!(actual, Err(BoundaryError::NegativeUncertainty));
            continue;
        }
        let actual = actual.unwrap();
        let exact = RationalInterval::from_nominal_uncertainty(&n, &u).unwrap();
        assert_eq!(exact.bounds(), Some((actual.lower(), actual.upper())));
        for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
            let point = Real::from(n.clone());
            let low = compare_reals(&Real::from(actual.lower().clone()), &point, policy);
            let high = compare_reals(&point, &Real::from(actual.upper().clone()), policy);
            assert_eq!(
                low,
                compare_reals(&Real::from(exact.lower().unwrap().clone()), &point, policy)
            );
            assert_eq!(
                high,
                compare_reals(&point, &Real::from(exact.upper().unwrap().clone()), policy)
            );
            for outcome in [low, high] {
                assert!(matches!(
                    outcome,
                    hyperlimit::PredicateOutcome::Decided {
                        value: std::cmp::Ordering::Less | std::cmp::Ordering::Equal,
                        certainty: hyperlimit::Certainty::Exact,
                        ..
                    }
                ));
            }
        }
    }
}

#[cfg(feature = "trace")]
#[test]
fn construction_dispatch_counts_match_the_original_formula() {
    use hyperreal::dispatch_trace::{self, with_recording};
    for index in 0..8 {
        // Fresh values on each side avoid reusing construction relations from
        // the first implementation when recording the second implementation.
        let (n, u) = sample(index);
        dispatch_trace::reset();
        let original = with_recording(|| {
            if u.is_negative() {
                return Err(BoundaryError::NegativeUncertainty);
            }
            Ok((n.clone() - u.clone(), n + u))
        });
        let before = dispatch_trace::take_trace();
        let (n, u) = sample(index);
        dispatch_trace::reset();
        let actual =
            with_recording(|| BoundedMeasurement::<Millimetres>::from_nominal_uncertainty(n, u));
        let after = dispatch_trace::take_trace();
        assert_eq!(after, before, "fixture {index}");
        assert_eq!(
            actual.map(|x| (x.lower().clone(), x.upper().clone())),
            original
        );
    }
}
