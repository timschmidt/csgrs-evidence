use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicU64, Ordering};

struct R17Allocator;
static R17_REQUESTED: AtomicU64 = AtomicU64::new(0);
static R17_LIVE: AtomicU64 = AtomicU64::new(0);
static R17_PEAK: AtomicU64 = AtomicU64::new(0);
static R17_ALLOCS: AtomicU64 = AtomicU64::new(0);
static R17_REALLOCS: AtomicU64 = AtomicU64::new(0);
static R17_FREES: AtomicU64 = AtomicU64::new(0);

fn r17_grow(bytes: usize) {
    let live = R17_LIVE.fetch_add(bytes as u64, Ordering::Relaxed) + bytes as u64;
    R17_PEAK.fetch_max(live, Ordering::Relaxed);
}

unsafe impl GlobalAlloc for R17Allocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        let pointer = unsafe { System.alloc(layout) };
        if !pointer.is_null() {
            R17_REQUESTED.fetch_add(layout.size() as u64, Ordering::Relaxed);
            R17_ALLOCS.fetch_add(1, Ordering::Relaxed);
            r17_grow(layout.size());
        }
        pointer
    }

    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        let pointer = unsafe { System.alloc_zeroed(layout) };
        if !pointer.is_null() {
            R17_REQUESTED.fetch_add(layout.size() as u64, Ordering::Relaxed);
            R17_ALLOCS.fetch_add(1, Ordering::Relaxed);
            r17_grow(layout.size());
        }
        pointer
    }

    unsafe fn dealloc(&self, pointer: *mut u8, layout: Layout) {
        R17_LIVE.fetch_sub(layout.size() as u64, Ordering::Relaxed);
        R17_FREES.fetch_add(1, Ordering::Relaxed);
        unsafe { System.dealloc(pointer, layout) };
    }

    unsafe fn realloc(&self, pointer: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
        let result = unsafe { System.realloc(pointer, layout, new_size) };
        if !result.is_null() {
            R17_REQUESTED.fetch_add(new_size as u64, Ordering::Relaxed);
            R17_REALLOCS.fetch_add(1, Ordering::Relaxed);
            if new_size >= layout.size() {
                r17_grow(new_size - layout.size());
            } else {
                R17_LIVE.fetch_sub((layout.size() - new_size) as u64, Ordering::Relaxed);
            }
        }
        result
    }
}

#[global_allocator]
static R17_GLOBAL_ALLOCATOR: R17Allocator = R17Allocator;

fn r17_snapshot(stage: &str) {
    let requested = R17_REQUESTED.load(Ordering::Relaxed);
    let live = R17_LIVE.load(Ordering::Relaxed);
    let peak = R17_PEAK.load(Ordering::Relaxed);
    let allocs = R17_ALLOCS.load(Ordering::Relaxed);
    let reallocs = R17_REALLOCS.load(Ordering::Relaxed);
    let frees = R17_FREES.load(Ordering::Relaxed);
    eprintln!(
        "R17_MEMORY {{\"stage\":\"{stage}\",\"requested_bytes\":{requested},\"live_bytes\":{live},\"peak_bytes\":{peak},\"alloc_calls\":{allocs},\"realloc_calls\":{reallocs},\"dealloc_calls\":{frees}}"
    );
    if std::env::var("R17_STOP_STAGE").is_ok_and(|value| value == stage) {
        // Diagnostic end-live snapshot with all current roots deliberately held.
        // This is neither a leak test nor completion of the release pipeline.
        std::process::exit(0);
    }
}

fn r17_check_allocator() {
    let live = R17_LIVE.load(Ordering::Relaxed);
    let requested = R17_REQUESTED.load(Ordering::Relaxed);
    let allocs = R17_ALLOCS.load(Ordering::Relaxed);
    let reallocs = R17_REALLOCS.load(Ordering::Relaxed);
    let frees = R17_FREES.load(Ordering::Relaxed);
    unsafe {
        let first = Layout::from_size_align(64, 8).unwrap();
        let pointer = R17_GLOBAL_ALLOCATOR.alloc(first);
        assert!(!pointer.is_null());
        pointer.write_volatile(17);
        let pointer = R17_GLOBAL_ALLOCATOR.realloc(pointer, first, 160);
        assert!(!pointer.is_null());
        assert_eq!(pointer.read_volatile(), 17);
        let pointer = R17_GLOBAL_ALLOCATOR.realloc(
            pointer, Layout::from_size_align(160, 8).unwrap(), 32,
        );
        assert!(!pointer.is_null());
        assert_eq!(pointer.read_volatile(), 17);
        R17_GLOBAL_ALLOCATOR.dealloc(pointer, Layout::from_size_align(32, 8).unwrap());
        let zeroed = Layout::from_size_align(256, 8).unwrap();
        let pointer = R17_GLOBAL_ALLOCATOR.alloc_zeroed(zeroed);
        assert!(!pointer.is_null());
        assert_eq!(pointer.read_volatile(), 0);
        R17_GLOBAL_ALLOCATOR.dealloc(pointer, zeroed);
    }
    assert_eq!(R17_LIVE.load(Ordering::Relaxed), live);
    assert_eq!(R17_REQUESTED.load(Ordering::Relaxed) - requested, 512);
    assert_eq!(R17_ALLOCS.load(Ordering::Relaxed) - allocs, 2);
    assert_eq!(R17_REALLOCS.load(Ordering::Relaxed) - reallocs, 2);
    assert_eq!(R17_FREES.load(Ordering::Relaxed) - frees, 2);
    println!("R17_ALLOCATOR_CHECK passed: live restored, 512 requested bytes, two allocations, two reallocations, two frees");
}

fn main() {
    if std::env::var_os("R17_ALLOCATOR_CHECK").is_some() {
        r17_check_allocator();
        return;
    }
    let repeats = std::env::var("R17_REPEATS")
        .map_or(1, |value| value.parse::<usize>().unwrap());
    assert!((1..=3).contains(&repeats));
    for repetition in 0..repeats {
        eprintln!("R17_REPETITION {repetition}");
        r17_snapshot("before-run");
        r17_original_main();
        r17_snapshot("after-all-drops");
    }
}
