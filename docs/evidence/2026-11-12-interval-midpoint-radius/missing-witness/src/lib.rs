use hyperlattice_interval::{IntervalVector,hyperinterval::FixedInterval};
pub fn witness() { let x=IntervalVector::new([FixedInterval::<i64,63>::new(0,1).unwrap()]).unwrap(); let _=x.midpoint_radius(); }
