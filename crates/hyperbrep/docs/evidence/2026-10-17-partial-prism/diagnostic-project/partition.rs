use hyperbrep::*;
fn main(){
 let slab=std::env::args().nth(1).unwrap_or_else(||"upper".into());
 let delta:Real="1e-12".parse().unwrap();
 let (low,high)=match slab.as_str(){"upper"=>((-20).into(),Real::from(6)-delta),"lower"=>(delta,20.into()),"interior"=>(2.into(),4.into()),"touch"=>(6.into(),20.into()),_=>panic!()};
 let a=builder::cylinder(5.into(),6.into()).unwrap();
 let b=builder::cuboid(Point3::new(0.into(),(-20).into(),low),Point3::new(20.into(),20.into(),high)).unwrap();
 let g=boolean::intersection_graph(a.bodies().next().unwrap(),b.bodies().next().unwrap()).unwrap();
 for (label,part) in [("cylinder",g.partition_first_faces().unwrap()),("box",g.partition_second_faces().unwrap())]{
  println!("part={label}");
  for f in part.model().faces(){
   println!("face={} kind={:?} orientation={:?}",f.index(),f.surface().kind(),f.orientation());
   for w in f.outer().into_iter().chain(f.inner()){
    for e in w.edge_uses(){ println!("use={} edge={} pcurve={:?}",e.index(),e.edge().index(),e.pcurve().geometry()); }
   }
  }
  let j=part.model().to_json().unwrap();
  println!("replay={:?}",RawModel::from_json(&j,&ArchiveLimits::default()).unwrap().validate().map(|x|x.counts()));
  if let Some(dir)=std::env::args().nth(2){std::fs::create_dir_all(&dir).unwrap();std::fs::write(format!("{dir}/{slab}-{label}.json"),j).unwrap();}
 }
}
