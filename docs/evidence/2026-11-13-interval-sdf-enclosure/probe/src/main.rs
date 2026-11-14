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
    let zero=d(0,0,0);
    for (name,expr,location) in [
        ("polynomial",SdfExpr::x().mul_expr(SdfExpr::constant(Real::one()).sub_expr(SdfExpr::x())).offset((Real::from(3)/Real::from(8)).unwrap()),SdfCellLocation::ConservativeInside),
        ("trig",SdfExpr::x().sin().add_expr(SdfExpr::y().cos()),SdfCellLocation::ConservativeOutside)
    ] {
        let source=Arc::new(Sdf::new(expr));let mut b=graph();let start=b.remaining_work();
        let p=SdfProgram::compile(source.clone(),&mut b).unwrap();let used=start-b.remaining_work();
        let cell=[d(0,1,0),zero.clone(),zero.clone()];
        let request=TaylorRequest{center:vec![d(1,1,-1),zero.clone(),zero.clone()],domain:cell.to_vec(),order:2,precision:-48};
        let report=p.taylor_cell(request.clone(),&mut graph(),&mut arithmetic()).unwrap();
        assert_eq!(report.location(),Some(location));
        println!("ROW|{name}|nodes={}|compile_work={used}|image={:?}|remainder={:?}",p.program().definition().nodes.len(),report.image(),report.model().unwrap().remainder());
        measure(&format!("{name}-compile"),||SdfProgram::compile(source.clone(),&mut graph()).unwrap());
        measure(&format!("{name}-natural"),||p.image(cell.clone(),-48,&mut graph(),&mut arithmetic()).unwrap());
        measure(&format!("{name}-taylor"),||{let r=p.taylor_cell(request.clone(),&mut graph(),&mut arithmetic()).unwrap();assert_eq!(r.location(),Some(location));r});
        measure(&format!("{name}-reuse"),||report.model().unwrap().enclose_on(&[d(1,1,-1),zero.clone(),zero.clone()],&mut graph(),&mut arithmetic()).unwrap());
        measure(&format!("{name}-late-exhaustion"),||{let r=SdfProgram::compile(source.clone(),&mut ExpressionBudget::new(1_000_000,used-1));assert!(matches!(r,Err(SdfProgramError::Expression(ExpressionError::WorkExhausted))));r});
    }
}
