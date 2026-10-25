use csgrs::{curve,GeometryContext,Real};
use hypercurve::{CurvePath2,CurveRegion2,FillRule,LineSeg2,Point2,PredicatePolicy,CurveCertainty};
fn report<T>(name:&str,certainty:CurveCertainty,result:hypercurve::ExactCurveResult<T>){match result{Ok(_)=>println!("{name}: success {certainty:?}"),Err(e)=>println!("{name}: {e:?} {certainty:?}")}}
fn main(){
 let z=(Real::e()+Real::one()).sin()-Real::e().sin()*Real::one().cos()-Real::e().cos()*Real::one().sin();
 let points=[Point2::from_values(0,0),Point2::from_values(1,0),Point2::from_values(1,1),Point2::from_values(0,1),Point2::new(z,Real::zero())];
 let path=CurvePath2::try_new(points.windows(2).map(|p|LineSeg2::try_new(p[0].clone(),p[1].clone()).unwrap().into()).collect()).unwrap();
 let strict=hypercurve::evaluate_under(PredicatePolicy::STRICT,||CurveRegion2::try_from_boundary_paths(&[path.clone()],FillRule::NonZero));report("construct strict",strict.certainty(),strict.into_unverified());
 let built=hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512,||CurveRegion2::try_from_boundary_paths(&[path],FillRule::NonZero));println!("construct approximate: {:?}",built.certainty());assert!(!built.is_certified());let region=built.into_unverified().unwrap();
 let half=(Real::one()/Real::from(2)).unwrap();let inside:hypercurve::CurvePoint2=Point2::new(half.clone(),half).into();let other=curve::square(Real::from(2)).unwrap();
 for (name,policy,context) in [("strict",PredicatePolicy::STRICT,GeometryContext::STRICT),("approximate",PredicatePolicy::APPROXIMATE_512,GeometryContext::APPROXIMATE_512),("strict-again",PredicatePolicy::STRICT,GeometryContext::STRICT)]{
  let x=hypercurve::evaluate_under(policy,||region.classify_point(&inside));report(&format!("classify {name}"),x.certainty(),x.into_unverified());
  let x=hypercurve::evaluate_under(policy,||region.boolean_region(&other,hypercurve::BooleanOp::Intersection));report(&format!("boolean {name}"),x.certainty(),x.into_unverified());
  match curve::try_translated_with_context(&region,3.into(),4.into(),&context){Ok(x)=>println!("translate {name}: success {:?}",x.certainty),Err(e)=>println!("translate {name}: {e:?}")};
  match curve::try_extrude(&region,Real::one(),&context){Ok(x)=>println!("extrude {name}: success {:?}",x.certainty),Err(e)=>println!("extrude {name}: {e:?}")};
 }
}
