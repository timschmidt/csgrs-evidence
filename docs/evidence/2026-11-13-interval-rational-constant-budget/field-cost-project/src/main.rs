use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
use hyperdynamics::field::{EnclosedVectorField,EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::{BoxN,IntervalMatrix,IntervalVector};
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
fn run<const N:usize>(name:&str,definition:FieldDefinition,state:BoxN<DyadicInterval,N>,expected:IntervalVector<DyadicInterval,N>,matrix:IntervalMatrix<DyadicInterval,N,N>) {
 let mut build=budget();let field=ExpressionField::<N>::from_definition(definition.clone(),&mut build).unwrap();
 let time=d(0,1);let mut image_budget=budget();let image=field.image(&time,&state,&mut image_budget).unwrap();assert_eq!(image,expected);
 let mut matrix_budget=budget();let jacobian=field.jacobian(&time,&state,&mut matrix_budget).unwrap();assert_eq!(jacobian,matrix);
 println!("RESOURCE {name} build_graph={} image_graph={} image_scalar={} jacobian_graph={} jacobian_scalar={}",build.policy().graph_work-build.remaining_graph_work(),image_budget.policy().graph_work-image_budget.remaining_graph_work(),image_budget.policy().scalar_work-image_budget.remaining_scalar_work(),matrix_budget.policy().graph_work-matrix_budget.remaining_graph_work(),matrix_budget.policy().scalar_work-matrix_budget.remaining_scalar_work());
 let encoded=serde_json::to_string(&field.identity()).unwrap();
 timed(name,"construct",||ExpressionField::<N>::from_definition(black_box(&definition).clone(),&mut budget()).unwrap());
 timed(name,"replay",||ExpressionField::<N>::from_definition(serde_json::from_str(black_box(&encoded)).unwrap(),&mut budget()).unwrap());
 timed(name,"image",||{let v=field.image(black_box(&time),black_box(&state),&mut budget()).unwrap();assert_eq!(v,expected);v});
 timed(name,"jacobian",||{let v=field.jacobian(black_box(&time),black_box(&state),&mut budget()).unwrap();assert_eq!(v,matrix);v});
 timed(name,"pipeline",||{
  let mut work=budget();let f=ExpressionField::<N>::from_definition(definition.clone(),&mut work).unwrap();let image=f.image(&time,&state,&mut work).unwrap();let jacobian=f.jacobian(&time,&state,&mut work).unwrap();assert_eq!(image,expected);assert_eq!(jacobian,matrix);(f.identity(),image,jacobian)
 });
 for work in [0,1,16] {print_row(name,&format!("exhaust-{work}"),32,measure(32,||{let r=ExpressionField::<N>::from_definition(definition.clone(),&mut EnclosureBudget::new(EnclosurePolicy{graph_work:work,..EnclosurePolicy::default()}));assert!(r.is_err());r}));}
 assert_eq!(field.image(&time,&state,&mut budget()).unwrap(),expected);
}
fn compile(outputs:&[Expr],variables:&[SymbolId])->hypersolve::expression_program::ExpressionDefinition {
 ExpressionProgram::compile(outputs,variables,&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap().definition().clone()
}
fn affine<const N:usize>() {
 let time=SymbolId(100);let state_ids:Vec<_>=(0..N).map(|i|SymbolId(i as u32)).collect();let mut variables=state_ids.clone();variables.reverse();variables.push(time);
 let coefficient=|r:usize,c:usize|((r+2*c)%5) as i64-2;
 let mut outputs=Vec::new();let mut expected=Vec::new();
 for r in 0..N {
  let mut expression=Expr::int(r as i64)+Expr::int(r as i64+1)*Expr::anonymous_symbol(time);let mut lo=r as i64;let mut hi=2*r as i64+1;
  for (c,id) in state_ids.iter().enumerate() {let a=coefficient(r,c);expression=expression+Expr::int(a)*Expr::anonymous_symbol(*id);let x=c as i64+1;lo+=(a*x).min(a*(x+1));hi+=(a*x).max(a*(x+1));}
  outputs.push(expression);expected.push(d(lo,hi));
 }
 let source=compile(&outputs,&variables);let expected:[DyadicInterval;N]=expected.try_into().unwrap();
 run(&format!("affine_{N}"),FieldDefinition{source,time,state:state_ids},BoxN::new(core::array::from_fn(|i|d(i as i64+1,i as i64+2))).unwrap(),IntervalVector::new(expected).unwrap(),IntervalMatrix::new(core::array::from_fn(|r|core::array::from_fn(|c|{let a=coefficient(r,c);d(a,a)}))).unwrap());
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=SymbolId(0);let time=SymbolId(100);
 for degree in [0_i64,1,8,32,128] {
  let mut source=Expr::int(1);for _ in 0..degree {source=source*Expr::anonymous_symbol(x)+Expr::int(1);}source=source+Expr::anonymous_symbol(time);
  run(&format!("degree_{degree}"),FieldDefinition{source:compile(&[source],&[x,time]),time,state:vec![x]},BoxN::new([d(1,1)]).unwrap(),IntervalVector::new([d(degree+1,degree+2)]).unwrap(),IntervalMatrix::new([[d(degree*(degree+1)/2,degree*(degree+1)/2)]]).unwrap());
 }
 affine::<2>();affine::<4>();
}
