use hypercurve::{BooleanOp, CircularArc2, Contour2, CurveRegion2, LineSeg2, Point2, Segment2};
fn p(x: i64, y: i64) -> Point2 { Point2::from_values(x, y) }
fn circle() -> Contour2 {
 Contour2::try_new(vec![
  Segment2::Arc(CircularArc2::try_from_center(p(11,0),p(9,0),p(10,0),false).unwrap()),
  Segment2::Arc(CircularArc2::try_from_center(p(9,0),p(11,0),p(10,0),false).unwrap()),
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
fn main() {
 let a=CurveRegion2::try_from_native_contours(vec![cap(),circle()],vec![]).unwrap();
 let rectangle=Contour2::from_real_ring(&[[1.into(),0.into()],[3.into(),0.into()],[3.into(),1.into()],[1.into(),1.into()],[1.into(),0.into()]]).unwrap();
 let b=CurveRegion2::try_from_native_contours(vec![rectangle],vec![]).unwrap();
 hyperreal::dispatch_trace::reset();
 let union=hyperreal::dispatch_trace::with_recording(||a.boolean_region(&b,BooleanOp::Union)).unwrap();
 println!("loops={}, fragments={:?}",union.len(),union.boundary_loops().iter().map(|b|b.curves().len()).collect::<Vec<_>>());
 println!("construct={:?}",hyperreal::dispatch_trace::take().into_iter().filter(|r|r.operation.contains("loop-roles") || r.operation == "r11-probe" || r.operation.contains("role-transport")).collect::<Vec<_>>());
 for query in 0..2 {
  let roles=hyperreal::dispatch_trace::with_recording(||union.loop_roles()).unwrap();
  println!("query={query} roles={roles:?} trace={:?}",hyperreal::dispatch_trace::take().into_iter().filter(|r|r.operation.contains("loop-roles") || r.operation == "r11-probe" || r.operation.contains("role-transport")).collect::<Vec<_>>());
 }
}
