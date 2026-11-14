//! Complete source-bound circuit query: preparation and reuse are separate costs.
use hypercircuit::{
    CircuitParameter, ComponentId, MnaUnknown, NetId, Real,
    residual::{CircuitResidualProgram, ResidualDisposition, ResidualInput, ResidualInputKind},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
use std::hint::black_box;
fn g() -> ExpressionBudget {
    ExpressionBudget::new(100_000, 10_000_000)
}
fn a() -> DyadicBudget {
    DyadicBudget::new(4096, 100_000_000)
}
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn main() {
    let iterations: u32 = std::env::var("CIRCUIT_RESIDUAL_ITERATIONS")
        .map(|v| v.parse().unwrap())
        .unwrap_or(2_000);
    assert!(iterations > 0);
    let v = Expr::anonymous_symbol(SymbolId(9));
    let r = Expr::anonymous_symbol(SymbolId(2));
    let source = ExpressionProgram::compile(
        &[v / r - Expr::int(1)],
        &[SymbolId(9), SymbolId(2)],
        &mut g(),
    )
    .unwrap();
    let inputs = vec![
        ResidualInput {
            symbol: SymbolId(9),
            kind: ResidualInputKind::Unknown(MnaUnknown::NetVoltage(NetId::new("v").unwrap())),
        },
        ResidualInput {
            symbol: SymbolId(2),
            kind: ResidualInputKind::Parameter {
                component: ComponentId::new("R1").unwrap(),
                parameter: CircuitParameter {
                    name: "resistance".into(),
                    value: Real::one(),
                    unit: "ohm".into(),
                    source: "supplier tolerance".into(),
                },
            },
        },
    ];
    let equations = vec!["R1 KCL (A)".to_owned()];
    let prepare = || {
        CircuitResidualProgram::new(source.clone(), inputs.clone(), equations.clone(), &mut g())
            .unwrap()
    };
    let program = prepare();
    let arguments = [d(3, 4, 0), d(1, 2, 0)];
    let expected = program
        .enclose(&arguments, -16, &mut g(), &mut a())
        .unwrap();
    assert_eq!(expected.residuals(), &[d(1, 6, -1)]);
    assert_eq!(
        expected.disposition(),
        ResidualDisposition::Excluded { equation: 0 }
    );
    assert_eq!(
        expected
            .evidence()
            .matrix::<1, 2>(&mut g(), &mut a())
            .unwrap()
            .intervals()
            .rows(),
        Some(&[[d(1, 8, -2), d(-16, -3, -2)]])
    );
    for candidate in [prepare(), program.clone()] {
        let report = candidate
            .enclose(&arguments, -16, &mut g(), &mut a())
            .unwrap();
        assert_eq!(report.evidence().values(), expected.evidence().values());
        assert_eq!(
            report.circuit().source().definition(),
            expected.circuit().source().definition()
        );
        assert_eq!(report.circuit().inputs(), expected.circuit().inputs());
        assert_eq!(report.circuit().equations(), expected.circuit().equations());
        assert_eq!(report.evidence().arguments(), &arguments);
        assert_eq!(report.disposition(), expected.disposition());
    }
    for mode in ["prepare", "reuse", "prepare_and_query"] {
        for _ in 0..16 {
            drop(
                prepare()
                    .enclose(&arguments, -16, &mut g(), &mut a())
                    .unwrap(),
            );
        }
        let guard = CountingGuard::start();
        for _ in 0..iterations {
            if mode == "prepare" {
                drop(black_box(prepare()));
            } else {
                let prepared;
                let selected = if mode == "reuse" {
                    &program
                } else {
                    prepared = prepare();
                    &prepared
                };
                let result = selected
                    .enclose(black_box(&arguments), -16, &mut g(), &mut a())
                    .unwrap();
                // Completed range, proof and retained circuit metadata are materialized.
                assert_eq!(result.evidence().values(), expected.evidence().values());
                assert_eq!(result.disposition(), expected.disposition());
                drop(black_box(result));
            }
        }
        let stats = AllocationStats::snapshot();
        drop(guard);
        print_row("circuit", mode, iterations as usize, stats);
    }
    let mut graph=g(); let mut native=a();
    let gb=graph.remaining_work(); let ab=native.remaining_work();
    let guard=CountingGuard::start();
    let report=program.enclose(&arguments,-16,&mut graph,&mut native).unwrap();
    let retained=AllocationStats::snapshot();
    drop(report);
    let after=AllocationStats::snapshot();drop(guard);
    assert_eq!(after.live_bytes,0);
    println!("RESOURCE query graph={} native={} retained={} peak={} after_drop={}",gb-graph.remaining_work(),ab-native.remaining_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
    let guard=CountingGuard::start();let prepared=prepare();let retained=AllocationStats::snapshot();drop(prepared);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
    println!("RESOURCE prepare retained={} peak={} after_drop={}",retained.live_bytes,retained.peak_live_bytes,after.live_bytes);

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




