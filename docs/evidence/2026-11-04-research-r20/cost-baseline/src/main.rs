use csgrs::{curve,GeometryContext,Real};
use hypercurve::BooleanOp;
use std::{alloc::{GlobalAlloc,Layout,System},hint::black_box,io::Write,sync::atomic::{AtomicUsize,Ordering},time::Instant};
struct Counter;
static ALLOCATED:AtomicUsize=AtomicUsize::new(0);
static LIVE:AtomicUsize=AtomicUsize::new(0);
static PEAK:AtomicUsize=AtomicUsize::new(0);
static CALLS:AtomicUsize=AtomicUsize::new(0);
fn grow(size:usize){CALLS.fetch_add(1,Ordering::Relaxed);ALLOCATED.fetch_add(size,Ordering::Relaxed);let live=LIVE.fetch_add(size,Ordering::Relaxed)+size;PEAK.fetch_max(live,Ordering::Relaxed);}
// Counter implementation copied from benchmarks/rust/successive_operations.rs.
// Pointers/layouts pass unchanged to System; the measured executions complete.
unsafe impl GlobalAlloc for Counter {
 unsafe fn alloc(&self,l:Layout)->*mut u8{grow(l.size());unsafe{System.alloc(l)}}
 unsafe fn alloc_zeroed(&self,l:Layout)->*mut u8{grow(l.size());unsafe{System.alloc_zeroed(l)}}
 unsafe fn dealloc(&self,p:*mut u8,l:Layout){LIVE.fetch_sub(l.size(),Ordering::Relaxed);unsafe{System.dealloc(p,l)}}
 unsafe fn realloc(&self,p:*mut u8,l:Layout,size:usize)->*mut u8{
  if size>=l.size(){grow(size-l.size());}else{CALLS.fetch_add(1,Ordering::Relaxed);LIVE.fetch_sub(l.size()-size,Ordering::Relaxed);}
  unsafe{System.realloc(p,l,size)}
 }
}
#[global_allocator]static GLOBAL:Counter=Counter;
fn main(){
 let args:Vec<_>=std::env::args().collect();let output=&args[1];let mode=args.get(2).map_or("legacy",String::as_str);
 let positive=curve::translated(&curve::rectangle(2,2).unwrap(),1,0).unwrap();
 let negative=curve::translated(&curve::rectangle(1,2).unwrap(),-2,1).unwrap();
 let mixed=positive.boolean_region(&negative,BooleanOp::Union).unwrap();
 let crossing=curve::translated(&curve::rectangle(5,2).unwrap(),-2,0).unwrap();
 let mut rows=std::fs::File::create(output).unwrap();
 let cases=[("positive-quarter",&positive,270,3),("negative-partial",&negative,-270,4),("positive-odd-full",&positive,360,5),("positive-even-full",&positive,360,6),("opposite-partial",&mixed,270,4),("axis-crossing",&crossing,270,3)];
 for (label,source,angle,segments) in cases{
  if label=="axis-crossing"&&mode!="solid"{continue;}
  let run=||{
   #[cfg(feature="candidate")]
   if mode=="solid"{return curve::revolve_solid(source,Real::from(angle),segments,GeometryContext::STRICT).unwrap();}
   curve::revolve(source,Real::from(angle),segments,GeometryContext::STRICT).unwrap()
  };
  for _ in 0..2{black_box(run());}
  let sample=run();let mesh=&sample.value;let evidence=mesh.construction_evidence();
  let positions:Vec<_>=mesh.positions.iter().map(|p|[&p.x,&p.y,&p.z]).collect();
  let triangles:Vec<_>=mesh.triangles.iter().map(|t|t.indices()).collect();
  let row=serde_json::to_vec(&(label,positions,triangles,sample.certainty as u8,[evidence.approximate_512_consumed(),evidence.source_sampled(),evidence.coordinates_projected(),evidence.source_history_missing()])).unwrap();
  rows.write_all(&row).unwrap();rows.write_all(b"\n").unwrap();drop(sample);
  for iteration in 0..20{
   let a=ALLOCATED.load(Ordering::Relaxed);let c=CALLS.load(Ordering::Relaxed);let live=LIVE.load(Ordering::Relaxed);PEAK.store(live,Ordering::Relaxed);
   let start=Instant::now();let result=black_box(run());let nanos=start.elapsed().as_nanos();
   let allocated=ALLOCATED.load(Ordering::Relaxed)-a;let calls=CALLS.load(Ordering::Relaxed)-c;let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);let retained=LIVE.load(Ordering::Relaxed) as i128-live as i128;
   drop(result);let after=LIVE.load(Ordering::Relaxed) as i128-live as i128;
   println!("{label}\t{iteration}\t{nanos}\t{allocated}\t{calls}\t{peak}\t{retained}\t{after}");
  }
 }
}
