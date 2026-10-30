use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyError, decompose_bivariate_curve,
};

fn domain() -> BivariateCurveDomain {
    BivariateCurveDomain {
        first: [(-1_i32).into(), 1_i32.into()],
        second: [(-2_i32).into(), 2_i32.into()],
    }
}

fn assert_empty(equation: BivariatePolynomial) {
    let rectangle = domain();
    let topology = decompose_bivariate_curve(&equation, &rectangle, Default::default())
        .expect("the equation has no real zero in the closed rectangle");
    assert_eq!(topology.equation(), &equation);
    assert_eq!(topology.domain(), &rectangle);
    assert!(topology.events().iter().all(|event| event.roots().is_empty()));
    assert!(topology.slabs().iter().all(|slab| slab.arcs().is_empty()));
    for x in [-1_i32, 0, 1] {
        assert!(
            topology
                .rational_fiber(&x.into(), Default::default())
                .unwrap()
                .roots()
                .is_empty()
        );
    }
}

#[test]
fn positive_axis_polynomial_has_empty_topology() {
    // x^2 + 1 >= 1 for every real x, independently of the solver.
    assert_empty(BivariatePolynomial::new(vec![
        vec![1_i32.into()],
        vec![],
        vec![1_i32.into()],
    ]));
}

#[test]
fn excluded_axis_root_has_empty_topology() {
    // The sole zero of x - 3 is outside the closed x-domain [-1, 1].
    assert_empty(BivariatePolynomial::new(vec![
        vec![(-3_i32).into()],
        vec![1_i32.into()],
    ]));
}

#[test]
fn existing_constant_empty_and_live_vertical_outcomes_stay_distinct() {
    assert_empty(BivariatePolynomial::new(vec![vec![2_i32.into()]]));
    for offset in [-1_i32, 0, 1] {
        let equation = BivariatePolynomial::new(vec![
            vec![offset.into()],
            vec![1_i32.into()],
        ]);
        assert_eq!(
            decompose_bivariate_curve(&equation, &domain(), Default::default()),
            Err(BivariateTopologyError::VerticalComponent)
        );
    }
}

#[test]
fn malformed_domain_is_not_hidden_by_empty_geometry() {
    let equation = BivariatePolynomial::new(vec![vec![2_i32.into()]]);
    let mut rectangle = domain();
    rectangle.first = [1_i32.into(), (-1_i32).into()];
    assert_eq!(
        decompose_bivariate_curve(&equation, &rectangle, Default::default()),
        Err(BivariateTopologyError::InvalidDomain)
    );
}
