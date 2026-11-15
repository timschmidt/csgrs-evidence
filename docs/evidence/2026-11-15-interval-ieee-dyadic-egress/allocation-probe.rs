use hyperinterval::{DyadicInterval,DyadicBudget,F32Enclosure,F64Enclosure,IntervalError};
use num_bigint::BigInt;
#[path="/mnt/development/csgrs-ieee-egress/crates/hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main(){
 for bits in [64usize,4096,1_000_000]{
  let source=DyadicInterval::point((BigInt::from(1)<<bits)+1,-(bits as i32)).unwrap();
  for small in [false,true]{
   let mut budget=DyadicBudget::new(if small {53}else{bits as u64+1},10_000_000);
   let (value,calls,bytes)=allocations::measure(||F64Enclosure::from_dyadic(&source,&mut budget));
   if small {assert_eq!(value,Err(IntervalError::SizeExhausted));assert_eq!((calls,bytes),(0,0));}
   else {let (a,b)=value.unwrap().bounds().unwrap();assert_eq!((a.to_bits(),b.to_bits()),(0x3ff0000000000000,0x3ff0000000000001));}
   println!("bits={bits},small={small},calls={calls},bytes={bytes},work={}",10_000_000-budget.remaining_work());
  }
 }
 for exponent in [i32::MIN,i32::MAX]{
  let source=DyadicInterval::point(1.into(),exponent).unwrap();
  let (value,calls,bytes)=allocations::measure(||F32Enclosure::from_dyadic(&source,&mut DyadicBudget::new(25,150)));
  if exponent==i32::MIN {let (a,b)=value.unwrap().bounds().unwrap();assert_eq!((a.to_bits(),b.to_bits()),(0,1));}else{assert_eq!(value,Err(IntervalError::Overflow));}
  assert_eq!((calls,bytes),(0,0));println!("exponent={exponent},calls={calls},bytes={bytes}");
 }
}
