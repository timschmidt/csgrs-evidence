#[path = "../allocations.rs"]
mod allocations;
use std::{hint::black_box,sync::Arc,time::Instant};
use hyperinterval::{DyadicBudget,DyadicInterval};
use hyperreal::Real;
use hypersdf::{Sdf,SdfExpr,SdfProgram,SdfProgramError,SdfCellLocation,SdfSubdivisionOptions};
use hypersolve::expression_program::{ExpressionBudget,ExpressionError};
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
 let mut matrix=hyperlattice::Matrix4::identity();matrix.0[0][0]=2.into();matrix.0[0][3]=1.into();
 let polynomial=SdfExpr::x().mul_expr(SdfExpr::constant(Real::one()).sub_expr(SdfExpr::x())).offset((Real::from(3)/Real::from(8)).unwrap());
 let sphere=SdfExpr::sphere(hyperlattice::Point3::new(0.into(),0.into(),0.into()),1.into()).affine_transform(matrix).unwrap();
 for (name,expr,cell,depth,records,leaves,unresolved,location) in [
  ("dependency",polynomial,[d(0,1,0),d(0,0,0),d(0,0,0)],3,11,6,0,SdfCellLocation::ConservativeInside),
  ("affine-sphere",sphere,[d(-3,5,0),d(0,0,0),d(0,0,0)],4,23,12,4,SdfCellLocation::Unknown)
 ] {
  let source=Arc::new(Sdf::new(expr));let p=SdfProgram::compile(source,&mut graph()).unwrap();
  let options=SdfSubdivisionOptions{precision:-48,max_depth:depth,max_cells:records};
  let mut b=graph();let initial=b.remaining_work();let cover=p.subdivide(cell.clone(),options,&mut b,&mut arithmetic()).unwrap();let used=initial-b.remaining_work();
  assert_eq!(cover.cells().len(),records);assert_eq!(cover.leaves().count(),leaves);assert_eq!(cover.leaves().filter(|(_,c)|c.unresolved().is_some()).count(),unresolved);assert_eq!(cover.location(),Some(location));
  println!("ROW|{name}|records={records}|leaves={leaves}|unresolved={unresolved}|graph_work={used}|location={location:?}");
  println!("DEFINITION|{name}|{:?}",cover);
  measure(&format!("{name}-cover"),||{let r=p.subdivide(cell.clone(),options,&mut graph(),&mut arithmetic()).unwrap();assert_eq!(r.cells().len(),records);assert_eq!(r.leaves().count(),leaves);assert_eq!(r.location(),Some(location));r});
  measure(&format!("{name}-late-exhaustion"),||{let r=p.subdivide(cell.clone(),options,&mut ExpressionBudget::new(1_000_000,used-1),&mut arithmetic());assert!(matches!(r,Err(SdfProgramError::Expression(ExpressionError::WorkExhausted))));r});
  measure(&format!("{name}-capacity"),||{let r=p.subdivide(cell.clone(),SdfSubdivisionOptions{max_cells:records-1,..options},&mut graph(),&mut arithmetic());assert!(matches!(r,Err(SdfProgramError::SubdivisionCapacity{limit,required}) if limit==records-1&&required==records));r});
 }
}
