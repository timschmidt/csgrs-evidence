#![cfg(all(feature="adaptive-taylor",feature="dispatch-trace"))]
use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,evolution::{EvolutionRequest,EvolutionOptions},taylor_flow::adaptive::{AdaptiveTaylorOptions,AdaptiveTaylorStatus}};
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionBudget,ExpressionProgram}};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hyperreal::dispatch_trace;
fn d(l:i64,u:i64,e:i32)->DyadicInterval{DyadicInterval::new(l.into(),u.into(),e).unwrap()}
fn budget()->EnclosureBudget{EnclosureBudget::new(EnclosurePolicy::default())}
#[test]
fn baseline_default_preparation_artifacts(){
 for case in 0..3 {
  let t=SymbolId(0);let x=SymbolId(1);let v=Expr::anonymous_symbol(x);
  let rhs=match case {0=>Expr::int(2),1=>v,_=>v.clone()*v};
  let source=ExpressionProgram::compile(&[rhs],&[x,t],&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
  let f=ExpressionField::<1>::from_definition(FieldDefinition{source:source.definition().clone(),time:t,state:vec![x]},&mut budget()).unwrap();
  dispatch_trace::reset();let mut b=budget();
  let p=dispatch_trace::with_recording(||f.flow_taylor(3,&mut b).unwrap());
  println!("PREP{case}={p:?}");println!("PREP_TRACE{case}={:?}",dispatch_trace::take_trace());println!("PREP_WORK{case}={}:{}",b.remaining_graph_work(),b.remaining_scalar_work());
  let controller=f.adaptive_taylor(AdaptiveTaylorOptions{maximum_order:3,remainder_limits:[d(1,1,-10)],native:EvolutionOptions{maximum_step:Some(d(1,1,-3)),..Default::default()},..Default::default()});
  dispatch_trace::reset();let mut b=budget();
  let r=dispatch_trace::with_recording(||controller.integrate(EvolutionRequest{start:d(0,0,0),end:d(1,1,-2),initial:BoxN::new([d(1,1,0)]).unwrap()},&mut b));
  assert!(matches!(r.status(),AdaptiveTaylorStatus::Completed),"{:?}",r.status());
  println!("REPORT{case}={r:?}");println!("TRACE{case}={:?}",dispatch_trace::take_trace());println!("WORK{case}={}:{}",b.remaining_graph_work(),b.remaining_scalar_work());
 }
}
