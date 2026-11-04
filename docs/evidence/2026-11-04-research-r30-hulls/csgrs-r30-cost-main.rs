use hypermesh::{MeshCertainty,MeshContext,Point3,PredicatePolicy,Real,TriangleMesh};
use std::{hint::black_box,time::Instant};
include!("/tmp/csgrs-r06-cost-allocator.rs");
fn p(x:i64,y:i64,z:i64)->Point3 { Point3::new(x.into(),y.into(),z.into()) }
fn sphere(n:usize,m:usize)->Vec<Point3> {
    let longitude=(0..n).map(|i| {let angle=Real::tau()*(Real::from(i as u64)/Real::from(n as u64)).unwrap();(angle.clone().sin(),angle.cos())}).collect::<Vec<_>>();
    let latitude=(1..m).map(|j| {let angle=Real::pi()*(Real::from(j as u64)/Real::from(m as u64)).unwrap();(angle.clone().sin(),angle.cos())}).collect::<Vec<_>>();
    let mut points=vec![p(0,1,0)];
    for (s,c) in longitude { for (v,w) in &latitude {points.push(Point3::new(&c*v,w.clone(),&s*v));} }
    points.push(p(0,-1,0));points
}
fn shell()->Vec<Point3> {
    let mut points=vec![p(0,1,0)];
    for i in 0..16 {let (s,c)=(std::f64::consts::TAU*i as f64/16.0).sin_cos();
        for j in 1..8 {let (v,w)=(std::f64::consts::PI*j as f64/8.0).sin_cos();points.push(Point3::new(Real::try_from(c*v).unwrap(),Real::try_from(w).unwrap(),Real::try_from(s*v).unwrap()));}}
    points.push(p(0,-1,0));let unique=points.clone();for _ in 1..6 {points.extend(unique.iter().cloned());}points
}
fn rows(mesh:&TriangleMesh)->String {
    let mut s=format!("{} {} {:?}\n",mesh.positions.len(),mesh.triangles.len(),mesh.construction_evidence());
    for p in mesh.positions.iter(){s.push_str(&format!("{} {} {}\n",p.x.to_json(),p.y.to_json(),p.z.to_json()));}
    for t in mesh.triangles.iter(){s.push_str(&format!("{:?}\n",t.indices()));}s
}
fn main(){
    let args=std::env::args().collect::<Vec<_>>();let case=&args[1];let count:usize=args[2].parse().unwrap();
    let input=match case.as_str(){
        "grid4913"=>(-8..=8).flat_map(|x|(-8..=8).flat_map(move|y|(-8..=8).map(move|z|p(x,y,z)))).collect(),
        "moment64"=>(-32_i64..32).map(|t|p(t,t*t,t*t*t)).collect(),
        "shell684"=>shell(),
        "tetra"|"coplanar_api"|"retained_api"=>vec![p(0,0,0),p(2,0,0),p(0,2,0),p(0,0,2)],
        "sphere32"=>sphere(32,16),
        "sphere17"=>sphere(17,9),
        "symbolic_cube"=>{let shift=Real::from(2).sqrt().unwrap();(-1..=1).flat_map(|x|(-1..=1).flat_map(move|y|(-1..=1).map(move|z|p(x,y,z)))).map(|q|Point3::new(q.x+&shift,q.y+&shift,q.z+&shift)).collect()},
        _=>panic!("unknown case")};
    let context=MeshContext::new(PredicatePolicy::STRICT);
    let ids=vec![[0,1,2,10,20],[3,4,5,10,21],[6,7,8,10,22],[9,10,11,10,23]];
    for sample in 0..count {
        let before_live=LIVE.load(Ordering::Relaxed);let before_bytes=ALLOCATED.load(Ordering::Relaxed);let before_calls=CALLS.load(Ordering::Relaxed);PEAK.store(before_live,Ordering::Relaxed);
        let start=Instant::now();
        let outcome=match case.as_str(){
            "coplanar_api"=>hypermesh::convex_hull_with_coplanar_groups(&context,black_box(&input),&[]),
            "retained_api"=>hypermesh::convex_hull_with_retained_facts(&context,black_box(&input),&[],&ids),
            _=>hypermesh::convex_hull(&context,black_box(&input))}.unwrap();
        assert_eq!(outcome.certainty,MeshCertainty::Certified);
        assert_eq!(outcome.value.validate_closed_pwn(&context).unwrap().certainty,MeshCertainty::Certified);
        let elapsed=start.elapsed().as_nanos();let bytes=ALLOCATED.load(Ordering::Relaxed)-before_bytes;let calls=CALLS.load(Ordering::Relaxed)-before_calls;let peak=PEAK.load(Ordering::Relaxed)-before_live;
        let row=rows(&outcome.value);if sample==0 {std::fs::write(&args[3],&row).unwrap();}else{eprintln!("rows_equal {} {}",sample,std::fs::read_to_string(&args[3]).unwrap()==row);} drop(row);
        drop(outcome);
        let delta=LIVE.load(Ordering::Relaxed) as i128-before_live as i128;
        println!("{}\t{}\t{}\t{}\t{}\t{}\t{}",case,sample,elapsed,bytes,calls,peak,delta);
    }
}
