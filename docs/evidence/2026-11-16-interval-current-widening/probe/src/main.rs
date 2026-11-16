use std::{hint::black_box,time::Instant};
use current_widen_probe::{input,operate,check_exact};
mod allocations;
fn main(){
 let timed=std::env::var_os("CURRENT_TIMING").is_some();
 println!("LAYOUT {} {} {} {}",size_of::<alumina_foc::Q30Interval>(),align_of::<alumina_foc::Q30Interval>(),size_of::<alumina_foc::CurrentSample>(),size_of::<alumina_foc::ValidatedTwoShuntCurrentCalibration>());
 for index in 0..if timed {12} else {4108} {
  let input=input(index);let operation=||operate(black_box(input));let result=operation();check_exact(input,result);if let Ok((sample,_))=result {println!("DIGESTS {index} {:?} {:?}",sample.configuration_digest.0,sample.synchronization.configuration_digest.0);}println!("RESULT {index} {result:?}");
  if index<12 {
   for _ in 0..128 {let _=black_box(operation());}
   let(_,calls,bytes)=allocations::measure(||{for _ in 0..32 {let _=black_box(operation());}});println!("ALLOC {index} {calls} {bytes}");assert_eq!((calls,bytes),(0,0));
   if timed {let mut samples=Vec::new();for _ in 0..31 {let start=Instant::now();for _ in 0..2048 {let _=black_box(operation());}samples.push(start.elapsed().as_nanos() as f64/2048.0);}println!("TIMING {index} {samples:?}");}
  }
 }
}
