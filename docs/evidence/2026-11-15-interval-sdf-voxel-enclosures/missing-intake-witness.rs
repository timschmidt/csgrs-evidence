#![cfg(all(feature = "enclosure-program", feature = "hypervoxel-adapter"))]
use hyperinterval::DyadicBudget;
use hypersdf::{Sdf, SdfExpr, SdfProgram};
use hypersolve::expression_program::ExpressionBudget;
use hypervoxel::GridFrame;
use std::sync::Arc;
#[test]
fn native_source_classifies_a_complete_voxel_frame() {
    let mut graph = ExpressionBudget::new(10000,1000000);
    let p = SdfProgram::compile(Arc::new(Sdf::new(SdfExpr::constant((-1).into()))),&mut graph).unwrap();
    let report = p.classify_voxel_grid(GridFrame::unit(0).unwrap(),Default::default(),&mut graph,&mut DyadicBudget::new(4096,1_000_000_000)).unwrap();
    assert_eq!(report.cells().len(),1);
}
