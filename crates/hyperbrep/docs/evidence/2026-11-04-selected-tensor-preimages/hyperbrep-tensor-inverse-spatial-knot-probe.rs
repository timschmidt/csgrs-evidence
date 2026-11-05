use hyperbrep::*;
fn main() {
 let curve=Curve3::nurbs(1,vec![Point3::origin(),Point3::new(1.into(),0.into(),0.into()),Point3::new((-1).into(),0.into(),0.into()),Point3::origin()],vec![Real::one();4],vec![0.into(),0.into(),1.into(),1.into(),2.into(),2.into()]);
 println!("curve admitted: {}",curve.is_ok());let curve=curve.unwrap();let query:GeometricPoint3=Point3::new(1.into(),0.into(),0.into()).into();let result=curve.parameters_of(&query).unwrap();println!("inverse: {result:?}");
 if let CurveParameterLocation::Parameters(found)=result {for t in found {println!("original spatial image agrees: {}",curve.point_at(&t).unwrap().coincides_with(&query).unwrap());}}
}
