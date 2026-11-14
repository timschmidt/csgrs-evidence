#![cfg(feature = "dispatch-trace")]

use hyperlimit::{Point2, PredicatePolicy, Sign};
use hyperreal::{Real, dispatch_trace as trace};

#[test]
fn separated_transcendental_orientation_uses_native_interval_filter() {
    let a = Point2::new(0.into(), 0.into());
    let b = Point2::new(Real::e(), Real::pi());
    let c = Point2::new(Real::pi(), Real::e());
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        trace::reset();
        let outcome = trace::with_recording(|| hyperlimit::orient2(&a, &b, &c, policy));
        // e < 3 < pi, so det = e²-pi² is strictly negative.
        assert_eq!(outcome.value(), Some(Sign::Negative));
        let snapshot = trace::take_trace();
        assert_eq!(
            snapshot.path_count("hyperlimit", "native_interval_difference", "negative"),
            1
        );
    }
}
