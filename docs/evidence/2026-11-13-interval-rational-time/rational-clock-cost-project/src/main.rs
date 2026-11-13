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


fn source<const N:usize>(outputs:&[Expr])->FieldDefinition {
 let t=SymbolId(100);let state:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=state.clone();variables.reverse();variables.push(t);
 let source=ExpressionProgram::compile(outputs,&variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone();FieldDefinition{source,time:t,state}
}

use hyperdynamics::field::{clock::*, evolution::*};
use hyperinterval::{DyadicBudget,IntervalError};
use hyperreal::Rational;
fn q(a:i64,b:u64)->Rational {Rational::fraction(a,b).unwrap()}
fn cap()->EvolutionOptions {EvolutionOptions { maximum_step:Some(DyadicInterval::point(1.into(),-2).unwrap()), ..Default::default() }}
fn run<const N:usize>(name:&str,outputs:&[Expr],a:Rational,z:Rational,initial:BoxN<DyadicInterval,N>,control:Option<[Rational;N]>) {
 let original=ExpressionField::<N>::from_definition(source::<N>(outputs),&mut budget()).unwrap();
 let mut build=budget();let field=original.on_time_span(a.clone(),z.clone(),&mut build).unwrap();
 let mut work=budget();let report=field.integrate(initial.clone(),cap(),&mut work);
 assert!(report.end_enclosure().is_some(),"{name} {:?}",report.status());assert_eq!(report.reached_time(),&z);
 let expected=report.end_enclosure().unwrap().clone();
 if let Some(control)=control {for (actual,expected) in expected.lanes().unwrap().iter().zip(control) {assert!(actual.to_rational(&mut DyadicBudget::new(16384,u64::MAX)).unwrap().contains_point(&expected),"{name}");}}
 let gw=work.policy().graph_work-work.remaining_graph_work();let sw=work.policy().scalar_work-work.remaining_scalar_work();
 println!("RESOURCE {name} graph={gw} scalar={sw} attempts={} segments={} build_graph={} build_scalar={}",report.normalized().attempts().len(),report.segments().len(),build.policy().graph_work-build.remaining_graph_work(),build.policy().scalar_work-build.remaining_scalar_work());
 timed(name,"integrate",||{let r=field.integrate(black_box(&initial).clone(),cap(),&mut budget());assert_eq!(r.end_enclosure(),Some(&expected));assert_eq!(r.reached_time(),&z);r});
 let encoded=serde_json::to_string(&(&field,&initial,cap())).unwrap();
 timed(name,"replay",||{let (definition,initial,options):(RationalTimeDefinition,BoxN<DyadicInterval,N>,EvolutionOptions)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let f=RationalTimeField::<N>::from_definition(definition,&mut work).unwrap();let r=f.integrate(initial,options,&mut work);assert_eq!(r.end_enclosure(),Some(&expected));assert_eq!(r.reached_time(),&z);r});
 for (label,policy) in [("graph-zero",EnclosurePolicy{graph_work:0,..EnclosurePolicy::default()}),("graph-short",EnclosurePolicy{graph_work:gw-1,..EnclosurePolicy::default()}),("scalar-zero",EnclosurePolicy{scalar_work:0,..EnclosurePolicy::default()}),("scalar-short",EnclosurePolicy{scalar_work:sw-1,..EnclosurePolicy::default()})] {
  print_row(name,label,32,measure(32,||{let r=field.integrate(initial.clone(),cap(),&mut EnclosureBudget::new(policy));assert!(matches!(r.status(),ClockStatus::Stopped(_)),"{name}/{label}");assert!(r.end_enclosure().is_none());r}));
 }
 assert_eq!(field.integrate(initial,cap(),&mut budget()).end_enclosure(),Some(&expected));
}
fn main() {
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let t=Expr::anonymous_symbol(SymbolId(100));
 run("constant",&[Expr::int(2)],q(1,3),q(2,3),BoxN::new([d(0,1)]).unwrap(),Some([q(2,3)]));
 run("time-affine",&[Expr::int(2)*t+Expr::int(3)],q(-2,3),q(-1,5),BoxN::new([d(0,0)]).unwrap(),Some([q(224,225)]));
 run("riccati",&[x.clone().powi(2)],q(1,3),q(1,2),BoxN::new([d(1,1)]).unwrap(),Some([q(6,5)]));
 run("zero",&[Expr::int(0)],q(1,3),q(2,3),BoxN::new([d(1,1)]).unwrap(),Some([q(1,1)]));
 run("unit",&[],q(1,3),q(2,3),BoxN::new([]).unwrap(),Some([]));
 run::<1>("empty",&[x.clone()],q(1,3),q(2,3),BoxN::empty().unwrap(),None);
 run("identity",&[x],q(1,3),q(1,3),BoxN::new([d(1,2)]).unwrap(),Some([q(1,1)]));
 let power=|n|(0..n).fold(Rational::one(),|a,_|a*Rational::from(2));
 let tiny=Rational::one()/(Rational::from(3)*power(300));
 run("close",&[Expr::int(1)],Rational::one(),Rational::one()+&tiny,BoxN::new([d(0,0)]).unwrap(),Some([tiny]));
 let a=power(512)+q(1,3);
 run("large",&[Expr::int(1)],a.clone(),a+q(2,3),BoxN::new([d(0,0)]).unwrap(),Some([q(2,3)]));
 for bits in [128,4096,131072] {
  let x=power(bits)+Rational::one();let y=q(1,3);
  for operation in ["compare","add","sub","mul"] {
   let stats=measure(64,||{let mut b=DyadicBudget::new(64,1000);let r=match operation {"compare"=>b.rational().compare(&x,&y).map(|_|()),"add"=>b.rational().add(&x,&y).map(|_|()),"sub"=>b.rational().sub(&x,&x).map(|_|()),_=>b.rational().mul(&x,&y).map(|_|())};assert_eq!(r,Err(IntervalError::SizeExhausted));});
   assert_eq!(stats.allocations,0);assert_eq!(stats.allocated_bytes,0);assert_eq!(stats.peak_live_bytes,0);print_row(&format!("reject-{bits}"),operation,64,stats);
  }
 }
}
