use hyperinterval::FixedInterval;
fn main() { let x=FixedInterval::<i64,63>::new(-5,7).unwrap(); assert_eq!(x.div_integer(3).unwrap().bounds(),Some((-2,3))); }
