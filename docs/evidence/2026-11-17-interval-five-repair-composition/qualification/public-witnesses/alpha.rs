use hyperlimit::{Certainty, PredicateOutcome, PredicatePolicy, compare_reals};
use hyperreal::Real;
use hypersolve::{
    Constraint, Expr, Problem, SymbolId, UnivariateQuadraticAlphaStatus,
    certify_univariate_quadratic_alpha, context_from_problem,
};

fn unresolved_zero() -> Real {
    (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
}

#[test]
fn exact_residual_does_not_certify_an_unresolved_derivative() {
    // The angle-addition identity makes z exactly zero. Its unresolved strict
    // comparison is already maintained in Hyperlimit's terminal-path corpus.
    let z = unresolved_zero();
    assert!(matches!(
        compare_reals(&z, &Real::zero(), PredicatePolicy::STRICT),
        PredicateOutcome::Unknown { .. }
    ));
    let mut problem = Problem::default();
    problem.add_variable("x", Real::zero());
    let x = Expr::symbol(SymbolId(0), "x");
    problem.add_constraint(Constraint::equality(
        "multiple root with unresolved derivative",
        x.clone().powi(2) + Expr::real(z) * x,
    ));
    let report = certify_univariate_quadratic_alpha(
        &problem.analyze(),
        &context_from_problem(&problem),
        PredicatePolicy::STRICT,
    );
    assert_eq!(report.examined_rows, 1);
    assert_eq!(report.rows[0].residual, Real::zero());
    assert!(matches!(
        compare_reals(
            &report.rows[0].derivative,
            &Real::zero(),
            PredicatePolicy::STRICT
        ),
        PredicateOutcome::Unknown { .. }
    ));
    eprintln!("observed status: {:?}", report.rows[0].status);
    assert_eq!(
        report.rows[0].status,
        UnivariateQuadraticAlphaStatus::Undecided
    );
    assert!(!report.all_examined_rows_certified());
}

#[test]
fn approximate_zero_residual_is_not_an_exact_root_certificate() {
    let residual = unresolved_zero() + Real::from(2).powi_i64(-600).unwrap();
    assert!(matches!(
        compare_reals(&residual, &Real::zero(), PredicatePolicy::STRICT),
        PredicateOutcome::Unknown { .. }
    ));
    assert!(matches!(
        compare_reals(&residual, &Real::zero(), PredicatePolicy::APPROXIMATE_512),
        PredicateOutcome::Decided {
            value: std::cmp::Ordering::Equal,
            certainty: Certainty::Approximate,
            ..
        }
    ));
    let mut problem = Problem::default();
    problem.add_variable("x", Real::zero());
    let x = Expr::symbol(SymbolId(0), "x");
    problem.add_constraint(Constraint::equality(
        "near root with a provably nonzero residual",
        x.clone().powi(2) + Expr::int(2) * x + Expr::real(residual),
    ));
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let report = certify_univariate_quadratic_alpha(
            &problem.analyze(),
            &context_from_problem(&problem),
            policy,
        );
        assert_eq!(report.examined_rows, 1);
        eprintln!("nonzero residual {policy:?}: {:?}", report.rows[0].status);
        // 8 * 2^-600 < 2^2 proves the Newton basin, but not an exact root.
        assert_eq!(
            report.rows[0].status,
            UnivariateQuadraticAlphaStatus::CertifiedSmaleAlphaBound
        );
        assert!(report.all_examined_rows_certified());
    }
}

#[test]
fn zero_derivative_does_not_decide_an_unresolved_residual() {
    let mut problem = Problem::default();
    problem.add_variable("x", Real::zero());
    let x = Expr::symbol(SymbolId(0), "x");
    problem.add_constraint(Constraint::equality(
        "unresolved residual with zero derivative",
        x.powi(2) + Expr::real(unresolved_zero()),
    ));
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let report = certify_univariate_quadratic_alpha(
            &problem.analyze(),
            &context_from_problem(&problem),
            policy,
        );
        assert_eq!(report.examined_rows, 1);
        assert_eq!(report.rows[0].derivative, Real::zero());
        eprintln!("zero derivative {policy:?}: {:?}", report.rows[0].status);
        assert_eq!(
            report.rows[0].status,
            UnivariateQuadraticAlphaStatus::Undecided
        );
        assert!(!report.all_examined_rows_certified());
    }
}
