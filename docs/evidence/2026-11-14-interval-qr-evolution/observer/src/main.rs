//! Complete fixed-chart and automatic QR flows, including preparation and source projections.
use criterion::{Criterion, black_box};
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    coordinates::{
        CoordinateField,
        qr_evolution::{QrEvolution, QrEvolutionOptions, QrEvolutionStatus},
    },
    evolution::{EvolutionOptions, EvolutionRequest},
    taylor_flow::evolution::{FlowTaylorEvolution, FlowTaylorEvolutionStatus},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hyperreal::{Rational, Real};
use hypersolve::{
    Expr, SymbolId,
    expression_program::{CoordinateChange, ExpressionBudget, ExpressionProgram},
};
#[path = "flow_oracles.rs"]
mod flow_oracles;
const X: SymbolId = SymbolId(0);
const Y: SymbolId = SymbolId(1);
const T: SymbolId = SymbolId(2);
fn d(a: i64, b: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(a.into(), b.into(), e).unwrap()
}
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn arithmetic() -> DyadicBudget {
    DyadicBudget::new(16384, 1_000_000_000_000)
}
struct Fixture {
    name: &'static str,
    chart: CoordinateField<2>,
    request: EvolutionRequest<2>,
    options: QrEvolutionOptions,
    expected: [(Rational, Rational); 2],
    width_limit: Rational,
}
fn fixture(
    name: &'static str,
    outputs: Vec<Expr>,
    initial: [DyadicInterval; 2],
    expected: [(Rational, Rational); 2],
    width_limit: Rational,
) -> Fixture {
    let source = ExpressionProgram::compile(
        &outputs,
        &[Y, T, X],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    let field = ExpressionField::<2>::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time: T,
            state: vec![X, Y],
        },
        &mut budget(),
    )
    .unwrap();
    let a = vec![
        vec![Real::one(), Real::zero()],
        vec![Real::zero(), Real::one()],
    ];
    let chart = field
        .in_coordinates(
            CoordinateChange {
                variables: vec![X, Y],
                to_source: a.clone(),
                from_source: a,
                origin: vec![Real::zero(); 2],
            },
            &mut budget(),
        )
        .unwrap();
    Fixture {
        name,
        chart,
        request: EvolutionRequest {
            start: d(0, 0, 0),
            end: d(3, 3, -1),
            initial: BoxN::new(initial).unwrap(),
        },
        options: QrEvolutionOptions {
            window: d(3, 3, -2),
            maximum_windows: 2,
            taylor_order: Some(3),
            native: EvolutionOptions {
                maximum_step: Some(d(1, 1, -4)),
                ..Default::default()
            },
        },
        expected,
        width_limit,
    }
}
fn fixtures() -> Vec<Fixture> {
    let p = |a: i64, b: i64| (Rational::from(a), Rational::from(b));
    let t = Rational::from(3) / Rational::from(2);
    let cos = flow_oracles::alternating_trig(&t, false);
    let sin = flow_oracles::alternating_trig(&t, true);
    assert!(cos.0.is_positive() && sin.0.is_positive());
    let mut result = vec![
        fixture(
            "constant",
            vec![Expr::int(2), Expr::int(1)],
            [d(-1, 1, 0), d(0, 0, 0)],
            [
                p(2, 4),
                (
                    Rational::from(3) / Rational::from(2),
                    Rational::from(3) / Rational::from(2),
                ),
            ],
            Rational::from(3),
        ),
        // For initial x in [-1,1], y=0, exact solution is (x*cos(t),x*sin(t)).
        // Independent exact alternating-series outer bounds cover both extremal
        // source points and therefore the complete line-segment input image.
        fixture(
            "rotation_uncertainty",
            vec![-Expr::anonymous_symbol(Y), Expr::anonymous_symbol(X)],
            [d(-1, 1, 0), d(0, 0, 0)],
            [(-&cos.1, cos.1), (-&sin.1, sin.1)],
            Rational::from(10),
        ),
    ];
    let q = |n: i64| Expr::real(Real::from(Rational::from(n) / Rational::from(25)));
    let x = Expr::anonymous_symbol(X);
    let y = Expr::anonymous_symbol(Y);
    // Zero is the exact equilibrium. The tilted Jacobian has a larger infinity
    // norm in the original frame; selected QR frames certify longer Picard steps.
    let mut tilted = fixture(
        "tilted_equilibrium",
        vec![q(7) * x.clone() + q(24) * y.clone(), q(24) * x + q(-7) * y],
        [d(0, 0, 0), d(0, 0, 0)],
        [p(0, 0), p(0, 0)],
        Rational::from(1) / Rational::from(1_i64 << 48),
    );
    tilted.request.end = d(7, 7, -2);
    tilted.options.window = d(7, 7, -3);
    tilted.options.native.maximum_step = Some(d(7, 7, -3));
    result.push(tilted);
    result
}
struct FixedRun {
    native: FlowTaylorEvolution<2>,
    initial: BoxN<DyadicInterval, 2>,
    source: Vec<(BoxN<DyadicInterval, 2>, BoxN<DyadicInterval, 2>)>,
}
fn fixed(f: &Fixture) -> FixedRun {
    let mut b = budget();
    let initial = f
        .chart
        .source_enclosure(&f.request.initial, &mut b)
        .unwrap();
    let p = f.chart.transformed_field().flow_taylor(3, &mut b).unwrap();
    let native = p.integrate(f.request.clone(), f.options.native.clone(), &mut b);
    assert!(
        matches!(native.status(), FlowTaylorEvolutionStatus::Completed),
        "{:?}",
        native.status()
    );
    let source = native
        .segments()
        .map(|s| {
            (
                f.chart.source_enclosure(s.tube(), &mut b).unwrap(),
                f.chart.source_enclosure(s.end_enclosure(), &mut b).unwrap(),
            )
        })
        .collect();
    FixedRun {
        native,
        initial,
        source,
    }
}
fn selected(f: &Fixture) -> QrEvolution<2> {
    let r = f
        .chart
        .integrate_qr(f.request.clone(), f.options.clone(), &mut budget());
    assert!(
        matches!(r.status(), QrEvolutionStatus::Completed),
        "{:?}",
        r.status()
    );
    r
}
fn check(f: &Fixture, end: &BoxN<DyadicInterval, 2>) -> Vec<Rational> {
    end.lanes()
        .unwrap()
        .iter()
        .zip(&f.expected)
        .map(|(x, (lo, hi))| {
            let q = x.to_rational(&mut arithmetic()).unwrap();
            assert!(q.contains_point(lo));
            assert!(q.contains_point(hi));
            let width = q.width().unwrap();
            assert!(width < f.width_limit);
            width
        })
        .collect()
}
fn main() {
    let mut c=Criterion::default();
    for f in fixtures() {
        let a = fixed(&f);
        let b = selected(&f);
        assert_eq!(a.native.reached_time(), &f.request.end);
        assert_eq!(b.reached_time(), &f.request.end);
        assert_eq!(a.initial, f.request.initial);
        assert_eq!(b.windows().len(), 2);
        let aw = check(&f, &a.source.last().unwrap().1);
        let bw = check(&f, b.source_end_enclosure().unwrap());
        eprintln!(
            "COMPLETED {} fixed_widths={:?} qr_widths={:?}",
            f.name,
            aw.iter()
                .map(Rational::to_f64_enclosure)
                .collect::<Vec<_>>(),
            bw.iter()
                .map(Rational::to_f64_enclosure)
                .collect::<Vec<_>>()
        );
        if std::env::var_os("QR_EVOLUTION_ALLOC").is_some() {
            for mode in ["fixed","qr"] {
                for _ in 0..4 { if mode=="fixed" {drop(black_box(fixed(&f)));} else {drop(black_box(selected(&f)));} }
                let guard=CountingGuard::start();
                for _ in 0..16 {
                    if mode=="fixed" { let r=fixed(&f); check(&f,&r.source.last().unwrap().1);drop(black_box(r)); }
                    else {let r=selected(&f);check(&f,r.source_end_enclosure().unwrap());drop(black_box(r));}
                }
                let stats=AllocationStats::snapshot();drop(guard);print_row(f.name,mode,16,stats);
                let guard=CountingGuard::start();
                let held=if mode=="fixed" {
                    let r=fixed(&f);let held=AllocationStats::snapshot();drop(black_box(r));held
                } else {
                    let r=selected(&f);let held=AllocationStats::snapshot();drop(black_box(r));held
                };
                let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
                println!("RETAINED {} {mode} bytes={} peak={} after_drop={}",f.name,held.live_bytes,held.peak_live_bytes,after.live_bytes);
            }
            let mut work=budget();let proof=f.chart.integrate_qr(f.request.clone(),f.options.clone(),&mut work);
            assert!(matches!(proof.status(),QrEvolutionStatus::Completed));
            println!("WORK {} graph={} scalar={} choices={:?}",f.name,work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work(),proof.windows().iter().map(|w|w.comparison().unwrap().choice()).collect::<Vec<_>>());
            continue;
        }
        if let Ok(iterations) = std::env::var("QR_EVOLUTION_ITERATIONS") {
            let iterations: usize = iterations.parse().unwrap();
            for mode in ["fixed", "qr"] {
                for _ in 0..4 {
                    if mode == "fixed" {
                        drop(black_box(fixed(&f)));
                    } else {
                        drop(black_box(selected(&f)));
                    }
                }
                let start = std::time::Instant::now();
                for _ in 0..iterations {
                    if mode == "fixed" {
                        let r = fixed(&f);
                        check(&f, &r.source.last().unwrap().1);
                        drop(black_box(r));
                    } else {
                        let r = selected(&f);
                        check(&f, r.source_end_enclosure().unwrap());
                        drop(black_box(r));
                    }
                }
                println!(
                    "TIME {} {mode} iterations={iterations} ns_per_operation={}",
                    f.name,
                    start.elapsed().as_nanos() / iterations as u128
                );
            }
        } else {
            let mut g = c.benchmark_group(f.name);
            g.bench_function("fixed", |b| {
                b.iter(|| {
                    let r = fixed(black_box(&f));
                    check(&f, &r.source.last().unwrap().1);
                    drop(black_box(r));
                })
            });
            g.bench_function("qr", |b| {
                b.iter(|| {
                    let r = selected(black_box(&f));
                    check(&f, r.source_end_enclosure().unwrap());
                    drop(black_box(r));
                })
            });
            g.finish();
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




