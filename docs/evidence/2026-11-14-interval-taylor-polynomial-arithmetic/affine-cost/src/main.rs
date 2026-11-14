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


use hypersolve::expression_program::{TaylorRequest,TaylorModel,TaylorAffineModel,TaylorAffineMap,TaylorAffineRow};
use hyperreal::{Real,Rational};
use hyperinterval::DyadicBudget;
use std::sync::Arc;
fn graph()->ExpressionBudget {ExpressionBudget::new(100_000,10_000_000)}
fn scalar()->DyadicBudget {DyadicBudget::new(16384,1_000_000_000_000)}
fn d(a:i64,b:i64,e:i32)->DyadicInterval{DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn map(rows:&[&[i32]],inputs:usize)->TaylorAffineMap{TaylorAffineMap{input_count:inputs,rows:rows.iter().map(|r|TaylorAffineRow{coefficients:r.iter().map(|&v|Real::from(v)).collect(),offset:Real::zero()}).collect()}}
fn timed<T>(name:&str,op:&str,mut f:impl FnMut()->T){
 print_row(name,op,32,measure(32,&mut f));let mut samples=Vec::new();
 for _ in 0..31 {let t=Instant::now();for _ in 0..8{drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/8.0);}
 println!("TIMING {name}/{op} ns_per_operation={samples:?}");
}
fn run(name:&str,source:Arc<TaylorModel>, transform:TaylorAffineMap, expected:&[DyadicInterval]){
 let mut g=graph();let mut a=scalar();let gw=g.remaining_work();let sw=a.remaining_work();
 let image=TaylorAffineModel::new(source.clone(),transform.clone(),&mut g,&mut a).unwrap();assert_eq!(image.range().bounds(),expected);
 let gw=gw-g.remaining_work();let sw=sw-a.remaining_work();
 println!("COMPLETE {name} graph={gw} scalar={sw} terms={} outputs={} image={:?} remainder={:?}",image.terms().len(),image.map().rows.len(),image.range().bounds(),image.remainder());
 timed(name,"construct",||{let v=TaylorAffineModel::new(source.clone(),transform.clone(),&mut graph(),&mut scalar()).unwrap();assert_eq!(v.range().bounds(),expected);assert!(Arc::ptr_eq(v.source(),&source));v});
 timed(name,"reuse",||{let v=image.enclose_on(&source.request().domain,&mut graph(),&mut scalar()).unwrap();assert_eq!(v.bounds(),expected);v});
 if expected.len()==2 {
  timed(name,"eight-roundtrips",||{let mut v=TaylorAffineModel::new(source.clone(),transform.clone(),&mut graph(),&mut scalar()).unwrap();let mut g=graph();let mut a=scalar();for _ in 0..8{v=v.transform(map(&[&[1,1],&[0,1]],2),&mut g,&mut a).unwrap().transform(map(&[&[1,-1],&[0,1]],2),&mut g,&mut a).unwrap();}assert_eq!(v.range().bounds(),expected);assert!(Arc::ptr_eq(v.source(),&source));assert_eq!(v.terms().len(),image.terms().len());v});
 }
 let encoded=serde_json::to_string(&(source.source().definition(),source.request(),image.map())).unwrap();
 timed(name,"replay",||{let(definition,request,map):(hypersolve::expression_program::ExpressionDefinition,TaylorRequest,TaylorAffineMap)=serde_json::from_str(&encoded).unwrap();let mut g=graph();let mut a=scalar();let p=ExpressionProgram::from_definition(definition,&mut g).unwrap();let source=Arc::new(p.taylor_model(request,&mut g,&mut a).unwrap());let v=TaylorAffineModel::new(source,map,&mut g,&mut a).unwrap();assert_eq!(v.range().bounds(),expected);v});
 let guard=CountingGuard::start();let v=TaylorAffineModel::new(source.clone(),transform.clone(),&mut graph(),&mut scalar()).unwrap();let retained=AllocationStats::snapshot();drop(v);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);println!("RETAINED {name} incremental={} peak={} after_drop={}",retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
 for (label,gg,ss) in [("graph-zero",0,1_000_000_000_000),("graph-short",gw-1,1_000_000_000_000),("scalar-short",10_000_000,sw-1)] {
  print_row(name,label,32,measure(32,||TaylorAffineModel::new(source.clone(),transform.clone(),&mut ExpressionBudget::new(100_000,gg),&mut DyadicBudget::new(16384,ss)).unwrap_err()));
 }
 assert_eq!(TaylorAffineModel::new(source,transform,&mut graph(),&mut scalar()).unwrap().range().bounds(),expected);
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let (x,y)=(Expr::anonymous_symbol(SymbolId(0)),Expr::anonymous_symbol(SymbolId(1)));
 let p=ExpressionProgram::compile(&[x.clone().powi(2)+y.clone(),x.clone().powi(2)-y],&[SymbolId(0),SymbolId(1)],&mut graph()).unwrap();
 let source=Arc::new(p.taylor_model(TaylorRequest{center:vec![d(0,0,0);2],domain:vec![d(-1,1,0);2],order:2,precision:-64},&mut graph(),&mut scalar()).unwrap());
 let half=Real::from(Rational::from(1)/Rational::from(2));let transform=TaylorAffineMap{input_count:2,rows:vec![TaylorAffineRow{coefficients:vec![half.clone(),half.clone()],offset:Real::zero()},TaylorAffineRow{coefficients:vec![half.clone(),-half],offset:Real::zero()}]};
 run("coupled",source,transform,&[d(0,1,0),d(-1,1,0)]);
 let p=ExpressionProgram::compile(&[Expr::int(1)/(Expr::int(1)-x.clone())],&[SymbolId(0)],&mut graph()).unwrap();
 let source=Arc::new(p.taylor_model(TaylorRequest{center:vec![d(0,0,0)],domain:vec![d(-1,1,-2)],order:0,precision:-64},&mut graph(),&mut scalar()).unwrap());
 let expected=source.image()[0].clone();run("reciprocal-copy",source,map(&[&[1],&[1]],1),&[expected.clone(),expected]);
}
