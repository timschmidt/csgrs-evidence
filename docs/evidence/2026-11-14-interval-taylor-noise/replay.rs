use hyperinterval::{DyadicBudget,DyadicInterval};
use hyperreal::Real;
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionBudget,ExpressionProgram,ExpressionDefinition,TaylorRequest,TaylorAffineMap,TaylorAffineRow,TaylorAffineModel,TaylorNoiseModel}};
use std::sync::Arc;
type Packet=(ExpressionDefinition,TaylorRequest,TaylorAffineMap,TaylorAffineMap,usize);
fn d(a:i64,b:i64)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),0).unwrap()}
fn map(rows:&[&[i32]])->TaylorAffineMap {TaylorAffineMap{input_count:2,rows:rows.iter().map(|r|TaylorAffineRow{coefficients:r.iter().map(|&x|Real::from(x)).collect(),offset:Real::zero()}).collect()}}
fn main()->Result<(),Box<dyn std::error::Error>> {
 let mut g=ExpressionBudget::new(100_000,10_000_000);let mut a=DyadicBudget::new(16384,1_000_000_000_000);
 if std::env::args().nth(1).as_deref()==Some("--emit") {
  let x=Expr::anonymous_symbol(SymbolId(7));let q=Expr::int(16)*x.clone()*x.clone();
  let p=ExpressionProgram::compile(&[q.clone()+x,q],&[SymbolId(7)],&mut g)?;
  let packet:Packet=(p.definition().clone(),TaylorRequest{center:vec![d(0,0)],domain:vec![d(-1,1)],order:2,precision:-64},map(&[&[1,0],&[0,1]]),map(&[&[1,-1]]),1);
  println!("{}",serde_json::to_string(&packet)?);return Ok(());
 }
 let (definition,request,affine,observation,capacity):Packet=serde_json::from_reader(std::io::stdin())?;
 let program=ExpressionProgram::from_definition(definition,&mut g)?;
 let original=Arc::new(program.taylor_model(request,&mut g,&mut a)?);
 let source=Arc::new(TaylorAffineModel::new(original,affine,&mut g,&mut a)?);
 let model=TaylorNoiseModel::new(source,capacity,&mut g,&mut a)?;
 let result=model.enclose(&observation,&mut g,&mut a)?;
 assert_eq!(result.bounds(),&[d(-1,1)]);
 println!("{}",serde_json::json!({"bounds":result.bounds(),"selected":model.columns().iter().map(|c|c.term_index()).collect::<Vec<_>>(),"discarded":model.discarded_terms(),"remainder":model.remainder()}));
 Ok(())
}
