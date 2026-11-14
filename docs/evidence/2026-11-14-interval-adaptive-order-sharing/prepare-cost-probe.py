from pathlib import Path
import shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-order-sharing');p=Path('/mnt/development/.interval-refactor-build/adaptive-order-sharing-probe');p.mkdir();(p/'src').mkdir()
manifest='''[package]
name="adaptive-shared-cost-probe"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
hyperdynamics={path="/mnt/development/csgrs-adaptive-order-sharing/crates/hyperdynamics",features=["adaptive-taylor"]}
hypersolve={path="/mnt/development/csgrs-adaptive-order-sharing/crates/hypersolve"}
hyperinterval={path="/mnt/development/csgrs-adaptive-order-sharing/crates/hyperinterval",features=["dyadic"]}
hyperlattice-interval={path="/mnt/development/csgrs-adaptive-order-sharing/crates/hyperlattice-interval",features=["dyadic"]}
'''
(p/'Cargo.toml').write_text(manifest);(s/'cost-probe-Cargo.toml').write_text(manifest);shutil.copyfile(r/'Cargo.lock',p/'Cargo.lock')
t=(r/'crates/hyperdynamics/benches/adaptive_shared.rs').read_text().split('fn benchmark(')[0].replace('use criterion::{Criterion, criterion_group, criterion_main};\n','')
t+='''
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicU64, AtomicI64, Ordering};
struct Counting;
static ACTIVE: AtomicBool = AtomicBool::new(false);
static CALLS: AtomicU64 = AtomicU64::new(0);
static BYTES: AtomicU64 = AtomicU64::new(0);
static LIVE: AtomicI64 = AtomicI64::new(0);
static PEAK: AtomicI64 = AtomicI64::new(0);
fn record(size:usize,delta:i64) {
 CALLS.fetch_add(1,Ordering::Relaxed);BYTES.fetch_add(size as u64,Ordering::Relaxed);
 let live=LIVE.fetch_add(delta,Ordering::Relaxed)+delta;PEAK.fetch_max(live,Ordering::Relaxed);
}
unsafe impl GlobalAlloc for Counting {
 unsafe fn alloc(&self,l:Layout)->*mut u8 {
  let ptr=unsafe {System.alloc(l)};
  if !ptr.is_null() && ACTIVE.load(Ordering::Relaxed) {record(l.size(),l.size() as i64);}
  ptr
 }
 unsafe fn dealloc(&self,p:*mut u8,l:Layout) {
  if ACTIVE.load(Ordering::Relaxed) {LIVE.fetch_sub(l.size() as i64,Ordering::Relaxed);}
  unsafe {System.dealloc(p,l)}
 }
 unsafe fn realloc(&self,p:*mut u8,l:Layout,n:usize)->*mut u8 {
  let ptr=unsafe {System.realloc(p,l,n)};
  if !ptr.is_null() && ACTIVE.load(Ordering::Relaxed) {record(n,n as i64-l.size() as i64);}
  ptr
 }
}
#[global_allocator] static ALLOC:Counting=Counting;
fn main() {
 for (case,name) in ["constant","exponential","riccati"].into_iter().enumerate() {
  let f=controller(case);let shared=f.clone().share_preparation();let expected=complete(&f,&shared,false,&mut budget());
  for reuse in [false,true] {
   let run=|| {
    CALLS.store(0,Ordering::Relaxed);BYTES.store(0,Ordering::Relaxed);LIVE.store(0,Ordering::Relaxed);PEAK.store(0,Ordering::Relaxed);
    let mut b=budget();
    ACTIVE.store(true,Ordering::Relaxed);
    let reports=complete(black_box(&f),&shared,reuse,&mut b);
    assert_eq!(reports.report().end_enclosure(),expected.report().end_enclosure());assert_eq!(reports.report().attempts().len(),expected.report().attempts().len());assert_eq!(reports.report().segments().len(),expected.report().segments().len());
    let retained=LIVE.load(Ordering::Relaxed);
    drop(black_box(reports));
    ACTIVE.store(false,Ordering::Relaxed);
    assert_eq!(LIVE.load(Ordering::Relaxed),0,"diagnostic scope must balance allocations");
    (b.policy().graph_work-b.remaining_graph_work(),b.policy().scalar_work-b.remaining_scalar_work(),CALLS.load(Ordering::Relaxed),BYTES.load(Ordering::Relaxed),PEAK.load(Ordering::Relaxed),retained)
   };
   for _ in 0..16 {run();}
   let first=run();for _ in 0..4 {assert_eq!(run(),first);}
   println!("{name}/{} graph={} native={} allocations={} requested_bytes={} peak_requested_live={} output_requested_live={}",if reuse {"shared"}else{"independent"},first.0,first.1,first.2,first.3,first.4,first.5);
  }
 }
}
'''
(p/'src/main.rs').write_text(t);(s/'cost-probe.rs').write_text(t)
