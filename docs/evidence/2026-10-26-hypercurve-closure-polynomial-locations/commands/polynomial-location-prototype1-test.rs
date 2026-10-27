//! Selected polynomial points retain incidence in their original source chart.

use hypercurve::{
    Curve2, CurveParameter2, CurvePoint2, CurvePointLocations2, Point2, PolynomialCurveSet2,
    QuadraticBezier2, Real,
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

fn located(curve: &Curve2, point: &CurvePoint2, expected: &CurveParameter2) -> CurveParameter2 {
    let CurvePointLocations2::Locations(locations) = curve.point_locations(point).unwrap() else {
        panic!("an injective graph has a single preimage");
    };
    assert_eq!(locations.len(), 1);
    assert_eq!(locations[0].span_index(), 0);
    let parameter = locations[0].parameter().unwrap();
    assert_eq!(parameter.compare(expected).unwrap(), Ordering::Equal);
    assert!(
        curve
            .point_at(&parameter)
            .unwrap()
            .coincides_with(point)
            .unwrap()
    );
    parameter
}

fn absent(curve: &Curve2, point: &CurvePoint2) {
    let CurvePointLocations2::Locations(locations) = curve.point_locations(point).unwrap() else {
        panic!("an off-curve point has no preimage");
    };
    assert!(locations.is_empty());
}

#[test]
fn polynomial_locations_consume_selected_fiber_output() {
    let set = curves(polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]));
    assert_eq!(set.curves().len(), 1);
    let curve = &set.curves()[0];
    let x = CurveParameter2::from(Real::zero());
    let point = curve.point_at(&x).unwrap();
    assert!(point.coordinates().is_none());
    located(curve, &point, &x);
    located(&curve.reversed().unwrap(), &point, &x);
    let replay = point.definition().unwrap().into_point().unwrap();
    located(curve, &replay, &x);
}

#[test]
fn polynomial_locations_check_native_points_and_closed_trims() {
    let set = curves(polynomial(&[&[0, 1], &[], &[-1]]));
    assert_eq!(set.curves().len(), 1);
    let curve = &set.curves()[0];
    located(
        curve,
        &Point2::new(q(1, 2), q(1, 4)).into(),
        &q(1, 2).into(),
    );
    absent(curve, &Point2::from_values(0, 1).into());
    absent(curve, &Point2::from_values(2, 4).into());
    let trim = curve
        .restrict_source(
            hypercurve::CurveParameterRange2::try_new(q(-1, 2).into(), q(1, 2).into()).unwrap(),
        )
        .unwrap();
    for x in [q(-1, 2), q(1, 2)] {
        located(&trim, &Point2::new(x.clone(), &x * &x).into(), &x.into());
    }
    absent(&trim, &Point2::from_values(1, 1).into());
}

#[test]
fn polynomial_locations_consume_generated_rational_contact() {
    // C(t)=(t^2,-t), with t^5+t^2+5t-5=0 selecting the only contact.
    let set = curves(polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]));
    let curve = &set.curves()[0];
    let rational = Curve2::from(QuadraticBezier2::new(
        Point2::from_values(0, 0),
        Point2::new(0.into(), q(-1, 2)),
        Point2::from_values(1, -1),
    ));
    let result = curve.intersect_curve(&rational).unwrap();
    assert_eq!(result.contacts().len(), 1);
    let contact = &result.contacts()[0];
    let x = contact.first().parameter().unwrap();
    let point = rational
        .point_at(&contact.second().parameter().unwrap())
        .unwrap();
    assert!(point.coordinates().is_none());
    located(curve, &point, &x);
    let replay = point.definition().unwrap().into_point().unwrap();
    located(curve, &replay, &x);
}
