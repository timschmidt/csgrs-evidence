//! Algebraic-coordinate line sections keep the original selected polynomial.

use hypercurve::{
    Curve2, CurvePoint2, LineSeg2, Point2, PolynomialCurveSet2, Real,
};
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};
use std::cmp::Ordering;

fn q(n: i64, d: i64) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn equation() -> BivariatePolynomial {
    // y^5 + 5y + 5 - x; F_y = 5y^4 + 5 is strictly positive.
    BivariatePolynomial::new(vec![
        vec![5.into(), 5.into(), 0.into(), 0.into(), 0.into(), 1.into()],
        vec![(-1).into()],
    ])
}

fn quintic() -> Curve2 {
    let topology = decompose_bivariate_curve(
        &equation(),
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    let set = PolynomialCurveSet2::from_topology(
        topology,
        AlgebraicFiberRootIsolationConfig::default(),
    )
    .unwrap();
    assert_eq!(set.curves().len(), 1);
    set.curves()[0].clone()
}

fn line(x0: Real, y0: Real, x1: Real, y1: Real) -> Curve2 {
    LineSeg2::try_new(Point2::new(x0, y0), Point2::new(x1, y1))
        .unwrap()
        .into()
}

fn alpha() -> Real {
    (Real::from(2).sqrt().unwrap() / Real::from(2)).unwrap()
}

fn on_quintic(point: &CurvePoint2) {
    assert_eq!(
        point.rational_form(equation(), BivariatePolynomial::new(vec![vec![Real::one()]]))
            .unwrap()
            .compare_to_real(&Real::zero())
            .unwrap(),
        Ordering::Equal
    );
}

#[test]
fn algebraic_abscissa_keeps_the_original_quintic_fiber() {
    let curve = quintic();
    let point = curve.point_at(&alpha().into()).unwrap();
    on_quintic(&point);
    assert_eq!(
        point.affine_form(1.into(), 0.into(), 0.into())
            .compare_to_real(&alpha()).unwrap(),
        Ordering::Equal
    );
    assert!(point.definition().unwrap().into_point().unwrap().coincides_with(&point).unwrap());
}

#[test]
fn original_irrational_vertical_line_splits_and_requeries() {
    let curve = quintic();
    let cut = line(alpha(), (-3).into(), alpha(), 3.into());
    for (first, second) in [(&curve, &cut), (&cut, &curve)] {
        let topology = first.intersection_topology(second).unwrap();
        assert!(topology.result().is_complete());
        assert_eq!(topology.result().contacts().len(), 1);
        assert!(topology.result().overlaps().is_empty());
        assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
        let contact = &topology.result().contacts()[0];
        on_quintic(contact.point());
        assert_eq!(contact.point().affine_form(1.into(), 0.into(), 0.into())
            .compare_to_real(&alpha()).unwrap(), Ordering::Equal);
        for (source, parameter) in [
            (first, contact.first().parameter().unwrap()),
            (second, contact.second().parameter().unwrap()),
        ] {
            assert!(source.point_at(&parameter).unwrap().coincides_with(contact.point()).unwrap());
        }
        let next = topology.first()[0].intersection_topology(&topology.second()[1]).unwrap();
        assert_eq!((next.first().len(), next.second().len()), (1, 1));
        assert_eq!(next.result().contacts().len(), 1);
    }
}

#[test]
fn original_irrational_sloped_line_is_certifiably_disjoint() {
    // The original frontier input is entirely above y=0, while the unique
    // quintic root is below y=0 throughout x in [-1,1].
    let curve = quintic();
    let cut = line((-1).into(), alpha(), 1.into(), 3.into());
    for (first, second) in [(&curve, &cut), (&cut, &curve)] {
        assert!(first.intersect_curve(second).unwrap().is_disjoint());
        let topology = first.intersection_topology(second).unwrap();
        assert_eq!((topology.first().len(), topology.second().len()), (1, 1));
        assert!(topology.result().is_disjoint());
    }
}

#[test]
fn algebraic_sloped_line_keeps_its_selected_contact() {
    let curve = quintic();
    let cut = line((-1).into(), -alpha(), 1.into(), (-1).into());
    // y = (alpha-1)x/2 - (alpha+1)/2; the decreasing line crosses the
    // increasing quintic graph exactly once, at a positive x below 1.
    let slope = (&alpha() - Real::one()) * q(1, 2);
    let offset = -(&alpha() + Real::one()) * q(1, 2);
    for (first, second) in [(&curve, &cut), (&cut, &curve)] {
        let topology = first.intersection_topology(second).unwrap();
        assert!(topology.result().is_complete());
        assert_eq!(topology.result().contacts().len(), 1);
        assert!(topology.result().overlaps().is_empty());
        let contact = &topology.result().contacts()[0];
        on_quintic(contact.point());
        assert_eq!(contact.point().affine_form(-slope.clone(), 1.into(), -offset.clone())
            .compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
        let x = contact.point().affine_form(1.into(), 0.into(), 0.into());
        assert_eq!(x.compare_to_real(&Real::zero()).unwrap(), Ordering::Greater);
        assert_eq!(x.compare_to_real(&Real::one()).unwrap(), Ordering::Less);
        for (source, parameter) in [
            (first, contact.first().parameter().unwrap()),
            (second, contact.second().parameter().unwrap()),
        ] {
            assert!(source.point_at(&parameter).unwrap().coincides_with(contact.point()).unwrap());
        }
        for piece in topology.first() {
            assert!(piece.intersect_curve(second).unwrap().is_complete());
        }
    }
}
