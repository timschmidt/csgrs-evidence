//! Completed continuous-trajectory verification, with preparation measured separately.
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy,
    picard::{PicardProposal, PicardStatus},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hyperphysics::{ForceAccumulator3, ForceContribution3, Real, Vector3};
use std::hint::black_box;
fn b() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn main() {
    let iterations: u32 = std::env::var("PHYSICS_FLOW_ITERATIONS")
        .map(|v| v.parse().unwrap())
        .unwrap_or(1_000);
    assert!(iterations > 0);
    let mut forces = ForceAccumulator3::default();
    forces.push(ForceContribution3 {
        source: "actuator".into(),
        force: Vector3::new([Real::from(3), Real::from(-2), Real::zero()]),
    });
    forces.push(ForceContribution3 {
        source: "bias".into(),
        force: Vector3::new([Real::from(1), Real::from(-2), Real::zero()]),
    });
    let prepare = || forces.dynamics(Real::from(2), &mut b()).unwrap();
    let model = prepare();
    let proposal = PicardProposal {
        start: d(0, 0, 0),
        end: d(1, 1, -2),
        initial: BoxN::new(std::array::from_fn(|_| d(0, 0, 0))).unwrap(),
        candidate: BoxN::new([
            d(0, 1, -3),
            d(-1, 0, -3),
            d(0, 0, 0),
            d(0, 1, -1),
            d(-1, 0, -1),
            d(0, 0, 0),
        ])
        .unwrap(),
    };
    let expected = model.certify_step(proposal.clone(), &mut b());
    assert!(matches!(
        expected.native().status(),
        PicardStatus::Certified
    ));
    let end = expected.native().end_enclosure().unwrap().lanes().unwrap();
    assert_eq!(&end[3..], &[d(1, 1, -1), d(-1, -1, -1), d(0, 0, 0)]);
    let mut arithmetic = DyadicBudget::new(4096, 100_000_000);
    assert!(d(1, 1, -4).subset_of(&end[0], &mut arithmetic).unwrap());
    assert!(d(-1, -1, -4).subset_of(&end[1], &mut arithmetic).unwrap());
    for candidate in [prepare(), model.clone()] {
        let result = candidate.certify_step(proposal.clone(), &mut b());
        assert!(matches!(result.native().status(), PicardStatus::Certified));
        assert_eq!(
            result.native().end_enclosure(),
            expected.native().end_enclosure()
        );
        assert_eq!(result.native().tube(), expected.native().tube());
        assert_eq!(
            result.native().evidence().jacobian(),
            expected.native().evidence().jacobian()
        );
        assert_eq!(
            result.native().evidence().contraction(),
            expected.native().evidence().contraction()
        );
        assert_eq!(result.native().identity(), expected.native().identity());
        assert_eq!(result.model().mass_sign(), expected.model().mass_sign());
        assert_eq!(result.model().provenance(), expected.model().provenance());
        assert_eq!(
            result.model().constant_forces().unwrap().contributions(),
            forces.contributions()
        );
    }
    for mode in ["prepare", "reuse", "prepare_and_step"] {
        for _ in 0..16 {
            drop(prepare().certify_step(proposal.clone(), &mut b()));
        }
        let guard = CountingGuard::start();
        for _ in 0..iterations {
            if mode == "prepare" {
                drop(black_box(prepare()));
            } else {
                let prepared;
                let current = if mode == "reuse" {
                    &model
                } else {
                    prepared = prepare();
                    &prepared
                };
                let report = current.certify_step(black_box(proposal.clone()), &mut b());
                assert!(matches!(report.native().status(), PicardStatus::Certified));
                assert_eq!(
                    report.native().end_enclosure(),
                    expected.native().end_enclosure()
                );
                assert_eq!(report.native().tube(), expected.native().tube());
                drop(black_box(report));
            }
        }
        let stats = AllocationStats::snapshot();
        drop(guard);
        print_row("physics", mode, iterations as usize, stats);
    }
    let mut budget=b();let gb=budget.remaining_graph_work();let sb=budget.remaining_scalar_work();
    let guard=CountingGuard::start();let report=model.certify_step(proposal.clone(),&mut budget);let retained=AllocationStats::snapshot();drop(report);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
    println!("RESOURCE query graph={} scalar={} retained={} peak={} after_drop={}",gb-budget.remaining_graph_work(),sb-budget.remaining_scalar_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
    let mut budget=b();let gb=budget.remaining_graph_work();let sb=budget.remaining_scalar_work();
    let guard=CountingGuard::start();let prepared=forces.dynamics(Real::from(2),&mut budget).unwrap();let retained=AllocationStats::snapshot();drop(prepared);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
    println!("RESOURCE prepare graph={} scalar={} retained={} peak={} after_drop={}",gb-budget.remaining_graph_work(),sb-budget.remaining_scalar_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);

}

use std::alloc::{GlobalAlloc,Layout,System};
use std::sync::atomic::{AtomicBool,AtomicIsize,AtomicUsize,Ordering};
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




