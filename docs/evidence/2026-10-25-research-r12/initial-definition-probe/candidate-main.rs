use hypercurve::{BezierParameter2, Curve2, CurveGeometry2, CurveParameter2, CurvePoint2, CurvePointDefinition2, LineSeg2, Point2, Real, CurvePath2, CurveRegion2, FillRule, OffsetCap, OffsetCornerStyle2, PredicatePolicy, QuadraticBezier2, RegionPointLocation, evaluate_under};
use serde_json::{json, Value};
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







fn p(x:i32,y:i32)->Point2 {Point2::from_values(x,y)}
fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn xy(p:&Point2)->Value {json!([p.x(),p.y()])}
fn parallel(p:&hypercurve::BezierParallel2)->Value {
 let source=match p.source(){
  hypercurve::BezierParallelSource2::Quadratic(s)=>json!({"quadratic":s.control_points().into_iter().map(xy).collect::<Vec<_>>()}),
  hypercurve::BezierParallelSource2::Cubic(s)=>json!({"cubic":s.control_points().into_iter().map(xy).collect::<Vec<_>>()}),
  hypercurve::BezierParallelSource2::Rational(s)=>json!({"rational":s.homogeneous_controls().iter().map(|h|json!([h.x(),h.y(),h.weight()])).collect::<Vec<_>>(),"weights":s.weights()}),
 };
 json!({"source":source,"distance":p.distance()})
}
fn param(p:&CurveParameter2)->Value {
 if let Some(p)=p.as_bezier_parameter(){return match p {
  BezierParameter2::Exact(x)=>json!({"exact":x}),
  BezierParameter2::Algebraic(x)=>json!({"polynomial":x.polynomial().coefficients(),"interval":[x.interval().start(),x.interval().end()],"root_count":x.root_count()}),
 };}
 if let Some(p)=p.affine_form_source(){return json!({"affine":p.coefficients(),"point":point(p.source())});}
 panic!("probe parameter has no admitted exact encoding")
}
fn point(p:&CurvePoint2)->Value {
 match p.definition().unwrap(){
  CurvePointDefinition2::Coordinates(p)=>json!({"coordinates":xy(&p)}),
  CurvePointDefinition2::Parallel{source,parameter}=>json!({"parallel":parallel(&source),"parameter":param(&parameter)}),
  CurvePointDefinition2::Rational{source,parameter}=>json!({"rational":source.homogeneous_controls().iter().map(|h|json!([h.x(),h.y(),h.weight()])).collect::<Vec<_>>(),"weights":source.weights(),"parameter":param(&parameter)}),
  CurvePointDefinition2::RationalExpression{parameter,x_numerator,y_numerator,denominator}=>json!({"parameter":param(&parameter.into()),"x":x_numerator,"y":y_numerator,"w":denominator}),
  CurvePointDefinition2::Similarity{source,transform}=>json!({"source":point(&source),"similarity":transform.affine_components()}),
  CurvePointDefinition2::SupportingLineIntersection{first,second}=>json!({"lines":[first.iter().map(point).collect::<Vec<_>>(),second.iter().map(point).collect::<Vec<_>>()]}),
  other=>panic!("unexpected point definition {other:?}"),
 }
}
fn curve(c:&Curve2)->Value {
 let domain=c.parameter_domain();
 let geometry=if let Some(a)=c.analytic_parallel(){
  json!({"parallel":parallel(a.parallel()),"reversed":a.is_reversed()})
 }else if let Some(g)=c.geometry(){match g {
  CurveGeometry2::Line(l)=>json!({"line":[xy(l.start()),xy(l.end())]}),
  CurveGeometry2::CircularArc(a)=>json!({"arc":[xy(a.start()),xy(a.end()),xy(a.center())],"clockwise":a.is_clockwise()}),
  CurveGeometry2::QuadraticBezier(b)=>json!({"quadratic":b.control_points().into_iter().map(xy).collect::<Vec<_>>()}),
  CurveGeometry2::CubicBezier(b)=>json!({"cubic":b.control_points().into_iter().map(xy).collect::<Vec<_>>()}),
  CurveGeometry2::RationalQuadraticBezier(b)=>json!({"rational_quadratic":b.control_points().into_iter().map(xy).collect::<Vec<_>>(),"weights":b.weights()}),
  CurveGeometry2::RationalBezier(b)=>json!({"rational":b.homogeneous_controls().iter().map(|h|json!([h.x(),h.y(),h.weight()])).collect::<Vec<_>>(),"weights":b.weights()}),
  other=>panic!("unexpected geometry {other:?}"),
 }}else {assert_eq!(c.family(),hypercurve::CurveFamily2::Line);json!({"retained_line":true})};
 json!({"geometry":geometry,"start":point(&c.start()),"end":point(&c.end()),"range":[param(domain.start()),param(domain.end())]})
}
fn rows(r:&CurveRegion2)->Value {
 json!({"loops":r.boundary_loops().iter().map(|b|b.curves().iter().map(curve).collect::<Vec<_>>()).collect::<Vec<_>>(),"roles":format!("{:?}",r.loop_roles().unwrap())})
}
fn fixture(kind:u8,reversed:bool)->(CurvePath2,CurvePoint2) {
 let source=QuadraticBezier2::new(p(0,0),p(1,1),p(2,1));
 let distance=if kind==3 {-q(1,10)}else{Real::zero()};
 let join=Point2::new(2.into(),Real::one()+&distance);
 let end=Point2::new(3.into(),Real::one()+&distance);
 let first:Curve2=match kind {
  0=>LineSeg2::try_new(p(0,1),p(2,1)).unwrap().into(),
  1=>source.into(),
  _=>Curve2::try_analytic_parallel(source.parallel_left(distance.clone()).unwrap(),hypercurve::BezierParameterRange2::try_new(BezierParameter2::Exact(Real::zero()),BezierParameter2::Exact(Real::one())).unwrap()).unwrap(),
 };
 let mut curves=Vec::new();
 if kind>=2 {
  let dy=(&distance/Real::from(2).sqrt().unwrap()).unwrap();
  let start=Point2::new(-dy.clone(),dy);
  let lead=Point2::new(start.x()-Real::one(),start.y()-Real::one());
  curves.push(LineSeg2::try_new(lead,start).unwrap().into());
 }
 curves.push(first);curves.push(LineSeg2::try_new(join.clone(),end).unwrap().into());
 let path=CurvePath2::try_new(curves).unwrap();
 (if reversed{path.reversed().unwrap()}else{path},join.into())
}
fn counters()->(usize,usize,usize){(LIVE.load(Ordering::Relaxed),ALLOCATED.load(Ordering::Relaxed),CALLS.load(Ordering::Relaxed))}
fn main(){
 let args:Vec<_>=std::env::args().collect();let kind:u8=args[1].parse().unwrap();let reversed=args[2]=="reverse";
 let policy=if args[3]=="strict" {PredicatePolicy::STRICT}else{PredicatePolicy::APPROXIMATE_512};
 let (path,join)=fixture(kind,reversed);let width=q(1,10);
 for sample in 0..20 {
  let (live,bytes,calls)=counters();PEAK.store(live,Ordering::Relaxed);let start=Instant::now();
  let outcome=evaluate_under(policy,||CurveRegion2::stroke_path(&path,width.clone(),&OffsetCornerStyle2::Round,OffsetCap::Round));
  let ns=start.elapsed().as_nanos();assert!(outcome.is_certified());let result=outcome.into_unverified().unwrap();let after=counters();let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);
  let continuation=Instant::now();
  let checked=evaluate_under(PredicatePolicy::STRICT,||{
   for point in [path.start(),join.clone(),path.end()] {assert_eq!(result.classify_point(&point).unwrap(),RegionPointLocation::Inside);}
   assert_eq!(result.classify_point(&p(-10,-10).into()).unwrap(),RegionPointLocation::Outside);
   let rebuilt=CurveRegion2::try_from_boundary_paths(&result.boundary_paths().unwrap(),FillRule::NonZero).unwrap();
   assert_eq!(rebuilt.classify_point(&join).unwrap(),RegionPointLocation::Inside);
   let exact=serde_json::to_vec(&json!({"stroke":rows(&result),"rebuilt":rows(&rebuilt),"certainty":"Certified"})).unwrap();
   (rebuilt,exact)
  });
  let continuation_ns=continuation.elapsed().as_nanos();assert!(checked.is_certified());let (rebuilt,exact)=checked.into_unverified();let checked_counts=counters();
  let checksum=exact.iter().fold(14695981039346656037u64,|hash,b|(hash^u64::from(*b)).wrapping_mul(1099511628211));
  if sample==0 {std::fs::write(&args[4],&exact).unwrap();}let output_size=exact.len();drop(exact);drop(rebuilt);drop(result);let dropped=counters();
  println!("{}",json!({"kind":kind,"reversed":reversed,"policy":args[3],"sample":sample,"status":"completed","certainty":"Certified","ns":ns,"bytes":after.1-bytes,"calls":after.2-calls,"peak_live_growth":peak,"result_live_growth":after.0.saturating_sub(live),"continuation_ns":continuation_ns,"continuation_bytes":checked_counts.1-after.1,"continuation_calls":checked_counts.2-after.2,"retained_after_drop":dropped.0 as i128-live as i128,"checksum":checksum.to_string(),"output_size":output_size}));std::io::stdout().flush().unwrap();
 }
}
