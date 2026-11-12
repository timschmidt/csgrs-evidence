#![cfg(feature="fixed")]
use hyperlattice_interval::{IntervalVector,hyperinterval::FixedInterval};
#[test]
fn full_range_widths_remain_ordered() {
 type I=FixedInterval<i64,63>;
 let x=IntervalVector::new([I::new(i64::MIN,i64::MAX).unwrap(),I::new(0,1).unwrap()]).unwrap();
 assert_eq!(x.widest_axis(&mut ()).unwrap(),Some(0));
 assert_eq!(x.widths(&mut ()).unwrap().unwrap()[0].numerator(),u64::MAX);
}
