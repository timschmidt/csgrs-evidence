use std::{alloc::{GlobalAlloc, Layout, System},sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering}};
// Complete direct and Cartesian-roundtrip chart transport, with all proofs retained.
use std::hint::black_box;
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    coordinates::{CoordinateFieldTransition, CoordinateTransport},
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
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
fn change(shear: i64, origin: [i64; 2]) -> CoordinateChange {
    CoordinateChange {
        variables: vec![X, Y],
        to_source: vec![vec![1.into(), shear.into()], vec![0.into(), 1.into()]],
        from_source: vec![vec![1.into(), (-shear).into()], vec![0.into(), 1.into()]],
        origin: origin.into_iter().map(Into::into).collect(),
    }
}
struct Fixture {
    name: &'static str,
    direct: CoordinateFieldTransition<2>,
    to_physical: CoordinateFieldTransition<2>,
    from_physical: CoordinateFieldTransition<2>,
    initial: BoxN<DyadicInterval, 2>,
    expected_direct: BoxN<DyadicInterval, 2>,
    expected_roundtrip: BoxN<DyadicInterval, 2>,
}
fn fixture(
    name: &'static str,
    old: i64,
    new: i64,
    origin: [i64; 2],
    direct: [(i64, i64); 2],
    roundtrip: [(i64, i64); 2],
) -> Fixture {
    let source = ExpressionProgram::compile(
        &[Expr::int(129), Expr::int(1)],
        &[Y, T, X],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    let f = ExpressionField::<2>::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time: T,
            state: vec![X, Y],
        },
        &mut budget(),
    )
    .unwrap();
    let a = f
        .in_coordinates(change(old, [10, -3]), &mut budget())
        .unwrap();
    let b = f
        .in_coordinates(change(new, origin), &mut budget())
        .unwrap();
    let physical = f.in_coordinates(change(0, [0, 0]), &mut budget()).unwrap();
    Fixture {
        name,
        direct: a.transition_to(&b, &mut budget()).unwrap(),
        to_physical: a.transition_to(&physical, &mut budget()).unwrap(),
        from_physical: physical.transition_to(&b, &mut budget()).unwrap(),
        initial: BoxN::new([d(0, 0), d(-1, 1)]).unwrap(),
        expected_direct: BoxN::new(direct.map(|(l, u)| d(l, u))).unwrap(),
        expected_roundtrip: BoxN::new(roundtrip.map(|(l, u)| d(l, u))).unwrap(),
    }
}
fn fixtures() -> Vec<Fixture> {
    vec![
        fixture(
            "identity",
            0,
            0,
            [10, -3],
            [(0, 0), (-1, 1)],
            [(0, 0), (-1, 1)],
        ),
        fixture(
            "same_shear",
            128,
            128,
            [10, -3],
            [(0, 0), (-1, 1)],
            [(-256, 256), (-1, 1)],
        ),
        fixture(
            "changed_shear",
            128,
            64,
            [12, -2],
            [(-2, 126), (-2, 0)],
            [(-130, 254), (-2, 0)],
        ),
    ]
}
fn direct(f: &Fixture) -> CoordinateTransport<2> {
    f.direct.enclose(f.initial.clone(), &mut budget()).unwrap()
}
fn roundtrip(f: &Fixture) -> (CoordinateTransport<2>, CoordinateTransport<2>) {
    let mut work = budget();
    let first = f.to_physical.enclose(f.initial.clone(), &mut work).unwrap();
    let second = f
        .from_physical
        .enclose(first.enclosure().clone(), &mut work)
        .unwrap();
    (first, second)
}
fn check(f: &Fixture) {
    assert_eq!(direct(f).enclosure(), &f.expected_direct);
    assert_eq!(roundtrip(f).1.enclosure(), &f.expected_roundtrip);
    // Independent exact endpoint boxes derived from the affine relations above.
    assert!(
        f.expected_direct
            .subset_of(
                &f.expected_roundtrip,
                &mut hyperinterval::DyadicBudget::new(16384, 1_000_000)
            )
            .unwrap()
    );
}
fn benchmarks(c: &mut Criterion) {
    for f in fixtures() {
        check(&f);
        let mut group = c.benchmark_group(f.name);
        group.bench_function("direct", |b| {
            b.iter(|| {
                let proof = direct(black_box(&f));
                black_box(&proof);
                drop(proof);
            })
        });
        group.bench_function("roundtrip", |b| {
            b.iter(|| {
                let proof = roundtrip(black_box(&f));
                black_box(&proof);
                drop(proof);
            })
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
   print_row(f.name,"prepare",32,measure(32,||f.direct.from().transition_to(f.direct.to(),&mut budget()).unwrap()));
   retained(&format!("{}/prepare",f.name),||f.direct.from().transition_to(f.direct.to(),&mut budget()).unwrap());
   let mut prep=budget();let map=f.direct.from().transition_to(f.direct.to(),&mut prep).unwrap();
   println!("PREPARE {} graph={} scalar={} nodes={}",f.name,EnclosurePolicy::default().graph_work-prep.remaining_graph_work(),EnclosurePolicy::default().scalar_work-prep.remaining_scalar_work(),map.relation().program().definition().nodes.len());
   retained(&format!("{}/direct",f.name),||direct(&f));
   retained(&format!("{}/roundtrip",f.name),||roundtrip(&f));
   let mut work=budget();let proof=f.direct.enclose(f.initial.clone(),&mut work).unwrap();
   println!("WORK {}/direct graph={} scalar={} output={:?}",f.name,EnclosurePolicy::default().graph_work-work.remaining_graph_work(),EnclosurePolicy::default().scalar_work-work.remaining_scalar_work(),proof.enclosure());
   let mut work=budget();let a=f.to_physical.enclose(f.initial.clone(),&mut work).unwrap();let b=f.from_physical.enclose(a.enclosure().clone(),&mut work).unwrap();
   println!("WORK {}/roundtrip graph={} scalar={} output={:?}",f.name,EnclosurePolicy::default().graph_work-work.remaining_graph_work(),EnclosurePolicy::default().scalar_work-work.remaining_scalar_work(),b.enclosure());
 }
}
