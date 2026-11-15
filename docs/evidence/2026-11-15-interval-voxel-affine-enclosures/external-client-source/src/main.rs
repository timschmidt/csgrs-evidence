use hyperinterval::DyadicBudget;
use hyperreal::Real;
use hypersdf::{Sdf, SdfExpr, SdfProgram, SdfCellLocation};
use hypersolve::expression_program::ExpressionBudget;
use hypervoxel::{CellBounds, ExactAffineTransform};
use std::sync::Arc;
fn main() -> Result<(),Box<dyn std::error::Error>> {
 let transform = ExactAffineTransform::new([[Real::from(2).sqrt()?,0.into(),0.into()],[0.into(),1.into(),0.into()],[0.into(),0.into(),1.into()]],[3.into(),0.into(),0.into()]);
 let source = CellBounds {min:[0.into(),0.into(),0.into()],max:[1.into(),1.into(),1.into()]};
 let mut budget=DyadicBudget::new(16384,1_000_000_000_000);
 let transformed=transform.enclose_bounds(&source,-24,&mut budget)?;
 let mut graph=ExpressionBudget::new(100_000,1_000_000);
 let program=SdfProgram::compile(Arc::new(Sdf::new(SdfExpr::x().sub_expr(SdfExpr::constant(10.into())))),&mut graph)?;
 let proof=program.image(transformed.bounds().lanes().unwrap().clone(),-24,&mut graph,&mut budget)?;
 assert_eq!(proof.location(),Some(SdfCellLocation::ConservativeInside));
 assert!(Arc::ptr_eq(proof.source().source(),program.source()));
 assert_eq!(transformed.source(),&source);
 // SDF proof pertains to the enclosing box: hence also to every transformed
 // source point. Keep both independent source associations alive.
 println!("exact affine source -> certified box -> source-bound whole-cell inside proof");
 Ok(())
}
