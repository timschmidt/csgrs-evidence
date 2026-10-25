use hypercurve::*;
use hypersolve::{AlgebraicFiberRootIsolationConfig,BivariatePolynomial};
use hypersolve::bivariate_topology::{BivariateCurveDomain,BivariateTopologyConfig,decompose_bivariate_curve};
fn source()->Curve2 {
 let equation=BivariatePolynomial::new(vec![vec![5.into(),5.into(),0.into(),0.into(),0.into(),1.into()],vec![(-1).into()]]);
 let topology=decompose_bivariate_curve(&equation,&BivariateCurveDomain{first:[(-1).into(),1.into()],second:[(-2).into(),2.into()]},BivariateTopologyConfig::default()).unwrap();
 PolynomialCurveSet2::from_topology(topology,AlgebraicFiberRootIsolationConfig::default()).unwrap().curves()[0].clone()
}
fn main(){
 let selected=BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(),0.into(),2.into()]).unwrap(),BezierParameterInterval::try_new(0.into(),1.into()).unwrap()).unwrap());
 let map=RationalMap2::new([BivariatePolynomial::new(vec![vec![],vec![1.into()]]),BivariatePolynomial::new(vec![vec![0.into(),1.into()]])],BivariatePolynomial::new(vec![vec![2.into()],vec![1.into()]]));
 let transform=Similarity2::try_from_real_affine(1.into(),0.into(),0.into(),1.into(),3.into(),4.into()).unwrap();
 for mapped in [false,true] {for reversed in [false,true] {for policy in [PredicatePolicy::STRICT,PredicatePolicy::APPROXIMATE_512,PredicatePolicy::STRICT] {
  let outcome=evaluate_under(policy,||{
   let c=source();let c=if mapped{c.rational_image(&map).unwrap()}else{c};let c=c.transform_similarity(&transform).unwrap();let c=if reversed{c.reversed().unwrap()}else{c};c.split_at(selected.clone().into()).unwrap()
  });let certainty=outcome.certainty();let (a,b)=outcome.into_unverified();
  let point=a.end();let definition=match point.definition(){Ok(d)=>match d.into_point(){Ok(p)=>format!("replay={:?}",p.coincides_with(&point)),Err(e)=>format!("replay-error={e:?}")},Err(e)=>format!("definition-error={e:?}")};
  println!("mapped={mapped} reversed={reversed} policy={policy:?} certainty={certainty:?} definition={definition} adjacent={:?}",point.coincides_with(&b.start()));
 }}}
}
