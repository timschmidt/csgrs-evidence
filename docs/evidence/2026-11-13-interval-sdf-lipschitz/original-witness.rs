use hyperlattice::Matrix4;
use hyperlimit::{Point3, PredicatePolicy, compare_reals};
use hyperreal::Real;
use hypersdf::{Sdf, SdfExpr};
use std::cmp::Ordering;

#[test]
fn inverse_affine_expansion_cannot_understate_a_certified_lipschitz_bound() {
    let mut matrix = Matrix4::identity();
    matrix.0[0][0] = (Real::one() / Real::from(2)).unwrap();
    let sdf = Sdf::new(SdfExpr::x().affine_transform(matrix).unwrap());
    let lo = Point3::new(0.into(), 0.into(), 0.into());
    let hi = Point3::new(1.into(), 0.into(), 0.into());
    let report = sdf.lipschitz_cell(&lo, &hi);
    assert!(report.is_certified());
    let delta = sdf.evaluate_point(&hi).unwrap() - sdf.evaluate_point(&lo).unwrap();
    assert_eq!(delta, Real::from(2));
    // World distance is exactly one, so a certified bound must be at least 2.
    assert_ne!(
        compare_reals(
            report.bound.as_ref().unwrap(),
            &delta,
            PredicatePolicy::STRICT
        )
        .value(),
        Some(Ordering::Less),
        "certified affine bound is smaller than the exact difference quotient"
    );
}
