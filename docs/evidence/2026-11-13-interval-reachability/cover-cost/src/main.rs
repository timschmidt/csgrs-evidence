use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::{BoxN};
use std::time::Instant;
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
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
    for _ in 0..1 {
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


use hyperdynamics::field::{evolution::*,reachability::*};
fn d(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn budget()->EnclosureBudget {EnclosureBudget::new(EnclosurePolicy::default())}
fn source<const N:usize>(outputs:&[Expr])->FieldDefinition {
 let t=SymbolId(100);let state:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut vars=state.clone();vars.push(t);
 let source=ExpressionProgram::compile(outputs,&vars,&mut ExpressionBudget::new(100000,10000000)).unwrap();
 FieldDefinition{source:source.definition().clone(),time:t,state}
}
fn req<const N:usize>(initial:BoxN<DyadicInterval,N>,epsilon:DyadicInterval)->ReachabilityRequest<N> {
 ReachabilityRequest{evolution:EvolutionRequest{start:d(0,0,0),end:d(1,1,-1),initial},epsilon}
}
fn run<const N:usize>(name:&str,outputs:&[Expr],request:ReachabilityRequest<N>,policy:ReachabilityPolicy,stress:bool) {
 let field=ExpressionField::<N>::from_definition(source::<N>(outputs),&mut budget()).unwrap();let mut work=budget();
 let begin=Instant::now();let report=field.reach(request.clone(),policy.clone(),&mut work);let cold=begin.elapsed().as_nanos();
 let cover=report.end_cover().unwrap_or_else(||panic!("{name} {:?}",report.status()));let expected:Vec<_>=cover.boxes().cloned().collect();
 println!("COMPLETE {name} status={:?} leaves={} cells={} attempts={} native_calls={} graph={} scalar={} cold_ns={cold}",report.status(),expected.len(),report.cells().len(),report.attempts().len(),report.attempts().iter().map(|a|a.evolution().steps().len()).sum::<usize>(),work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work());
 drop(report);
 let operation=||{let r=field.reach(black_box(&request).clone(),black_box(&policy).clone(),&mut budget());let cover=r.end_cover().unwrap();assert_eq!(cover.boxes().len(),expected.len());for (a,b) in cover.boxes().zip(&expected){assert_eq!(a,b);}r};
 let count=if stress{1}else{16};print_row(name,"completed-cover-and-drop",count,measure(count,operation));
 let mut samples=Vec::new();for _ in 0..if stress{3}else{15} {let begin=Instant::now();for _ in 0..count{drop(black_box(operation()));}samples.push(begin.elapsed().as_nanos() as f64/count as f64);}
 println!("TIMING {name} iterations={count} ns_per_operation={samples:?}");
 let encoded=serde_json::to_string(&(source::<N>(outputs),&request,&policy)).unwrap();
 let replay=||{let (source,request,policy):(FieldDefinition,ReachabilityRequest<N>,ReachabilityPolicy)=serde_json::from_str(&encoded).unwrap();let mut work=budget();let field=ExpressionField::<N>::from_definition(source,&mut work).unwrap();let r=field.reach(request,policy,&mut work);let cover=r.end_cover().unwrap();assert_eq!(cover.boxes().len(),expected.len());for(a,b)in cover.boxes().zip(&expected){assert_eq!(a,b);}r};
 print_row(name,"source-rebuild-cover-and-drop",count,measure(count,replay));
 for (label,limits) in [("zero-attempts",ReachabilityPolicy{maximum_evolutions:0,..policy.clone()}),("zero-cells",ReachabilityPolicy{maximum_cells:0,..policy.clone()})] {
  let r=field.reach(request.clone(),limits,&mut budget());assert!(r.end_cover().is_none());println!("STOPPED {name}/{label} {:?}",r.status());
 }
}
fn main(){
 run("constant",&[Expr::int(2)],req(BoxN::new([d(-2,2,0)]).unwrap(),d(1,1,0)),Default::default(),false);
 run("partition-2d",&[Expr::int(2),Expr::int(-1)],req(BoxN::new([d(-1,1,0),d(0,2,0)]).unwrap(),d(1,1,0)),Default::default(),false);
 let x=Expr::anonymous_symbol(SymbolId(0));
 run("affine-point",&[x.clone()],req(BoxN::new([d(1,1,0)]).unwrap(),d(1,1,-3)),Default::default(),false);
 run("riccati-uncertain",&[x.clone()*x],req(BoxN::new([d(1,2,-2)]).unwrap(),d(1,1,-7)),ReachabilityPolicy{maximum_depth:8,maximum_evolutions:2048,..Default::default()},true);
 run::<0>("unit",&[],req(BoxN::new([]).unwrap(),d(0,0,0)),Default::default(),false);
 run("empty",&[Expr::int(0)],req(BoxN::<DyadicInterval,1>::empty().unwrap(),d(0,0,0)),Default::default(),false);
}
