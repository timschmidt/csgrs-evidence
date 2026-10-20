use hyperbrep::*;
use hyperbrep::boolean::{FacePairTrim,FacePairRelation};
#[allow(dead_code)]
#[path="/mnt/development/csgrs/crates/hyperbrep/tests/support/axial_shells.rs"] mod native;
fn main(){
 let args=std::env::args().collect::<Vec<_>>();let kind=args[1].parse().unwrap();let stage=&args[2];let mode=&args[3];
 let map=if mode=="identity"{Matrix4::identity()}else{native::frame(mode=="reflected")};
 let (a,b)=native::operands(kind);let result=boolean::difference(&a,&b).unwrap().transformed(&map).unwrap();
 let result=native::replay(result.model());let result=BodySet::from_solid(result.solids().next().unwrap());
 let a=a.transformed(&map).unwrap();let b=b.transformed(&map).unwrap();
 let other=if stage=="union"{boolean::intersection(&a,&b).unwrap()}else if stage=="half"{builder::cuboid(native::point(-30,0,-30),native::point(30,30,30)).unwrap().transformed(&map).unwrap()}else if stage=="empty"{a}else{b};
 let graph=boolean::intersection_graph(result.bodies().next().unwrap(),other.bodies().next().unwrap()).unwrap();
 for pair in graph.intersections(){
  let trim=match pair.trim(){FacePairTrim::SurfaceCurveFragments(c)=>format!("retained {}",c.len()),FacePairTrim::CurveFragments(c)=>format!("bare {}",c.len()),FacePairTrim::CoincidentFaces{first_traces,second_traces}=>format!("coincident {}/{}",first_traces.len(),second_traces.len()),FacePairTrim::NotAvailable=>"unavailable".into(),FacePairTrim::CompleteCarrier=>"carrier".into(),FacePairTrim::NoContact|FacePairTrim::NoCurveInterior=>continue,other=>format!("{other:?}")};
  let relation=match pair.relation(){FacePairRelation::Unsupported=>"unsupported",FacePairRelation::Exact(SurfaceSurfaceIntersection::Coincident)=>"coincident",FacePairRelation::Exact(SurfaceSurfaceIntersection::Line(_)|SurfaceSurfaceIntersection::Lines(_))=>"line",_=>"other"};
  println!("pair={}/{} {:?}/{:?} relation={relation} trim={trim}",pair.first_face().index(),pair.second_face().index(),pair.first_face().surface().kind(),pair.second_face().surface().kind());
 }
 for pair in graph.intersections(){if pair.second_face().surface().kind()==SurfaceKind::Plane {println!("detail={}/{} {:?}",pair.first_face().index(),pair.second_face().index(),pair.trim());}}
 println!("first={:?}",graph.partition_first_faces().map(|p|p.model().counts()));
 println!("second={:?}",graph.partition_second_faces().map(|p|p.model().counts()));
 let outcome=if stage=="union"{boolean::union(&result,&other)}else{boolean::difference(&result,&other)};
 println!("outcome={:?}",outcome.map(|b|b.model().counts()));
}
