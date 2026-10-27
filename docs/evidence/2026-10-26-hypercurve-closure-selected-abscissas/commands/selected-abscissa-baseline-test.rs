//! Polynomial source charts must consume retained rational coordinates.

use hypercurve::{Curve2, CurvePoint2, Point2, PolynomialCurveSet2, QuadraticBezier2, Real};
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};
use std::cmp::Ordering;

fn polynomial(rows: &[&[i32]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter()
            .map(|row| row.iter().copied().map(Real::from).collect())
            .collect(),
    )
}

fn curves(equation: BivariatePolynomial) -> PolynomialCurveSet2 {
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    PolynomialCurveSet2::from_topology(topology, AlgebraicFiberRootIsolationConfig::default())
        .unwrap()
}

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn on(point: &CurvePoint2, equation: BivariatePolynomial) {
    assert_eq!(
        point
            .rational_form(equation, polynomial(&[&[1]]))
            .unwrap()
            .compare_to_real(&Real::zero())
            .unwrap(),
        Ordering::Equal
    );
}

fn quintic() -> BivariatePolynomial {
    polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]])
}

#[test]
fn polynomial_branch_consumes_retained_rational_abscissa() {
    // C(t)=(t^3,t^2); at y=1/2 the positive t and x=t^3 remain correlated.
    let cubic = Curve2::from(hypercurve::CubicBezier2::new(
        Point2::from_values(0, 0),
        Point2::from_values(0, 0),
        Point2::new(0.into(), q(1, 3)),
        Point2::from_values(1, 1),
    ));
    let line = Curve2::from(
        hypercurve::LineSeg2::try_new(
            Point2::new(0.into(), q(1, 2)),
            Point2::new(1.into(), q(1, 2)),
        )
        .unwrap(),
    );
    let contact = cubic.intersect_curve(&line).unwrap();
    assert_eq!(contact.contacts().len(), 1);
    let point = contact.contacts()[0].point().clone();
    assert!(point.coordinates().is_none());
    on(&point, polynomial(&[&[0, 0, 0, 1], &[], &[-1]]));
    let x = point
        .affine_form(1.into(), 0.into(), 0.into())
        .parameter()
        .unwrap();
    drop(contact);
    drop(cubic);
    drop(line);
    let set = curves(polynomial(&[&[0, 0, 0, 1], &[], &[-1]]));
    assert_eq!(set.curves().len(), 2);
    let branch = &set.curves()[1];
    assert_eq!(
        branch
            .parameter_domain()
            .start()
            .compare(&Real::zero().into())
            .unwrap(),
        Ordering::Equal
    );
    let replay = branch.point_at(&x).unwrap();
    assert!(replay.coincides_with(&point).unwrap());
    on(&replay, polynomial(&[&[0, 0, 0, 1], &[], &[-1]]));
    assert_eq!(
        replay
            .affine_form(0.into(), 1.into(), 0.into())
            .compare_to_real(&q(1, 2))
            .unwrap(),
        Ordering::Equal
    );
}

#[test]
fn polynomial_branch_consumes_fifth_degree_rational_abscissa() {
    // C(t)=(t^2,t^5), so at y=1/2 the source x solves 4x^5=1.
    let controls = (0..=5)
        .map(|i| {
            Point2::new(
                q(i * (i - 1), 20),
                if i == 5 { Real::one() } else { Real::zero() },
            )
        })
        .collect();
    let source =
        Curve2::from(hypercurve::RationalBezier2::try_new(controls, vec![Real::one(); 6]).unwrap());
    let line = Curve2::from(
        hypercurve::LineSeg2::try_new(
            Point2::new(0.into(), q(1, 2)),
            Point2::new(1.into(), q(1, 2)),
        )
        .unwrap(),
    );
    let contact = source.intersect_curve(&line).unwrap();
    assert_eq!(contact.contacts().len(), 1);
    let point = contact.contacts()[0].point().clone();
    assert!(point.coordinates().is_none());
    let equation = polynomial(&[&[0, 0, 1], &[], &[], &[], &[], &[-1]]);
    on(&point, equation.clone());
    let x = point
        .affine_form(1.into(), 0.into(), 0.into())
        .parameter()
        .unwrap();
    drop(contact);
    drop(source);
    drop(line);
    let set = curves(equation.clone());
    assert_eq!(set.curves().len(), 2);
    let replay = set.curves()[1].point_at(&x).unwrap();
    assert!(replay.coincides_with(&point).unwrap());
    on(&replay, equation);
    on(&replay, polynomial(&[&[-1], &[], &[], &[], &[], &[4]]));
    assert_eq!(
        replay
            .affine_form(0.into(), 1.into(), 0.into())
            .compare_to_real(&q(1, 2))
            .unwrap(),
        Ordering::Equal
    );
}

#[test]
fn polynomial_branch_consumes_generic_quintic_abscissa_without_projection() {
    let polynomial = hypercurve::BezierParameterPolynomial::try_new_power_basis(
        [-5, 5, 1, 0, 0, 1].into_iter().map(Real::from).collect(),
    )
    .unwrap();
    let roots = polynomial.isolate_unit_interval_roots().unwrap();
    assert_eq!(roots.len(), 1);
    let parameter = roots[0].clone().into();
    let source = Curve2::from(QuadraticBezier2::new(
        Point2::from_values(0, 0),
        Point2::new(0.into(), q(-1, 2)),
        Point2::from_values(1, -1),
    ));
    let point = source.point_at(&parameter).unwrap();
    assert!(point.coordinates().is_none());
    on(&point, quintic());
    on(&point, polynomial_from_parabola());
    let x = point
        .affine_form(1.into(), 0.into(), 0.into())
        .parameter()
        .unwrap();
    assert!(x.as_bezier_parameter().is_none());
    drop(source);
    drop(roots);
    let set = curves(quintic());
    let replay = set.curves()[0].point_at(&x).unwrap();
    assert!(replay.coincides_with(&point).unwrap());
    on(&replay, quintic());
    on(&replay, polynomial_from_parabola());
}

fn polynomial_from_parabola() -> BivariatePolynomial {
    polynomial(&[&[0, 0, 1], &[-1]])
}
