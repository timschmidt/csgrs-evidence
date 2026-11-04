use hyperbrep::*;
fn q(a:i32,b:i32)->Real{(Real::from(a)/Real::from(b)).unwrap()}
fn inspect(name:&str,set:&BodySet){
 let policy=tessellation::ChordalApproximationPolicy::uniform(std::num::NonZeroUsize::new(3).unwrap(),1);
 let mut good=0;let mut bad=0;
 for body in set.bodies(){for face in body.outer().faces(){match tessellation::approximate_face_chordally(face,policy){Ok(mesh)=>{good+=1;println!("{name} face={} success points={} triangles={} relation={:?}",face.index(),mesh.points().len(),mesh.triangles().len(),mesh.source_relation());},Err(error)=>{bad+=1;println!("{name} face={} error={error:?}",face.index());}}}}
 println!("{name} completed={good} blocked={bad}");
}
fn main(){
 let cube=builder::cuboid(Point3::origin(),Point3::new(1.into(),1.into(),1.into())).unwrap();
 let authored=builder::sweep_curve(&[(0,0),(1,0),(1,1),(0,1)].map(|(x,y)|Point2::new(x.into(),y.into())),Vector3::x(),Vector3::y(),Curve3::rational_bezier([0,1,0,1].map(|z|Point3::new(0.into(),0.into(),z.into())).to_vec(),vec![Real::one();4]).unwrap()).unwrap();
 let slab=builder::cuboid(Point3::new((-1).into(),(-1).into(),q(1,4)),Point3::new(2.into(),2.into(),q(3,4))).unwrap();
 inspect("authored",&authored);
 inspect("control-cut",&boolean::difference(&cube,&slab).unwrap());
 inspect("authored-cut",&boolean::difference(&authored,&slab).unwrap());
}
