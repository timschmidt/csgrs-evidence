use std::alloc::{GlobalAlloc,Layout,System};
use std::sync::atomic::{AtomicBool,AtomicIsize,AtomicUsize,Ordering};
use std::hint::black_box;
use std::time::Instant;
use hyperinterval::{F64Enclosure,F32Enclosure,DyadicBudget,DyadicInterval,IntervalError};
use hyperreal::{Rational,dispatch_trace};
struct CountingAllocator;

#[global_allocator]
static ALLOCATOR: CountingAllocator = CountingAllocator;

static ENABLED: AtomicBool = AtomicBool::new(false);
static ALLOCATIONS: AtomicUsize = AtomicUsize::new(0);
static DEALLOCATIONS: AtomicUsize = AtomicUsize::new(0);
static REALLOCATIONS: AtomicUsize = AtomicUsize::new(0);
static ALLOCATED_BYTES: AtomicUsize = AtomicUsize::new(0);
// Signed deltas expose any pre-epoch allocation freed during measurement
// instead of letting a saturating subtraction hide it as a clean zero.
static LIVE_BYTES: AtomicIsize = AtomicIsize::new(0);
static PEAK_LIVE_BYTES: AtomicIsize = AtomicIsize::new(0);

unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        let pointer = unsafe { System.alloc(layout) };
        if !pointer.is_null() && ENABLED.load(Ordering::Relaxed) {
            ALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            ALLOCATED_BYTES.fetch_add(layout.size(), Ordering::Relaxed);
            add_live_bytes(layout.size());
        }
        pointer
    }

    unsafe fn dealloc(&self, pointer: *mut u8, layout: Layout) {
        if ENABLED.load(Ordering::Relaxed) {
            DEALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            subtract_live_bytes(layout.size());
        }
        unsafe { System.dealloc(pointer, layout) };
    }

    unsafe fn realloc(&self, pointer: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
        let replacement = unsafe { System.realloc(pointer, layout, new_size) };
        if !replacement.is_null() && ENABLED.load(Ordering::Relaxed) {
            REALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            ALLOCATED_BYTES.fetch_add(new_size, Ordering::Relaxed);
            if new_size >= layout.size() {
                add_live_bytes(new_size - layout.size());
            } else {
                subtract_live_bytes(layout.size() - new_size);
            }
        }
        replacement
    }
}

fn add_live_bytes(bytes: usize) {
    let bytes = bytes as isize;
    let live = LIVE_BYTES.fetch_add(bytes, Ordering::Relaxed) + bytes;
    let mut peak = PEAK_LIVE_BYTES.load(Ordering::Relaxed);
    while live > peak {
        match PEAK_LIVE_BYTES.compare_exchange_weak(
            peak,
            live,
            Ordering::Relaxed,
            Ordering::Relaxed,
        ) {
            Ok(_) => break,
            Err(observed) => peak = observed,
        }
    }
}

fn subtract_live_bytes(bytes: usize) {
    LIVE_BYTES.fetch_sub(bytes as isize, Ordering::Relaxed);
}

#[derive(Clone, Copy)]
struct AllocationStats {
    allocations: usize,
    deallocations: usize,
    reallocations: usize,
    allocated_bytes: usize,
    peak_live_bytes: isize,
    live_bytes: isize,
}

impl AllocationStats {
    fn snapshot() -> Self {
        Self {
            allocations: ALLOCATIONS.load(Ordering::Relaxed),
            deallocations: DEALLOCATIONS.load(Ordering::Relaxed),
            reallocations: REALLOCATIONS.load(Ordering::Relaxed),
            allocated_bytes: ALLOCATED_BYTES.load(Ordering::Relaxed),
            peak_live_bytes: PEAK_LIVE_BYTES.load(Ordering::Relaxed),
            live_bytes: LIVE_BYTES.load(Ordering::Relaxed),
        }
    }
}

struct CountingGuard;

impl CountingGuard {
    fn start() -> Self {
        for counter in [
            &ALLOCATIONS,
            &DEALLOCATIONS,
            &REALLOCATIONS,
            &ALLOCATED_BYTES,
        ] {
            counter.store(0, Ordering::Relaxed);
        }
        LIVE_BYTES.store(0, Ordering::Relaxed);
        PEAK_LIVE_BYTES.store(0, Ordering::Relaxed);
        ENABLED.store(true, Ordering::SeqCst);
        Self
    }
}

impl Drop for CountingGuard {
    fn drop(&mut self) {
        ENABLED.store(false, Ordering::SeqCst);
    }
}

fn measure<T>(iterations: usize, mut operation: impl FnMut() -> T) -> AllocationStats {
    // Exact-real approximation nodes refine lazily. Several warm-up passes
    // ensure the counting epoch measures a stable cache depth rather than
    // charging retained refinement state as an apparent live-byte leak.
    for _ in 0..8 {
        drop(black_box(operation()));
    }
    let guard = CountingGuard::start();
    for _ in 0..iterations {
        drop(black_box(operation()));
    }
    let stats = AllocationStats::snapshot();
    drop(guard);
    stats
}

fn print_row(name: &str, operation: &str, iterations: usize, stats: AllocationStats) {
    let divisor = iterations as f64;
    println!(
        "| {name} | {operation} | {:.2} | {:.2} | {:.1} | {:.2} | {} | {} |",
        stats.allocations as f64 / divisor,
        stats.deallocations as f64 / divisor,
        stats.allocated_bytes as f64 / divisor,
        stats.reallocations as f64 / divisor,
        stats.peak_live_bytes,
        stats.live_bytes,
    );
    assert_eq!(
        stats.live_bytes, 0,
        "{name}/{operation} retained or released foreign bytes during the counting epoch"
    );
}

fn timed<T>(name:&str,mut f:impl FnMut()->T){
 print_row(name,"conversion",128,measure(128,&mut f));
 let mut samples=Vec::new();for _ in 0..31 {let t=Instant::now();for _ in 0..1024 {drop(black_box(f()));} samples.push(t.elapsed().as_nanos() as f64/1024.0);}
 println!("TIMING {name} ns_per_operation={samples:?}");
}
fn check(name:&str,lo:Rational,hi:Rational,mut f:impl FnMut(u64,u64)->(Result<DyadicInterval,IntervalError>,u64)) {
 const WORK:u64=1_000_000_000;
 let (result,remaining)=f(4096,WORK);let value=result.unwrap();
 let rational=value.to_rational(&mut DyadicBudget::new(4096,WORK)).unwrap();
 assert_eq!(rational.lower(),Some(&lo));assert_eq!(rational.upper(),Some(&hi));
 dispatch_trace::reset();dispatch_trace::reset_rational_stats();
 let traced=dispatch_trace::with_recording(||f(4096,WORK));assert_eq!(traced.0,Ok(value.clone()));
 assert!(dispatch_trace::take_trace().dispatch.is_empty());
 println!("EXACT {name} work={} value={}", WORK-remaining,serde_json::to_string(&value).unwrap());
 let used=WORK-remaining;let mut exact=f(4096,used);assert_eq!(exact.0,Ok(value));assert_eq!(exact.1,0);
 exact=f(4096,used-1);assert_eq!(exact.0,Err(IntervalError::WorkExhausted));
 println!("SHORT {name} {exact:?}");
 timed(name,||f(4096,WORK));
 timed(&format!("{name}/exhausted"),||f(0,0));
}
fn main(){
 for (i,(a,b)) in [(0.0,0.0),(-0.1,0.3),(f64::from_bits(1),f64::from_bits(2)),(-f64::MAX,f64::MAX),(1.0,1.0),(f64::MIN_POSITIVE,f64::MIN_POSITIVE),(0.0,f64::from_bits(1)),(-1.0,f64::from_bits(1))].into_iter().enumerate(){
 let x=F64Enclosure::new(a,b).unwrap();check(&format!("f64-{i}"),Rational::try_from(a).unwrap(),Rational::try_from(b).unwrap(),|bits,work|{let mut budget=DyadicBudget::new(bits,work);let result=black_box(x).to_dyadic(&mut budget);(result,budget.remaining_work())});
 }
 for (i,(a,b)) in [(0.0f32,0.0),(-0.1,0.3),(f32::from_bits(1),f32::from_bits(2)),(-f32::MAX,f32::MAX),(1.0,1.0),(f32::MIN_POSITIVE,f32::MIN_POSITIVE),(0.0,f32::from_bits(1)),(-1.0,f32::from_bits(1))].into_iter().enumerate(){
 let x=F32Enclosure::new(a,b).unwrap();check(&format!("f32-{i}"),Rational::try_from(f64::from(a)).unwrap(),Rational::try_from(f64::from(b)).unwrap(),|bits,work|{let mut budget=DyadicBudget::new(bits,work);let result=black_box(x).to_dyadic(&mut budget);(result,budget.remaining_work())});
 }
}
