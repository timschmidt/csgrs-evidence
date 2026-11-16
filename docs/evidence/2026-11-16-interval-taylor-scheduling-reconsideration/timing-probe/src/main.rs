use std::{hint::black_box,time::Instant};
use hyperlimit::{PredicatePolicy,classify_real_sign};
#[path="../../coefficients-probe/src/fixture.rs"] mod fixture;
use fixture::{graph,source};
fn main() {
 let args:Vec<_>=std::env::args().collect();
 let iterations:usize=args.get(1).map(|s|s.parse().unwrap()).unwrap_or(1000);
 let samples:usize=args.get(2).map(|s|s.parse().unwrap()).unwrap_or(20);
 assert!((1..=100_000).contains(&iterations) && (1..=1000).contains(&samples));
 let (source,requests,_)=source();
 for mode in ["construct","complete_strict","complete_approximate"] {
  let run=|| {
   let mut budget=graph();
   let result=source.coefficients(black_box(&requests),&mut budget).unwrap();
   if mode!="construct" {
    let policy=if mode=="complete_strict" {PredicatePolicy::STRICT} else {PredicatePolicy::APPROXIMATE_512};
    let values=result.program().eval_real(&[2.into()],&mut budget).unwrap();
    for value in &values {black_box(classify_real_sign(value,policy));}
    drop(black_box(serde_json::to_vec(result.program().definition()).unwrap()));
    drop(black_box(values));
   }
   drop(black_box(result));
  };
  for _ in 0..100 {run();}
  for sample in 0..samples {
   let start=Instant::now();for _ in 0..iterations {run();}
   println!("{}",serde_json::json!({"mode":mode,"sample":sample,"iterations":iterations,"total_ns":start.elapsed().as_nanos()}));
  }
 }
}
