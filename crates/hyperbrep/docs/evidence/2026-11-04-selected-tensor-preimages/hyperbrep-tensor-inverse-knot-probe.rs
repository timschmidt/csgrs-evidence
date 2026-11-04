use hypercurve::{Curve2,CurvePointLocations2,Point2,NurbsCurve2,RationalMap2,Real};
use hypersolve::BivariatePolynomial as P;
fn main() {
 let source=Curve2::from(NurbsCurve2::try_new(1,vec![Point2::from_values(0,0),Point2::from_values(1,0),Point2::from_values(-1,0),Point2::from_values(0,0)],vec![Real::one();4],vec![0.into(),0.into(),1.into(),1.into(),2.into(),2.into()]).unwrap());
 let map=RationalMap2::new([P::new(vec![vec![],vec![Real::one()]]),P::new(vec![vec![Real::zero(),Real::one()]])],P::new(vec![vec![Real::one()]]));
 let query=Point2::from_values(1,0).into();let result=source.rational_image_point_locations(&map,&query).unwrap();println!("result: {result:?}");
 let CurvePointLocations2::Locations(found)=result else {panic!("finite")};
 for location in found {let t=location.parameter().unwrap();println!("candidate agrees with original curve: {:?}",source.point_at(&t).unwrap().coincides_with(&query));}
 println!("authored right-sided knot value: {:?}",source.point_at(&Real::one().into()).unwrap());
}
