use hyperbrep::*;
fn main() {
    let profile=[(0,0),(2,0),(2,2),(0,2)].map(|(x,y)|Point2::new(x.into(),y.into()));
    let path=Curve3::rational_bezier([(0,0,0),(1,0,1),(0,0,4)].map(|(x,y,z)|Point3::new(x.into(),y.into(),z.into())).to_vec(),vec![Real::one(),2.into(),3.into()]).unwrap();
    let a=builder::sweep_curve(&profile,Vector3::x(),Vector3::y(),path).unwrap();
    let b=a.clone();
    for operation in [BooleanOperation::Union,BooleanOperation::Intersection,BooleanOperation::Difference] {
        println!("{operation:?}: {:?}",boolean::boolean(&a,&b,operation).map(|s|s.len()));
    }
}
