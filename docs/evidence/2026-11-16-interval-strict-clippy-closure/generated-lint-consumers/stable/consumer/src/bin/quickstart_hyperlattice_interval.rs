use hyperlattice_interval::hyperinterval::FixedInterval;
use hyperlattice_interval::{IntervalLatticeError, IntervalMatrix, IntervalVector};

fn main() -> Result<(), IntervalLatticeError> {
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
