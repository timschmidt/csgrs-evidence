use hyperinterval::{FixedInterval, IntervalError, SignSet};

fn main() -> Result<(), IntervalError> {
    type Q30Bounds = FixedInterval<i32, 30>;
    let range = Q30Bounds::new(-(1 << 29), 1 << 29)?;
    assert_eq!(range.signs(), SignSet::Mixed);
    assert!(range.contains_point(0)); // possible zero is not a scalar equality proof
    assert_eq!(range.square()?.bounds(), Some((0, 1 << 28)));
    assert_eq!(Q30Bounds::new(1, 0), Err(IntervalError::ReversedEndpoints));
    Ok(())
}
