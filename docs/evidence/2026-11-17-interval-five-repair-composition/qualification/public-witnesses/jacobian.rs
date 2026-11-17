use hyperreal::Real;
use hypersolve::jacobian::{FiniteDifferenceConfig, finite_difference_jacobian};
use hypersolve::{Constraint, Expr, Problem, SymbolId, context_from_problem};

fn check(authored: Real, center: Real, expected: f64) {
    let mut problem = Problem::default();
    problem.add_variable("x", authored);
    problem.add_constraint(Constraint::equality(
        "square",
        Expr::symbol(SymbolId(0), "x").powi(2),
    ));
    let mut context = context_from_problem(&problem);
    context.bind(SymbolId(0), center);
    let bindings = context.bindings().clone();
    let generation = context.generation();
    let result = finite_difference_jacobian(
        &problem,
        &context,
        FiniteDifferenceConfig { step: Real::one() },
    )
    .unwrap();
    // (c+1)^2-c^2 = 2c+1 exactly at these dyadic finite proposal inputs.
    assert_eq!(result, vec![vec![expected]]);
    assert_eq!(context.bindings(), &bindings);
    assert_eq!(context.generation(), generation);
}
#[test]
fn rebound_positive() {
    check(Real::one(), Real::from(3), 7.0);
}
#[test]
fn rebound_zero() {
    check(Real::one(), Real::zero(), 1.0);
}
#[test]
fn rebound_rational() {
    check(Real::one(), (Real::from(3) / Real::from(2)).unwrap(), 4.0);
}
#[test]
fn original_center_controls() {
    check(Real::one(), Real::one(), 3.0);
    check(Real::from(-3), Real::from(-3), -5.0);
}
