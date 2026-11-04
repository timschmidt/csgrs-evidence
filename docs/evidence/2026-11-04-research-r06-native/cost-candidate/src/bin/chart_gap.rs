use hypercurve::{PolynomialCurveSet2,Real};
use hypersolve::{BivariatePolynomial,bivariate_topology::{BivariateCurveDomain,decompose_bivariate_curve}};
fn main(){
 let equation=BivariatePolynomial::new(vec![vec![],vec![Real::zero(),Real::one()]]);
 let topology=decompose_bivariate_curve(&equation,&BivariateCurveDomain{first:[(-2).into(),2.into()],second:[(-2).into(),2.into()]},Default::default()).unwrap();
 let set=PolynomialCurveSet2::from_topology(topology,Default::default()).unwrap();
 match set.curves()[0].intersect_curve(&set.curves()[2]){
  Ok(result)=>println!("complete={}, contacts={}, overlaps={}",result.is_complete(),result.contacts().len(),result.overlaps().len()),
  Err(error)=>println!("{error:?}"),
 }
}
