use servo_migration_probe::*;
use alumina_foc::*;
use std::{hint::black_box, time::Instant};
mod allocations;
fn run(action: u32)->(u64,u64) {
 let mut checksum=0u64; let mut completed=0;
 if action==0 {
  for _ in 0..128 { for lower in VALUES { for upper in VALUES { if lower>upper {continue;}
   let value=black_box(ServoPositionInterval::new(ServoPosition::from_bits(lower),ServoPosition::from_bits(upper)).unwrap());
   checksum=checksum.wrapping_add(black_box(value.midpoint()).bits() as u64).wrapping_add(black_box(value.width_ulps())); completed+=1;
  }}}
 } else {
  for seed in [-31,-7,-1,0,1,7,31] {
   black_box(trace(black_box(seed),if action==1 {0} else {1},500,|result| {
    if let Ok(update)=black_box(result) {
     checksum=checksum.wrapping_add(update.current_target.q.bits() as u64).wrapping_add(update.velocity_target.bits() as u64);
    } else { checksum=checksum.wrapping_add(1); }
    completed+=1;
   }));
  }
 }
 (completed,checksum)
}
fn main() {
 println!("action,sample,completed,elapsed_ns,allocation_calls,allocated_bytes,checksum");
 for action in 0..3 {
  for _ in 0..8 {black_box(run(action));}
  for sample in 0..20 {
   let start=Instant::now();
   let ((completed,checksum),calls,bytes)=allocations::measure(||run(black_box(action)));
   let elapsed=start.elapsed().as_nanos(); assert_eq!((calls,bytes),(0,0));
   println!("{action},{sample},{completed},{elapsed},{calls},{bytes},{checksum}");
  }
 }
}
