//! Polynomial incidence must consume generated lines with retained endpoints.

use hypercurve::{Curve2, CurvePoint2, LineSeg2, Point2, PolynomialCurveSet2, Real};
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

fn quintic_equation() -> BivariatePolynomial {
    polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]])
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

fn vertical_contact(source: &Curve2, line: &Curve2) {
    for (a, b) in [(source, line), (line, source)] {
        let result = a.intersect_curve(b).unwrap();
        assert!(result.is_complete() && result.overlaps().is_empty());
        assert_eq!(result.contacts().len(), 1);
        on(result.contacts()[0].point(), quintic_equation());
        on(result.contacts()[0].point(), polynomial(&[&[], &[1]]));
        let topology = a.intersection_topology(b).unwrap();
        assert!(topology.result().is_complete());
        assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
        assert_eq!(topology.result().contacts().len(), 1);
        let contact = &topology.result().contacts()[0];
        for (curve, location) in [(a, contact.first()), (b, contact.second())] {
            assert!(
                curve
                    .point_at(&location.parameter().unwrap())
                    .unwrap()
                    .coincides_with(contact.point())
                    .unwrap()
            );
        }
        let next = topology.first()[0]
            .intersection_topology(&topology.second()[0])
            .unwrap();
        assert_eq!((next.first().len(), next.second().len()), (1, 1));
        assert_eq!(next.result().contacts().len(), 1);
    }
}

#[test]
fn generated_rational_line_reuses_polynomial_sections() {
    let set = curves(quintic_equation());
    let start = Point2::from_values(0, -2);
    let end = Point2::from_values(0, 2);
    let native = Curve2::from(LineSeg2::try_new(start.clone(), end.clone()).unwrap());
    vertical_contact(&set.curves()[0], &native);
    let generated = Curve2::try_line(start.into(), end.into()).unwrap();
    vertical_contact(&set.curves()[0], &generated);
}

#[test]
fn generated_selected_endpoint_line_reuses_polynomial_sections() {
    let set = curves(quintic_equation());
    let root = Real::from(2).sqrt().unwrap();
    let native = Curve2::from(
        LineSeg2::try_new(
            Point2::new(Real::zero(), -root.clone()),
            Point2::new(Real::zero(), root),
        )
        .unwrap(),
    );
    vertical_contact(&set.curves()[0], &native);
    let endpoints = curves(polynomial(&[&[-2, 0, 1]]));
    assert_eq!(endpoints.curves().len(), 2);
    let start = endpoints.curves()[0]
        .point_at(&Real::zero().into())
        .unwrap();
    let end = endpoints.curves()[1]
        .point_at(&Real::zero().into())
        .unwrap();
    assert!(start.coordinates().is_none() && end.coordinates().is_none());
    let generated = Curve2::try_line(start, end).unwrap();
    drop(endpoints);
    vertical_contact(&set.curves()[0], &generated);
}

#[test]
fn generated_selected_line_retains_common_component_overlap() {
    let set = curves(polynomial(&[&[-2, 0, 1]]));
    let source = &set.curves()[0];
    let y = -Real::from(2).sqrt().unwrap();
    let native = Curve2::from(
        LineSeg2::try_new(
            Point2::new((-1).into(), y.clone()),
            Point2::new(1.into(), y),
        )
        .unwrap(),
    );
    let generated = Curve2::try_line(source.start(), source.end()).unwrap();
    for line in [native, generated] {
        for (a, b) in [(source, &line), (&line, source)] {
            let topology = a.intersection_topology(b).unwrap();
            assert!(topology.result().is_complete());
            assert!(topology.result().contacts().is_empty());
            assert_eq!(topology.result().overlaps().len(), 1);
            assert_eq!((topology.first().len(), topology.second().len()), (1, 1));
            let overlap = &topology.result().overlaps()[0];
            for (s, t) in [
                (
                    overlap.first_range().start(),
                    overlap.second_range().start(),
                ),
                (overlap.first_range().end(), overlap.second_range().end()),
            ] {
                assert!(
                    a.point_at(s)
                        .unwrap()
                        .coincides_with(&b.point_at(t).unwrap())
                        .unwrap()
                );
            }
        }
    }
}
