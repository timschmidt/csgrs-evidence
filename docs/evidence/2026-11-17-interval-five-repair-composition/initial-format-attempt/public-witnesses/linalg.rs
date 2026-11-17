use hypersolve::{DenseLinearBackend, LinearBackend};

#[test]
fn finite_normal_overflow_is_explicit() {
    let result = DenseLinearBackend.solve_damped_normal(&[vec![1e308]], &[1e308], 0.0);
    assert_eq!(format!("{:?}", result.unwrap_err()), "NonFiniteArithmetic");
}
#[test]
fn nonfinite_normal_input_is_explicit() {
    let result = DenseLinearBackend.solve_damped_normal(&[vec![f64::NAN]], &[1.0], 0.0);
    assert_eq!(format!("{:?}", result.unwrap_err()), "NonFiniteInput");
}
#[test]
fn dogleg_overflow_is_not_zero_success() {
    let result = DenseLinearBackend.solve_dogleg(&[vec![1.0]], &[1e200], 1.0);
    assert_eq!(format!("{:?}", result.unwrap_err()), "NonFiniteArithmetic");
}
#[test]
fn bfgs_overflow_is_not_zero_success() {
    let result = DenseLinearBackend.solve_bfgs_direction(&[vec![1.0]], &[1e200], 1.0);
    assert_eq!(format!("{:?}", result.unwrap_err()), "NonFiniteArithmetic");
}
#[test]
fn finite_backend_controls() {
    for result in [
        DenseLinearBackend.solve_damped_normal(&[vec![1.0]], &[1.0], 0.0),
        DenseLinearBackend.solve_dogleg(&[vec![1.0]], &[1.0], 1.0),
        DenseLinearBackend.solve_bfgs_direction(&[vec![1.0]], &[1.0], 1.0),
    ] {
        assert_eq!(result.unwrap().0, vec![-1.0]);
    }
}
