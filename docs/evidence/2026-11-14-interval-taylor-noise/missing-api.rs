#![cfg(feature = "taylor-affine")]
use hypersolve::expression_program::TaylorNoiseModel;
#[test]
fn noise_carrier_is_available() {
    assert!(core::mem::size_of::<TaylorNoiseModel>() > 0);
}
