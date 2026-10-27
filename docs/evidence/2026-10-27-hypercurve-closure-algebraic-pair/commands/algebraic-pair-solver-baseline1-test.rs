//! Nonzero algebraic equation scales preserve a selected common fiber.

use hyperlimit::{Certainty, PredicatePolicy};
use hyperreal::Real;
use hypersolve::algebraic::{
    AlgebraicRootRepresentation, AlgebraicRootValidationReport, AlgebraicRootValidationStatus,
    validate_algebraic_root_representation,
};
use hypersolve::algebraic_fiber::{
    AlgebraicFiberRootCountStatus, count_bivariate_common_fiber_roots_at_algebraic_parameter,
};
use hypersolve::root_isolation::IsolatedRootInterval;
use hypersolve::symbolic::SymbolId;
use hypersolve::{BivariatePolynomial, CurveResultantParameter};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn retained_root() -> AlgebraicRootRepresentation {
    // Eliminating y from y^2=x and y^5+5y+5=x gives this equation.
    // Its unique root in (3/5,7/10) has the negative common ordinate.
    let mut root = AlgebraicRootRepresentation {
        constraint_index: 0,
        symbol: SymbolId(0),
        interval_index: 0,
        polynomial_coefficients: vec![
            (-25).into(),
            35.into(),
            (-1).into(),
            10.into(),
            0.into(),
            1.into(),
        ],
        interval: IsolatedRootInterval {
            lower: q(3, 5),
            upper: q(7, 10),
            exact_root: None,
            distinct_root_count: 1,
        },
        validation: AlgebraicRootValidationReport {
            status: AlgebraicRootValidationStatus::Valid,
            message: None,
        },
    };
    root.validation = validate_algebraic_root_representation(&root, PredicatePolicy::STRICT);
    assert!(root.is_valid());
    root
}

fn check_count(scale: Real) {
    let root = retained_root();
    let g = BivariatePolynomial::new(vec![vec![0.into(), 0.into(), 1.into()], vec![(-1).into()]]);
    let f = BivariatePolynomial::new(vec![
        vec![
            Real::from(5) * &scale,
            Real::from(5) * &scale,
            0.into(),
            0.into(),
            0.into(),
            scale.clone(),
        ],
        vec![-scale],
    ]);
    let report = count_bivariate_common_fiber_roots_at_algebraic_parameter(
        &g,
        &f,
        CurveResultantParameter::First,
        &root,
        &(-1).into(),
        &q(-1, 2),
        PredicatePolicy::STRICT,
    );
    assert_eq!(report.status, AlgebraicFiberRootCountStatus::Counted);
    assert_eq!(report.certainty, Certainty::Exact);
    assert_eq!(report.distinct_root_count, Some(1));
}

#[test]
fn unscaled_quintic_common_fiber_is_exact() {
    check_count(Real::one());
}

#[test]
fn common_fiber_count_preserves_algebraic_constant_scaling() {
    let s = Real::from(2).root_n(7).unwrap();
    let square = &s * &s;
    let fourth = &square * &square;
    let fifth = &fourth * &s;
    check_count(fifth);
}
