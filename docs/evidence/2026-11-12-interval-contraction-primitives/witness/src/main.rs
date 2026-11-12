use hyperlattice_interval::{IntervalMatrix, hyperinterval::FixedInterval};
fn main() { let a = IntervalMatrix::new([[FixedInterval::<i32, 0>::point(1).unwrap()]]).unwrap(); let _ = a.identity_minus(&mut ()); let _ = a.contraction_margin_one(&mut ()); let _ = a.contraction_margin_infinity(&mut ()); }
