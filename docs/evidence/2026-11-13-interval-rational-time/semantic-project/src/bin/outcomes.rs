use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,evolution::*};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionProgram,ExpressionBudget}};
fn d(a:i64)->DyadicInterval{DyadicInterval::point(a.into(),0).unwrap()}
fn b()->EnclosureBudget{EnclosureBudget::new(EnclosurePolicy::default())}
fn main(){
 let x=Expr::anonymous_symbol(SymbolId(0));
 for (name,expression,initial,options) in [
  ("step-limit",Expr::int(1),0,EvolutionOptions{maximum_step:Some(DyadicInterval::point(1.into(),-2).unwrap()),maximum_steps:1,..Default::default()}),
  ("halving-limit",Expr::int(1),0,EvolutionOptions{maximum_expansions:0,maximum_halvings:2,..Default::default()}),
  ("pole",Expr::int(1)/x.clone(),0,EvolutionOptions{maximum_halvings:2,..Default::default()}),
  ("riccati-blowup",x.powi(2),1,EvolutionOptions{maximum_steps:24,maximum_halvings:8,..Default::default()})] {
  let time=SymbolId(100);let state=SymbolId(0);let source=ExpressionProgram::compile(&[expression],&[state,time],&mut ExpressionBudget::new(100000,10000000)).unwrap().definition().clone();
  let field=ExpressionField::<1>::from_definition(FieldDefinition{source,time,state:vec![state]},&mut b()).unwrap();let mut work=b();let report=field.integrate(EvolutionRequest{start:d(0),end:d(1),initial:BoxN::new([d(initial)]).unwrap()},options,&mut work);
  assert!(matches!(report.status(),EvolutionStatus::Stopped(_)));assert!(report.end_enclosure().is_none());
  println!("{}",serde_json::json!({"case":name,"status":format!("{:?}",report.status()),"attempts":report.attempts().len(),"segments":report.segments().len(),"reached_time":report.reached_time(),"last_step":report.attempts().last().map(|a|format!("{:?}",a.report().status())),"graph":work.policy().graph_work-work.remaining_graph_work(),"scalar":work.policy().scalar_work-work.remaining_scalar_work()}));
 }
}
