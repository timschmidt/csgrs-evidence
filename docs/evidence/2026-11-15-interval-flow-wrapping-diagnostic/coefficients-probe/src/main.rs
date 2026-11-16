use std::{alloc::{GlobalAlloc,Layout,System},sync::atomic::{AtomicBool,AtomicIsize,AtomicUsize,Ordering},hint::black_box};
use hyperreal::{Real,Rational,dispatch_trace};
use hyperlimit::{PredicatePolicy,classify_real_sign};
use hypersolve::{SymbolId,SymbolRef,expression_program::{ExpressionProgram,ExpressionDefinition,ExpressionNode,BinaryOperation,CoefficientRequest,ExpressionBudget}};
use serde_json::json;
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


fn graph() -> ExpressionBudget { ExpressionBudget::new(100_000,10_000_000) }
fn source() -> (ExpressionProgram,Vec<CoefficientRequest>,Real) {
 let x=SymbolId(7);
 let k=Real::from("123456789012345678901234567890123456789012345678901234567890".parse::<Rational>().unwrap());
 let source=ExpressionProgram::from_definition(ExpressionDefinition {
 variables:vec![x], nodes:vec![
 ExpressionNode::Variable(SymbolRef::new(x,Some("retained_named_coordinate".repeat(8)))),
 ExpressionNode::Constant(k.clone()),
 ExpressionNode::Binary{operation:BinaryOperation::Mul,left:0,right:0},
 ExpressionNode::Binary{operation:BinaryOperation::Mul,left:1,right:2},
 ExpressionNode::Binary{operation:BinaryOperation::Add,left:3,right:0}],
 outputs:vec![4,4,1]},&mut graph()).unwrap();
 let requests=(0..3).flat_map(|output|(1..=3).map(move |degree|CoefficientRequest{output,powers:vec![(x,degree)]})).collect();
 (source,requests,k)
}
fn main() {
 for policy in [PredicatePolicy::STRICT,PredicatePolicy::APPROXIMATE_512] {
  let (s,r,k)=source(); let mut g=graph();dispatch_trace::reset();
  let (result,values,receipts)=dispatch_trace::with_recording(||{
   let result=s.coefficients(&r,&mut g).unwrap();
   let values=result.program().eval_real(&[2.into()],&mut g).unwrap();
   let receipts:Vec<_>=values.iter().map(|v|classify_real_sign(v,policy)).collect();
   (result,values,receipts)
  });
  let trace=dispatch_trace::take_trace();
  let value=k.clone()*Real::from(4)+Real::from(2);
  let first=k.clone()*Real::from(4)+Real::one();
  assert_eq!(values,vec![value.clone(),value,k.clone(),first.clone(),k.clone(),Real::zero(),first,k,Real::zero(),Real::zero(),Real::zero(),Real::zero()]);
  println!("{}",json!({"kind":"control","policy":format!("{policy:?}"),"graph_work":10_000_000-g.remaining_work(),"definition":result.program().definition(),"values":values,"receipts":format!("{receipts:?}"),"trace":format!("{trace:?}")}));
 }
 let (s,r,_)=source();let mut full=graph();let result=s.coefficients(&r,&mut full).unwrap();let work=10_000_000-full.remaining_work();
 for limit in 0..=work {
  let mut g=ExpressionBudget::new(100_000,limit);
  let out=s.coefficients(&r,&mut g);
  if let Ok(ref out)=out {assert_eq!(out.program().definition(),result.program().definition());}
  println!("{}",json!({"kind":"work","limit":limit,"remaining":g.remaining_work(),"result":out.err().map(|e|format!("{e:?}"))}));
 }
 for limit in 0..=100 {
  let mut g=ExpressionBudget::new(limit,10_000_000);let out=s.coefficients(&r,&mut g);
  println!("{}",json!({"kind":"size","limit":limit,"remaining":g.remaining_work(),"result":out.err().map(|e|format!("{e:?}"))}));
 }
 let stats=measure(100,||s.coefficients(&r,&mut graph()).unwrap());
 assert_eq!(stats.live_bytes,0);
 println!("{}",json!({"kind":"allocations","iterations":100,"allocations":stats.allocations,"deallocations":stats.deallocations,"reallocations":stats.reallocations,"allocated_bytes":stats.allocated_bytes,"peak_live_bytes":stats.peak_live_bytes,"live_bytes":stats.live_bytes}));
}
