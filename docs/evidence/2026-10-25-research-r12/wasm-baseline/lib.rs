use hypercurve::{BezierParameter2, Curve2, CurvePoint2, LineSeg2, Point2, Real, CurvePath2, CurveRegion2, FillRule, OffsetCap, OffsetCornerStyle2, PredicatePolicy, QuadraticBezier2, RegionPointLocation, evaluate_under};
fn p(x:i32,y:i32)->Point2 {Point2::from_values(x,y)}
fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
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

#[unsafe(no_mangle)]
pub extern "C" fn stroke_and_rebuild(kind:u32,reversed:u32,approximate:u32)->u32 {
    assert!(kind<4);
    let (path,join)=fixture(kind as u8,reversed!=0);
    let policy=if approximate==0 {PredicatePolicy::STRICT}else{PredicatePolicy::APPROXIMATE_512};
    let result=evaluate_under(policy,||CurveRegion2::stroke_path(&path,q(1,10),&OffsetCornerStyle2::Round,OffsetCap::Round));
    assert!(result.is_certified());
    let region=result.into_unverified().unwrap();drop(path);
    assert_eq!(region.classify_point(&join).unwrap(),RegionPointLocation::Inside);
    let rebuilt=CurveRegion2::try_from_boundary_paths(&region.boundary_paths().unwrap(),FillRule::NonZero).unwrap();drop(region);
    assert_eq!(rebuilt.classify_point(&join).unwrap(),RegionPointLocation::Inside);
    rebuilt.boundary_loops().len() as u32
}
