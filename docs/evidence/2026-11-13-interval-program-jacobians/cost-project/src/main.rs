use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
use hyperreal::Real;
use hyperinterval::{DyadicBudget,DyadicInterval};
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


fn budget()->ExpressionBudget { ExpressionBudget::new(1_000_000,100_000_000) }
fn timed<T>(name:&str,op:&str,mut f:impl FnMut()->T) {
 print_row(name,op,32,measure(32,&mut f));
 let mut samples=Vec::new();
 for _ in 0..31 { let t=Instant::now();for _ in 0..8 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/8.0); }
 println!("TIMING {name}/{op} ns_per_operation={samples:?}");
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=SymbolId(0);
 for degree in [1_i64,8,32,128] {
  let mut source=Expr::int(1);
  for _ in 0..degree { source=Expr::Add(Box::new(Expr::Mul(Box::new(source),Box::new(Expr::anonymous_symbol(x)))),Box::new(Expr::int(1))); }
  let source=ExpressionProgram::compile(&[source],&[x],&mut budget()).unwrap();
  let mut work=budget();let jacobian=source.jacobian(&[x],&mut work).unwrap();
  let expected=[Real::from(degree+1),Real::from(degree*(degree+1)/2)];
  let input=[Real::one()];let intervals=[DyadicInterval::point(1.into(),0).unwrap()];
  let expected_intervals=[DyadicInterval::point((degree+1).into(),0).unwrap(),DyadicInterval::point((degree*(degree+1)/2).into(),0).unwrap()];
  let name=format!("degree_{degree}");
  println!("RESOURCE {name} source_nodes={} generated_nodes={} graph_work={}",source.definition().nodes.len(),jacobian.program().definition().nodes.len(),100_000_000-work.remaining_work());
  timed(&name,"differentiate",||{source.jacobian(black_box(&[x]),&mut budget()).unwrap()});
  timed(&name,"replay",||{
   let replay=ExpressionProgram::from_definition(black_box(source.definition()).clone(),&mut budget()).unwrap();
   replay.jacobian(&[x],&mut budget()).unwrap()
  });
  timed(&name,"evaluate-real",||{
   let result=jacobian.program().eval_real(black_box(&input),&mut budget()).unwrap();assert_eq!(result,expected);result
  });
  timed(&name,"evaluate-interval",||{
   let result=jacobian.program().eval_dyadic(black_box(&intervals),-32,&mut budget(),&mut DyadicBudget::new(16_384,1_000_000_000_000)).unwrap();assert_eq!(result,expected_intervals);result
  });
  for work in [0,1,16] {print_row(&name,&format!("exhaust-{work}"),32,measure(32,||{
   let result=source.jacobian(&[x],&mut ExpressionBudget::new(1_000_000,work));assert!(result.is_err());result
  }));}
  assert_eq!(source.jacobian(&[x],&mut budget()).unwrap().program().eval_real(&input,&mut budget()).unwrap(),expected);
 }
}
