use hyperbrep::*;
use hypercurve::{Curve2,NurbsCurve2,Point2 as Uv};
fn q(n:i64,d:i64)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn main() {
 // S(u,v)=(u(u-v),v(v-u),uv) maps the two UV axes and diagonal
 // to three spatial axes. All weights are one; no sampling defines S.
 let patch=Surface::rational_bezier((0..3).map(|j|(0..3).map(|i|{
  let uv=q(i*j,4);Point3::new(Real::from(if i==2 {1}else{0})-&uv,Real::from(if j==2 {1}else{0})-&uv,uv)
 }).collect()).collect(),vec![vec![Real::one();3];3]).unwrap();
 let source=Curve2::from(NurbsCurve2::try_new(1,vec![Uv::from_values(0,0),Uv::from_values(1,0),Uv::from_values(0,0),Uv::from_values(0,1),Uv::from_values(0,0),Uv::from_values(1,1),Uv::from_values(0,0)],vec![Real::one();7],vec![0.into(),0.into(),1.into(),2.into(),3.into(),4.into(),5.into(),6.into(),6.into()]).unwrap());
 let curve=Curve3::tensor_image(patch,source).unwrap();
 let selector=Curve3::rational_bezier([-5,-7,-9,-11,-13,145].map(|n|Point3::new(q(n,5),0.into(),0.into())).to_vec(),vec![Real::one();6]).unwrap();
 let CurveParameterLocation::Parameters(roots)=selector.parameters_of(Point3::origin()).unwrap() else {panic!("selected root")};
 let query=selector.point_at(&roots[0]).unwrap();assert!(query.try_coordinates().is_none());
 // Each source span maps to a single spatial axis with a squared linear
 // coordinate. Thus zero occurs only at lambda=0,2,4,6, or s=lambda/6.
 for t in [Real::zero(),q(1,3),q(2,3),Real::one()] {assert!(curve.point_at(&t.into()).unwrap().coincides_with(&query).unwrap());}
 let result=curve.parameters_of(&query);
 println!("independent exact finite expectation: {{0,1/3,2/3,1}}");println!("each planar projection also has a whole source interval at zero");println!("actual spatial inverse: {result:?}");
 assert!(matches!(result,Err(GeometryError::PlanarCurve(hypercurve::ExactCurveError::Blocked(b))) if b.reason()==hypercurve::UncertaintyReason::Unsupported));
}
