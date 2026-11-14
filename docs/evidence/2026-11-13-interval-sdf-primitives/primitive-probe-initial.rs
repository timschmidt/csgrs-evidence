#[path="../allocations.rs"] mod allocations;
use std::{sync::Arc,hint::black_box,time::Instant};
use hypersdf::{Sdf,SdfExpr,SdfProgram,SdfCoordinate,SdfCellLocation,SdfProgramError};
use hyperreal::Real;
use hyperinterval::{DyadicInterval,DyadicBudget};
use hypersolve::expression_program::{ExpressionBudget,ExpressionError,TaylorRequest};
fn graph()->ExpressionBudget {ExpressionBudget::new(1_000_000,100_000_000)}
fn arithmetic()->DyadicBudget {DyadicBudget::new(16384,1_000_000_000_000)}
fn d(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn row<T>(name:&str,mut run:impl FnMut()->T) {
    for _ in 0..8 {drop(black_box(run()));}
    let s=allocations::measure(32,&mut run);
    println!("ALLOC|{name}|{}|{}|{}|{}|{}|{}",s.allocations,s.deallocations,s.reallocations,s.allocated_bytes,s.peak_live_bytes,s.live_bytes);assert_eq!(s.live_bytes,0);
    for repeat in 0..5 {let t=Instant::now();for _ in 0..128{drop(black_box(run()));}println!("TIME|{name}|{repeat}|128|{}",t.elapsed().as_nanos());}
}
fn main(){
    for (name,expr,cell,center,order,expected) in [
        ("sphere",SdfExpr::sphere(Default::default(),4.into()),[d(-1,1,0),d(-1,1,0),d(-1,1,0)],[d(0,0,0),d(0,0,0),d(0,0,0)],2,d(-4,-1,0)),
        ("torus",SdfExpr::torus(SdfCoordinate::Z,Default::default(),4.into(),1.into()),[d(7,9,-2),d(-1,1,-2),d(-1,1,-2)],[d(2,2,0),d(0,0,0),d(0,0,0)],4,d(-4480,-2775,-8))
    ] {
        let source=Arc::new(Sdf::new(expr));let mut b=graph();let start=b.remaining_work();let p=SdfProgram::compile(source.clone(),&mut b).unwrap();let used=start-b.remaining_work();
        let request=TaylorRequest{center:center.to_vec(),domain:cell.to_vec(),order,precision:-64};
        let proof=p.taylor_cell(request.clone(),&mut graph(),&mut arithmetic()).unwrap();
        assert_eq!(proof.image(),&expected);assert_eq!(proof.location(),Some(SdfCellLocation::ConservativeInside));assert_eq!(proof.model().unwrap().remainder(),&[d(0,0,0)]);
        println!("ROW|{name}|nodes={}|work={used}|image={:?}|remainder={:?}",p.program().definition().nodes.len(),proof.image(),proof.model().unwrap().remainder());
        row(&format!("{name}-compile"),||SdfProgram::compile(source.clone(),&mut graph()).unwrap());
        row(&format!("{name}-natural"),||p.image(cell.clone(),-64,&mut graph(),&mut arithmetic()).unwrap());
        row(&format!("{name}-taylor"),||{let r=p.taylor_cell(request.clone(),&mut graph(),&mut arithmetic()).unwrap();assert_eq!(r.image(),&expected);r});
        row(&format!("{name}-reuse"),||proof.model().unwrap().enclose_on(&center,&mut graph(),&mut arithmetic()).unwrap());
        row(&format!("{name}-late-exhaustion"),||{let r=SdfProgram::compile(source.clone(),&mut ExpressionBudget::new(1_000_000,used-1));assert!(matches!(r,Err(SdfProgramError::Expression(ExpressionError::WorkExhausted))));r});
    }
}
