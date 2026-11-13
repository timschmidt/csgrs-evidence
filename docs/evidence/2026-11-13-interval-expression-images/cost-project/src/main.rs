use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
use hyperinterval::{DyadicBudget, DyadicInterval};
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


fn graph() -> ExpressionBudget { ExpressionBudget::new(100_000, 1_000_000) }
fn arithmetic() -> DyadicBudget { DyadicBudget::new(16_384, 1_000_000_000_000) }
fn main() {
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));
 let mut cases=vec![
  ("constant".to_owned(),Expr::int(7)), ("variable".to_owned(),x.clone()),
  ("add".to_owned(),x.clone()+Expr::int(2)), ("sub".to_owned(),x.clone()-Expr::int(2)),
  ("mul".to_owned(),x.clone()*Expr::int(2)), ("div".to_owned(),x.clone()/Expr::int(2)),
  ("neg".to_owned(),-x.clone()), ("pow".to_owned(),x.clone().powi(3)),
  ("sqrt".to_owned(),x.clone().sqrt()), ("sin".to_owned(),x.clone().sin()),
  ("cos".to_owned(),x.clone().cos()), ("ln".to_owned(),x.clone().ln()),
  ("log10".to_owned(),x.clone().log10()), ("asin".to_owned(),x.clone().asin()),
  ("acos".to_owned(),x.clone().acos()), ("acosh".to_owned(),(x.clone()+Expr::int(1)).acosh()),
  ("atanh".to_owned(),x.clone().atanh()),
 ];
 for degree in [1,8,32,128] {
  let mut source=Expr::int(1);
  for _ in 0..degree { source=Expr::Add(Box::new(Expr::Mul(Box::new(source),Box::new(x.clone()))),Box::new(Expr::int(1))); }
  cases.push((format!("degree_{degree}"),source));
 }
 let input=[DyadicInterval::new(1.into(),2.into(),-2).unwrap()];
 for (label,source) in cases {
  let program=ExpressionProgram::compile(&[source],&[SymbolId(0)],&mut graph()).unwrap();
  for precision in [-16,-64] {
   let name=format!("{label}/p{precision}");
   let mut gb=graph();let mut db=arithmetic();
   let expected=program.eval_dyadic(&input,precision,&mut gb,&mut db).unwrap();
   assert_eq!(expected.len(),1); assert!(!expected[0].is_empty());
   println!("RESOURCE {name} graph={} arithmetic={} output={expected:?}",1_000_000-gb.remaining_work(),1_000_000_000_000-db.remaining_work());
   print_row(&name,"evaluate",32,measure(32,||{
    let output=program.eval_dyadic(black_box(&input),precision,&mut graph(),&mut arithmetic()).unwrap();
    assert_eq!(output,expected); output
   }));
   let mut samples=Vec::new();
   for _ in 0..31 {
    let start=Instant::now();
    for _ in 0..8 {
     let output=program.eval_dyadic(black_box(&input),precision,&mut graph(),&mut arithmetic()).unwrap();
     assert_eq!(output,expected); drop(black_box(output));
    }
    samples.push(start.elapsed().as_nanos() as f64/8.0);
   }
   println!("TIMING {name} ns_per_operation={samples:?}");
   for work in [0,1] {
    print_row(&name,&format!("arithmetic-exhaust-{work}"),32,measure(32,||{
     let result=program.eval_dyadic(&input,precision,&mut graph(),&mut DyadicBudget::new(16_384,work));
     assert!(result.is_err()); result
    }));
   }
   assert_eq!(program.eval_dyadic(&input,precision,&mut graph(),&mut arithmetic()).unwrap(),expected);
  }
 }
}
