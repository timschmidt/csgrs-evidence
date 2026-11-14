#![cfg(feature = "enclosure-program")]
use hyperlattice::Matrix4;
use hyperlimit::Point3;
use hyperreal::Real;
use hypersdf::{Sdf, SdfExpr, SdfProgram};
use hypersolve::expression_program::ExpressionBudget;
use std::sync::Arc;

fn frame() -> Matrix4 {
    Matrix4([
        [1.into(), 2.into(), 0.into(), 3.into()],
        [0.into(), 1.into(), 0.into(), 0.into()],
        [0.into(), 0.into(), (-2).into(), 1.into()],
        [0.into(), 0.into(), 0.into(), 1.into()],
    ])
}
fn field() -> Arc<Sdf> {
    Arc::new(Sdf::new(
        SdfExpr::sphere(Point3::new(0.into(), 0.into(), 0.into()), 4.into())
            .affine_transform(frame())
            .unwrap(),
    ))
}
fn graph() -> ExpressionBudget {
    ExpressionBudget::new(1_000_000, 100_000_000)
}
#[test]
fn sheared_reflected_sphere_is_a_native_program_operand() {
    let source = field();
    // Inverse coordinates at (6,1,3) are (1,1,-1): squared norm minus 4 is -1.
    let p = SdfProgram::compile(source.clone(), &mut graph()).unwrap();
    assert!(Arc::ptr_eq(p.source(), &source));
    assert_eq!(
        p.program().eval_real(&[6.into(), 1.into(), 3.into()], &mut graph()).unwrap(),
        vec![Real::from(-1)]
    );
}
