use hyperreal::Real;
use hypervoxel::{CellBounds, ExactAffineTransform, HypervoxelError};

#[path = "../../hypersdf/tests/support/uncertainty.rs"]
mod uncertainty;

#[test]
fn finite_coefficient_can_have_undecided_exact_order() {
    let zero = uncertainty::terminal_zero(Real::zero());
    assert!(zero.certified_dyadic_interval(-16).is_some());
    let transform = ExactAffineTransform::new(
        [[zero, 0.into(), 0.into()], [0.into(), 1.into(), 0.into()], [0.into(), 0.into(), 1.into()]],
        [0.into(), 0.into(), 0.into()],
    );
    let bounds = CellBounds { min: [1.into(), 1.into(), 1.into()], max: [2.into(), 2.into(), 2.into()] };
    assert!(matches!(transform.map_bounds(&bounds), Err(HypervoxelError::UnknownScalarOrdering { field: "affine term order" })));
}
