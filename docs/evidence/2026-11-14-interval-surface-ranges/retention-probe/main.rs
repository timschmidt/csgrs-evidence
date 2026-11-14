use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicU64, Ordering};
use std::hint::black_box;
#[path="/mnt/development/csgrs-surface-interval-ranges/crates/hyperbrep/benches/support/surface_ranges.rs"]
mod workload;
const ALLOCATION_MAGIC: u64 = 0x4859_5045_524d_454d;

static TRACKING_ENABLED: AtomicBool = AtomicBool::new(false);
static ALLOCATION_COUNT: AtomicU64 = AtomicU64::new(0);
static REALLOCATION_COUNT: AtomicU64 = AtomicU64::new(0);
static DEALLOCATION_COUNT: AtomicU64 = AtomicU64::new(0);
static ALLOCATED_BYTES: AtomicU64 = AtomicU64::new(0);
static REALLOCATED_BYTES: AtomicU64 = AtomicU64::new(0);
static DEALLOCATED_BYTES: AtomicU64 = AtomicU64::new(0);
static LIVE_BYTES: AtomicU64 = AtomicU64::new(0);
static PEAK_LIVE_BYTES: AtomicU64 = AtomicU64::new(0);

#[repr(C, align(16))]
#[derive(Clone, Copy)]
struct AllocationHeader {
    requested_size: usize,
    magic: u64,
    counted: bool,
}

struct TrackingAllocator;

fn allocation_layout(layout: Layout) -> Option<(Layout, usize)> {
    let (combined, offset) = Layout::new::<AllocationHeader>().extend(layout).ok()?;
    Some((combined.pad_to_align(), offset))
}

fn update_peak(candidate: u64) {
    let mut peak = PEAK_LIVE_BYTES.load(Ordering::Relaxed);
    while candidate > peak {
        match PEAK_LIVE_BYTES.compare_exchange_weak(
            peak,
            candidate,
            Ordering::Relaxed,
            Ordering::Relaxed,
        ) {
            Ok(_) => break,
            Err(observed) => peak = observed,
        }
    }
}

fn record_allocation(size: usize) {
    ALLOCATION_COUNT.fetch_add(1, Ordering::Relaxed);
    ALLOCATED_BYTES.fetch_add(size as u64, Ordering::Relaxed);
    let live = LIVE_BYTES.fetch_add(size as u64, Ordering::Relaxed) + size as u64;
    update_peak(live);
}

fn record_reallocation(old_size: usize, new_size: usize, was_counted: bool) {
    REALLOCATION_COUNT.fetch_add(1, Ordering::Relaxed);
    REALLOCATED_BYTES.fetch_add(new_size as u64, Ordering::Relaxed);
    if was_counted {
        resize_live_bytes(old_size, new_size);
    } else {
        let live = LIVE_BYTES.fetch_add(new_size as u64, Ordering::Relaxed) + new_size as u64;
        update_peak(live);
    }
}

fn resize_live_bytes(old_size: usize, new_size: usize) {
    if new_size >= old_size {
        let added = (new_size - old_size) as u64;
        let live = LIVE_BYTES.fetch_add(added, Ordering::Relaxed) + added;
        update_peak(live);
    } else {
        LIVE_BYTES.fetch_sub((old_size - new_size) as u64, Ordering::Relaxed);
    }
}

fn record_deallocation(size: usize, count_event: bool) {
    LIVE_BYTES.fetch_sub(size as u64, Ordering::Relaxed);
    if count_event {
        DEALLOCATION_COUNT.fetch_add(1, Ordering::Relaxed);
        DEALLOCATED_BYTES.fetch_add(size as u64, Ordering::Relaxed);
    }
}

// SAFETY: every returned pointer comes from `System` with a layout extended by
// a private header. Deallocation and reallocation reconstruct exactly that
// layout from the caller-supplied original layout.
unsafe impl GlobalAlloc for TrackingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        let Some((combined, offset)) = allocation_layout(layout) else {
            return std::ptr::null_mut();
        };
        // SAFETY: `combined` is a valid layout.
        let base = unsafe { System.alloc(combined) };
        if base.is_null() {
            return base;
        }
        let counted = TRACKING_ENABLED.load(Ordering::Relaxed);
        let header = AllocationHeader {
            requested_size: layout.size(),
            magic: ALLOCATION_MAGIC,
            counted,
        };
        // SAFETY: `base` has room and alignment for the header and payload.
        unsafe { base.cast::<AllocationHeader>().write(header) };
        if counted {
            record_allocation(layout.size());
        }
        // SAFETY: `offset` is the payload offset returned by `Layout::extend`.
        unsafe { base.add(offset) }
    }

    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        let Some((combined, offset)) = allocation_layout(layout) else {
            return std::ptr::null_mut();
        };
        // SAFETY: `combined` is a valid layout.
        let base = unsafe { System.alloc_zeroed(combined) };
        if base.is_null() {
            return base;
        }
        let counted = TRACKING_ENABLED.load(Ordering::Relaxed);
        let header = AllocationHeader {
            requested_size: layout.size(),
            magic: ALLOCATION_MAGIC,
            counted,
        };
        // SAFETY: `base` has room and alignment for the header and payload.
        unsafe { base.cast::<AllocationHeader>().write(header) };
        if counted {
            record_allocation(layout.size());
        }
        // SAFETY: `offset` is the payload offset returned by `Layout::extend`.
        unsafe { base.add(offset) }
    }

    unsafe fn dealloc(&self, pointer: *mut u8, layout: Layout) {
        let Some((combined, offset)) = allocation_layout(layout) else {
            std::process::abort();
        };
        // SAFETY: the pointer was returned at this deterministic offset.
        let base = unsafe { pointer.sub(offset) };
        // SAFETY: the header was initialized by this allocator.
        let header = unsafe { base.cast::<AllocationHeader>().read() };
        if header.magic != ALLOCATION_MAGIC || header.requested_size != layout.size() {
            std::process::abort();
        }
        if header.counted {
            record_deallocation(
                header.requested_size,
                TRACKING_ENABLED.load(Ordering::Relaxed),
            );
        }
        // SAFETY: `base` and `combined` match the allocation call.
        unsafe { System.dealloc(base, combined) };
    }

    unsafe fn realloc(&self, pointer: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
        let Some((old_combined, old_offset)) = allocation_layout(layout) else {
            return std::ptr::null_mut();
        };
        let Ok(new_payload) = Layout::from_size_align(new_size, layout.align()) else {
            return std::ptr::null_mut();
        };
        let Some((new_combined, new_offset)) = allocation_layout(new_payload) else {
            return std::ptr::null_mut();
        };
        if old_offset != new_offset || old_combined.align() != new_combined.align() {
            return std::ptr::null_mut();
        }
        // SAFETY: the pointer was returned at `old_offset` by this allocator.
        let base = unsafe { pointer.sub(old_offset) };
        // SAFETY: the existing header remains initialized until realloc succeeds.
        let old_header = unsafe { base.cast::<AllocationHeader>().read() };
        if old_header.magic != ALLOCATION_MAGIC || old_header.requested_size != layout.size() {
            std::process::abort();
        }
        // SAFETY: `base` and `old_combined` identify the old allocation; the
        // new combined layout has the same alignment.
        let new_base = unsafe { System.realloc(base, old_combined, new_combined.size()) };
        if new_base.is_null() {
            // Restore the header because `read` moved it logically.
            // SAFETY: failed realloc leaves the old allocation valid.
            unsafe { base.cast::<AllocationHeader>().write(old_header) };
            return new_base;
        }
        let enabled = TRACKING_ENABLED.load(Ordering::Relaxed);
        let counted = old_header.counted || enabled;
        let new_header = AllocationHeader {
            requested_size: new_size,
            magic: ALLOCATION_MAGIC,
            counted,
        };
        // SAFETY: successful realloc returned space for the new header.
        unsafe { new_base.cast::<AllocationHeader>().write(new_header) };
        if enabled {
            record_reallocation(old_header.requested_size, new_size, old_header.counted);
        } else if old_header.counted {
            resize_live_bytes(old_header.requested_size, new_size);
        }
        // SAFETY: `new_offset` is the extended payload offset.
        unsafe { new_base.add(new_offset) }
    }
}

#[global_allocator]
static GLOBAL_ALLOCATOR: TrackingAllocator = TrackingAllocator;

#[repr(C)]
#[derive(Clone, Copy, Debug, Default, Eq, PartialEq)]
struct AllocationStats {
    allocation_count: u64,
    reallocation_count: u64,
    deallocation_count: u64,
    allocated_bytes: u64,
    reallocated_bytes: u64,
    deallocated_bytes: u64,
    live_bytes: u64,
    peak_live_bytes: u64,
}

impl AllocationStats {
    fn rust_snapshot() -> Self {
        Self {
            allocation_count: ALLOCATION_COUNT.load(Ordering::Relaxed),
            reallocation_count: REALLOCATION_COUNT.load(Ordering::Relaxed),
            deallocation_count: DEALLOCATION_COUNT.load(Ordering::Relaxed),
            allocated_bytes: ALLOCATED_BYTES.load(Ordering::Relaxed),
            reallocated_bytes: REALLOCATED_BYTES.load(Ordering::Relaxed),
            deallocated_bytes: DEALLOCATED_BYTES.load(Ordering::Relaxed),
            live_bytes: LIVE_BYTES.load(Ordering::Relaxed),
            peak_live_bytes: PEAK_LIVE_BYTES.load(Ordering::Relaxed),
        }
    }
}

fn rust_tracking_reset() {
    ALLOCATION_COUNT.store(0, Ordering::Relaxed);
    REALLOCATION_COUNT.store(0, Ordering::Relaxed);
    DEALLOCATION_COUNT.store(0, Ordering::Relaxed);
    ALLOCATED_BYTES.store(0, Ordering::Relaxed);
    REALLOCATED_BYTES.store(0, Ordering::Relaxed);
    DEALLOCATED_BYTES.store(0, Ordering::Relaxed);
    PEAK_LIVE_BYTES.store(LIVE_BYTES.load(Ordering::Relaxed), Ordering::Relaxed);
}

fn rust_tracking_enable(enabled: bool) {
    TRACKING_ENABLED.store(enabled, Ordering::SeqCst);
}


fn main() {
 let case:usize=std::env::var("SURFACE_RANGE_COLD_CASE").unwrap().parse().unwrap();
 let shared=std::env::var("SURFACE_RANGE_COLD_SHARED").unwrap()=="1";
 for attempt in 0..32 {
  let source=workload::source(case);
  let mut graph=workload::graph(); let mut arithmetic=workload::arithmetic();
  rust_tracking_reset(); rust_tracking_enable(true);
  let reports=workload::complete(black_box(&source),shared,&mut graph,&mut arithmetic);
  rust_tracking_enable(false); workload::validate(case,&reports);
  rust_tracking_enable(true);drop(black_box(reports));rust_tracking_enable(false);drop(source);
  let stats=AllocationStats::rust_snapshot();
  println!("attempt={attempt} live={} allocations={} reallocations={} peak={}",stats.live_bytes,stats.allocation_count,stats.reallocation_count,stats.peak_live_bytes);
 }
 // After all retention observations, recheck complete cross-mode evidence.
 let source=workload::source(case);
 let a=workload::complete(&source,false,&mut workload::graph(),&mut workload::arithmetic());
 let b=workload::complete(&source,true,&mut workload::graph(),&mut workload::arithmetic());
 workload::compare(&a,&b);
}
