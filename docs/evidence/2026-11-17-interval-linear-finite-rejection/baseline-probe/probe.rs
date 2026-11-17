pub mod linalg;
use linalg::{
    DenseLinearBackend, LinearAdapterKind, LinearAdapterPrecision, LinearBackend, LinearSolveError,
};

#[test]
fn diagonal_solution_and_receipt() {
    let (x, r) = DenseLinearBackend
        .solve_damped_normal(&[vec![0.0, 2.0], vec![3.0, 0.0]], &[-4.0, -9.0], 0.0)
        .unwrap();
    assert_eq!(x, [3.0, 2.0]);
    assert_eq!(r.adapter, LinearAdapterKind::DenseF64NormalEquations);
    assert_eq!(r.precision(), LinearAdapterPrecision::LossyF64);
    assert!(r.lossy && r.is_lossy());
    assert_eq!((r.rank_hint, r.pivot_count, r.row_swaps), (Some(2), 2, 0));
    assert_eq!((r.min_abs_pivot, r.max_abs_pivot), (Some(4.0), Some(9.0)));
}
#[test]
fn damped_solution() {
    let (x, r) = DenseLinearBackend
        .solve_damped_normal(&[vec![2.0]], &[-5.0], 1.0)
        .unwrap();
    assert_eq!(x, [2.0]);
    assert_eq!(r.damping, 1.0);
}
#[test]
fn shapes_are_checked() {
    let b = DenseLinearBackend;
    for matrix in [vec![vec![1.0]], vec![vec![1.0], vec![]]] {
        assert_eq!(
            b.solve_damped_normal(&matrix, &[1.0, 1.0], 0.0)
                .unwrap_err(),
            LinearSolveError::DimensionMismatch
        );
        assert_eq!(
            b.solve_dogleg(&matrix, &[1.0, 1.0], 1.0).unwrap_err(),
            LinearSolveError::DimensionMismatch
        );
    }
    assert_eq!(
        b.solve_bfgs_direction(&[vec![]], &[1.0], 1.0).unwrap_err(),
        LinearSolveError::DimensionMismatch
    );
}
#[test]
fn empty_and_zero_width_systems() {
    for matrix in [vec![], vec![vec![]]] {
        let residuals = vec![1.0; matrix.len()];
        for (x, r) in [
            DenseLinearBackend
                .solve_damped_normal(&matrix, &residuals, 0.0)
                .unwrap(),
            DenseLinearBackend
                .solve_dogleg(&matrix, &residuals, 1.0)
                .unwrap(),
        ] {
            assert!(x.is_empty());
            assert!(r.is_lossy());
            assert_eq!((r.rank_hint, r.pivot_count), (Some(0), 0));
            assert_eq!((r.min_abs_pivot, r.max_abs_pivot), (None, None));
        }
    }
    assert!(
        DenseLinearBackend
            .solve_bfgs_direction(&[], &[], 1.0)
            .unwrap()
            .0
            .is_empty()
    );
}
#[test]
fn singular_and_tiny_pivots() {
    for x in [0.0, f64::EPSILON] {
        assert_eq!(
            DenseLinearBackend
                .solve_damped_normal(&[vec![x]], &[1.0], 0.0)
                .unwrap_err(),
            LinearSolveError::Singular
        );
        assert_eq!(
            DenseLinearBackend
                .solve_dogleg(&[vec![x]], &[1.0], 1.0)
                .unwrap_err(),
            LinearSolveError::Singular
        );
    }
}
#[test]
fn dogleg_gauss_newton_and_cauchy() {
    assert_eq!(
        DenseLinearBackend
            .solve_dogleg(&[vec![2.0]], &[-4.0], 3.0)
            .unwrap()
            .0,
        [2.0]
    );
    assert_eq!(
        DenseLinearBackend
            .solve_dogleg(&[vec![2.0]], &[-4.0], 1.0)
            .unwrap()
            .0,
        [1.0]
    );
}
#[test]
fn dogleg_interpolated_boundary() {
    let (x, r) = DenseLinearBackend
        .solve_dogleg(&[vec![1.0, 0.0], vec![0.0, 2.0]], &[-1.0, -2.0], 1.2)
        .unwrap();
    // GN=(1,1); steepest-descent endpoint=(17/65,68/65).
    // Independent geometric conditions select the segment/sphere intersection.
    let tau = (x[0] - 17.0 / 65.0) / (1.0 - 17.0 / 65.0);
    assert!(tau > 0.0 && tau < 1.0);
    assert!((x[1] - (68.0 / 65.0 + tau * (1.0 - 68.0 / 65.0))).abs() < 1e-14);
    assert!((x[0] * x[0] + x[1] * x[1] - 1.44).abs() < 1e-14);
    assert!(r.is_lossy());
}
#[test]
fn bfgs_direction_and_clipping() {
    for (limit, expected) in [(10.0, vec![-3.0, -4.0]), (2.5, vec![-1.5, -2.0])] {
        let (x, r) = DenseLinearBackend
            .solve_bfgs_direction(&[vec![1.0, 0.0], vec![0.0, 1.0]], &[3.0, 4.0], limit)
            .unwrap();
        assert_eq!(x, expected);
        assert_eq!(r.adapter, LinearAdapterKind::DenseF64BfgsDirection);
        assert!(r.is_lossy());
        assert_eq!(r.pivot_count, 0);
    }
}
#[test]
fn nonpositive_limits_are_clamped_characterization() {
    for limit in [0.0, -1.0] {
        assert_eq!(
            DenseLinearBackend
                .solve_dogleg(&[vec![1.0]], &[-1.0], limit)
                .unwrap()
                .0,
            [f64::EPSILON]
        );
        assert_eq!(
            DenseLinearBackend
                .solve_bfgs_direction(&[vec![1.0]], &[1.0], limit)
                .unwrap()
                .0,
            [-f64::EPSILON]
        );
    }
}
#[test]
#[ignore = "missing acceptance: finite inputs must not yield a successful NaN proposal"]
fn finite_overflow_normal_must_fail() {
    let result = DenseLinearBackend.solve_damped_normal(&[vec![1e308]], &[1e308], 0.0);
    assert!(result.is_err(), "actual {result:?}");
}
#[test]
#[ignore = "missing acceptance: finite inputs must not yield a successful NaN proposal"]
fn finite_overflow_bfgs_must_fail() {
    let result = DenseLinearBackend.solve_bfgs_direction(&[vec![1e308]], &[2.0], 1.0);
    assert!(result.is_err(), "actual {result:?}");
}
#[test]
#[ignore = "missing acceptance: NaN input must not yield a successful proposal"]
fn nan_normal_must_fail() {
    let result = DenseLinearBackend.solve_damped_normal(&[vec![f64::NAN]], &[1.0], 0.0);
    assert!(result.is_err(), "actual {result:?}");
}
