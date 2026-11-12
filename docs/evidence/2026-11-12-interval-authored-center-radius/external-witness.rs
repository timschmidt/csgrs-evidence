use hyperlattice_interval::{CenteredVector,IntervalVector,hyperinterval::FixedInterval};
fn main(){type I=FixedInterval<i32,0>; let c=IntervalVector::new([I::point(i32::MAX).unwrap()]).unwrap();let r=IntervalVector::new([I::point(1).unwrap()]).unwrap();let form=CenteredVector::new(c,r).unwrap();assert!(form.enclosure(&mut ()).is_err());assert_eq!(form.center(),Some(&c));}
