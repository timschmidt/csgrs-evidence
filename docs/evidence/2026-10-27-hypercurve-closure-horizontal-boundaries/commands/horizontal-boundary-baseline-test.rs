//! Closed rectangle boundaries are part of the original zero-set domain.

use hyperreal::Real;
use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateCurveTopology, BivariateTopologyConfig, decompose_bivariate_curve,
};

fn domain() -> BivariateCurveDomain {
    BivariateCurveDomain {
        first: [(-2).into(), 2.into()],
        second: [(-2).into(), 2.into()],
    }
}

fn assert_horizontal_topology(topology: &BivariateCurveTopology, ordinates: &[i32]) {
    assert_eq!(topology.domain(), &domain());
    assert_eq!(topology.events().len(), 2);
    assert_eq!(topology.slabs().len(), 1);
    for event in topology.events() {
        assert_eq!(event.roots().len(), ordinates.len());
        for (root, y) in event.roots().iter().zip(ordinates) {
            assert_eq!(root.exact_root.as_ref(), Some(&Real::from(*y)));
        }
    }
    let slab = &topology.slabs()[0];
    assert_eq!(slab.arcs().len(), ordinates.len());
    for (index, arc) in slab.arcs().iter().enumerate() {
        assert_eq!((arc.left_root(), arc.right_root()), (index, index));
    }
    assert!(slab.connections().iter().all(Option::is_some));
    for proof in slab.connections().iter().flatten() {
        assert_eq!(proof.root_counts(), vec![1; ordinates.len()]);
    }
    assert_eq!(topology.rational_fiber(&Real::zero(), Default::default()).unwrap().roots().len(), ordinates.len());
    assert_eq!(decompose_bivariate_curve(topology.equation(), topology.domain(), topology.config()).unwrap(), *topology);
}

#[test]
fn original_horizontal_boundary_component_is_a_complete_closed_graph() {
    // Preserve the original lower-boundary blocker fixture and its reflected upper boundary.
    for (constant, ordinate) in [(2, -2), (-2, 2)] {
        let equation = BivariatePolynomial::new(vec![vec![constant.into(), 1.into()]]);
        let topology = decompose_bivariate_curve(&equation, &domain(), BivariateTopologyConfig::default()).unwrap();
        assert_eq!(topology.equation(), &equation);
        assert_horizontal_topology(&topology, &[ordinate]);
    }
}

#[test]
fn both_horizontal_boundary_factors_retain_distinct_components() {
    let equation = BivariatePolynomial::new(vec![vec![(-4).into(), 0.into(), 1.into()]]);
    let topology = decompose_bivariate_curve(&equation, &domain(), BivariateTopologyConfig::default()).unwrap();
    assert_eq!(topology.equation(), &equation);
    assert_horizontal_topology(&topology, &[-2, 2]);
}
