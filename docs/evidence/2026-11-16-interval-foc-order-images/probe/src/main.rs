use std::{hint::black_box,time::Instant};
use foc_order_probe::{input,operate,fields};
mod allocations;
fn main(){
 let timed=std::env::var_os("FOC_TIMING").is_some();
 println!("LAYOUT {} {} {}",size_of::<alumina_foc::Q30Interval>(),align_of::<alumina_foc::Q30Interval>(),size_of::<alumina_foc::ModulationResult>());
 for index in 0..if timed {12} else {4108} {
  let(value,limit)=input(index);
  let operation=|| operate(black_box(value),black_box(limit));
  let result=operation();
  println!("RAW {index} {:?}",fields(result));
  if index<12 {
   println!("RESULT {index} {result:?}");
   for _ in 0..128 {let _=black_box(operation());}
   let(_,calls,bytes)=allocations::measure(|| {for _ in 0..32 {let _=black_box(operation());}});
   println!("ALLOC {index} {calls} {bytes}");assert_eq!((calls,bytes),(0,0));
   if timed {
    let mut samples=Vec::new();
    for _ in 0..31 {let start=Instant::now();for _ in 0..4096 {let _=black_box(operation());}samples.push(start.elapsed().as_nanos() as f64/4096.0);}
    println!("TIMING {index} {samples:?}");
   }
  }
 }
}
