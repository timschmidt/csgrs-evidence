use std::{alloc::{GlobalAlloc, Layout, System},sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering}};
// Completed source-coordinate flow proofs in identity and exact QR frames.
use std::hint::black_box;
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    coordinates::{
        CoordinateEvolution, CoordinateEvolutionStatus, CoordinateField, QrCoordinateField,
    },
    evolution::{EvolutionOptions, EvolutionRequest},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hyperreal::Real;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{CoordinateChange, ExpressionBudget, ExpressionProgram},
};
const X: SymbolId = SymbolId(0);
const Y: SymbolId = SymbolId(1);
const T: SymbolId = SymbolId(2);
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn d(l: i64, u: i64) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), 0).unwrap()
}
fn basis() -> Vec<Vec<Real>> {
    vec![vec![3.into(), (-4).into()], vec![4.into(), 3.into()]]
}
fn ratio(n: i64, d: i64) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
struct Fixture {
    name: &'static str,
    source: ExpressionField<2>,
    identity: CoordinateField<2>,
    qr: QrCoordinateField<2>,
    horizon: DyadicInterval,
    expected: BoxN<DyadicInterval, 2>,
    segments: [usize; 2],
}
fn fixture(
    name: &'static str,
    outputs: Vec<Expr>,
    horizon: DyadicInterval,
    expected: [i64; 2],
    segments: [usize; 2],
) -> Fixture {
    let p = ExpressionProgram::compile(
        &outputs,
        &[Y, T, X],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    let source = ExpressionField::<2>::from_definition(
        FieldDefinition {
            source: p.definition().clone(),
            time: T,
            state: vec![X, Y],
        },
        &mut budget(),
    )
    .unwrap();
    let identity = source
        .in_coordinates(
            CoordinateChange {
                variables: vec![X, Y],
                to_source: vec![vec![1.into(), 0.into()], vec![0.into(), 1.into()]],
                from_source: vec![vec![1.into(), 0.into()], vec![0.into(), 1.into()]],
                origin: vec![0.into(), 0.into()],
            },
            &mut budget(),
        )
        .unwrap();
    let qr = prepare(&source);
    Fixture {
        name,
        source,
        identity,
        qr,
        horizon,
        expected: BoxN::new(expected.map(|x| d(x, x))).unwrap(),
        segments,
    }
}
fn fixtures() -> Vec<Fixture> {
    let x = Expr::anonymous_symbol(X);
    let y = Expr::anonymous_symbol(Y);
    vec![
        fixture(
            "rotated_equilibrium",
            vec![
                Expr::real(ratio(-7, 25)) * x.clone() + Expr::real(ratio(24, 25)) * y.clone(),
                Expr::real(ratio(24, 25)) * x + Expr::real(ratio(7, 25)) * y,
            ],
            DyadicInterval::point(7.into(), -3).unwrap(),
            [0, 0],
            [2, 1],
        ),
        fixture(
            "constant_flow",
            vec![Expr::int(2), Expr::int(1)],
            d(1, 1),
            [2, 1],
            [1, 1],
        ),
    ]
}
fn prepare(source: &ExpressionField<2>) -> QrCoordinateField<2> {
    source
        .in_qr_coordinates(basis(), vec![0.into(), 0.into()], &mut budget())
        .unwrap()
}
fn run(chart: &CoordinateField<2>, horizon: &DyadicInterval) -> CoordinateEvolution<2> {
    let report = chart.integrate(
        EvolutionRequest {
            start: d(0, 0),
            end: horizon.clone(),
            initial: BoxN::new([d(0, 0), d(0, 0)]).unwrap(),
        },
        EvolutionOptions::default(),
        &mut budget(),
    );
    assert!(
        matches!(report.status(), CoordinateEvolutionStatus::Completed),
        "{:?}",
        report.status()
    );
    report
}
fn check(f: &Fixture) {
    for (chart, count) in [(&f.identity, f.segments[0]), (f.qr.chart(), f.segments[1])] {
        let report = run(chart, &f.horizon);
        assert_eq!(report.native().reached_time(), &f.horizon);
        assert_eq!(report.segments().len(), count);
        let output = report.source_end_enclosure().unwrap();
        let mut arithmetic = DyadicBudget::new(16384, 1_000_000_000);
        // Independent exact source flows: equilibrium at zero, or (2t,t).
        assert!(f.expected.subset_of(output, &mut arithmetic).unwrap());
        for width in output.widths(&mut arithmetic).unwrap().unwrap() {
            assert!(
                width
                    .compare_singleton(
                        &DyadicInterval::point(1.into(), -48).unwrap(),
                        &mut arithmetic
                    )
                    .unwrap()
                    != std::cmp::Ordering::Greater
            );
        }
        eprintln!(
            "COMPLETED {} segments={} attempts={} output={:?}",
            f.name,
            count,
            report.native().attempts().len(),
            output
        );
    }
}
fn benchmarks(c: &mut Criterion) {
    for f in fixtures() {
        check(&f);
        let mut group = c.benchmark_group(f.name);
        group.bench_function("identity", |b| {
            b.iter(|| {
                drop(black_box(run(
                    black_box(&f.identity),
                    black_box(&f.horizon),
                )))
            })
        });
        group.bench_function("qr", |b| {
            b.iter(|| {
                drop(black_box(run(
                    black_box(f.qr.chart()),
                    black_box(&f.horizon),
                )))
            })
        });
        group.bench_function("prepare_qr", |b| {
            b.iter(|| drop(black_box(prepare(black_box(&f.source)))))
        });
        group.finish();
    }
}
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
impl Criterion {
 fn benchmark_group(&mut self,name:impl Into<String>)->Group {Group{name:name.into()}}
 fn bench_function(&mut self,name:&str,run:impl FnOnce(&mut Bencher)) {run(&mut Bencher{name:name.into(),operation:"prepare".into()});}
}
impl Group {
 fn bench_function(&mut self,operation:&str,run:impl FnOnce(&mut Bencher)) {run(&mut Bencher{name:self.name.clone(),operation:operation.into()});}
 fn finish(self) {}
}
impl Bencher { fn iter(&mut self,mut f:impl FnMut()) {print_row(&self.name,&self.operation,32,measure(32,&mut f));} }
fn retained<T>(name:&str, mut construct:impl FnMut()->T) {
    for _ in 0..8 {drop(black_box(construct()));}
    let guard=CountingGuard::start();let value=construct();
    let live=AllocationStats::snapshot();drop(value);let after=AllocationStats::snapshot();drop(guard);
    assert_eq!(after.live_bytes,0);
    println!("RETAINED {name} bytes={} peak={} after_drop={}",live.live_bytes,live.peak_live_bytes,after.live_bytes);
}
fn main() {
 benchmarks(&mut Criterion);
 for f in fixtures() {
   retained(&format!("{}/identity",f.name),||run(&f.identity,&f.horizon));
   retained(&format!("{}/qr",f.name),||run(f.qr.chart(),&f.horizon));
   retained(&format!("{}/prepare_qr",f.name),||prepare(&f.source));
   let mut work=budget();let prepared=f.source.in_qr_coordinates(basis(),vec![0.into(),0.into()],&mut work).unwrap();
   println!("PREPARE {} graph={} scalar={} nodes={}",f.name,EnclosurePolicy::default().graph_work-work.remaining_graph_work(),EnclosurePolicy::default().scalar_work-work.remaining_scalar_work(),prepared.factorization().coordinates().program().definition().nodes.len());
   for (label,chart) in [("identity",&f.identity),("qr",f.qr.chart())] {
     let mut work=budget();let report=chart.integrate(EvolutionRequest{start:d(0,0),end:f.horizon.clone(),initial:BoxN::new([d(0,0),d(0,0)]).unwrap()},EvolutionOptions::default(),&mut work);
     assert!(matches!(report.status(),CoordinateEvolutionStatus::Completed));
     println!("WORK {}/{} graph={} scalar={} segments={} attempts={}",f.name,label,EnclosurePolicy::default().graph_work-work.remaining_graph_work(),EnclosurePolicy::default().scalar_work-work.remaining_scalar_work(),report.segments().len(),report.native().attempts().len());
   }
 }
}
