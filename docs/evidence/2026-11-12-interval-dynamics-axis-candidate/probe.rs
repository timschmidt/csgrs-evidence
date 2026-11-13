use hyperlimit::PredicatePolicy;
use hyperreal::{Real,Rational};
use projection::{AffineSpanAxisProjection,AxisMotionLimits,plan_axis_projected_motion_limits};
use std::{hint::black_box,time::Instant};
#[path="/mnt/development/csgrs/crates/hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main() {
 println!("axes,spans,policy,sample,elapsed_ns,allocations,bytes,checksum");
 for axes in [2,6,16] {for spans in [1,8] {
  let p:Vec<_>=(0..spans).map(|s|AffineSpanAxisProjection{absolute_axis_derivatives:(0..axes).map(|a|Real::new(Rational::new((s+a)%7+1)/Rational::new(8))).collect()}).collect();
  let limits:Vec<_>=(0..axes).map(|a|AxisMotionLimits{maximum_velocity:Real::from(a+17),maximum_acceleration:Real::from(a+31),maximum_jerk:Real::from(a+47)}).collect();
  for (label,policy) in [("strict",PredicatePolicy::STRICT),("approximate",PredicatePolicy::APPROXIMATE_512)] {
   let run=||plan_axis_projected_motion_limits(black_box(&p),black_box(&limits),black_box(policy)).unwrap();
   let (result,allocs,bytes)=allocations::measure(run);
   assert!(result.all_satisfied());
   let encoded=format!("{result:?}");
   // Only a deterministic comparison aid; exact report and independent tests
   // establish correctness before these completed-workload measurements.
   let checksum=encoded.bytes().fold(0u64,|s,b|s.wrapping_mul(131).wrapping_add(u64::from(b)));
   for _ in 0..8 {black_box(run());}
   for sample in 0..20 {
    let start=Instant::now();for _ in 0..16 {black_box(run());}
    println!("{axes},{spans},{label},{sample},{},{allocs},{bytes},{checksum}",start.elapsed().as_nanos());
   }
  }
 }}
}
