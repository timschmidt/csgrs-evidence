include!("/tmp/csgrs-r06-cost-allocator.rs");
use hyperreal::{Real,CertifiedRealSign};
use hypersolve::bareiss::{determinant_bareiss,BareissDeterminantMethod};
use std::{hint::black_box,io::Write,time::Instant};
fn fixture(name:&str)->Vec<Vec<Real>> {
 if name=="rational3" {return vec![vec![1.into(),2.into(),3.into()],vec![0.into(),4.into(),5.into()],vec![1.into(),0.into(),6.into()]];}
 if name=="swapped3" {return vec![vec![0.into(),2.into(),3.into()],vec![1.into(),4.into(),5.into()],vec![1.into(),0.into(),6.into()]];}
 if name=="singular3" {return vec![vec![1.into(),2.into(),3.into()],vec![2.into(),4.into(),6.into()],vec![0.into(),1.into(),2.into()]];}
 let n=name.strip_prefix("pivot_free").unwrap().parse::<usize>().unwrap();
 let [_,upper]=Real::pi().certified_rational_interval(-256).unwrap();
 let a=Real::from(upper)-Real::pi();
 assert!(matches!(a.certified_sign_until(-128),CertifiedRealSign::Unknown{..}));
 (0..n).map(|i|(0..n).map(|j|if i==0&&j==0{a.clone()}else if i==j{Real::one()}else if j>i{Real::from((i+j+1)as i32)}else{Real::zero()}).collect()).collect()
}
fn run(name:&str)->(String,Real) {
 let matrix=fixture(name);let report=determinant_bareiss(&matrix,-128).unwrap();
 if name.starts_with("pivot_free"){assert_eq!(report.method,BareissDeterminantMethod::PivotFreeFaddeevLeverrier);}
 let expected=match name {"rational3"=>Some(22),"swapped3"=>Some(-14),"singular3"=>Some(0),_=>None};
 if let Some(n)=expected {assert_eq!(report.determinant.exact_rational_normal_form().unwrap(),hyperreal::Rational::from(n));}
 let wire=report.determinant.to_json();let replay=Real::from_json(&wire).unwrap();assert_eq!(replay.to_json(),wire);
 let row=serde_json::json!({"case":name,"method":format!("{:?}",report.method),"swaps":report.swaps,"pivots":report.pivots.iter().map(|p|serde_json::json!([p.pivot,p.row,p.value.to_json()])).collect::<Vec<_>>(),"determinant":wire}).to_string();
 (row,replay)
}
fn main(){let args:Vec<_>=std::env::args().collect();let name=&args[1];let mut rows=std::fs::File::create(&args[2]).unwrap();
 for _ in 0..2 {black_box(run(name));}
 let (row,_)=run(name);writeln!(rows,"{row}").unwrap();
 for i in 0..20 {let a=ALLOCATED.load(Ordering::Relaxed);let c=CALLS.load(Ordering::Relaxed);let live=LIVE.load(Ordering::Relaxed);PEAK.store(live,Ordering::Relaxed);
 let t=Instant::now();let value=black_box(run(name));let ns=t.elapsed().as_nanos();let bytes=ALLOCATED.load(Ordering::Relaxed)-a;let calls=CALLS.load(Ordering::Relaxed)-c;let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);drop(value);let delta=LIVE.load(Ordering::Relaxed)as i128-live as i128;
 println!("{name}\t{i}\t{ns}\t{bytes}\t{calls}\t{peak}\t{delta}");}
}
