//! Polynomial sections retain authored rational parameter charts.

use hypercurve::{
    Curve2, CurveParameterRange2, CurvePoint2, Point2, PolynomialCurveSet2, QuadraticBezier2,
    RationalQuadraticBezier2, Real,
};
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

fn circle_equation() -> BivariatePolynomial {
    polynomial(&[&[-1, 0, 1], &[], &[1]])
}

fn quarter_circle() -> Curve2 {
    // x=(1-t^2)/(1+t^2), y=-2t/(1+t^2), with rational Bernstein weights.
    RationalQuadraticBezier2::try_new(
        Point2::from_values(1, 0),
        Point2::from_values(1, -1),
        Point2::from_values(0, -1),
        1.into(),
        1.into(),
        2.into(),
    )
    .unwrap()
    .into()
}

fn finite_contact(branch: &Curve2, curve: &Curve2, other_equation: &BivariatePolynomial) {
    for (a, b, swapped) in [(branch, curve, false), (curve, branch, true)] {
        let result = a.intersect_curve(b).unwrap();
        assert!(result.is_complete() && result.overlaps().is_empty());
        assert_eq!(result.contacts().len(), 1);
        let topology = a.intersection_topology(b).unwrap();
        assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
        assert_eq!(topology.result().contacts().len(), 1);
        let contact = &topology.result().contacts()[0];
        on(contact.point(), quintic());
        on(contact.point(), other_equation.clone());
        assert_eq!(
            contact
                .point()
                .affine_form(1.into(), 0.into(), 0.into())
                .compare_to_real(&Real::zero())
                .unwrap(),
            Ordering::Greater
        );
        assert_eq!(
            contact
                .point()
                .affine_form(0.into(), 1.into(), 0.into())
                .compare_to_real(&Real::zero())
                .unwrap(),
            Ordering::Less
        );
        assert_eq!(
            contact.tangent_cross_sign(),
            Some(if swapped {
                hyperreal::RealSign::Positive
            } else {
                hyperreal::RealSign::Negative
            })
        );
        assert!(contact.is_certified_transverse());
        for (curve, location) in [(a, contact.first()), (b, contact.second())] {
            assert!(
                curve
                    .point_at(&location.parameter().unwrap())
                    .unwrap()
                    .coincides_with(contact.point())
                    .unwrap()
            );
        }
        let replay = contact.point().definition().unwrap().into_point().unwrap();
        on(&replay, quintic());
        on(&replay, other_equation.clone());
        let next = topology.first()[0]
            .intersection_topology(&topology.second()[0])
            .unwrap();
        assert_eq!((next.first().len(), next.second().len()), (1, 1));
        assert_eq!(next.result().contacts().len(), 1);
    }
}

#[test]
fn polynomial_spans_keep_finite_polynomial_contacts() {
    let set = curves(quintic());
    let negative = Curve2::from(QuadraticBezier2::new(
        Point2::from_values(0, 0),
        Point2::new(0.into(), q(-1, 2)),
        Point2::from_values(1, -1),
    ));
    finite_contact(
        &set.curves()[0],
        &negative,
        &polynomial(&[&[0, 0, 1], &[-1]]),
    );
    let positive = Curve2::from(QuadraticBezier2::new(
        Point2::from_values(0, 0),
        Point2::new(0.into(), q(1, 2)),
        Point2::from_values(1, 1),
    ));
    for (a, b) in [(&set.curves()[0], &positive), (&positive, &set.curves()[0])] {
        assert!(a.intersection_topology(b).unwrap().result().is_disjoint());
    }
}

#[test]
fn rational_spans_keep_finite_polynomial_contacts() {
    let set = curves(quintic());
    finite_contact(&set.curves()[0], &quarter_circle(), &circle_equation());
}

#[test]
fn polynomial_spans_keep_common_component_correspondence() {
    let set = curves(polynomial(&[&[0, 1], &[], &[-1]]));
    assert_eq!(set.curves().len(), 1);
    let branch = &set.curves()[0];
    let quadratic = Curve2::from(QuadraticBezier2::new(
        Point2::from_values(-1, 1),
        Point2::from_values(0, -1),
        Point2::from_values(1, 1),
    ));
    for (a, b, swapped) in [(branch, &quadratic, false), (&quadratic, branch, true)] {
        let topology = a.intersection_topology(b).unwrap();
        assert!(topology.result().contacts().is_empty());
        assert_eq!(topology.result().overlaps().len(), 1);
        let overlap = &topology.result().overlaps()[0];
        let branch_range = [q(-3, 4).into(), q(-1, 4).into()];
        let curve_range = [q(1, 4).into(), q(1, 2).into()];
        let clipped = if swapped {
            overlap.restrict(curve_range, branch_range)
        } else {
            overlap.restrict(branch_range, curve_range)
        }
        .unwrap()
        .unwrap();
        let mut points = Vec::new();
        for (s, t) in [
            (
                clipped.first_range().start(),
                clipped.second_range().start(),
            ),
            (clipped.first_range().end(), clipped.second_range().end()),
        ] {
            let point = a.point_at(s).unwrap();
            assert!(point.coincides_with(&b.point_at(t).unwrap()).unwrap());
            on(&point, polynomial(&[&[0, 1], &[], &[-1]]));
            points.push(point);
        }
        for expected in [q(-1, 2), q(-1, 4)] {
            assert!(points.iter().any(|point| {
                point
                    .affine_form(1.into(), 0.into(), 0.into())
                    .compare_to_real(&expected)
                    .unwrap()
                    == Ordering::Equal
            }));
        }
        let first = a
            .restrict_source(
                CurveParameterRange2::try_new(
                    clipped.first_range().start().clone(),
                    clipped.first_range().end().clone(),
                )
                .unwrap(),
            )
            .unwrap();
        let second = b
            .restrict_source(
                CurveParameterRange2::try_new(
                    clipped.second_range().start().clone(),
                    clipped.second_range().end().clone(),
                )
                .unwrap(),
            )
            .unwrap();
        let next = first.intersection_topology(&second).unwrap();
        assert_eq!(next.result().overlaps().len(), 1);
        assert_eq!((next.first().len(), next.second().len()), (1, 1));
    }
}

#[test]
fn rational_spans_keep_common_component_correspondence() {
    let set = curves(circle_equation());
    assert_eq!(set.curves().len(), 2);
    let negative = &set.curves()[0];
    let circle = quarter_circle();
    for (a, b) in [(negative, &circle), (&circle, negative)] {
        let topology = a.intersection_topology(b).unwrap();
        assert!(topology.result().contacts().is_empty());
        assert_eq!(topology.result().overlaps().len(), 1);
        let overlap = &topology.result().overlaps()[0];
        assert_eq!(
            overlap.orientation(),
            hypercurve::CurveOverlapOrientation2::Reversed
        );
        for (s, t) in [
            (
                overlap.first_range().start(),
                overlap.second_range().start(),
            ),
            (overlap.first_range().end(), overlap.second_range().end()),
        ] {
            let point = a.point_at(s).unwrap();
            on(&point, circle_equation());
            assert!(point.coincides_with(&b.point_at(t).unwrap()).unwrap());
        }
    }
}
