#[path = "../allocations.rs"]
mod allocations;
use std::{hint::black_box,sync::Arc,time::Instant};
use hyperinterval::{DyadicBudget,DyadicInterval};
use hyperreal::Real;
use hypersdf::{Sdf,SdfExpr,SdfProgram,SdfProgramError,SdfCellLocation};
use hypersolve::expression_program::{ExpressionBudget,ExpressionError,TaylorRequest};
fn graph()->ExpressionBudget {ExpressionBudget::new(1_000_000,100_000_000)}
fn arithmetic()->DyadicBudget {DyadicBudget::new(16384,1_000_000_000_000)}
fn d(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn measure<T>(name:&str,mut run:impl FnMut()->T) {
    for _ in 0..8 {drop(black_box(run()));}
    let s=allocations::measure(32,&mut run);
    println!("ALLOC|{name}|{}|{}|{}|{}|{}|{}",s.allocations,s.deallocations,s.reallocations,s.allocated_bytes,s.peak_live_bytes,s.live_bytes);
    assert_eq!(s.live_bytes,0);
    for repeat in 0..5 {
        let start=Instant::now();for _ in 0..128 {drop(black_box(run()));}
        println!("TIME|{name}|{repeat}|128|{}",start.elapsed().as_nanos());
    }
}
fn main(){
 let matrix=hyperlattice::Matrix4([
 [1.into(),2.into(),0.into(),3.into()], [0.into(),1.into(),0.into(),0.into()],
 [0.into(),0.into(),(-2).into(),1.into()], [0.into(),0.into(),0.into(),1.into()]]);
 let expr=SdfExpr::x().mul_expr(SdfExpr::constant(Real::one()).sub_expr(SdfExpr::x())).offset((Real::from(3)/Real::from(8)).unwrap()).affine_transform(matrix).unwrap();
 let source=Arc::new(Sdf::new(expr));let mut b=graph();let start=b.remaining_work();
 let p=SdfProgram::compile(source.clone(),&mut b).unwrap();let used=start-b.remaining_work();
 let cell=[d(5,5,0),d(1,2,-1),d(1,1,0)];
 let request=TaylorRequest{center:vec![d(5,5,0),d(3,3,-2),d(1,1,0)],domain:cell.to_vec(),order:2,precision:-48};
 let report=p.taylor_cell(request.clone(),&mut graph(),&mut arithmetic()).unwrap();
 assert_eq!(report.image(),&d(-3,-1,-3));assert_eq!(report.model().unwrap().remainder(),&[d(0,0,0)]);
 println!("DEFINITION|affine|{:?}",p.program().definition());
 println!("ROW|affine|nodes={}|compile_work={used}|image={:?}|remainder={:?}",p.program().definition().nodes.len(),report.image(),report.model().unwrap().remainder());
 measure("affine-compile",||SdfProgram::compile(source.clone(),&mut graph()).unwrap());
 measure("affine-natural",||{let r=p.image(cell.clone(),-48,&mut graph(),&mut arithmetic()).unwrap();assert_eq!(r.image(),&d(-3,5,-3));assert_eq!(r.location(),Some(SdfCellLocation::Unknown));r});
 measure("affine-taylor",||{let r=p.taylor_cell(request.clone(),&mut graph(),&mut arithmetic()).unwrap();assert_eq!(r.image(),&d(-3,-1,-3));assert_eq!(r.location(),Some(SdfCellLocation::ConservativeInside));r});
 measure("affine-reuse",||{let r=report.model().unwrap().enclose_on(&[d(5,5,0),d(3,3,-2),d(1,1,0)],&mut graph(),&mut arithmetic()).unwrap();assert_eq!(r,vec![d(-1,-1,-3)]);r});
 measure("affine-late-exhaustion",||{let r=SdfProgram::compile(source.clone(),&mut ExpressionBudget::new(1_000_000,used-1));assert!(matches!(r,Err(SdfProgramError::Expression(ExpressionError::WorkExhausted))));r});
}
