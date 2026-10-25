include!("allocator.rs");
use hypertri::{Point2, Real, PredicatePolicy, TriangulationContext};
use serde_json::json;
use std::{collections::BTreeMap,io::Write,time::Instant};
fn p(x:i32,y:i32)->Point2{Point2::new(x.into(),y.into())}
fn fixture(case:u8,reversed:bool)->(Vec<Point2>,Vec<usize>){
 let (mut v,holes)=match case {
  0=>(vec![p(0,0),p(8,0),p(8,8),p(0,8)],vec![]),
  1=>(vec![p(0,0),p(8,0),p(8,8),p(6,8),p(6,2),p(2,2),p(2,8),p(0,8)],vec![]),
  2=>{let mut v=vec![p(0,0),p(32,0),p(32,8)];for x in (1..32).rev(){v.push(p(x,if x%2==0{8}else{4}));}v.push(p(0,8));(v,vec![])},
  3=>(vec![p(-10,-10),p(10,-10),p(0,12),p(0,0),p(0,2),p(2,0)],vec![3]),
  4=>(vec![p(0,0),p(20,0),p(20,20),p(0,20),p(4,4),p(8,4),p(8,8),p(4,8),p(12,12),p(16,12),p(16,16),p(12,16)],vec![4,8]),
  5=>{let tiny=(Real::one()/Real::from(1_i128<<80)).unwrap();(vec![p(0,0),p(8,0),Point2::new(8.into(),tiny.clone()),Point2::new(Real::zero(),tiny)],vec![])},
  6=>{let (mut v,h)=fixture(1,false);for v in &mut v{v.x=&v.x+Real::e();v.y=&v.y+Real::pi();}(v,h)},
  7=>{let mut v=vec![];for (n,radius) in [(40,10),(20,3)]{for i in 0..n{let angle=(Real::pi()*Real::from(2*i)/Real::from(n)).unwrap();v.push(Point2::new(angle.clone().cos()*Real::from(radius),angle.sin()*Real::from(radius)));}}(v,vec![40])},
  _=>panic!("unknown case")
 };
 if reversed{let mut starts=vec![0];starts.extend(&holes);starts.push(v.len());for ab in starts.windows(2){v[ab[0]..ab[1]].reverse();}}
 (v,holes)
}
fn ring_area(v:&[Point2])->Real{v.iter().zip(v.iter().cycle().skip(1)).take(v.len()).fold(Real::zero(),|sum,(a,b)|sum+Real::diff_of_products(&a.x,&b.y,&a.y,&b.x))}
fn positive(x:Real)->Real{match hyperlimit::compare_reals(&x,&Real::zero(),PredicatePolicy::STRICT).value(){Some(std::cmp::Ordering::Less)=>-x,Some(_)=>x,_=>panic!("unknown area")}}
fn validate(v:&[Point2],holes:&[usize],tris:&[usize]){
 let mut starts=vec![0];starts.extend(holes);starts.push(v.len());let mut expected=Real::zero();let mut boundary=BTreeMap::new();
 for (i,ab) in starts.windows(2).enumerate(){let a=positive(ring_area(&v[ab[0]..ab[1]]));expected=if i==0{a}else{expected-a};for x in ab[0]..ab[1]{let y=if x+1==ab[1]{ab[0]}else{x+1};boundary.insert((x.min(y),x.max(y)),1usize);}}
 let mut edges=BTreeMap::new();let mut area=Real::zero();assert!(tris.len().is_multiple_of(3));
 for &[a,b,c] in tris.as_chunks::<3>().0{assert_eq!(hyperlimit::orient2(&v[a],&v[b],&v[c],PredicatePolicy::STRICT).value(),Some(hyperlimit::Sign::Positive));area=area+Real::diff_of_products(&(&v[b].x-&v[a].x),&(&v[c].y-&v[a].y),&(&v[b].y-&v[a].y),&(&v[c].x-&v[a].x));for (x,y) in [(a,b),(b,c),(c,a)]{*edges.entry((x.min(y),x.max(y))).or_insert(0usize)+=1;}}
 assert_eq!(hyperlimit::compare_reals(&area,&expected,PredicatePolicy::STRICT).value(),Some(std::cmp::Ordering::Equal));assert!(boundary.iter().all(|(e,n)|edges.get(e)==Some(n)));assert!(edges.iter().all(|(e,n)|*n==if boundary.contains_key(e){1}else{2}));
}
fn count()->(usize,usize,usize){(LIVE.load(Ordering::Relaxed),ALLOCATED.load(Ordering::Relaxed),CALLS.load(Ordering::Relaxed))}
fn main(){
 let args=std::env::args().collect::<Vec<_>>();let case=args[1].parse().unwrap();let reversed=args[2]=="reverse";let policy=if args[3]=="strict"{PredicatePolicy::STRICT}else{PredicatePolicy::APPROXIMATE_512};let(v,holes)=fixture(case,reversed);let context=TriangulationContext::new(policy);
 for sample in 0..20{
  let(live,bytes,calls)=count();PEAK.store(live,Ordering::Relaxed);let start=Instant::now();let result=hypertri::earcut(&context,&v,&holes).unwrap();let ns=start.elapsed().as_nanos();let after=count();let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);assert_eq!(result.certainty,hypertri::TriangulationCertainty::Certified);validate(&v,&holes,&result.value);let rows=serde_json::to_vec(&result.value).unwrap();if sample==0{std::fs::write(&args[4],&rows).unwrap();}let checksum=rows.iter().fold(0xcbf29ce484222325_u64,|hash,byte|(hash^u64::from(*byte)).wrapping_mul(0x100000001b3));let output_size=rows.len();drop(rows);drop(result);let retained=LIVE.load(Ordering::Relaxed) as i128-live as i128;
  println!("{}",json!({"sample":sample,"ns":ns,"bytes":after.1-bytes,"calls":after.2-calls,"peak_live_growth":peak,"result_live_growth":after.0.saturating_sub(live),"retained_after_drop":retained,"checksum":checksum,"output_size":output_size,"certainty":"Certified"}));std::io::stdout().flush().unwrap();
 }
}
