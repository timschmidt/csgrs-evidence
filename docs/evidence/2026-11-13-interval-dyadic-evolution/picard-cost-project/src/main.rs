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

use hyperdynamics::field::picard::{PicardProposal,PicardStatus,PicardReport};
fn compile(outputs:&[Expr],variables:&[SymbolId])->hypersolve::expression_program::ExpressionDefinition {
 ExpressionProgram::compile(outputs,variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone()
}
fn scaled(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn run<const N:usize>(name:&str,outputs:&[Expr],proposal:PicardProposal<N>,expected:BoxN<DyadicInterval,N>,empty:bool) {
 let t=SymbolId(100);let states:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=states.clone();variables.reverse();variables.push(t);
 let source=FieldDefinition{source:compile(outputs,&variables),time:t,state:states};
 let field=ExpressionField::<N>::from_definition(source.clone(),&mut budget()).unwrap();
 let validate=|r:&PicardReport<N>|{assert!(if empty {matches!(r.status(),PicardStatus::Empty)}else{matches!(r.status(),PicardStatus::Certified)},"{:?}",r.status());assert_eq!(r.end_enclosure(),Some(&expected));};
 let mut work=budget();let r=field.certify_step(proposal.clone(),&mut work);validate(&r);
 println!("RESOURCE {name} graph={} scalar={}",work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work());
 timed(name,"verify",||{let r=field.certify_step(black_box(&proposal).clone(),&mut budget());validate(&r);r});
 let encoded=serde_json::to_string(&(source,&proposal)).unwrap();
 timed(name,"replay",||{let (source,p):(FieldDefinition,PicardProposal<N>)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let f=ExpressionField::<N>::from_definition(source,&mut work).unwrap();let r=f.certify_step(p,&mut work);validate(&r);r});
 for limit in [0,1,work.policy().scalar_work-work.remaining_scalar_work()-1] {let policy=EnclosurePolicy{scalar_work:limit,..EnclosurePolicy::default()};print_row(name,&format!("exhaust-{limit}"),32,measure(32,||{let r=field.certify_step(proposal.clone(),&mut EnclosureBudget::new(policy));assert!(matches!(r.status(),PicardStatus::Rejected(_)));assert!(r.end_enclosure().is_none());r}));}
 let label=if work.policy().scalar_work-work.remaining_scalar_work()<=16 {"budget-16-completed"}else{"budget-16-exhausted"};
 print_row(name,label,32,measure(32,||{let r=field.certify_step(proposal.clone(),&mut EnclosureBudget::new(EnclosurePolicy{scalar_work:16,..EnclosurePolicy::default()}));if label=="budget-16-completed" {validate(&r);}else{assert!(matches!(r.status(),PicardStatus::Rejected(_)));assert!(r.end_enclosure().is_none());}r}));
 validate(&field.certify_step(proposal,&mut budget()));
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let y=Expr::anonymous_symbol(SymbolId(1));let t=Expr::anonymous_symbol(SymbolId(100));
 run("constant",&[Expr::int(2)],PicardProposal{start:d(0,0),end:scaled(1,1,-2),initial:BoxN::new([d(0,1)]).unwrap(),candidate:BoxN::new([d(0,2)]).unwrap()},BoxN::new([scaled(1,3,-1)]).unwrap(),false);
 run("time-affine",&[Expr::int(2)*t.clone()+Expr::int(3)],PicardProposal{start:d(0,0),end:scaled(1,1,-1),initial:BoxN::new([d(0,0)]).unwrap(),candidate:BoxN::new([d(0,2)]).unwrap()},BoxN::new([scaled(3,4,-1)]).unwrap(),false);
 run("oscillator",&[y,-x.clone()],PicardProposal{start:d(0,0),end:scaled(1,1,-2),initial:BoxN::new([d(1,1),d(0,0)]).unwrap(),candidate:BoxN::new([d(0,2),d(-1,1)]).unwrap()},BoxN::new([scaled(3,5,-2),scaled(-1,0,-1)]).unwrap(),false);
 run("riccati",&[x.clone().powi(2)],PicardProposal{start:d(0,0),end:scaled(1,1,-3),initial:BoxN::new([d(1,1)]).unwrap(),candidate:BoxN::new([d(1,2)]).unwrap()},BoxN::new([scaled(9,12,-3)]).unwrap(),false);
 run("temporal-root",&[t.sqrt()],PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([d(0,0)]).unwrap(),candidate:BoxN::new([d(0,1)]).unwrap()},BoxN::new([d(0,1)]).unwrap(),false);
 run("unit",&[],PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([]).unwrap(),candidate:BoxN::new([]).unwrap()},BoxN::new([]).unwrap(),false);
 run::<1>("empty",&[x.clone()],PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::empty().unwrap(),candidate:BoxN::empty().unwrap()},BoxN::empty().unwrap(),true);
 let time=SymbolId(100);let state=SymbolId(0);
 for (name,expression,candidate) in [("self-map",Expr::int(1),d(0,0)),("contraction",x.clone(),d(-1,1)),("regularity",x.sqrt(),d(0,1))] {
  let field=ExpressionField::<1>::from_definition(FieldDefinition{source:compile(&[expression],&[state,time]),time,state:vec![state]},&mut budget()).unwrap();
  let p=PicardProposal{start:d(0,0),end:d(1,1),initial:BoxN::new([d(0,0)]).unwrap(),candidate:BoxN::new([candidate]).unwrap()};
  timed(name,"rejected",||{let r=field.certify_step(p.clone(),&mut budget());assert!(matches!(r.status(),PicardStatus::Rejected(_)));assert!(r.end_enclosure().is_none());r});
 }
 let field=ExpressionField::<1>::from_definition(FieldDefinition{source:compile(&[Expr::int(2)],&[state,time]),time,state:vec![state]},&mut budget()).unwrap();
 timed("constant","two-step",||{let mut work=budget();let first=field.certify_step(PicardProposal{start:d(0,0),end:scaled(1,1,-2),initial:BoxN::new([d(0,1)]).unwrap(),candidate:BoxN::new([d(0,2)]).unwrap()},&mut work);let second=field.certify_step(PicardProposal{start:scaled(1,1,-2),end:scaled(1,1,-1),initial:first.end_enclosure().unwrap().clone(),candidate:BoxN::new([d(0,2)]).unwrap()},&mut work);assert_eq!(second.end_enclosure().unwrap().lanes(),Some(&[d(1,2)]));(first,second)});
}
