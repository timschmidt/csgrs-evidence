use hyperreal::{Real,CertifiedRealSign};
use hypersolve::bareiss::{determinant_bareiss,BareissDeterminantMethod};
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
fn bivariate(name:&str)->(String,Vec<Real>){
 use hypersolve::{BivariatePolynomial,CurveResultantParameter as Axis,CurveIntersectionResultantConfig as Config,CurveIntersectionResultantStatus as Status};
 let n=name.strip_prefix("bezout").unwrap().parse::<usize>().unwrap();
 let equation=|slope:i32,negative:bool|{
  let mut p=vec![vec![Real::one()]];
  for i in 0..n {let offset=Real::from(if negative{-(i as i32)-1}else{i as i32+1});let w=p.iter().map(Vec::len).max().unwrap()+1;let mut next=vec![vec![Real::zero();w];p.len()+1];
   for(i,row)in p.iter().enumerate(){for(j,c)in row.iter().enumerate(){next[i][j+1]+=c;next[i][j]-=c*&offset;next[i+1][j]-=c*Real::from(slope);}}p=next;
  } BivariatePolynomial::new(p)
 };
 let first=equation(1,false);let second=equation(2,true);let mut rows=Vec::new();let mut values=Vec::new();
 for axis in [Axis::First,Axis::Second] {
  let report=hypersolve::resultant_bivariate_polynomial_system(&first,&second,axis,Config{max_resultant_degree:128,..Default::default()});assert_eq!(report.status,Status::Constructed);
  let mut expected=vec![Real::one()];
  for i in 0..n {for j in 0..n {
   let (constant,linear)=match axis{Axis::First=>(i+j+2,-1),Axis::Second=>(2*i+j+3,1)};
   let constant=Real::from(if axis==Axis::First{constant as i32}else{-(constant as i32)});
   let mut next=vec![Real::zero();expected.len()+1];for(k,v)in expected.iter().enumerate(){next[k]+=v*&constant;next[k+1]+=v*Real::from(linear);}expected=next;
  }}
  assert_eq!(report.resultant_coefficients.len(),expected.len());
  for(a,b)in report.resultant_coefficients.iter().zip(expected){assert_eq!(a.exact_rational_normal_form(),b.exact_rational_normal_form());}
  let wire=report.resultant_coefficients.iter().map(Real::to_json).collect::<Vec<_>>();
  for scalar in &wire {let replay=Real::from_json(scalar).unwrap();assert_eq!(replay.to_json(),*scalar);values.push(replay);}
  rows.push(serde_json::json!({"axis":format!("{:?}",axis),"status":format!("{:?}",report.status),"coefficients":wire}));
 }
 (serde_json::json!({"case":name,"systems":rows}).to_string(),values)
}
fn run(name:&str)->(String,Vec<Real>) {
 if name.starts_with("bezout"){return bivariate(name);}
 let matrix=fixture(name);let report=determinant_bareiss(&matrix,-128).unwrap();
 if name.starts_with("pivot_free"){assert_eq!(report.method,BareissDeterminantMethod::PivotFreeFaddeevLeverrier);}
 let expected=match name {"rational3"=>Some(22),"swapped3"=>Some(-14),"singular3"=>Some(0),_=>None};
 if let Some(n)=expected {assert_eq!(report.determinant.exact_rational_normal_form().unwrap(),hyperreal::Rational::from(n));}
 let wire=report.determinant.to_json();let replay=Real::from_json(&wire).unwrap();assert_eq!(replay.to_json(),wire);
 let row=serde_json::json!({"case":name,"method":format!("{:?}",report.method),"swaps":report.swaps,"pivots":report.pivots.iter().map(|p|serde_json::json!([p.pivot,p.row,p.value.to_json()])).collect::<Vec<_>>(),"determinant":wire}).to_string();
 (row,vec![replay])
}
fn main(){
 let args:Vec<_>=std::env::args().collect();
 hyperreal::dispatch_trace::reset();
 let (row,_)=hyperreal::dispatch_trace::with_recording(||run(&args[1]));
 let trace=hyperreal::dispatch_trace::take_trace();
 println!("{}",serde_json::json!({"outcome":serde_json::from_str::<serde_json::Value>(&row).unwrap(),"dispatch":trace.dispatch.iter().map(|r|serde_json::json!([r.layer,r.operation,r.path,r.count])).collect::<Vec<_>>(),"rational":format!("{:?}",trace.rational)}));
}
