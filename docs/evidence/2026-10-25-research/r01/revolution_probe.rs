use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::time::Instant;
use std::io::Write;
use csgrs::{curve, Real, GeometryContext, GeometryCertainty};
struct CountingAllocator;
static ALLOCATED: AtomicUsize = AtomicUsize::new(0);
static LIVE: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);

fn grow(size: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    ALLOCATED.fetch_add(size, Ordering::Relaxed);
    let live = LIVE.fetch_add(size, Ordering::Relaxed) + size;
    PEAK.fetch_max(live, Ordering::Relaxed);
}

// SAFETY: The original pointers and layouts pass unchanged to System; the
// counters neither inspect allocations nor change their lifetime.
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc(layout) }
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc_zeroed(layout) }
    }
    unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, size: usize) -> *mut u8 {
        if size >= layout.size() {
            grow(size - layout.size());
        } else {
            CALLS.fetch_add(1, Ordering::Relaxed);
            LIVE.fetch_sub(layout.size() - size, Ordering::Relaxed);
        }
        unsafe { System.realloc(ptr, layout, size) }
    }
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        LIVE.fetch_sub(layout.size(), Ordering::Relaxed);
        unsafe { System.dealloc(ptr, layout) }
    }
}

#[global_allocator]
static GLOBAL: CountingAllocator = CountingAllocator;


fn r(n: i32) -> Real { Real::from(n) }
fn main() {
    let args: Vec<_> = std::env::args().collect();
    let mode = &args[1];
    let n: usize = args[2].parse().unwrap();
    let rows = std::path::Path::new(&args[3]);
    let rect = |x0: i32, x1: i32, y0: i32, y1: i32| curve::polygon(&[
        [r(x0),r(y0)],[r(x1),r(y0)],[r(x1),r(y1)],[r(x0),r(y1)],
    ]).unwrap();
    let profile = match mode.as_str() {
        "negative" => rect(-2,-1,0,1),
        "positive" => rect(1,2,0,1),
        "axis" => rect(-1,2,0,1),
        "disjoint" => rect(-2,-1,0,1).boolean_region(&rect(1,2,2,3), hypercurve::BooleanOp::Union).unwrap(),
        "overlap" => rect(-2,-1,1,3).boolean_region(&rect(1,3,0,2), hypercurve::BooleanOp::Union).unwrap(),
        _ => panic!("unknown case"),
    };
    for sample in 0..5 {
        let before_live = LIVE.load(Ordering::Relaxed);
        let before_alloc = ALLOCATED.load(Ordering::Relaxed);
        let before_calls = CALLS.load(Ordering::Relaxed);
        PEAK.store(before_live, Ordering::Relaxed);
        let clock = Instant::now();
        let result = curve::revolve(&profile, r(360), n, &GeometryContext::STRICT);
        let step_ns = clock.elapsed().as_nanos();
        let calls = CALLS.load(Ordering::Relaxed)-before_calls;
        let allocated = ALLOCATED.load(Ordering::Relaxed)-before_alloc;
        let peak = PEAK.load(Ordering::Relaxed).saturating_sub(before_live);
        let result_live = LIVE.load(Ordering::Relaxed).saturating_sub(before_live);
        let outcome = match result {
            Ok(x) => x,
            Err(e) => { println!("{mode}\t{n}\t{sample}\terror:{e:?}\t{step_ns}\t{calls}\t{allocated}\t{peak}"); std::io::stdout().flush().unwrap(); continue; },
        };
        assert_eq!(outcome.certainty, GeometryCertainty::Certified);
        let mesh=outcome.value;
        let clock=Instant::now();
        assert!(mesh.is_closed_manifold_geometry(&GeometryContext::STRICT.mesh_context()).unwrap().value);
        let validation_ns=clock.elapsed().as_nanos();
        let clock=Instant::now();
        let coordinates: Vec<_> = mesh.positions.iter().map(|p| [&p.x,&p.y,&p.z]).collect();
        let triangles: Vec<_> = mesh.triangles.iter().map(|t| t.indices()).collect();
        let exact=serde_json::to_vec(&(coordinates,triangles)).unwrap();
        let output_bytes=exact.len();
        let checksum=exact.iter().fold(14695981039346656037u64, |hash,b| (hash^u64::from(*b)).wrapping_mul(1099511628211));
        let materialize_ns=clock.elapsed().as_nanos();
        if sample==0 { std::fs::write(rows.join(format!("{mode}-{n}.json")), &exact).unwrap(); }
        drop(exact);
        let clock=Instant::now();
        drop(mesh);
        let drop_ns=clock.elapsed().as_nanos();
        let retained=LIVE.load(Ordering::Relaxed) as i128-before_live as i128;
        println!("{mode}\t{n}\t{sample}\tcertified\t{step_ns}\t{calls}\t{allocated}\t{peak}\t{result_live}\t{retained}\t{validation_ns}\t{materialize_ns}\t{drop_ns}\t{output_bytes}\t{checksum:016x}");
        std::io::stdout().flush().unwrap();
    }
}
