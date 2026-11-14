//! Completed polynomial-map proofs from an existing seed versus fresh differentiation.
//! Both paths retain exact coefficients and certify the same function/domain/order.
//! Polynomial cases have identical ranges. The nonlinear case has an explicit
//! common width limit; its distinct certified widths are printed, not hidden.
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperreal::{Rational, Real};
use hypersolve::{
    Expr, SymbolId,
    expression_program::{
        ExpressionBudget, ExpressionProgram, TaylorModel, TaylorPolynomialModel, TaylorRequest,
    },
};
use std::{hint::black_box, sync::Arc};
fn graph() -> ExpressionBudget {
    ExpressionBudget::new(1_000_000, 100_000_000)
}
fn arithmetic() -> DyadicBudget {
    DyadicBudget::new(16384, 1_000_000_000_000)
}
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
struct Case {
    name: &'static str,
    seed: Arc<TaylorModel>,
    map: ExpressionProgram,
    native: ExpressionProgram,
    request: TaylorRequest,
    coefficients: [Real; 3],
    extrema: [Rational; 2],
    exact_range: Option<DyadicInterval>,
}
fn cases() -> Vec<Case> {
    let x = Expr::anonymous_symbol(SymbolId(7));
    let u = Expr::anonymous_symbol(SymbolId(9));
    let root = Real::from(2).sqrt().unwrap();
    let f = Expr::int(1) / (Expr::int(1) - x.clone());
    let definitions = [
        (
            "centered_logistic",
            x.clone(),
            u.clone() * (Expr::int(1) - u.clone()),
            x.clone() * (Expr::int(1) - x.clone()),
            d(1, 1, -1),
            d(0, 1, 0),
            [
                Real::from(Rational::from(1) / Rational::from(4)),
                Real::zero(),
                Real::from(-1),
            ],
            [Rational::from(0), Rational::from(1) / Rational::from(4)],
            Some(d(0, 1, -2)),
        ),
        (
            "algebraic_product",
            x.clone() + Expr::real(root.clone()),
            u.clone() * (u.clone() - Expr::real(Real::from(2) * root)),
            x.clone() * x.clone() - Expr::int(2),
            d(0, 0, 0),
            d(-1, 1, 0),
            [Real::from(-2), Real::zero(), Real::one()],
            [Rational::from(-2), Rational::from(-1)],
            Some(d(-2, -1, 0)),
        ),
        (
            "reciprocal_square",
            f.clone(),
            u.clone() * u,
            f.clone() * f,
            d(0, 0, 0),
            d(-1, 1, -4),
            [Real::one(), Real::from(2), Real::from(3)],
            [
                Rational::from(256) / Rational::from(289),
                Rational::from(256) / Rational::from(225),
            ],
            None,
        ),
    ];
    definitions
        .into_iter()
        .map(
            |(name, seed, map, native, center, domain, coefficients, extrema, exact_range)| {
                let request = TaylorRequest {
                    center: vec![center],
                    domain: vec![domain],
                    order: 2,
                    precision: -64,
                };
                let seed =
                    ExpressionProgram::compile(&[seed], &[SymbolId(7)], &mut graph()).unwrap();
                let seed = Arc::new(
                    seed.taylor_model(request.clone(), &mut graph(), &mut arithmetic())
                        .unwrap(),
                );
                Case {
                    name,
                    seed,
                    map: ExpressionProgram::compile(&[map], &[SymbolId(9)], &mut graph()).unwrap(),
                    native: ExpressionProgram::compile(&[native], &[SymbolId(7)], &mut graph())
                        .unwrap(),
                    request,
                    coefficients,
                    extrema,
                    exact_range,
                }
            },
        )
        .collect()
}
fn validate(case: &Case) {
    let reused = TaylorPolynomialModel::new(
        case.seed.clone(),
        case.map.clone(),
        &mut graph(),
        &mut arithmetic(),
    )
    .unwrap();
    let rebuilt = case
        .native
        .taylor_model(case.request.clone(), &mut graph(), &mut arithmetic())
        .unwrap();
    for (degree, expected) in case.coefficients.iter().enumerate() {
        let powers = if degree == 0 {
            vec![]
        } else {
            vec![(SymbolId(7), degree)]
        };
        assert_eq!(reused.terms(0).unwrap().get(&powers), Some(expected));
        let term = rebuilt
            .terms()
            .iter()
            .find(|t| rebuilt.coefficient_program().requests()[t.request_index()].powers == powers)
            .unwrap();
        assert_eq!(term.coefficient(), expected);
    }
    for bounds in [reused.range(), rebuilt.image()] {
        assert_eq!(bounds.len(), 1);
        let exact = bounds[0].to_rational(&mut arithmetic()).unwrap();
        for endpoint in &case.extrema {
            assert!(exact.contains_point(endpoint));
        }
        if let Some(expected) = &case.exact_range {
            assert_eq!(&bounds[0], expected);
        } else {
            assert!(
                exact.upper().unwrap() - exact.lower().unwrap()
                    <= Rational::from(1) / Rational::from(2)
            );
        }
    }
    eprintln!(
        "COMPLETED {} reused={:?} rebuilt={:?}",
        case.name,
        reused.range(),
        rebuilt.image()
    );
}
fn benchmarks(c: &mut Criterion) {
    for case in cases() {
        validate(&case);
        let mut group = c.benchmark_group(format!("taylor_polynomial/{}", case.name));
        group.bench_function("reuse", |b| {
            b.iter(|| {
                drop(black_box(
                    TaylorPolynomialModel::new(
                        black_box(case.seed.clone()),
                        black_box(case.map.clone()),
                        &mut graph(),
                        &mut arithmetic(),
                    )
                    .unwrap(),
                ))
            })
        });
        group.bench_function("redifferentiate", |b| {
            b.iter(|| {
                drop(black_box(
                    black_box(&case.native)
                        .taylor_model(
                            black_box(case.request.clone()),
                            &mut graph(),
                            &mut arithmetic(),
                        )
                        .unwrap(),
                ))
            })
        });
        group.finish();
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




struct Criterion;
struct Group { name:String }
struct Bencher { name:String, operation:String }
impl Criterion { fn benchmark_group(&mut self,name:String)->Group {Group{name}} }
impl Group {
 fn bench_function(&mut self,operation:&str,run:impl FnOnce(&mut Bencher)) {run(&mut Bencher{name:self.name.clone(),operation:operation.to_owned()});}
 fn finish(self) {}
}
impl Bencher {fn iter(&mut self,mut f:impl FnMut()) {print_row(&self.name,&self.operation,32,measure(32,&mut f));}}
fn retained<T>(name: &str, operation: &str, mut construct: impl FnMut(&mut ExpressionBudget, &mut DyadicBudget) -> T) {
    // Warm the retained source's scalar caches before attributing incremental
    // ownership to the new output. Cold cache growth is a separate observation.
    for _ in 0..8 { drop(black_box(construct(&mut graph(), &mut arithmetic()))); }
    let mut g = graph(); let mut a = arithmetic();
    let graph_before=g.remaining_work(); let arithmetic_before=a.remaining_work();
    let guard=CountingGuard::start();
    let value=construct(&mut g,&mut a);
    let retained=AllocationStats::snapshot();
    drop(value);
    let after=AllocationStats::snapshot();
    drop(guard);
    assert_eq!(after.live_bytes,0);
    println!("RESOURCE {name}/{operation} graph={} arithmetic={} retained={} peak={} after_drop={}",graph_before-g.remaining_work(),arithmetic_before-a.remaining_work(),retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
}


fn main(){
 benchmarks(&mut Criterion);
 for case in cases(){
  validate(&case);
  retained(case.name,"reuse",|g,a|TaylorPolynomialModel::new(case.seed.clone(),case.map.clone(),g,a).unwrap());
  retained(case.name,"redifferentiate",|g,a|case.native.taylor_model(case.request.clone(),g,a).unwrap());
 }
}
