use std::{sync::Arc,hint::black_box,time::Instant,hash::{Hash,Hasher},collections::hash_map::DefaultHasher};
use hyperinterval::DyadicBudget;
use hyperreal::{Real,Rational};
use hypersdf::{Sdf,SdfExpr,SdfProgram,SdfVoxelEnclosureOptions};
use hypersolve::expression_program::ExpressionBudget;
use hypervoxel::{GridFrame,LengthUnit,MaterialRegionId};
#[path="../../hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn ratio(a:i64,b:u64)->Real{Rational::fraction(a,b).unwrap().into()}
fn main(){
 for (name,depth,iterations) in [("polynomial",0,256),("polynomial",1,128),("polynomial",3,8),("trigonometric",1,16),("trigonometric",2,4),("algebraic-frame",1,8)] {
  let mut graph=ExpressionBudget::new(1_000_000,100_000_000);
  let expr=match name {
   "trigonometric"=>SdfExpr::x().sin().add_expr(SdfExpr::y().cos()).complement(),
   "algebraic-frame"=>SdfExpr::x(),
   _=>SdfExpr::x().mul_expr(SdfExpr::x()).complement().sub_expr(SdfExpr::constant(1.into())),
  };
  let p=SdfProgram::compile(Arc::new(Sdf::new(expr)),&mut graph).unwrap();
  let frame=if name=="algebraic-frame" {GridFrame::new([Real::from(2).sqrt().unwrap(),0.into(),0.into()],[Real::from(3).sqrt().unwrap(),1.into(),1.into()],depth,LengthUnit::Meter).unwrap()}
  else {GridFrame::new([0.into(),0.into(),0.into()],[ratio(1,16),ratio(1,16),ratio(1,16)],depth,LengthUnit::Millimeter).unwrap()};
  let run=||{
   let mut graph=ExpressionBudget::new(1_000_000,100_000_000);
   let mut arithmetic=DyadicBudget::new(16384,1_000_000_000_000_000);
   let proof=p.classify_voxel_grid(frame.clone(),SdfVoxelEnclosureOptions{precision:-24,max_cells:512},&mut graph,&mut arithmetic).unwrap();
   let intake=proof.continuous_field_batch(MaterialRegionId(3),&mut graph).unwrap();
   let grid=intake.materialize_exact_sparse_grid().unwrap();
   black_box((proof,intake,grid,100_000_000-graph.remaining_work(),1_000_000_000_000_000-arithmetic.remaining_work()))
  };
  drop(run());
  let ((proof,intake,grid,graph_work,scalar_work),allocations,bytes)=allocations::measure(run);
  let mut hash=DefaultHasher::new();
  for row in &intake.cells {row.address.hash(&mut hash);row.cell.hash(&mut hash);assert_eq!(grid.get(row.address).unwrap(),row.cell);}
  assert_eq!(proof.cells().len(),intake.cells.len());
  let filled=if name=="algebraic-frame"{0}else{intake.cells.len()};assert_eq!(grid.len(),filled);
  println!("complete,{name},{depth},cells,{},filled,{filled},hash,{:x},allocations,{allocations},bytes,{bytes},graph,{graph_work},scalar,{scalar_work}",proof.cells().len(),hash.finish());
  drop((proof,intake,grid));
  for sample in 0..5 {
   let start=Instant::now();for _ in 0..iterations{drop(run());}
   println!("timing,{name},{depth},{sample},{iterations},{}",start.elapsed().as_nanos());
  }
 }
}
