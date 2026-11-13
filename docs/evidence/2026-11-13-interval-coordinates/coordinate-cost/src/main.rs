use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};

use hyperinterval::DyadicInterval;

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


use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,EnclosedVectorField,coordinates::{CoordinateField,CoordinateFieldDefinition,CoordinateStatus},picard::PicardProposal};
use hyperlattice_interval::BoxN;
use hyperreal::Real;
use hypersolve::expression_program::CoordinateChange;
fn budget()->EnclosureBudget { EnclosureBudget::new(EnclosurePolicy::default()) }
fn d(a:i64,b:i64,e:i32)->DyadicInterval { DyadicInterval::new(a.into(),b.into(),e).unwrap() }
fn field(outputs:&[Expr])->ExpressionField<2> {
 let p=ExpressionProgram::compile(outputs,&[SymbolId(1),SymbolId(2),SymbolId(0)],&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
 ExpressionField::from_definition(FieldDefinition { source:p.definition().clone(),time:SymbolId(2),state:vec![SymbolId(0),SymbolId(1)] },&mut budget()).unwrap()
}
fn timed<T>(name:&str,op:&str,mut f:impl FnMut()->T) {
 print_row(name,op,32,measure(32,&mut f));let mut samples=Vec::new();
 for _ in 0..31 { let t=Instant::now();for _ in 0..8 { drop(black_box(f())); } samples.push(t.elapsed().as_nanos() as f64/8.0); }
 println!("TIMING {name}/{op} ns_per_operation={samples:?}");
}
fn run(name:&str,source:ExpressionField<2>,change:CoordinateChange,proposal:PicardProposal<2>,expected:BoxN<DyadicInterval,2>) {
 let policy=EnclosurePolicy::default();let mut b=budget();let chart=source.in_coordinates(change.clone(),&mut b).unwrap();
 let cg=policy.graph_work-b.remaining_graph_work();let mut b=budget();let step=chart.certify_step(proposal.clone(),&mut b);assert!(matches!(step.status(),CoordinateStatus::Certified));assert_eq!(step.source_end_enclosure(),Some(&expected));
 let sg=policy.graph_work-b.remaining_graph_work();let ss=policy.scalar_work-b.remaining_scalar_work();
 println!("COMPLETE {name} construct_graph={cg} step_graph={sg} step_scalar={ss} nodes={} end={:?} status={:?}",chart.transformation().program().definition().nodes.len(),step.source_end_enclosure(),step.status());
 timed(name,"construct",||{let v=source.in_coordinates(change.clone(),&mut budget()).unwrap();assert_eq!(v.original_field().identity(),source.identity());assert_eq!(v.transformation().inverse_evidence().len(),4);v});
 timed(name,"step-and-transport",||{let v=chart.certify_step(proposal.clone(),&mut budget());assert!(matches!(v.status(),CoordinateStatus::Certified));assert_eq!(v.source_end_enclosure(),Some(&expected));v});
 let original=source.identity();let encoded=serde_json::to_string(&(CoordinateFieldDefinition { source:FieldDefinition { source:original.source().clone(),time:original.time(),state:original.state().to_vec() },change:change.clone() },&proposal)).unwrap();
 timed(name,"replay",||{let(definition,proposal):(CoordinateFieldDefinition,PicardProposal<2>)=serde_json::from_str(&encoded).unwrap();let mut b=budget();let v=CoordinateField::<2>::from_definition(definition,&mut b).unwrap().certify_step(proposal,&mut b);assert!(matches!(v.status(),CoordinateStatus::Certified));assert_eq!(v.source_end_enclosure(),Some(&expected));v});
 let guard=CountingGuard::start();let retained=source.in_coordinates(change.clone(),&mut budget()).unwrap();let stats=AllocationStats::snapshot();drop(retained);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);println!("RETAINED {name} incremental={} peak={} after_drop=0",stats.live_bytes,stats.peak_live_bytes);
 for(label,graph,scalar)in[("graph-zero",0,policy.scalar_work),("graph-short",sg-1,policy.scalar_work),("scalar-short",policy.graph_work,ss-1)] {
  print_row(name,label,32,measure(32,||{let mut b=EnclosureBudget::new(EnclosurePolicy { graph_work:graph,scalar_work:scalar,..policy });let v=chart.certify_step(proposal.clone(),&mut b);assert!(!matches!(v.status(),CoordinateStatus::Certified|CoordinateStatus::Empty));assert!(v.source_end_enclosure().is_none());v}));
 }
 assert_eq!(chart.certify_step(proposal,&mut budget()).source_end_enclosure(),Some(&expected));
}
fn main() {
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=SymbolId(0);let y=SymbolId(1);
 let source=field(&[Expr::int(128)*Expr::anonymous_symbol(y),Expr::int(0)]);
 let change=CoordinateChange { variables:vec![x,y],to_source:vec![vec![128.into(),0.into()],vec![0.into(),1.into()]],from_source:vec![vec![(Real::one()/Real::from(128)).unwrap(),0.into()],vec![0.into(),1.into()]],origin:vec![0.into(),0.into()] };
 run("scaled-shear",source,change,PicardProposal { start:d(0,0,0),end:d(1,1,-1),initial:BoxN::new([d(0,0,0),d(-1,1,0)]).unwrap(),candidate:BoxN::new([d(-1,1,0),d(-1,1,0)]).unwrap() },BoxN::new([d(-64,64,0),d(-1,1,0)]).unwrap());
 let source=field(&[Expr::int(2),Expr::int(1)]);let change=CoordinateChange { variables:vec![x,y],to_source:vec![vec![1.into(),1.into()],vec![0.into(),1.into()]],from_source:vec![vec![1.into(),(-1).into()],vec![0.into(),1.into()]],origin:vec![10.into(),(-3).into()] };
 run("translated-constant",source,change,PicardProposal { start:d(0,0,0),end:d(1,1,0),initial:BoxN::new([d(-1,1,0),d(-1,1,0)]).unwrap(),candidate:BoxN::new([d(-1,2,0),d(-1,2,0)]).unwrap() },BoxN::new([d(10,14,0),d(-3,-1,0)]).unwrap());
}
