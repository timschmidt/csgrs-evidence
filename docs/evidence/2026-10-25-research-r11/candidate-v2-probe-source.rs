use hypercurve::{BooleanOp, CircularArc2, Contour2, CurveRegion2, LineSeg2, Point2, Segment2};
fn p(x: i64, y: i64) -> Point2 { Point2::from_values(x, y) }
fn circle_at(offset: i64) -> Contour2 {
 Contour2::try_new(vec![
  Segment2::Arc(CircularArc2::try_from_center(p(offset+1,0),p(offset-1,0),p(offset,0),false).unwrap()),
  Segment2::Arc(CircularArc2::try_from_center(p(offset-1,0),p(offset+1,0),p(offset,0),false).unwrap()),
 ]).unwrap()
}
fn cap() -> Contour2 {
 Contour2::try_new(vec![
  Segment2::Line(LineSeg2::try_new(p(0,0),p(2,0)).unwrap()),
  Segment2::Line(LineSeg2::try_new(p(2,0),p(2,1)).unwrap()),
  Segment2::Arc(CircularArc2::try_from_center(p(2,1),p(0,1),p(1,1),false).unwrap()),
  Segment2::Line(LineSeg2::try_new(p(0,1),p(0,0)).unwrap()),
 ]).unwrap()
}

use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::time::Instant;
use std::io::Write;

struct CountingAllocator;
static ALLOCATED: AtomicUsize = AtomicUsize::new(0);
static LIVE: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);

fn grow(size: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    ALLOCATED.fetch_add(size, Ordering::Relaxed);
    let live = LIVE.fetch_add(size, Ordering::Relaxed) + size;
    PEAK.fetch_max(live, Ordering::Relaxed);
}

// SAFETY: The original pointers and layouts pass unchanged to System; the
// counters neither inspect allocations nor change their lifetime.
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc(layout) }
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc_zeroed(layout) }
    }
    unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, size: usize) -> *mut u8 {
        CALLS.fetch_add(1, Ordering::Relaxed);
        ALLOCATED.fetch_add(size, Ordering::Relaxed);
        if size >= layout.size() {
            let live = LIVE.fetch_add(size - layout.size(), Ordering::Relaxed) + size - layout.size();
            PEAK.fetch_max(live, Ordering::Relaxed);
        } else {
            LIVE.fetch_sub(layout.size() - size, Ordering::Relaxed);
        }
        unsafe { System.realloc(ptr, layout, size) }
    }
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        LIVE.fetch_sub(layout.size(), Ordering::Relaxed);
        unsafe { System.dealloc(ptr, layout) }
    }
}

#[global_allocator]
static GLOBAL: CountingAllocator = CountingAllocator;






fn rect(x0:i64,x1:i64,y0:i64,y1:i64)->Contour2 {
 Contour2::from_real_ring(&[[x0.into(),y0.into()],[x1.into(),y0.into()],[x1.into(),y1.into()],[x0.into(),y1.into()],[x0.into(),y0.into()]]).unwrap()
}
fn exact_rows(region: &CurveRegion2)->Vec<u8> {
 use hypercurve::CurveGeometry2;
 let point=|p:&Point2|serde_json::json!([p.x(),p.y()]);
 let loops:Vec<_>=region.boundary_loops().iter().map(|b|{
  b.curves().iter().map(|c|match c.geometry().unwrap(){
   CurveGeometry2::Line(l)=>serde_json::json!({"line":[point(l.start()),point(l.end())]}),
   CurveGeometry2::QuadraticBezier(q)=>serde_json::json!({"quadratic":q.control_points().into_iter().map(point).collect::<Vec<_>>()}),
   CurveGeometry2::CubicBezier(q)=>serde_json::json!({"cubic":q.control_points().into_iter().map(point).collect::<Vec<_>>()}),
   CurveGeometry2::RationalQuadraticBezier(q)=>serde_json::json!({"rational_quadratic":q.control_points().into_iter().map(point).collect::<Vec<_>>(),"weights":q.weights()}),
   other=>panic!("unexpected probe carrier {other:?}"),
  }).collect::<Vec<_>>()
 }).collect();
 serde_json::to_vec(&serde_json::json!({"loops":loops,"roles":format!("{:?}",region.loop_roles().unwrap()),"area":region.filled_area().unwrap()})).unwrap()
}
fn counters()->(usize,usize,usize){(LIVE.load(Ordering::Relaxed),ALLOCATED.load(Ordering::Relaxed),CALLS.load(Ordering::Relaxed))}
fn main(){
 let args:Vec<_>=std::env::args().collect();let mode=args[1].as_str();let count:usize=args[2].parse().unwrap();
 let mut materials=vec![if mode=="mixed" {cap()} else {rect(0,2,0,1)}];
 for i in 1..count {let x=10+4*i as i64; materials.push(if mode=="mixed" {circle_at(x)} else {rect(x,x+2,0,1)});}
 let a=CurveRegion2::try_from_native_contours(materials,vec![]).unwrap();
 let b=CurveRegion2::try_from_native_contours(vec![rect(1,3,0,1)],vec![]).unwrap();
 for sample in 0..5 {
  let (live,alloc,calls)=counters();PEAK.store(live,Ordering::Relaxed);
  let start=Instant::now();let outcome=hypercurve::evaluate_under(hyperlimit::PredicatePolicy::STRICT,||a.boolean_region(&b,BooleanOp::Union));
  let ns=start.elapsed().as_nanos();assert!(outcome.is_certified());let result=outcome.into_unverified().unwrap();
  let after=counters();let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);
  let start=Instant::now();for _ in 0..10 {std::hint::black_box(result.loop_roles().unwrap());}
  let query_ns=start.elapsed().as_nanos();let queries=counters();
  let bytes=exact_rows(&result);let checksum=bytes.iter().fold(14695981039346656037u64,|hash,b|(hash^u64::from(*b)).wrapping_mul(1099511628211));
  if sample==0 {std::fs::write(&args[3],&bytes).unwrap();}
  drop(bytes);drop(result);let dropped=counters();
  println!("{}",serde_json::json!({"mode":mode,"components":count,"sample":sample,"boolean_ns":ns,"boolean_bytes":after.1-alloc,"boolean_calls":after.2-calls,"peak_live_growth":peak,"result_live_growth":after.0.saturating_sub(live),"ten_queries_ns":query_ns,"query_bytes":queries.1-after.1,"query_calls":queries.2-after.2,"retained_after_drop":dropped.0 as i128-live as i128,"checksum":checksum.to_string()}));std::io::stdout().flush().unwrap();
 }
}
