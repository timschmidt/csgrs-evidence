use std::{alloc::{GlobalAlloc, Layout, System},sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering}};
// Complete source flows with independently checked endpoint quality.
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionReport, EvolutionRequest, EvolutionStatus},
    reachability::{
        ReachabilityPolicy, ReachabilityReport, ReachabilityRequest, ReachabilityStatus,
    },
    taylor_flow::{
        FlowTaylorProgram,
        evolution::{FlowTaylorEvolution, FlowTaylorEvolutionStatus},
    },
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperlattice_interval::BoxN;
use hyperreal::Rational;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
use std::hint::black_box;
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy {
        scalar_bits: 1_048_576,
        scalar_work: 100_000_000_000_000,
        ..EnclosurePolicy::default()
    })
}
struct Fixture {
    name: &'static str,
    field: ExpressionField<1>,
    program: FlowTaylorProgram<1>,
    initial: i64,
    native_exponent: i32,
}
fn fixtures() -> Vec<Fixture> {
    let x = SymbolId(1);
    let t = SymbolId(0);
    [
        ("exponential", Expr::anonymous_symbol(x), 1, -12),
        ("constant", Expr::int(2), 0, -2),
    ]
    .into_iter()
    .map(|(name, expr, initial, native_exponent)| {
        let source = ExpressionProgram::compile(
            &[expr],
            &[x, t],
            &mut ExpressionBudget::new(1_000_000, 100_000_000),
        )
        .unwrap();
        let field = ExpressionField::from_definition(
            FieldDefinition {
                source: source.definition().clone(),
                time: t,
                state: vec![x],
            },
            &mut budget(),
        )
        .unwrap();
        let program = prepare(&field);
        Fixture {
            name,
            field,
            program,
            initial,
            native_exponent,
        }
    })
    .collect()
}
fn prepare(field: &ExpressionField<1>) -> FlowTaylorProgram<1> {
    field.flow_taylor(3, &mut budget()).unwrap()
}
fn request(f: &Fixture) -> EvolutionRequest<1> {
    EvolutionRequest {
        start: d(0, 0, 0),
        end: d(1, 1, -1),
        initial: BoxN::new([d(f.initial, f.initial, 0)]).unwrap(),
    }
}
fn options(exponent: i32) -> EvolutionOptions {
    EvolutionOptions {
        maximum_step: Some(d(1, 1, exponent)),
        maximum_steps: 16384,
        ..Default::default()
    }
}
fn native(f: &Fixture, work: &mut EnclosureBudget) -> EvolutionReport<1> {
    let r = f
        .field
        .integrate(request(f), options(f.native_exponent), work);
    assert!(
        matches!(r.status(), EvolutionStatus::Completed),
        "{:?}",
        r.status()
    );
    r
}
fn taylor(f: &Fixture, work: &mut EnclosureBudget) -> FlowTaylorEvolution<1> {
    let r = f.program.integrate(request(f), options(-2), work);
    assert!(
        matches!(r.status(), FlowTaylorEvolutionStatus::Completed),
        "{:?}",
        r.status()
    );
    r
}
fn validate(f: &Fixture, end: &BoxN<DyadicInterval, 1>) {
    let mut b = DyadicBudget::new(1_048_576, 100_000_000_000_000);
    let value = end.lanes().unwrap()[0].to_rational(&mut b).unwrap();
    if f.name == "constant" {
        assert_eq!(end, &BoxN::new([d(1, 1, 0)]).unwrap());
    } else {
        let mut term = Rational::from(1);
        let mut lower = term.clone();
        for k in 1..=10 {
            term = term / Rational::from(2 * k);
            lower = lower + &term;
        }
        let upper = &lower
            + (&term / Rational::from(22))
                / (Rational::from(1) - Rational::from(1) / Rational::from(24));
        assert!(value.contains_point(&lower));
        assert!(value.contains_point(&upper));
        let width = value.upper().unwrap() - value.lower().unwrap();
        assert!(
            width <= Rational::from(1) / Rational::from(512),
            "{} width={width:?}",
            f.name
        );
    }
    eprintln!("COMPLETED {} end={end:?}", f.name);
}
// Existing checked regridding plus displacement proposals, including the
// complete single-cell epsilon-cover certificate and every native prefix.
fn reachability(f: &Fixture, work: &mut EnclosureBudget) -> ReachabilityReport<1> {
    let r = f.field.reach(
        ReachabilityRequest {
            evolution: request(f),
            epsilon: if f.name == "constant" {
                d(0, 0, 0)
            } else {
                d(1, 1, -9)
            },
        },
        ReachabilityPolicy {
            // The retained cap probe rejects -10 and admits -11 at width 1/512.
            // Constant flow keeps the same 1/4 cap in every strategy.
            evolution: options(if f.name == "constant" {
                f.native_exponent
            } else {
                -11
            }),
            maximum_cells: 1,
            maximum_evolutions: 1,
            maximum_depth: 0,
            maximum_time_refinements: 0,
        },
        work,
    );
    assert!(
        matches!(r.status(), ReachabilityStatus::Completed),
        "{:?}",
        r.status()
    );
    r
}
fn benchmarks(c: &mut Criterion) {
    for f in fixtures() {
        let a = native(&f, &mut budget());
        let b = taylor(&f, &mut budget());
        validate(&f, a.end_enclosure().unwrap());
        validate(&f, b.end_enclosure().unwrap());
        assert_eq!(a.reached_time(), &request(&f).end);
        assert_eq!(b.reached_time(), &request(&f).end);
        eprintln!(
            "SEGMENTS {} native={} taylor={}",
            f.name,
            a.segments().len(),
            b.segments().len()
        );
        let cover = reachability(&f, &mut budget());
        let end = cover.end_cover().unwrap();
        assert_eq!(end.boxes().len(), 1);
        assert_eq!(end.end_time(), &request(&f).end);
        validate(&f, end.boxes().next().unwrap());
        assert_eq!(cover.cells().len(), 1);
        assert_eq!(cover.attempts().len(), 1);
        assert_eq!(
            cover.attempts()[0].evolution().steps().len(),
            if f.name == "constant" { 2 } else { 1024 }
        );
        drop((a, b, cover));
        let mut group = c.benchmark_group(f.name);
        group.bench_function("picard", |b| {
            b.iter(|| drop(black_box(native(black_box(&f), &mut budget()))))
        });
        group.bench_function("taylor", |b| {
            b.iter(|| drop(black_box(taylor(black_box(&f), &mut budget()))))
        });
        group.bench_function("prepare_taylor3", |b| {
            b.iter(|| drop(black_box(prepare(black_box(&f.field)))))
        });
        group.bench_function("reachability", |b| {
            b.iter(|| drop(black_box(reachability(black_box(&f), &mut budget()))))
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
   retained(&format!("{}/picard",f.name),||native(&f,&mut budget()));
   retained(&format!("{}/taylor",f.name),||taylor(&f,&mut budget()));
   retained(&format!("{}/prepare_taylor3",f.name),||prepare(&f.field));
   retained(&format!("{}/reachability",f.name),||reachability(&f,&mut budget()));
   let mut work=budget();let prepared=f.field.flow_taylor(3,&mut work).unwrap();
   println!("PREPARE {} graph={} scalar={} stages={}",f.name,work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work(),prepared.stages().len());
   let mut work=budget();let a=native(&f,&mut work);
   println!("WORK {}/picard graph={} scalar={} segments={} attempts={}",f.name,work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work(),a.segments().len(),a.attempts().len());
   let mut work=budget();let a=taylor(&f,&mut work);
   println!("WORK {}/taylor graph={} scalar={} segments={} searches={} picard_attempts={}",f.name,work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work(),a.segments().len(),a.attempts().len(),a.attempts().iter().map(|a|a.search().attempts().len()).sum::<usize>());
 
   let mut work=budget();let a=reachability(&f,&mut work);
   println!("WORK {}/reachability graph={} scalar={} cells={} evolutions={} prefixes={} picard_attempts={} boxes={}",f.name,work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work(),a.cells().len(),a.attempts().len(),a.attempts().iter().map(|a|a.evolution().steps().len()).sum::<usize>(),a.attempts().iter().flat_map(|a|a.evolution().steps()).map(|s|s.native().attempts().len()).sum::<usize>(),a.end_cover().unwrap().boxes().len());
 }
}
