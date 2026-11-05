use hypercurve::*;
use std::{hint::black_box,time::Instant};
include!("../../allocator.rs");
fn q(n:i32,d:i32)->Real{(Real::from(n)/Real::from(d)).unwrap()}
fn source()->CurvePath2{CurvePath2::try_new(vec![LineSeg2::try_new(Point2::from_values(-1,0),Point2::from_values(0,0)).unwrap().into(),QuadraticBezier2::new(Point2::from_values(0,0),Point2::from_values(1,0),Point2::from_values(1,1)).into()]).unwrap()}
fn geometry(path:CurvePath2)->SvgGeometry2{SvgGeometry2::new(CurveRegion2::empty(),vec![],vec![path])}
fn main(){
 let args=std::env::args().collect::<Vec<_>>();let case=&args[1];let count:usize=args[2].parse().unwrap();
 let source=source();let options=BezierParallelVerificationOptions::try_new(q(1,20),16).unwrap();
 let map=Similarity2::try_from_real_affine(2.into(),0.into(),0.into(),2.into(),3.into(),4.into()).unwrap();
 eprintln!("Curve2_bytes {}",std::mem::size_of::<Curve2>());
 for sample in 0..count {
  let before_live=LIVE.load(Ordering::Relaxed);let before_bytes=ALLOCATED.load(Ordering::Relaxed);let before_calls=CALLS.load(Ordering::Relaxed);PEAK.store(before_live,Ordering::Relaxed);
  let start=Instant::now();
  let value=evaluate_under(PredicatePolicy::STRICT,||->ExactCurveResult<CurvePath2>{
   let path=match case.as_str(){
    "plain"=>source.clone(),
    "construct"|"edit"|"replay"|"brep_replay"=>black_box(&source).approximate_parallel_blend2d_certified(q(1,10),&options)?.into_path(),
    _=>panic!("case"),
   };
   if case=="construct" {return Ok(path)}
   let curves=path.curves().iter().map(|c|c.subcurve(q(1,4).into(),q(3,4).into())?.reversed()?.transform_similarity(&map)).collect::<ExactCurveResult<Vec<_>>>()?;
   if case=="brep_replay" {
    let source=curves.last().unwrap().clone();
    let spatial=hyperbrep::Curve3::planar_image(source,hyperbrep::Point3::origin(),hyperbrep::Vector3::x(),hyperbrep::Vector3::y()).unwrap();
    let mut builder=hyperbrep::ModelBuilder::new();builder.curve(spatial).unwrap();let model=builder.finish().unwrap();
    let json=model.to_json().unwrap();let restored=hyperbrep::RawModel::from_json(&json,&hyperbrep::ArchiveLimits::default()).unwrap().validate().unwrap();
    assert_eq!(restored.to_json().unwrap(),json);
    let c=restored.curves().next().unwrap().geometry().planar_geometry().unwrap().source.clone();
    return Ok(CurvePath2::try_new(vec![c])?);
   }
   // Separate paths preserve disconnected extracted spans.
   if case=="replay"||case=="plain" {
    let g=SvgGeometry2::new(CurveRegion2::empty(),vec![],curves.iter().map(|c|CurvePath2::try_new(vec![c.clone()]).unwrap()).collect());
    let text=export_svg_document(&g).unwrap();let decoded=import_svg_document(&text).unwrap();
    assert_eq!(export_svg_document(&decoded).unwrap(),text);
    return Ok(decoded.paths().iter().find(|p|matches!(p.curves()[0].geometry(),Some(CurveGeometry2::QuadraticBezier(_)))).expect("same quadratic output after path/string normalization").clone());
   }
   Ok(CurvePath2::try_new(vec![curves.last().unwrap().clone()])?)
  });
  assert_eq!(value.certainty(),CurveCertainty::Certified);let output=value.into_unverified().unwrap();
  let elapsed=start.elapsed().as_nanos();let bytes=ALLOCATED.load(Ordering::Relaxed)-before_bytes;let calls=CALLS.load(Ordering::Relaxed)-before_calls;let peak=PEAK.load(Ordering::Relaxed)-before_live;
  let raw=CurvePath2::try_new(output.curves().iter().map(|c|Curve2::new(c.geometry().unwrap().clone())).collect()).unwrap();
  let rows=export_svg_document(&geometry(raw)).unwrap();let native=export_svg_document(&geometry(output.clone())).unwrap();
  if sample==0 {std::fs::write(&args[3],&rows).unwrap();std::fs::write(format!("{}.native",args[3]),&native).unwrap();}
  else{assert_eq!(std::fs::read_to_string(&args[3]).unwrap(),rows);}
  drop(rows);drop(native);drop(output);
  let delta=LIVE.load(Ordering::Relaxed) as i128-before_live as i128;
  println!("{}\t{}\t{}\t{}\t{}\t{}\t{}",case,sample,elapsed,bytes,calls,peak,delta);
 }
}
