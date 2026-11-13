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
 let mut samples=Vec::new();for _ in 0..31 {let t=Instant::now();for _ in 0..64 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/64.0);}
 println!("TIMING {name}/{op} ns_per_operation={samples:?}");
}


use hyperdynamics::field::evolution::*;
fn scaled(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn ratio(a:i64,b:i64)->DyadicInterval {d(a,a).div(&d(b,b),-80,&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000_000)).unwrap()}
fn source<const N:usize>(outputs:&[Expr])->FieldDefinition {
 let t=SymbolId(100);let state:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=state.clone();variables.reverse();variables.push(t);
 let source=ExpressionProgram::compile(outputs,&variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone();FieldDefinition{source,time:t,state}
}
fn run<const N:usize>(name:&str,outputs:&[Expr],request:EvolutionRequest<N>,options:EvolutionOptions,control:BoxN<DyadicInterval,N>,exact:bool) {
 let definition=source::<N>(outputs);let field=ExpressionField::<N>::from_definition(definition.clone(),&mut budget()).unwrap();let mut work=budget();let report=field.integrate(request.clone(),options.clone(),&mut work);
 assert!(report.end_enclosure().is_some(),"{name} {:?}",report.status());let expected=report.end_enclosure().unwrap().clone();
 assert!(control.subset_of(&expected,&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000_000)).unwrap(),"{name}");if exact {assert_eq!(control,expected);}
 let gw=work.policy().graph_work-work.remaining_graph_work();let sw=work.policy().scalar_work-work.remaining_scalar_work();
 println!("RESOURCE {name} graph={gw} scalar={sw} attempts={} segments={}",report.attempts().len(),report.segments().len());
 timed(name,"integrate",||{let r=field.integrate(black_box(&request).clone(),black_box(&options).clone(),&mut budget());assert_eq!(r.end_enclosure(),Some(&expected));r});
 let encoded=serde_json::to_string(&(definition,&request,&options)).unwrap();
 timed(name,"replay",||{let (source,r,o):(FieldDefinition,EvolutionRequest<N>,EvolutionOptions)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let field=ExpressionField::<N>::from_definition(source,&mut work).unwrap();let r=field.integrate(r,o,&mut work);assert_eq!(r.end_enclosure(),Some(&expected));r});
 for (label,policy) in [("graph-zero",EnclosurePolicy{graph_work:0,..EnclosurePolicy::default()}),("graph-short",EnclosurePolicy{graph_work:gw-1,..EnclosurePolicy::default()}),("scalar-zero",EnclosurePolicy{scalar_work:0,..EnclosurePolicy::default()}),("scalar-short",EnclosurePolicy{scalar_work:sw-1,..EnclosurePolicy::default()})] {
  print_row(name,label,32,measure(32,||{let r=field.integrate(request.clone(),options.clone(),&mut EnclosureBudget::new(policy));assert!(matches!(r.status(),EvolutionStatus::Stopped(_)));assert!(r.end_enclosure().is_none());r}));
 }
 assert_eq!(field.integrate(request,options,&mut budget()).end_enclosure(),Some(&expected));
}
fn req<const N:usize>(end:DyadicInterval,initial:[DyadicInterval;N])->EvolutionRequest<N> {EvolutionRequest{start:d(0,0),end,initial:BoxN::new(initial).unwrap()}}
fn cap()->EvolutionOptions {EvolutionOptions{maximum_step:Some(scaled(1,1,-2)),..Default::default()}}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let v=Expr::anonymous_symbol(SymbolId(1));let t=Expr::anonymous_symbol(SymbolId(100));
 run("constant",&[Expr::int(2)],req(scaled(5,5,-3),[d(0,1)]),cap(),BoxN::new([scaled(5,9,-2)]).unwrap(),true);
 run("time-affine",&[Expr::int(2)*t+Expr::int(3)],req(scaled(3,3,-2),[d(0,0)]),cap(),BoxN::new([scaled(45,45,-4)]).unwrap(),false);
 run("affine-halving",&[Expr::int(2)*x.clone()],req(scaled(1,1,-1),[d(0,0)]),Default::default(),BoxN::new([d(0,0)]).unwrap(),true);
 let cos=ratio(7,8).hull(&ratio(337,384),&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000)).unwrap();let minus_sin=ratio(-1,2).hull(&ratio(-23,48),&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000)).unwrap();
 run("oscillator",&[v,-x.clone()],req(scaled(1,1,-1),[d(1,1),d(0,0)]),EvolutionOptions{maximum_step:Some(scaled(1,1,-3)),..Default::default()},BoxN::new([cos,minus_sin]).unwrap(),false);
 run("riccati",&[x.clone().powi(2)],req(scaled(1,1,-2),[d(1,1)]),Default::default(),BoxN::new([ratio(4,3)]).unwrap(),false);
 let exp=ratio(3392923553,2642411520).hull(&ratio(1190916167113,927486443520),&mut hyperinterval::DyadicBudget::new(16384,1_000_000_000)).unwrap();
 run("exponential",&[x.clone()],req(scaled(1,1,-2),[d(1,1)]),Default::default(),BoxN::new([exp]).unwrap(),false);
 run("unit",&[],req(d(1,1),[]),Default::default(),BoxN::new([]).unwrap(),true);
 run::<1>("empty",&[x.clone()],EvolutionRequest{start:d(0,0),end:d(1,1),initial:BoxN::empty().unwrap()},Default::default(),BoxN::empty().unwrap(),true);
 run("identity",&[x.clone()],req(d(0,0),[d(1,2)]),Default::default(),BoxN::new([d(1,2)]).unwrap(),true);
 for (name,expression,request,options) in [
 ("step-limit",Expr::int(1),req(d(1,1),[d(0,0)]),EvolutionOptions{maximum_steps:1,..cap()}),
 ("halving-limit",Expr::int(1),req(d(1,1),[d(0,0)]),EvolutionOptions{maximum_expansions:0,maximum_halvings:2,..Default::default()}),
 ("pole",Expr::int(1)/x.clone(),req(d(1,1),[d(0,0)]),EvolutionOptions{maximum_halvings:2,..Default::default()}),
 ("riccati-blowup",x.powi(2),req(d(1,1),[d(1,1)]),EvolutionOptions{maximum_steps:24,maximum_halvings:8,..Default::default()})] {
  let field=ExpressionField::<1>::from_definition(source::<1>(&[expression]),&mut budget()).unwrap();
  timed(name,"stopped",||{let r=field.integrate(request.clone(),options.clone(),&mut budget());assert!(matches!(r.status(),EvolutionStatus::Stopped(_)));assert!(r.end_enclosure().is_none());r});
 }
}
