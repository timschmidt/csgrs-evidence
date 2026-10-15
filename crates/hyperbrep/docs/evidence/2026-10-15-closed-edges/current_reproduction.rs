use hyperbrep::*;
fn main() {
    let mut b=ModelBuilder::new();
    let vertex=b.vertex(Point3::new(2.into(),0.into(),0.into()).into()).unwrap();
    let curve=b.curve(Curve3::circle_arc(Point3::origin(),Vector3::x(),Vector3::y(),2.into(),Real::zero(),Real::tau()).unwrap()).unwrap();
    let closed=b.edge(&vertex,&vertex,&curve,ParameterDomain::new(Real::zero(),Real::tau()).unwrap().into());
    println!("closed edge: {closed:?}");
    assert!(closed.is_ok(), "one complete regular circle must admit its single seam vertex");
}
