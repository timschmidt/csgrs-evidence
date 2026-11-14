//! Fresh complete order portfolio, including all preparation, proofs and destruction.
use hyperdynamics::field::{
    EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition,
    picard::PicardProposal,
    taylor_flow::{FlowTaylorReport, FlowTaylorStatus},
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
fn field(case: usize) -> ExpressionField<1> {
    let t = SymbolId(0);
    let x = SymbolId(1);
    let expr = Expr::anonymous_symbol(x);
    let rhs = match case {
        0 => Expr::int(2),
        1 => expr,
        _ => expr.clone() * expr,
    };
    let source = ExpressionProgram::compile(
        &[rhs],
        &[x, t],
        &mut ExpressionBudget::new(1_000_000, 100_000_000),
    )
    .unwrap();
    ExpressionField::from_definition(
        FieldDefinition {
            source: source.definition().clone(),
            time: t,
            state: vec![x],
        },
        &mut budget(),
    )
    .unwrap()
}
fn proposal() -> PicardProposal<1> {
    PicardProposal {
        start: d(0, 0, 0),
        end: d(1, 1, -3),
        initial: BoxN::new([d(1, 1, 0)]).unwrap(),
        candidate: BoxN::new([d(1, 2, 0)]).unwrap(),
    }
}
fn complete(
    f: &ExpressionField<1>,
    reuse: bool,
    b: &mut EnclosureBudget,
) -> Vec<FlowTaylorReport<1>> {
    let high = if reuse {
        Some(f.flow_taylor(3, b).unwrap())
    } else {
        None
    };
    (0..=3)
        .map(|order| {
            let p = if let Some(high) = &high {
                high.restrict_order(order, b).unwrap()
            } else {
                f.flow_taylor(order, b).unwrap()
            };
            let r = p.certify_step(proposal(), b);
            assert!(matches!(r.status(), FlowTaylorStatus::Certified));
            assert_eq!(r.evidence().coefficients().len(), order);
            assert_eq!(r.evidence().end_terms().len(), order + 1);
            assert!(r.evidence().remainder().is_some());
            r
        })
        .collect()
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
  let f=field(case);let expected=complete(&f,false,&mut budget());
  for reuse in [false,true] {
   let run=|| {
    CALLS.store(0,Ordering::Relaxed);BYTES.store(0,Ordering::Relaxed);LIVE.store(0,Ordering::Relaxed);PEAK.store(0,Ordering::Relaxed);
    let mut b=budget();
    ACTIVE.store(true,Ordering::Relaxed);
    let reports=complete(black_box(&f),reuse,&mut b);
    for (r,e) in reports.iter().zip(&expected) {assert_eq!(r.end_enclosure(),e.end_enclosure());assert_eq!(r.tube(),e.tube());}
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
