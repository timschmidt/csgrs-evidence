use hypercurve::*;
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial, IsolatedRootInterval};
use std::cmp::Ordering;

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn p(rows: &[&[i32]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter().map(|row| row.iter().copied().map(Real::from).collect()).collect(),
    )
}
fn x() -> BivariatePolynomial { p(&[&[], &[1]]) }
fn y() -> BivariatePolynomial { p(&[&[0, 1]]) }
fn form(point: &CurvePoint2, numerator: BivariatePolynomial) -> CurvePointRationalForm2 {
    point.rational_form(numerator, p(&[&[1]])).unwrap()
}
fn zero(point: &CurvePoint2, equation: BivariatePolynomial) {
    assert_eq!(form(point, equation).compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
}
fn source() -> CurvePoint2 {
    let parameter = BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![q(-1, 8), 0.into(), 1.into()]).unwrap(),
            BezierParameterInterval::try_new(q(1, 3), q(1, 2)).unwrap(),
        ).unwrap(),
    );
    CurvePointDefinition2::PolynomialFiber {
        equation: p(&[&[0, 0, 0, 16], &[-1]]),
        parameter: parameter.into(),
        root: IsolatedRootInterval {
            lower: q(1, 4), upper: q(3, 8), exact_root: None, distinct_root_count: 1,
        },
    }.into_point().unwrap()
}
fn curves(equation: BivariatePolynomial) -> PolynomialCurveSet2 {
    curves_with_config(equation, AlgebraicFiberRootIsolationConfig::default())
}
fn curves_with_config(equation: BivariatePolynomial, config: AlgebraicFiberRootIsolationConfig) -> PolynomialCurveSet2 {
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain { first: [(-1).into(), 1.into()], second: [(-2).into(), 2.into()] },
        BivariateTopologyConfig::default(),
    ).unwrap();
    PolynomialCurveSet2::from_topology(topology, config).unwrap()
}

#[test]
fn selected_fiber_abscissa_has_independent_exact_relations() {
    let source = source();
    zero(&source, p(&[&[-1], &[], &[8]]));
    zero(&source, p(&[&[0, 0, 0, 16], &[-1]]));
    let value = form(&source, y());
    assert_eq!(value.compare_to_real(&q(1, 4)).unwrap(), Ordering::Greater);
    assert_eq!(value.compare_to_real(&q(3, 8)).unwrap(), Ordering::Less);
    let parameter = value.parameter().unwrap();
    assert!(parameter.as_bezier_parameter().is_none());
    assert!(parameter.rational_form_source().is_some());
}

#[test]
fn polynomial_branch_consumes_a_nested_selected_fiber_query() {
    let source = source();
    let value = form(&source, y());
    let parameter = value.parameter().unwrap();
    let set = curves(p(&[&[0, 0, 1], &[-1]]));
    assert_eq!(set.curves().len(), 2);
    let branch = &set.curves()[1];
    let point = branch.point_at(&parameter).expect("the positive square-root branch must consume the selected cubic fiber query");
    zero(&point, p(&[&[0, 0, 1], &[-1]]));
    zero(&point, p(&[&[-1], &[], &[], &[], &[], &[], &[2048]]));
    assert_eq!(form(&point, x()).compare(&value).unwrap(), Ordering::Equal);
    assert_eq!(form(&point, y()).compare_to_real(&Real::zero()).unwrap(), Ordering::Greater);
    let CurvePointLocations2::Locations(locations) = branch.point_locations(&point).unwrap() else { panic!("isolated graph preimage") };
    assert_eq!(locations.len(), 1);
    assert_eq!(locations[0].parameter().unwrap().compare(&parameter).unwrap(), Ordering::Equal);
    let replay = point.definition().unwrap().into_point().unwrap();
    assert!(replay.coincides_with(&point).unwrap());
    let next = curves(p(&[&[0, 1], &[], &[-1]]));
    let ordinate = form(&replay, y()).parameter().unwrap();
    let next_point = next.curves()[0].point_at(&ordinate).unwrap();
    assert_eq!(form(&next_point, y()).compare(&value).unwrap(), Ordering::Equal);
    zero(&next_point, p(&[&[0, 1], &[], &[-1]]));
}

#[test]
fn selected_query_fiber_respects_the_configured_subdivision_limit() {
    let parameter = form(&source(), y()).parameter().unwrap();
    let equation = p(&[&[0, 0, 1], &[-1]]);
    let limited = curves_with_config(equation.clone(), AlgebraicFiberRootIsolationConfig {
        max_subdivision_depth: 0,
        refinement_steps: 8,
    });
    let error = limited.curves()[1].point_at(&parameter).expect_err("a zero subdivision allowance must not publish a completed fiber");
    assert!(matches!(error, ExactCurveError::Blocked(blocker) if blocker.reason() == UncertaintyReason::BudgetExhausted));
    let retry = curves(equation.clone());
    zero(&retry.curves()[1].point_at(&parameter).unwrap(), equation);
}
