use hyperreal::{Rational, Real};
use hypersolve::real_interval::RealInterval;
use std::hint::black_box;
use std::time::Instant;
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
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


fn fixture(case:usize)->(Real,Real,Option<i32>) {
    match black_box(case) {
            0 => (Real::from(2), Real::from(3), Some(-64)),
            1 => (Real::from(-1), Real::from(4), Some(-16)),
            2 => (Real::zero(), Real::zero(), Some(-8)),
            3 => (Real::from(-4), Real::from(-1), Some(-8)),
            4 => (Real::from(2), Real::from(3), Some(1)),
            5 => (Real::from(2), Real::from(3), None),
            6 => (Real::from(2).sqrt().unwrap(), Real::from(3).sqrt().unwrap(), Some(-32)),
            7 => (Real::from(Rational::fraction(1,3).unwrap()), Real::from(Rational::fraction(7,3).unwrap()), Some(-40)),
            8 => (Real::from(9), Real::from(16), Some(0)),
            9 => (Real::from(2), Real::from(3), Some(-512)),
            10 => (Real::from(Rational::fraction(9,4).unwrap()), Real::from(Rational::fraction(25,4).unwrap()), Some(-128)),
            _ => (Real::from(Rational::from_bigint(num_bigint::BigInt::from(1u8)<<512usize)), Real::from(Rational::from_bigint((num_bigint::BigInt::from(1u8)<<513usize)+3)), Some(-32)),
        }
}
fn main() {
    let timed=std::env::var_os("SQRT_TIMING").is_some();
    for case in 0..12 {
        let (lower,upper,precision)=fixture(case);
        let input=RealInterval{lower,upper};
        let operation=|| black_box(&input).nonnegative_square_root(black_box(precision));
        #[cfg(feature="trace")]
        { hyperreal::dispatch_trace::reset(); hyperreal::dispatch_trace::reset_rational_stats(); }
        #[cfg(feature="trace")]
        let result=hyperreal::dispatch_trace::with_recording(operation);
        #[cfg(not(feature="trace"))]
        let result=operation();
        #[cfg(feature="trace")]
        println!("TRACE {case} {:?}",hyperreal::dispatch_trace::take_trace());
        let output=result.as_ref().map(|r|(&r.lower,&r.upper));
        let orders=result.as_ref().map(|r|[hyperlimit::PredicatePolicy::STRICT,hyperlimit::PredicatePolicy::APPROXIMATE_512].map(|policy|format!("{:?}",hyperlimit::compare_reals(&r.lower,&r.upper,policy))));
        let squared=result.as_ref().map(|r|r.square());
        let squared_output=squared.as_ref().and_then(|r|r.as_ref().map(|r|(&r.lower,&r.upper)));
        println!("RESULT {}",serde_json::json!({"case":case,"output":output,"orders":orders,"squared":squared_output}));
        drop(squared);drop(result);
        for _ in 0..8 {drop(black_box(operation()));}
        let guard=CountingGuard::start();
        for _ in 0..16 {drop(black_box(operation()));}
        let stats=AllocationStats::snapshot();drop(guard);
        println!("ALLOC {case} {} {} {} {} {} {}",stats.allocations,stats.deallocations,stats.reallocations,stats.allocated_bytes,stats.peak_live_bytes,stats.live_bytes);
        if timed {
            let mut samples=Vec::new();
            for _ in 0..31 {
                let start=Instant::now();
                for _ in 0..128 {drop(black_box(operation()));}
                samples.push(start.elapsed().as_nanos() as f64 /128.0);
            }
            println!("TIMING {case} {samples:?}");
        }
    }
}
