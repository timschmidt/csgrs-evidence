#![cfg(feature = "qr-coordinates")]
use hyperdynamics::field::coordinates::CoordinateField;
#[test]
fn automatic_qr_evolution_is_available() {
    let _ = CoordinateField::<2>::integrate_qr;
}
