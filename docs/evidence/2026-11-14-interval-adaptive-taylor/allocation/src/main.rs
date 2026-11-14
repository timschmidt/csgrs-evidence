//! Complete fresh preparation, integration, local remainder checks and proof destruction.
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest},
    taylor_flow::{
        adaptive::{AdaptiveTaylorOptions, AdaptiveTaylorStatus},
        evolution::FlowTaylorEvolutionStatus,
    },
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
use std::hint::black_box;
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn field(exponential: bool) -> ExpressionField<1> {
    let t = SymbolId(0);
    let x = SymbolId(1);
    let source = ExpressionProgram::compile(
        &[if exponential {
            Expr::anonymous_symbol(x)
        } else {
            Expr::int(2)
        }],
        &[t, x],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    ExpressionField::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time: t,
            state: vec![x],
        },
        &mut budget(),
    )
    .unwrap()
}
fn main() {
    let iterations: u32 = std::env::var("ADAPTIVE_TAYLOR_ITERATIONS")
        .map(|v| v.parse().unwrap())
        .unwrap_or(1000);
    assert!(iterations > 0);
    for exponential in [false, true] {
        let f = field(exponential);
        let name = if exponential {
            "exponential"
        } else {
            "constant"
        };
        let request = EvolutionRequest {
            start: d(0, 0, 0),
            end: d(1, 1, -1),
            initial: BoxN::new([if exponential { d(1, 1, 0) } else { d(0, 0, 0) }]).unwrap(),
        };
        let native = EvolutionOptions {
            maximum_step: Some(d(1, 1, -2)),
            ..Default::default()
        };
        let options = AdaptiveTaylorOptions {
            maximum_order: 3,
            remainder_limits: [d(1, 1, -10)],
            native: native.clone(),
            ..Default::default()
        };
        let controller = f.adaptive_taylor(options);
        let expected = f.flow_taylor(3, &mut budget()).unwrap().integrate(
            request.clone(),
            native.clone(),
            &mut budget(),
        );
        assert!(matches!(
            expected.status(),
            FlowTaylorEvolutionStatus::Completed
        ));
        let check_endpoint = |end: &BoxN<DyadicInterval, 1>| {
            assert_eq!(Some(end), expected.end_enclosure());
            let mut arithmetic = DyadicBudget::new(16384, 1_000_000_000);
            if exponential {
                use hyperreal::Rational as Q;
                let mut term = Q::from(1);
                let mut lo = term.clone();
                for k in 1..=12 {
                    term = term / Q::from(2 * k);
                    lo = lo + &term;
                }
                let hi = &lo + (&term / Q::from(26)) / (Q::from(1) - Q::from(1) / Q::from(28));
                let out = end.lanes().unwrap()[0]
                    .to_rational(&mut arithmetic)
                    .unwrap();
                assert!(out.contains_point(&lo));
                assert!(out.contains_point(&hi));
                assert!(
                    end.widths(&mut arithmetic).unwrap().unwrap()[0]
                        .subset_of(&d(0, 1, -9), &mut arithmetic)
                        .unwrap()
                );
            } else {
                assert_eq!(end, &BoxN::new([d(1, 1, 0)]).unwrap());
            }
        };
        let check_remainder = |term: &DyadicInterval| {
            let mut a = DyadicBudget::new(16384, 1_000_000_000);
            assert!(
                term.abs(&mut a)
                    .unwrap()
                    .subset_of(&d(0, 1, -10), &mut a)
                    .unwrap()
            );
        };
        for mode in ["fixed3", "adaptive"] {
            let run = || {
                let mut b = budget();
                if mode == "fixed3" {
                    let result = f.flow_taylor(3, &mut b).unwrap().integrate(
                        black_box(request.clone()),
                        native.clone(),
                        &mut b,
                    );
                    assert!(matches!(
                        result.status(),
                        FlowTaylorEvolutionStatus::Completed
                    ));
                    check_endpoint(result.end_enclosure().unwrap());
                    assert_eq!(result.segments().len(), 2);
                    for s in result.segments() {
                        check_remainder(
                            &s.evidence().end_terms().last().unwrap().lanes().unwrap()[0],
                        );
                    }
                    drop(black_box(result));
                } else {
                    let result = controller.integrate(black_box(request.clone()), &mut b);
                    assert!(matches!(result.status(), AdaptiveTaylorStatus::Completed));
                    check_endpoint(result.end_enclosure().unwrap());
                    assert_eq!(result.segments().len(), 2);
                    for s in result.segments() {
                        assert_eq!(s.refinement().meets_limits(), Some(true));
                        check_remainder(
                            &s.refinement()
                                .evidence()
                                .end_terms()
                                .last()
                                .unwrap()
                                .lanes()
                                .unwrap()[0],
                        );
                    }
                    drop(black_box(result));
                }
            };
            for _ in 0..16 {
                run();
            }
            let guard = CountingGuard::start();
            for _ in 0..iterations {
                run();
            }
            let stats = AllocationStats::snapshot();drop(guard);print_row(name,mode,iterations as usize,stats);
        }
        for mode in ["fixed3", "adaptive"] {
            let mut work=budget();let graph=work.remaining_graph_work();let scalar=work.remaining_scalar_work();
            let guard=CountingGuard::start();
            let retained;
            if mode=="fixed3" {
                let report=f.flow_taylor(3,&mut work).unwrap().integrate(request.clone(),native.clone(),&mut work);
                retained=AllocationStats::snapshot();drop(report);
            } else {
                let report=controller.integrate(request.clone(),&mut work);
                retained=AllocationStats::snapshot();drop(report);
            }
            let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
            println!("RESOURCE {name}/{mode} graph={} scalar={} retained={} peak={} after_drop={}",graph-work.remaining_graph_work(),scalar-work.remaining_scalar_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
        }

    }
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




