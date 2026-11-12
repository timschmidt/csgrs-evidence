#![cfg(feature="fixed")]
use hyperlattice_interval::{IntervalVector, IntervalMatrix};
use hyperlattice_interval::hyperinterval::FixedInterval;
#[test]
fn norms_and_negative_measures_are_ranges() {
 type I=FixedInterval<i32,0>;
 let vector=IntervalVector::new([I::new(-2,1).unwrap(), I::new(3,4).unwrap()]).unwrap();
 assert_eq!(vector.norm_one(&mut ()).unwrap(),I::new(3,6).unwrap());
 let matrix=IntervalMatrix::new([[I::point(-3).unwrap(),I::point(0).unwrap()],[I::point(0).unwrap(),I::point(-2).unwrap()]]).unwrap();
 assert_eq!(matrix.measure_infinity(&mut ()).unwrap(),I::point(-2).unwrap());
}
