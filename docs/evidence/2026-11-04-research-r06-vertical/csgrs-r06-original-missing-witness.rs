//! R06: a complete vertical component is an interval, not an empty point fiber.
use hyperreal::Real;
use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_topology::{BivariateCurveDomain, decompose_bivariate_curve};

#[test]
fn a_vertical_line_has_a_complete_closed_component() {
    let equation = BivariatePolynomial::new(vec![vec![Real::zero()], vec![Real::one()]]);
    let domain = BivariateCurveDomain {
        first: [(-2).into(), 2.into()],
        second: [(-3).into(), 3.into()],
    };
    let topology = decompose_bivariate_curve(&equation, &domain, Default::default())
        .expect("a vertical line has a finite exact component description");
    assert_eq!(topology.equation(), &equation);
    assert!(!topology.is_empty());
}
