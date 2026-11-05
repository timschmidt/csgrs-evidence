use hyperbrep::*;
fn q(n:i32,d:i32)->Real {(Real::from(n)/Real::from(d)).unwrap()}
fn main() {
 let patch=Surface::rational_bezier(
  (0..3).map(|i|(0..3).map(|j|{
   let a=[1,-1,1]; let xs=[-1,0,1];
   Point3::new(xs[i].into(),xs[j].into(),(a[i]+a[j]).into())
  }).collect()).collect(),vec![vec![Real::one();3];3]).unwrap();
 let plane=Surface::plane(Point3::origin(),Vector3::y(),Vector3::z()).unwrap();
 let section=match patch.intersect_surface(&plane).unwrap() {
  SurfaceSurfaceIntersection::Curve(c)=>*c,
  other=>panic!("one complete section: {other:?}")
 };
 assert_eq!(section.curve().kind(),Curve3Kind::TensorImage);
 let selector=Curve3::rational_bezier(
  [-5,-7,-9,-11,-13,145].map(|n|Point3::new(q(n,5),0.into(),0.into())).to_vec(),
  vec![Real::one();6]).unwrap();
 let CurveParameterLocation::Parameters(alpha)=selector.parameters_of(Point3::origin()).unwrap() else {panic!("one selected root")};
 assert_eq!(alpha.len(),1);assert!(alpha[0].try_real().is_none());
 let native=Curve3::rational_bezier(
  vec![Point3::new(0.into(),(-1).into(),1.into()),Point3::new(0.into(),0.into(),(-1).into()),Point3::new(0.into(),1.into(),1.into())],
  vec![Real::one();3]).unwrap();
 let query=native.point_at(&alpha[0]).unwrap();
 assert!(query.try_coordinates().is_none());
 let CurveParameterLocation::Parameters(roots)=native.parameters_of(&query).unwrap() else {panic!("native inverse control")};
 assert_eq!(roots.len(),1);assert_eq!(roots[0].compare(&alpha[0]).unwrap(),std::cmp::Ordering::Equal);
 let result=section.curve().parameters_of(&query);
 println!("native rational selected inverse: complete with one exact preimage");
 println!("independent generated TensorImage selected inverse: {result:?}");
 assert!(matches!(result,Err(GeometryError::UnsupportedParameterLocation)));
}
