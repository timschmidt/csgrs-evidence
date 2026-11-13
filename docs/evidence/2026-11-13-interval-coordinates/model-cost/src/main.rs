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


fn budget()->EnclosureBudget { EnclosureBudget::new(EnclosurePolicy::default()) }
fn d(a:i64,b:i64)->DyadicInterval { DyadicInterval::new(a.into(),b.into(),0).unwrap() }
fn timed<T>(name:&str,op:&str,mut f:impl FnMut()->T) {
 print_row(name,op,32,measure(32,&mut f));
 let mut samples=Vec::new();for _ in 0..31 {let t=Instant::now();for _ in 0..8 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/8.0);}
 println!("TIMING {name}/{op} ns_per_operation={samples:?}");
}


use hyperdynamics::field::taylor::*;
use hyperdynamics::field::EnclosedVectorField;
fn scaled(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn source<const N:usize>(outputs:&[Expr])->FieldDefinition {
 let t=SymbolId(100);let state:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=state.clone();variables.reverse();variables.push(t);
 let source=ExpressionProgram::compile(outputs,&variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone();FieldDefinition{source,time:t,state}
}
fn run<const N:usize>(name:&str,outputs:&[Expr],request:FieldTaylorRequest<N>,point:[DyadicInterval;N],expected:[DyadicInterval;N],zero_remainder:bool) {
 let definition=source::<N>(outputs);let field=ExpressionField::<N>::from_definition(definition.clone(),&mut budget()).unwrap();
 let mut work=budget();let start=Instant::now();let model=field.taylor_model(request.clone(),&mut work).unwrap();let cold=start.elapsed().as_nanos();
 let proof=model.model().unwrap();assert_eq!(proof.source().definition(),field.identity().source());
 if zero_remainder {assert!(proof.remainder().iter().all(|v|*v==d(0,0)));}else{assert!(proof.remainder().iter().any(|v|*v!=d(0,0)));}
 let gw=work.policy().graph_work-work.remaining_graph_work();let sw=work.policy().scalar_work-work.remaining_scalar_work();
 println!("COMPLETE {name} graph={gw} scalar={sw} nodes={} coefficients={} terms={} remainder_terms={} cold_ns={cold}",proof.coefficient_program().program().definition().nodes.len(),proof.coefficient_program().requests().len(),proof.terms().len(),proof.remainder_terms().len());
 println!("IMAGE {name} {:?} REMAINDER {:?}", model.image(),proof.remainder());
 let point=BoxN::new(point).unwrap();let control=BoxN::new(expected).unwrap();let time=d(0,0);
 let image=model.enclose_on(&time,&point,&mut budget()).unwrap();assert!(control.subset_of(&image,&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000_000)).unwrap());
 if zero_remainder {assert_eq!(control,image);}
 timed(name,"construct",||{let m=field.taylor_model(black_box(&request).clone(),&mut budget()).unwrap();assert_eq!(m.image(),model.image());m});
 timed(name,"reuse",||{let r=model.enclose_on(black_box(&time),black_box(&point),&mut budget()).unwrap();assert_eq!(r,image);r});
 let encoded=serde_json::to_string(&(definition,request.clone())).unwrap();
 timed(name,"replay",||{let (definition,request):(FieldDefinition,FieldTaylorRequest<N>)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let f=ExpressionField::<N>::from_definition(definition,&mut work).unwrap();let m=f.taylor_model(request,&mut work).unwrap();assert_eq!(m.image(),model.image());m});
 let guard=CountingGuard::start();let retained=field.taylor_model(request.clone(),&mut budget()).unwrap();let live=AllocationStats::snapshot();drop(retained);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);
 println!("RETAINED {name} incremental_live={} peak={} allocated={} after_drop={}",live.live_bytes,live.peak_live_bytes,live.allocated_bytes,after.live_bytes);
 for (label,policy) in [("graph-zero",EnclosurePolicy{graph_work:0,..EnclosurePolicy::default()}),("graph-short",EnclosurePolicy{graph_work:gw-1,..EnclosurePolicy::default()}),("scalar-zero",EnclosurePolicy{scalar_work:0,..EnclosurePolicy::default()}),("scalar-short",EnclosurePolicy{scalar_work:sw-1,..EnclosurePolicy::default()})] {
  print_row(name,label,32,measure(32,||{let e=field.taylor_model(request.clone(),&mut EnclosureBudget::new(policy)).unwrap_err();assert!(std::error::Error::source(&e).is_some());e}));
 }
 assert_eq!(field.taylor_model(request,&mut budget()).unwrap().image(),model.image());
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let y=Expr::anonymous_symbol(SymbolId(1));
 run("logistic",&[x.clone()*(Expr::int(1)-x.clone())],FieldTaylorRequest{time:d(0,1),state:BoxN::new([d(0,1)]).unwrap(),order:2},[scaled(1,1,-1)],[scaled(1,1,-2)],true);
 run("mixed",&[x.clone().powi(2)+Expr::int(2)*x.clone()*y.clone(),x.clone()-y],FieldTaylorRequest{time:d(0,1),state:BoxN::new([d(-1,1),d(-1,1)]).unwrap(),order:2},[scaled(1,1,-1),scaled(1,1,-1)],[scaled(3,3,-2),d(0,0)],true);
 run("reciprocal",&[Expr::int(1)/(Expr::int(1)-x.clone())],FieldTaylorRequest{time:d(0,1),state:BoxN::new([scaled(0,1,-2)]).unwrap(),order:3},[d(0,0)],[d(1,1)],false);
 run("sine",&[x.sin()],FieldTaylorRequest{time:d(0,1),state:BoxN::new([scaled(-1,1,-2)]).unwrap(),order:3},[d(0,0)],[d(0,0)],false);
}
