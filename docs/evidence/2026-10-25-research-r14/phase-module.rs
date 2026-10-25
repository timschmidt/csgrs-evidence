use std::sync::atomic::{AtomicU64,Ordering};
static COUNTS:[AtomicU64;3]=[const{AtomicU64::new(0)};3];
static NS:[AtomicU64;3]=[const{AtomicU64::new(0)};3];
pub(super) struct Guard{phase:usize,start:std::time::Instant}
impl Guard{pub(super) fn new(phase:usize)->Self{COUNTS[phase].fetch_add(1,Ordering::Relaxed);Self{phase,start:std::time::Instant::now()}}}
impl Drop for Guard{fn drop(&mut self){NS[self.phase].fetch_add(self.start.elapsed().as_nanos() as u64,Ordering::Relaxed);}}
pub(super) fn reset(){for x in COUNTS.iter().chain(NS.iter()){x.store(0,Ordering::Relaxed);}}
pub(super) fn report(leaf:&str){println!("R14_PHASE leaf={leaf} preparation_calls={} preparation_ns={} point_calls={} point_ns={} enclosure_calls={} enclosure_ns={}",COUNTS[0].load(Ordering::Relaxed),NS[0].load(Ordering::Relaxed),COUNTS[1].load(Ordering::Relaxed),NS[1].load(Ordering::Relaxed),COUNTS[2].load(Ordering::Relaxed),NS[2].load(Ordering::Relaxed));}
