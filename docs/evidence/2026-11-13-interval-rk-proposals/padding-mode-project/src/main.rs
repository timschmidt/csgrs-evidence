use hyperdynamics::field::{EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,evolution::EvolutionRequest,proposal::{Rk4Error,Rk4Options}};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionBudget,ExpressionProgram}};
mod native_mode;
fn main(){
 let t=SymbolId(100);let x=SymbolId(0);let p=ExpressionProgram::compile(&[Expr::int(0)],&[t,x],&mut ExpressionBudget::new(100,1000)).unwrap();
 let mut b=EnclosureBudget::new(EnclosurePolicy::default());let f=ExpressionField::<1>::from_definition(FieldDefinition{source:p.definition().clone(),time:t,state:vec![x]},&mut b).unwrap();let prepared=f.rk4_proposer(&mut b).unwrap();let mut failures=0;
 for mode in 0..16 {native_mode::with_mxcsr(mode,|| {
 for relative in [false,true] {
  let negative=std::hint::black_box(f64::from_bits(0x8000_0000_0000_0001));
  let options=if relative {Rk4Options{relative_padding:negative,absolute_padding:0.0}}else{Rk4Options{relative_padding:0.0,absolute_padding:negative}};
  let req=EvolutionRequest{start:DyadicInterval::point(0.into(),0).unwrap(),end:DyadicInterval::point(1.into(),0).unwrap(),initial:BoxN::empty().unwrap()};
  let r=prepared.propose(req,options,&mut EnclosureBudget::new(EnclosurePolicy::default()));let rejected=matches!(r,Err(ref e) if matches!(e.error(),Rk4Error::InvalidPadding));println!("mode={mode} relative={relative} rejected={rejected}");if !rejected{failures+=1;}
 }
 });}
 assert_eq!(failures,0,"negative subnormal padding was accepted");
}
