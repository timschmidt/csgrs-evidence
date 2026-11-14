//! Complete independent/shared adaptive histories, including all trajectory preparation.
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    evolution::{EvolutionOptions, EvolutionRequest},
    taylor_flow::adaptive::{
        AdaptiveTaylorEvolution, AdaptiveTaylorField, AdaptiveTaylorOptions, AdaptiveTaylorStatus,
        shared::{SharedAdaptiveTaylorEvolution, SharedAdaptiveTaylorField},
    },
};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram},
};
use std::hint::black_box;
fn d(l: i64, u: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(l.into(), u.into(), e).unwrap()
}
fn budget() -> EnclosureBudget {
    EnclosureBudget::new(EnclosurePolicy::default())
}
fn controller(case: usize) -> AdaptiveTaylorField<1> {
    let t = SymbolId(0);
    let x = SymbolId(1);
    let v = Expr::anonymous_symbol(x);
    let rhs = match case {
        0 => Expr::int(2),
        1 => v,
        _ => v.clone() * v,
    };
    let p = ExpressionProgram::compile(
        &[rhs],
        &[x, t],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    let f = ExpressionField::<1>::from_definition(
        FieldDefinition {
            source: p.definition().clone(),
            time: t,
            state: vec![x],
        },
        &mut budget(),
    )
    .unwrap();
    f.adaptive_taylor(AdaptiveTaylorOptions {
        maximum_order: 3,
        remainder_limits: [d(1, 1, -10)],
        native: EvolutionOptions {
            maximum_step: Some(d(1, 1, -3)),
            ..Default::default()
        },
        ..Default::default()
    })
}
fn request() -> EvolutionRequest<1> {
    EvolutionRequest {
        start: d(0, 0, 0),
        end: d(1, 1, -2),
        initial: BoxN::new([d(1, 1, 0)]).unwrap(),
    }
}
enum Outcome {
    Independent(AdaptiveTaylorEvolution<1>),
    Shared(SharedAdaptiveTaylorEvolution<1>),
}
impl Outcome {
    fn report(&self) -> &AdaptiveTaylorEvolution<1> {
        match self {
            Self::Independent(r) => r,
            Self::Shared(r) => r.report(),
        }
    }
}
fn complete(
    c: &AdaptiveTaylorField<1>,
    shared: &SharedAdaptiveTaylorField<1>,
    reuse: bool,
    b: &mut EnclosureBudget,
) -> Outcome {
    let out = if reuse {
        Outcome::Shared(shared.integrate(request(), b))
    } else {
        Outcome::Independent(c.integrate(request(), b))
    };
    assert!(matches!(
        out.report().status(),
        AdaptiveTaylorStatus::Completed
    ));
    for segment in out.report().segments() {
        assert_eq!(segment.refinement().meets_limits(), Some(true));
        assert!(segment.refinement().evidence().remainder().is_some());
    }
    out
}

use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicBool, AtomicU64, AtomicI64, Ordering};
struct Counting;
static ACTIVE: AtomicBool = AtomicBool::new(false);
static CALLS: AtomicU64 = AtomicU64::new(0);
static BYTES: AtomicU64 = AtomicU64::new(0);
static LIVE: AtomicI64 = AtomicI64::new(0);
static PEAK: AtomicI64 = AtomicI64::new(0);
fn record(size:usize,delta:i64) {
 CALLS.fetch_add(1,Ordering::Relaxed);BYTES.fetch_add(size as u64,Ordering::Relaxed);
 let live=LIVE.fetch_add(delta,Ordering::Relaxed)+delta;PEAK.fetch_max(live,Ordering::Relaxed);
}
unsafe impl GlobalAlloc for Counting {
 unsafe fn alloc(&self,l:Layout)->*mut u8 {
  let ptr=unsafe {System.alloc(l)};
  if !ptr.is_null() && ACTIVE.load(Ordering::Relaxed) {record(l.size(),l.size() as i64);}
  ptr
 }
 unsafe fn dealloc(&self,p:*mut u8,l:Layout) {
  if ACTIVE.load(Ordering::Relaxed) {LIVE.fetch_sub(l.size() as i64,Ordering::Relaxed);}
  unsafe {System.dealloc(p,l)}
 }
 unsafe fn realloc(&self,p:*mut u8,l:Layout,n:usize)->*mut u8 {
  let ptr=unsafe {System.realloc(p,l,n)};
  if !ptr.is_null() && ACTIVE.load(Ordering::Relaxed) {record(n,n as i64-l.size() as i64);}
  ptr
 }
}
#[global_allocator] static ALLOC:Counting=Counting;
fn main() {
 for (case,name) in ["constant","exponential","riccati"].into_iter().enumerate() {
  let f=controller(case);let shared=f.clone().share_preparation();let expected=complete(&f,&shared,false,&mut budget());
  for reuse in [false,true] {
   let run=|| {
    CALLS.store(0,Ordering::Relaxed);BYTES.store(0,Ordering::Relaxed);LIVE.store(0,Ordering::Relaxed);PEAK.store(0,Ordering::Relaxed);
    let mut b=budget();
    ACTIVE.store(true,Ordering::Relaxed);
    let reports=complete(black_box(&f),&shared,reuse,&mut b);
    assert_eq!(reports.report().end_enclosure(),expected.report().end_enclosure());assert_eq!(reports.report().attempts().len(),expected.report().attempts().len());assert_eq!(reports.report().segments().len(),expected.report().segments().len());
    let retained=LIVE.load(Ordering::Relaxed);
    drop(black_box(reports));
    ACTIVE.store(false,Ordering::Relaxed);
    assert_eq!(LIVE.load(Ordering::Relaxed),0,"diagnostic scope must balance allocations");
    (b.policy().graph_work-b.remaining_graph_work(),b.policy().scalar_work-b.remaining_scalar_work(),CALLS.load(Ordering::Relaxed),BYTES.load(Ordering::Relaxed),PEAK.load(Ordering::Relaxed),retained)
   };
   for _ in 0..16 {run();}
   let first=run();for _ in 0..4 {assert_eq!(run(),first);}
   println!("{name}/{} graph={} native={} allocations={} requested_bytes={} peak_requested_live={} output_requested_live={}",if reuse {"shared"}else{"independent"},first.0,first.1,first.2,first.3,first.4,first.5);
  }
 }
}
