#![cfg(feature = "fixed")]
use hyperlattice_interval::{AffineChain, IntervalVector};
use hyperlattice_interval::hyperinterval::FixedInterval;
#[test]
fn zero_capacity_retains_source() {
    type I = FixedInterval<i32, 31>;
    let source = IntervalVector::new([I::new(-1, 1).unwrap()]).unwrap();
    let chain = AffineChain::<_, _, 1, 0>::new(source);
    assert_eq!(chain.enclosure(&mut ()).unwrap(), source);
}
