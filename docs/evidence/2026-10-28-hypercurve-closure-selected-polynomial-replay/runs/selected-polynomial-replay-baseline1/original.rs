//! Exact graph replay must retain joint selections and original equations.

#[path = "/home/tim/Documents/GitHub/workspace/csgrs-closure-work/selected-polynomial-replay/crates/hypersolve/tests/support/recursive_quadratic.rs"]
#[allow(dead_code)]
mod support;

use hyperreal::{Real, RealSign};
use hypersolve::classification::Classification;
use hypersolve::recursive_quadratic_field::RecursiveQuadraticField;
use hypersolve::selected_polynomial_field::{
    SelectedPolynomialDefinition, SelectedPolynomialField, SelectedPolynomialValue,
};
use support::*;

fn decided<T: std::fmt::Debug>(result: Classification<T>) -> T {
    match result {
        Classification::Decided(value) => value,
        other => panic!("expected exact completion: {other:?}"),
    }
}

fn base() -> SelectedPolynomialField {
    SelectedPolynomialField::from_recursive(
        RecursiveQuadraticField::base(
            Vec::new(), constant_tensor(0, real(1)), constant_tensor(0, real(1)),
        ).unwrap(),
    )
}

fn root(value: &SelectedPolynomialValue, degree: usize) -> SelectedPolynomialValue {
    let field = value.field();
    let mut coefficients = vec![field.constant(real(0)).unwrap(); degree + 1];
    coefficients[0] = value.scale(&real(-1)).unwrap();
    coefficients[degree] = field.constant(real(1)).unwrap();
    decided(field.select(coefficients, real(1), real(2), &TestContext::strict()).unwrap())
        .generator().unwrap()
}

fn power(value: &SelectedPolynomialValue, exponent: usize) -> SelectedPolynomialValue {
    (0..exponent).fold(value.field().constant(real(1)).unwrap(), |v, _| v.multiply(value).unwrap())
}

fn zero(value: &SelectedPolynomialValue) {
    assert_eq!(value.sign(&TestContext::strict()).unwrap(), Classification::Decided(RealSign::Zero));
}

#[test]
fn dependent_polynomial_graph_replay_retains_joint_authority() {
    let q = base();
    let a = root(&q.constant(real(2)).unwrap(), 3);
    let b = root(&a, 3);
    let c = root(&b, 5);
    let x = c.add(&b).unwrap();
    let y = decided(c.divide(&x, &TestContext::strict()).unwrap());
    let graph = SelectedPolynomialDefinition::from_values(&[a, b, c, x, y], 10000).unwrap();
    let values = decided(graph.replay(10000, &TestContext::strict()).unwrap());
    let [a, b, c, x, y] = values.as_slice() else { panic!("five roots") };
    assert!(b.field().parent().unwrap().shares_authority(a.field()));
    assert!(c.field().parent().unwrap().shares_authority(b.field()));
    assert!(x.field().shares_authority(c.field()));
    assert!(y.field().shares_authority(c.field()));
    zero(&power(a, 3).subtract(&a.field().constant(real(2)).unwrap()).unwrap());
    zero(&power(b, 3).subtract(a).unwrap());
    zero(&power(c, 5).subtract(b).unwrap());
    zero(&power(c, 45).subtract(&c.field().constant(real(2)).unwrap()).unwrap());
    zero(&x.multiply(y).unwrap().subtract(c).unwrap());
    let next = root(c, 3);
    zero(&power(&next, 3).subtract(c).unwrap());
    let bounds = decided(c.enclosed(&TestContext::strict()).unwrap());
    let bounds = decided(bounds.refined(5, &TestContext::strict()).unwrap());
    assert_eq!(&bounds.interval().upper - &bounds.interval().lower, fraction(1, 32));
}
