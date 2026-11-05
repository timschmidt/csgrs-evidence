use std::{alloc::{GlobalAlloc,Layout,System},sync::atomic::{AtomicUsize,Ordering}};
struct Counter;
static ALLOCATED:AtomicUsize=AtomicUsize::new(0);
static LIVE:AtomicUsize=AtomicUsize::new(0);
static PEAK:AtomicUsize=AtomicUsize::new(0);
static CALLS:AtomicUsize=AtomicUsize::new(0);
fn grow(size:usize){CALLS.fetch_add(1,Ordering::Relaxed);ALLOCATED.fetch_add(size,Ordering::Relaxed);let live=LIVE.fetch_add(size,Ordering::Relaxed)+size;PEAK.fetch_max(live,Ordering::Relaxed);}
// Derived from benchmarks/rust/successive_operations.rs; realloc traffic counts
// its full new request separately from logical live-byte growth.
// Pointers/layouts pass unchanged to System; the measured executions complete.
unsafe impl GlobalAlloc for Counter {
 unsafe fn alloc(&self,l:Layout)->*mut u8{grow(l.size());unsafe{System.alloc(l)}}
 unsafe fn alloc_zeroed(&self,l:Layout)->*mut u8{grow(l.size());unsafe{System.alloc_zeroed(l)}}
 unsafe fn dealloc(&self,p:*mut u8,l:Layout){LIVE.fetch_sub(l.size(),Ordering::Relaxed);unsafe{System.dealloc(p,l)}}
 unsafe fn realloc(&self,p:*mut u8,l:Layout,size:usize)->*mut u8{
  CALLS.fetch_add(1,Ordering::Relaxed);ALLOCATED.fetch_add(size,Ordering::Relaxed);
  if size>=l.size(){let live=LIVE.fetch_add(size-l.size(),Ordering::Relaxed)+size-l.size();PEAK.fetch_max(live,Ordering::Relaxed);}else{LIVE.fetch_sub(l.size()-size,Ordering::Relaxed);}
  unsafe{System.realloc(p,l,size)}
 }
}
#[global_allocator]static GLOBAL:Counter=Counter;
