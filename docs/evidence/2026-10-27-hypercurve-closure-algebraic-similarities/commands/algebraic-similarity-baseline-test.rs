//! Algebraic similarity images keep the original selected graph parameters.

use hypercurve::{
    Curve2, CurvePoint2, LineSeg2, Point2, PolynomialCurveSet2, Real, Similarity2,
};
use hyperreal::RealSign;
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};
use std::cmp::Ordering;

fn polynomial(rows: &[&[i64]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter()
            .map(|row| row.iter().copied().map(Real::from).collect())
            .collect(),
    )
}

fn quintic() -> Curve2 {
    // F = y^5 + 5y + 5 - x, with F_y = 5y^4 + 5 > 0.
    let graph = decompose_bivariate_curve(
        &polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]),
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    let set = PolynomialCurveSet2::from_topology(
        graph,
        AlgebraicFiberRootIsolationConfig::default(),
    )
    .unwrap();
    assert_eq!(set.curves().len(), 1);
    set.curves()[0].clone()
}

fn on(point: &CurvePoint2, equation: &BivariatePolynomial) {
    assert_eq!(
        point
            .rational_form(equation.clone(), polynomial(&[&[1]]))
            .unwrap()
            .compare_to_real(&Real::zero())
            .unwrap(),
        Ordering::Equal
    );
}

fn check_image(transform: Similarity2, equation: BivariatePolynomial, reflected: bool) {
    let source = quintic();
    let native = Curve2::from(
        LineSeg2::try_new(Point2::from_values(0, -2), Point2::from_values(0, 2))
            .unwrap(),
    );
    // The source-coordinate line is an independently admitted control.
    let control = source.intersect_curve(&native).unwrap();
    assert_eq!(control.contacts().len(), 1);
    let image = source.transform_similarity(&transform).unwrap();
    let cut = native.transform_similarity(&transform).unwrap();
    for reverse_branch in [false, true] {
        let curve = if reverse_branch {
            image.reversed().unwrap()
        } else {
            image.clone()
        };
        for reverse_line in [false, true] {
            let line = if reverse_line {
                cut.reversed().unwrap()
            } else {
                cut.clone()
            };
            for (first, second, branch_first) in [(&curve, &line, true), (&line, &curve, false)] {
                let topology = first.intersection_topology(second).unwrap();
                let result = topology.result();
                assert!(result.is_complete());
                assert!(result.overlaps().is_empty());
                assert_eq!(result.contacts().len(), 1);
                assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
                let contact = &result.contacts()[0];
                assert_eq!(
                    contact.tangent_cross_sign(),
                    Some(if reflected ^ reverse_branch ^ reverse_line ^ !branch_first {
                        RealSign::Negative
                    } else {
                        RealSign::Positive
                    })
                );
                let parameter = if branch_first { contact.first() } else { contact.second() }
                    .parameter()
                    .unwrap();
                assert_eq!(parameter.compare(&Real::zero().into()).unwrap(), Ordering::Equal);
                on(contact.point(), &equation);
                for (curve, parameter) in [
                    (first, contact.first().parameter().unwrap()),
                    (second, contact.second().parameter().unwrap()),
                ] {
                    assert!(curve.point_at(&parameter).unwrap().coincides_with(contact.point()).unwrap());
                }
                assert!(contact.point().definition().unwrap().into_point().unwrap()
                    .coincides_with(contact.point()).unwrap());
                let next = topology.first()[0].intersection_topology(&topology.second()[1]).unwrap();
                assert!(next.result().is_complete());
                assert_eq!(next.result().contacts().len(), 1);
                assert_eq!((next.first().len(), next.second().len()), (1, 1));
            }
        }
    }
}

#[test]
fn polynomial_line_sections_consume_algebraic_scale() {
    let s = Real::from(2).sqrt().unwrap();
    check_image(
        Similarity2::try_from_real_affine(
            s.clone(), 0.into(), 0.into(), s.clone(), 0.into(), 0.into(),
        ).unwrap(),
        // X = sqrt(2)x, Y = sqrt(2)y: Y^5 + 20Y + 20sqrt(2) - 4X = 0.
        BivariatePolynomial::new(vec![
            vec![Real::from(20) * s, 20.into(), 0.into(), 0.into(), 0.into(), 1.into()],
            vec![(-4).into()],
        ]),
        false,
    );
}

#[test]
fn polynomial_line_sections_consume_algebraic_translation() {
    let s = Real::from(2).sqrt().unwrap();
    let r = Real::from(3).sqrt().unwrap();
    check_image(
        Similarity2::try_from_real_affine(
            1.into(), 0.into(), 0.into(), 1.into(), r.clone(), s.clone(),
        ).unwrap(),
        // X = x + sqrt(3), Y = y + sqrt(2); expanded independently.
        BivariatePolynomial::new(vec![
            vec![Real::from(5) + r - Real::from(9) * &s, 25.into(),
                 -Real::from(20) * &s, 20.into(), -Real::from(5) * s, 1.into()],
            vec![(-1).into()],
        ]),
        false,
    );
}
