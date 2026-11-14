#![no_std]
pub mod hyperinterval {
use hyperinterval::{FixedInterval, IntervalError, SignSet};

pub fn verify() -> Result<(), IntervalError> {
    type Q30Bounds = FixedInterval<i32, 30>;
    let range = Q30Bounds::new(-(1 << 29), 1 << 29)?;
    assert_eq!(range.signs(), SignSet::Mixed);
    assert!(range.contains_point(0)); // possible zero is not a scalar equality proof
    assert_eq!(range.square()?.bounds(), Some((0, 1 << 28)));
    assert_eq!(Q30Bounds::new(1, 0), Err(IntervalError::ReversedEndpoints));
    Ok(())
}

}
pub mod hyperlattice_interval {
use hyperlattice_interval::hyperinterval::FixedInterval;
use hyperlattice_interval::{IntervalLatticeError, IntervalMatrix, IntervalVector};

pub fn verify() -> Result<(), IntervalLatticeError> {
    type I = FixedInterval<i32, 0>;
    let matrix = IntervalMatrix::new([[I::point(2)?, I::point(-1)?]])?;
    let vector = IntervalVector::new([I::new(1, 3)?, I::new(4, 5)?])?;
    let image = matrix.mul_vector(&vector, &mut ())?;
    assert_eq!(image.lanes().unwrap()[0].bounds(), Some((-3, 2)));
    let scale = IntervalMatrix::new([[I::point(2)?]])?;
    let next = scale.mul_vector(&image, &mut ())?;
    assert_eq!(next.lanes().unwrap()[0].bounds(), Some((-6, 4)));
    Ok(())
}

}
