use std::alloc::{GlobalAlloc,Layout,System};
use std::sync::atomic::{AtomicBool,AtomicIsize,AtomicUsize,Ordering};
use std::hint::black_box;
use std::time::Instant;
use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,evolution::EvolutionRequest,picard::PicardStatus,proposal::Rk4Options};
use hyperinterval::{DyadicInterval,DyadicBudget};
use hyperlattice_interval::BoxN;
use hyperreal::Rational;
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionBudget,ExpressionProgram}};
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

fn budget()->EnclosureBudget {EnclosureBudget::new(EnclosurePolicy::default())}
fn d(a:i64,e:i32)->DyadicInterval {DyadicInterval::point(a.into(),e).unwrap()}
fn source(expression:Expr)->FieldDefinition {
 let t=SymbolId(100);let x=SymbolId(0);
 let p=ExpressionProgram::compile(&[expression],&[x,t],&mut ExpressionBudget::new(100000,10000000)).unwrap();
 FieldDefinition{source:p.definition().clone(),time:t,state:vec![x]}
}
fn timed<T>(name:&str,operation:&str,mut f:impl FnMut()->T){
 print_row(name,operation,32,measure(32,&mut f));
 let mut samples=Vec::new();for _ in 0..31 {let t=Instant::now();for _ in 0..8 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/8.0);}
 println!("TIMING {name}/{operation} ns_per_operation={samples:?}");
}
fn main(){
 let x=Expr::anonymous_symbol(SymbolId(0));let t=Expr::anonymous_symbol(SymbolId(100));
 for (name,expression,initial,h,expected,success) in [
  ("constant",Expr::int(3),d(1,0),d(1,-2),Rational::fraction(7,4).unwrap(),true),
  ("zero",Expr::int(0),d(1,0),d(1,-2),Rational::one(),true),
  ("time-affine",Expr::int(2)*t+Expr::int(3),d(0,0),d(1,-2),Rational::fraction(13,16).unwrap(),true),
  ("riccati",x.clone().powi(2),d(1,0),d(1,-3),Rational::fraction(8,7).unwrap(),true),
  ("contraction-rejected",Expr::int(2)*x.clone(),d(1,0),d(1,0),Rational::one(),false),
 ] {
 let definition=source(expression);let field=ExpressionField::<1>::from_definition(definition.clone(),&mut budget()).unwrap();
 let prepared=field.rk4_proposer(&mut budget()).unwrap();
 let req=EvolutionRequest{start:d(0,0),end:h,initial:BoxN::new([initial]).unwrap()};
 let mut b=budget();let attempt=prepared.propose(req.clone(),Rk4Options::default(),&mut b).unwrap().certify(&mut b);
 assert_eq!(matches!(attempt.proof().status(),PicardStatus::Certified),success);
 if success {assert!(attempt.proof().end_enclosure().unwrap().lanes().unwrap()[0].to_rational(&mut DyadicBudget::new(16384,1_000_000_000_000)).unwrap().contains_point(&expected));}
 let p=attempt.proof();let e=p.evidence();
 println!("EXACT {name} {}",serde_json::json!([p.identity(),p.proposal(),p.policy(),e.time(),e.duration(),e.image(),e.jacobian(),e.picard_image(),e.lipschitz(),e.contraction(),e.end(),format!("{:?}",p.status()),b.remaining_graph_work(),b.remaining_scalar_work()]));
 timed(name,"prepare",||field.rk4_proposer(&mut budget()).unwrap());
 timed(name,"proposal-and-proof",||prepared.propose(req.clone(),Default::default(),&mut budget()).unwrap().certify(&mut budget()));
 timed(name,"replay-and-proof",||{let mut b=budget();let f=ExpressionField::<1>::from_definition(serde_json::from_str(&serde_json::to_string(&definition).unwrap()).unwrap(),&mut b).unwrap();f.rk4_proposer(&mut b).unwrap().propose(req.clone(),Default::default(),&mut b).unwrap().certify(&mut b)});
 for work in [0,1,32] {timed(&format!("{name}/graph-{work}"),"exhausted",||{let mut b=EnclosureBudget::new(EnclosurePolicy{graph_work:work,..Default::default()});let result=prepared.propose(req.clone(),Default::default(),&mut b);assert!(result.is_err());result});}
 }
}
