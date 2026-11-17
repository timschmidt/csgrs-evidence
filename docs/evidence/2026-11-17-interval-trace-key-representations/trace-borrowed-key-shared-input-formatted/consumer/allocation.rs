use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
struct CountingAllocator;
unsafe extern "C" {
    fn malloc_usable_size(pointer: *mut std::ffi::c_void) -> usize;
}
static USABLE_LIVE: AtomicIsize = AtomicIsize::new(0);
static USABLE_PEAK: AtomicIsize = AtomicIsize::new(0);
static USABLE_TRAFFIC: AtomicUsize = AtomicUsize::new(0);
fn add_usable(bytes: usize) {
    USABLE_TRAFFIC.fetch_add(bytes, Ordering::Relaxed);
    let live = USABLE_LIVE.fetch_add(bytes as isize, Ordering::Relaxed) + bytes as isize;
    USABLE_PEAK.fetch_max(live, Ordering::Relaxed);
}

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
            add_usable(unsafe { malloc_usable_size(pointer.cast()) });
        }
        pointer
    }

    unsafe fn dealloc(&self, pointer: *mut u8, layout: Layout) {
        if ENABLED.load(Ordering::Relaxed) {
            DEALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            subtract_live_bytes(layout.size());
            USABLE_LIVE.fetch_sub(
                unsafe { malloc_usable_size(pointer.cast()) } as isize,
                Ordering::Relaxed,
            );
        }
        unsafe { System.dealloc(pointer, layout) };
    }

    unsafe fn realloc(&self, pointer: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
        let old_usable = if ENABLED.load(Ordering::Relaxed) {
            unsafe { malloc_usable_size(pointer.cast()) }
        } else {
            0
        };
        let replacement = unsafe { System.realloc(pointer, layout, new_size) };
        if !replacement.is_null() && ENABLED.load(Ordering::Relaxed) {
            USABLE_LIVE.fetch_sub(old_usable as isize, Ordering::Relaxed);
            add_usable(unsafe { malloc_usable_size(replacement.cast()) });
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

#[derive(Clone, Copy, Debug)]
pub struct AllocationStats {
    allocations: usize,
    deallocations: usize,
    reallocations: usize,
    allocated_bytes: usize,
    peak_live_bytes: isize,
    live_bytes: isize,
    usable: (usize, isize, isize),
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
            usable: (
                USABLE_TRAFFIC.load(Ordering::Relaxed),
                USABLE_PEAK.load(Ordering::Relaxed),
                USABLE_LIVE.load(Ordering::Relaxed),
            ),
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
        USABLE_TRAFFIC.store(0, Ordering::Relaxed);
        USABLE_PEAK.store(0, Ordering::Relaxed);
        USABLE_LIVE.store(0, Ordering::Relaxed);
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

pub fn observe<T>(operation: impl FnOnce() -> T) -> (T, AllocationStats) {
    let guard = CountingGuard::start();
    let result = operation();
    let stats = AllocationStats::snapshot();
    drop(guard);
    (result, stats)
}

impl AllocationStats {
    pub fn usable(&self) -> (usize, isize, isize) {
        self.usable
    }
    pub fn values(&self) -> (usize, usize, usize, usize, isize, isize) {
        (
            self.allocations,
            self.deallocations,
            self.reallocations,
            self.allocated_bytes,
            self.peak_live_bytes,
            self.live_bytes,
        )
    }
}
