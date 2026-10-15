use hyperbrep::*;
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::time::Instant;
struct Allocator;
static LIVE:AtomicUsize=AtomicUsize::new(0);
static PEAK:AtomicUsize=AtomicUsize::new(0);
static CALLS:AtomicUsize=AtomicUsize::new(0);
static REQUESTED:AtomicUsize=AtomicUsize::new(0);
fn allocated(n:usize) {CALLS.fetch_add(1,Ordering::Relaxed);REQUESTED.fetch_add(n,Ordering::Relaxed);let live=LIVE.fetch_add(n,Ordering::Relaxed)+n;PEAK.fetch_max(live,Ordering::Relaxed);}
// SAFETY: original layouts and pointers are passed unchanged to System. Counters
// record requested live bytes, not allocator metadata or resident process memory.
unsafe impl GlobalAlloc for Allocator {
    unsafe fn alloc(&self,l:Layout)->*mut u8 {let p=unsafe{System.alloc(l)};if !p.is_null(){allocated(l.size());}p}
    unsafe fn alloc_zeroed(&self,l:Layout)->*mut u8 {let p=unsafe{System.alloc_zeroed(l)};if !p.is_null(){allocated(l.size());}p}
    unsafe fn dealloc(&self,p:*mut u8,l:Layout){LIVE.fetch_sub(l.size(),Ordering::Relaxed);unsafe{System.dealloc(p,l)}}
    unsafe fn realloc(&self,p:*mut u8,l:Layout,n:usize)->*mut u8 {let result=unsafe{System.realloc(p,l,n)};if !result.is_null(){LIVE.fetch_sub(l.size(),Ordering::Relaxed);allocated(n);}result}
}
#[global_allocator]static ALLOCATOR:Allocator=Allocator;
fn set(n:i32,offset:i32)->BodySet {
    let regions=(0..n).map(|i|{let x=4*i+offset;([(x,0),(x+2,0),(x+2,1),(x,1)].map(|(a,b)|Point2::new(a.into(),b.into())).to_vec(),Vec::new())}).collect::<Vec<_>>();
    builder::extrude_regions(&regions,0.into(),1.into()).unwrap()
}
fn volume(set:&BodySet)->Real{set.bodies().fold(Real::zero(),|v,s|v+s.volume().unwrap())}
fn main(){
    for n in [1,4,16,64] {
        let before=LIVE.load(Ordering::Relaxed);PEAK.store(before,Ordering::Relaxed);CALLS.store(0,Ordering::Relaxed);REQUESTED.store(0,Ordering::Relaxed);
        let start=Instant::now();
        let a=set(n,0);let b=set(n,1);
        let cut=boolean::difference(&a,&b).unwrap();let common=boolean::intersection(&a,&b).unwrap();
        for result in [&cut,&common] {assert_eq!(result.len(),n as usize);assert_eq!(volume(result),Real::from(n));}
        let recovered=boolean::union(&cut,&common).unwrap();assert_eq!(recovered.len(),n as usize);assert_eq!(volume(&recovered),Real::from(2*n));
        for i in 0..n {for offset in [1,3,5,7] {let p=Point3::new((Real::from(8*i+offset)/Real::from(2)).unwrap(),(Real::one()/Real::from(2)).unwrap(),(Real::one()/Real::from(2)).unwrap());let inside=recovered.bodies().any(|s|s.classify_point(&p).unwrap()==SolidPointLocation::Inside);assert_eq!(inside,offset<4);}}
        let archive=recovered.model().to_json().unwrap();let loaded=RawModel::from_json(&archive,&ArchiveLimits::default()).unwrap().validate().unwrap();assert_eq!(loaded.to_json().unwrap(),archive);
        assert!(boolean::difference(&recovered,&recovered).unwrap().is_empty());
        let elapsed=start.elapsed().as_nanos();let peak=PEAK.load(Ordering::Relaxed);let calls=CALLS.load(Ordering::Relaxed);let requested=REQUESTED.load(Ordering::Relaxed);let bytes=archive.len();
        drop((a,b,cut,common,recovered,archive,loaded));
        println!("{{\"input_bodies_each\":{n},\"ns\":{elapsed},\"allocation_calls\":{calls},\"requested_bytes\":{requested},\"live_requested_before\":{before},\"peak_live_requested\":{peak},\"live_requested_after_drop\":{},\"archive_bytes\":{bytes},\"completion\":\"certified\"}}",LIVE.load(Ordering::Relaxed));
    }
}
