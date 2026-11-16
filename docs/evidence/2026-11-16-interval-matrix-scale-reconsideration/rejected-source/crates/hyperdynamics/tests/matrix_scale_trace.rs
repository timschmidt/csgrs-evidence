#![cfg(all(feature = "field", feature = "dispatch-trace"))]

use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::{IntervalMatrix, IntervalVector};
use hyperreal::dispatch_trace;

#[test]
fn generated_scaled_matrix_consumption_needs_no_scalar_decision() {
    let point = |n: i32| DyadicInterval::point(n.into(), 0).unwrap();
    let matrix = IntervalMatrix::new([[point(1), point(-2)], [point(3), point(4)]]).unwrap();
    let scalar = DyadicInterval::new((-3).into(), 2.into(), -1).unwrap();
    let vector = IntervalVector::new([point(1), point(-1)]).unwrap();
    dispatch_trace::reset();
    let actual = dispatch_trace::with_recording(|| {
        let mut budget = DyadicBudget::new(256, 1_000_000);
        matrix
            .scale(&scalar, &mut budget)
            .unwrap()
            .mul_vector(&vector, &mut budget)
            .unwrap()
    });
    let trace = dispatch_trace::take_trace();
    // Cartesian products independently give [-9/2,3] and [-17/2,9].
    let expected = IntervalVector::new([
        DyadicInterval::new((-9).into(), 6.into(), -1).unwrap(),
        DyadicInterval::new((-17).into(), 18.into(), -1).unwrap(),
    ])
    .unwrap();
    assert_eq!(actual, expected);
    assert!(trace.dispatch.is_empty());
    assert_eq!(
        trace.rational,
        dispatch_trace::RationalTraceStats::default()
    );
}
