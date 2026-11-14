//! Complete repeated coordinate/derivative queries, including prepared graphs.
use hypercurve::{
    Aabb2, HomogeneousControl2, Point2, RationalBezier2,
    interval_ranges::{RationalBezierRangeEnclosure, prepare_rational_bezier_ranges},
};
use hyperinterval::{DyadicBudget, DyadicInterval};
use hyperreal::Real;
use hypersolve::expression_program::ExpressionBudget;
use std::hint::black_box;
fn source(case: usize) -> RationalBezier2 {
    match case {
        0 => RationalBezier2::try_new(
            vec![
                Point2::from_values(0, 0),
                Point2::from_values(1, 0),
                Point2::from_values(2, 1),
            ],
            vec![Real::one(); 3],
        )
        .unwrap(),
        1 => RationalBezier2::from_homogeneous_controls(vec![
            HomogeneousControl2::new(Real::from(0), Real::from(1), Real::from(1)),
            HomogeneousControl2::new(Real::from(1), Real::from(1), Real::from(2)),
        ])
        .unwrap(),
        _ => {
            let n = 8;
            RationalBezier2::try_new(
                (0..=n)
                    .map(|i| {
                        Point2::new(
                            (Real::from(i) / Real::from(n)).unwrap(),
                            Real::from(i32::from(i == n)),
                        )
                    })
                    .collect(),
                vec![Real::one(); n as usize + 1],
            )
            .unwrap()
        }
    }
}
fn complete(
    source: &RationalBezier2,
    shared: bool,
    graph: &mut ExpressionBudget,
    arithmetic: &mut DyadicBudget,
) -> Vec<RationalBezierRangeEnclosure> {
    let prepared = shared.then(|| prepare_rational_bezier_ranges(source, graph).unwrap());
    let mut reports = Vec::new();
    for i in 0..16 {
        let parameters = DyadicInterval::new(i.into(), (i + 1).into(), -4).unwrap();
        let report = match prepared.as_ref() {
            Some(p) => p.enclose(&parameters, -32, graph, arithmetic).unwrap(),
            None => prepare_rational_bezier_ranges(source, graph)
                .unwrap()
                .enclose(&parameters, -32, graph, arithmetic)
                .unwrap(),
        };
        assert_eq!(report.parameters(), &parameters);
        let projected = report.native_bounds(graph, arithmetic).unwrap();
        let query = Aabb2::new_unchecked(Point2::from_values(3, 3), Point2::from_values(4, 4));
        assert!(
            !projected
                .bounds()
                .expect("nonempty cell")
                .overlaps(&query)
                .unwrap()
        );
        reports.push(report);
    }
    reports
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
 for (case,name) in ["polynomial","rational","degree8"].into_iter().enumerate() {
  let curve=source(case);
  for shared in [false,true] {
   for _ in 0..16 {drop(complete(&curve,shared,&mut ExpressionBudget::new(1_000_000,100_000_000),&mut DyadicBudget::new(16384,1_000_000_000_000)));}
   let run=|| {
    CALLS.store(0,Ordering::Relaxed);BYTES.store(0,Ordering::Relaxed);LIVE.store(0,Ordering::Relaxed);PEAK.store(0,Ordering::Relaxed);
    let mut graph=ExpressionBudget::new(1_000_000,100_000_000);let mut arithmetic=DyadicBudget::new(16384,1_000_000_000_000);
    ACTIVE.store(true,Ordering::Relaxed);
    let reports=complete(black_box(&curve),shared,&mut graph,&mut arithmetic);
    let retained=LIVE.load(Ordering::Relaxed);drop(black_box(reports));ACTIVE.store(false,Ordering::Relaxed);
    assert_eq!(LIVE.load(Ordering::Relaxed),0,"whole query/destruction allocation scope");
    (100_000_000-graph.remaining_work(),1_000_000_000_000-arithmetic.remaining_work(),CALLS.load(Ordering::Relaxed),BYTES.load(Ordering::Relaxed),PEAK.load(Ordering::Relaxed),retained)
   };
   let first=run();for _ in 0..4 {assert_eq!(run(),first);}
   println!("{name}/{} graph={} native={} allocations={} requested_bytes={} peak_requested_live={} output_requested_live={}",if shared {"shared"}else{"independent"},first.0,first.1,first.2,first.3,first.4,first.5);
  }
 }
}
