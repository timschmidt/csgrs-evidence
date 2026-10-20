use hyperbrep::*;
fn main() {
 for overlap in [false,true] {
  let xy=if overlap {[(0,0),(0,1),(1,1),(2,1)]} else {[(-1,0),(0,0),(1,1),(2,1)]};
  let source=hypercurve::Curve2::try_nurbs(1,xy.map(|(x,y)|hypercurve::Point2::from_values(x,y)).to_vec(),vec![Real::one();4],[0,0,1,1,2,2].map(Real::from).to_vec()).unwrap();
  let curve=Curve3::planar_image(source,Point3::origin(),Vector3::x(),Vector3::y()).unwrap();
  for x in [0,1] {
   let target=Real::from(x);
   let plane=Surface::plane(Point3::new(target.clone(),0.into(),0.into()),Vector3::y(),Vector3::z()).unwrap();
   match plane.intersect_curve(&curve) {
    Ok(CurveSurfaceIntersection::Points(contacts)) => {for contact in &contacts {assert_eq!(contact.point.compare_linear_form(&Vector3::x(),&target).unwrap(),std::cmp::Ordering::Equal,"overlap={overlap} plane={x}");} println!("overlap={overlap} plane={x} points={} valid=true",contacts.len());},
    Ok(CurveSurfaceIntersection::Overlap(range)) => {for p in [range.start(),range.end()] {assert_eq!(curve.point_at(p).unwrap().compare_linear_form(&Vector3::x(),&target).unwrap(),std::cmp::Ordering::Equal,"overlap={overlap} plane={x}");} println!("overlap={overlap} plane={x} range_valid=true");},
    other=>println!("overlap={overlap} plane={x} result={other:?}"),
   }
  }
 }
}
