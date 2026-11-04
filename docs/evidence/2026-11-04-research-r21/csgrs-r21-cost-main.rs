include!("/tmp/csgrs-r21-cost-allocator.rs");
#[path="/tmp/csgrs-r21-cost-cases.rs"]mod cases;
use std::{hint::black_box,io::Write,time::Instant};
fn main(){
 let args:Vec<_>=std::env::args().collect();let mode=args.get(2).map_or("legacy",String::as_str);
 let cases=cases::cases();let mut rows=std::fs::File::create(&args[1]).unwrap();
 for case in &cases {
  if (mode=="new") != case.name.starts_with("stationary-"){continue;}
  for _ in 0..2 {black_box(cases::run(case));}
  let sample=cases::run(case);rows.write_all(serde_json::to_string(&sample.row).unwrap().as_bytes()).unwrap();rows.write_all(b"\n").unwrap();drop(sample);
  for iteration in 0..20 {
   let a=ALLOCATED.load(Ordering::Relaxed);let c=CALLS.load(Ordering::Relaxed);let live=LIVE.load(Ordering::Relaxed);PEAK.store(live,Ordering::Relaxed);
   let start=Instant::now();let receipt=black_box(cases::run(case));let nanos=start.elapsed().as_nanos();
   let allocated=ALLOCATED.load(Ordering::Relaxed)-a;let calls=CALLS.load(Ordering::Relaxed)-c;let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);let retained=LIVE.load(Ordering::Relaxed)as i128-live as i128;
   drop(receipt);let after=LIVE.load(Ordering::Relaxed)as i128-live as i128;
   println!("{}\t{iteration}\t{nanos}\t{allocated}\t{calls}\t{peak}\t{retained}\t{after}",case.name);
  }
 }
}
