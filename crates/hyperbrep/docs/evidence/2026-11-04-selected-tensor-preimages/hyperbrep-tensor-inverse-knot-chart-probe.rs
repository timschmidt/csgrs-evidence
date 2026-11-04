use hypercurve::{Curve2,CurvePointLocations2,Point2,NurbsCurve2,RationalMap2,Real};
use hypersolve::BivariatePolynomial as P;
fn main() {
 let source=Curve2::from(NurbsCurve2::try_new(1,vec![Point2::from_values(0,0),Point2::from_values(1,0),Point2::from_values(-1,0),Point2::from_values(0,0)],vec![Real::one();4],vec![0.into(),0.into(),1.into(),1.into(),2.into(),2.into()]).unwrap());
 let map=RationalMap2::new([P::new(vec![vec![],vec![],vec![Real::one()]]),P::new(vec![vec![Real::zero(),Real::one()]])],P::new(vec![vec![Real::one()]]));
 let query=Point2::from_values(1,0).into();let result=source.rational_image_point_locations(&map,&query).unwrap();println!("result: {result:?}");
 let CurvePointLocations2::Locations(found)=result else {panic!("finite")};
 println!("returned chart locations: {}",found.len());
 for side in [hypercurve::CurveParameterSide2::Left,hypercurve::CurveParameterSide2::Right] {
  let point=source.point_at_side(&Real::one().into(),side).unwrap();
  println!("{side:?} source: {point:?}; mapped agrees: {}",point.rational_image(&map).unwrap().coincides_with(&query).unwrap());
 }
}
