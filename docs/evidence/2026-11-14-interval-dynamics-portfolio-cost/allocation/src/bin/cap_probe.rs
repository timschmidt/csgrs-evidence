use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,evolution::{EvolutionOptions,EvolutionRequest},reachability::{ReachabilityRequest,ReachabilityPolicy,ReachabilityStatus}};
use hyperinterval::{DyadicInterval,DyadicBudget};
use hyperlattice_interval::BoxN;
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionProgram,ExpressionBudget}};
use hyperreal::Rational;
fn d(n:i64,e:i32)->DyadicInterval{DyadicInterval::point(n.into(),e).unwrap()}
fn main(){
 let x=SymbolId(1);let t=SymbolId(0);
 let source=ExpressionProgram::compile(&[Expr::anonymous_symbol(x)],&[x,t],&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
 let f=ExpressionField::<1>::from_definition(FieldDefinition{source:source.definition().clone(),time:t,state:vec![x]},&mut EnclosureBudget::new(EnclosurePolicy::default())).unwrap();
 for exponent in (-12..=-8).rev(){
  let mut work=EnclosureBudget::new(EnclosurePolicy::default());
  let r=f.reach(ReachabilityRequest{evolution:EvolutionRequest{start:d(0,0),end:d(1,-1),initial:BoxN::new([d(1,0)]).unwrap()},epsilon:d(1,-9)},ReachabilityPolicy{evolution:EvolutionOptions{maximum_step:Some(d(1,exponent)),maximum_steps:16384,..Default::default()},maximum_cells:1,maximum_evolutions:1,maximum_depth:0,maximum_time_refinements:0},&mut work);
  println!("PROBE exponent={} status={:?} steps={} diameter={:?} graph={} scalar={}",exponent,r.status(),r.attempts().iter().map(|a|a.evolution().steps().len()).sum::<usize>(),r.cells()[0].end_diameter(),work.policy().graph_work-work.remaining_graph_work(),work.policy().scalar_work-work.remaining_scalar_work());
  if matches!(r.status(),ReachabilityStatus::Completed){
   let v=r.end_cover().unwrap().boxes().next().unwrap().lanes().unwrap()[0].to_rational(&mut DyadicBudget::new(16384,1_000_000_000_000)).unwrap();
   let mut term=Rational::from(1);let mut lower=term.clone();
   for k in 1..=32 {term=term/Rational::from(2*k);lower=lower+&term;}
   let upper=&lower+term/Rational::from(66)*Rational::fraction(68,67).unwrap();
   assert!(v.contains_point(&lower));assert!(v.contains_point(&upper));
  }
 }
}
