from pathlib import Path
import shutil
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-taylor-noise');p=Path('/mnt/development/.interval-refactor-build/taylor-noise-probe');p.mkdir();(p/'src').mkdir()
manifest='''[package]
name = "taylor-noise-cost-probe"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
hypersolve = {path="/mnt/development/csgrs-taylor-noise/crates/hypersolve", features=["taylor-noise"]}
hyperreal = {path="/mnt/development/csgrs-taylor-noise/crates/hyperreal"}
hyperinterval = {path="/mnt/development/csgrs-taylor-noise/crates/hyperinterval", features=["hyperreal"]}
'''
(p/'Cargo.toml').write_text(manifest);(s/'cost-probe-Cargo.toml').write_text(manifest);shutil.copyfile(r/'Cargo.lock',p/'Cargo.lock')
t=(r/'crates/hypersolve/benches/taylor_noise.rs').read_text().split('fn bench(')[0];t=t.replace('use criterion::{BenchmarkId, Criterion, criterion_group, criterion_main};\n','');t+='''
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
struct Counting;
static ACTIVE: AtomicBool = AtomicBool::new(false);
static CALLS: AtomicU64 = AtomicU64::new(0);
static BYTES: AtomicU64 = AtomicU64::new(0);
unsafe impl GlobalAlloc for Counting {
 unsafe fn alloc(&self,l:Layout)->*mut u8 {
  if ACTIVE.load(Ordering::Relaxed) { CALLS.fetch_add(1,Ordering::Relaxed); BYTES.fetch_add(l.size() as u64,Ordering::Relaxed); }
  unsafe {System.alloc(l)}
 }
 unsafe fn dealloc(&self,p:*mut u8,l:Layout) {unsafe {System.dealloc(p,l)}}
 unsafe fn realloc(&self,p:*mut u8,l:Layout,n:usize)->*mut u8 {
  if ACTIVE.load(Ordering::Relaxed) { CALLS.fetch_add(1,Ordering::Relaxed); BYTES.fetch_add(n as u64,Ordering::Relaxed); }
  unsafe {System.realloc(p,l,n)}
 }
}
#[global_allocator] static ALLOC:Counting=Counting;
fn main() {
 let original=source();
 let prepared=TaylorNoiseModel::new(original.clone(),1,&mut graph(),&mut scalar()).unwrap();
 for queries in [1i64,16] {
  let maps:Vec<_>=(1..=queries).map(|n|TaylorAffineMap{input_count:2,rows:vec![TaylorAffineRow{coefficients:vec![Real::from(n),Real::from(-n)],offset:Real::zero()}]}).collect();
  let expected:Vec<_>=(1..=queries).map(|n|d(-n,n)).collect();
  for mode in ["full_affine","noise_cold","noise_warm"] {
   let mut run=|| {
    CALLS.store(0,Ordering::Relaxed);BYTES.store(0,Ordering::Relaxed);
    let mut g=graph();let mut a=scalar();let gw=g.remaining_work();let aw=a.remaining_work();
    ACTIVE.store(true,Ordering::Relaxed);
    if mode=="full_affine" {
     for (map,want) in maps.iter().zip(&expected) {
      let result=original.transform(black_box(map.clone()),&mut g,&mut a).unwrap();
      assert_eq!(result.range().bounds(),std::slice::from_ref(want));drop(black_box(result));
     }
    } else if mode=="noise_cold" {
     let noise=TaylorNoiseModel::new(original.clone(),1,&mut g,&mut a).unwrap();
     for (map,want) in maps.iter().zip(&expected) {
      let result=noise.enclose(black_box(map),&mut g,&mut a).unwrap();assert_eq!(result.bounds(),std::slice::from_ref(want));drop(black_box(result));
     }
     drop(black_box(noise));
    } else {
     for (map,want) in maps.iter().zip(&expected) {
      let result=prepared.enclose(black_box(map),&mut g,&mut a).unwrap();assert_eq!(result.bounds(),std::slice::from_ref(want));drop(black_box(result));
     }
    }
    ACTIVE.store(false,Ordering::Relaxed);
    (gw-g.remaining_work(),aw-a.remaining_work(),CALLS.load(Ordering::Relaxed),BYTES.load(Ordering::Relaxed))
   };
   let _=run();let counts=run();assert_eq!(counts,run());
   println!("{mode} queries={queries} graph={} native={} allocation_calls={} allocated_bytes={}",counts.0,counts.1,counts.2,counts.3);
  }
 }
}
'''
(p/'src/main.rs').write_text(t);(s/'cost-probe.rs').write_text(t)
