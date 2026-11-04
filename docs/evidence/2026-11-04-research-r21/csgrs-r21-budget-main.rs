use hyperbrep::*;
fn q(a:i32,b:i32)->Real{(Real::from(a)/Real::from(b)).unwrap()}
fn main(){
 let polynomial=[9,-96,352,-512,256].map(Real::from);
 let report=hypersolve::work_budget::with_budget(WorkBudget::ZERO,||hypersolve::certify_univariate_polynomial_nonnegative(&polynomial,&Real::zero(),&Real::one(),STRICT_PREDICATES));
 println!("polynomial_nonnegative_under_zero_budget: {report:?}");
 let source=||builder::sweep_curve(&[(0,0),(1,0),(1,1),(0,1)].map(|(x,y)|Point2::new(x.into(),y.into())),Vector3::x(),Vector3::y(),Curve3::rational_bezier([0,1,0,1].map(|z|Point3::new(0.into(),0.into(),z.into())).to_vec(),vec![Real::one();4]).unwrap());
 let context=OperationContext::strict(WorkBudget::ZERO);
 let build=context.evaluate(source);
 println!("stationary_constructor_outer_ok={} geometric_success={} outer_error={:?} usage={:?}",build.result.is_ok(),build.result.as_ref().is_ok_and(|r|r.is_ok()),build.result.as_ref().err(),build.usage);
 let set=source().unwrap();
 let usage=set.model().wires().flat_map(|wire|wire.edge_uses()).find(|usage|usage.direction()==Direction::Forward&&matches!(usage.parameter_correspondence(),ParameterCorrespondence::Coordinate{..})).unwrap();
 let denied=context.evaluate(||usage.pcurve_parameter_at(&q(1,4).into()));
 println!("inverse_zero_budget: outer_error={:?} usage={:?}",denied.result.as_ref().err(),denied.usage);
 let retry=OperationContext::strict(WorkBudget{refinements:512,promotions:64}).evaluate(||{
   let parameter=usage.pcurve_parameter_at(&q(1,4).into())?;
   let mapped=usage.edge_parameter_at(&parameter)?;
   Ok::<_,QueryError>((parameter.try_real().is_some(),mapped.compare(&q(1,4).into())?))
 });
 println!("inverse_retry: result={:?} usage={:?}",retry.result,retry.usage);
}
