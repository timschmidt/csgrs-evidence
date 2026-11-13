use hyperlattice_interval::{CenteredVector,IntervalVector,hyperinterval::FixedInterval};
fn main(){type I=FixedInterval<i32,31>;let v=IntervalVector::new([I::point(1<<30).unwrap()]).unwrap();let f=CenteredVector::new(v,v).unwrap();let s=f.affine_source(&mut ()).unwrap();assert!(s.enclosure(&mut ()).is_err());}
