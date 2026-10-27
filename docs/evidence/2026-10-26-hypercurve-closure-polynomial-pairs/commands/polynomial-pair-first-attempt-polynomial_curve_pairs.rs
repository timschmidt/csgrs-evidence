//! Selected polynomial pairs retain finite contacts and common components.

use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveOverlapOrientation2, CurveParameter2,
    CurveParameterRange2, CurvePoint2, Point2, PolynomialCurveSet2, Real,
};
use hyperreal::RealSign;
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};
use std::cmp::Ordering;

fn q(n: i64, d: i64) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn polynomial(rows: &[&[i64]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter()
            .map(|row| row.iter().copied().map(Real::from).collect())
            .collect(),
    )
}

fn curves(polynomial: BivariatePolynomial) -> PolynomialCurveSet2 {
    let topology = decompose_bivariate_curve(
        &polynomial,
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

fn on(point: &CurvePoint2, polynomial: BivariatePolynomial) {
    assert_eq!(
        point
            .rational_form(
                polynomial,
                BivariatePolynomial::new(vec![vec![Real::one()]])
            )
            .unwrap()
            .compare_to_real(&Real::zero())
            .unwrap(),
        Ordering::Equal
    );
}

fn parameter_is(value: &CurveParameter2, expected: Real) {
    assert_eq!(value.compare(&expected.into()).unwrap(), Ordering::Equal);
}

fn rational_contact(first: &Curve2, second: &Curve2, x: Real, y: Real, sign: RealSign) {
    for (first, second, swapped) in [(first, second, false), (second, first, true)] {
        let topology = first.intersection_topology(second).unwrap();
        assert!(topology.result().is_complete());
        assert!(topology.result().overlaps().is_empty());
        assert_eq!(topology.result().contacts().len(), 1);
        let contact = &topology.result().contacts()[0];
        let expected = Point2::new(x.clone(), y.clone()).into();
        assert!(contact.point().coincides_with(&expected).unwrap());
        assert_eq!(
            contact.tangent_cross_sign(),
            Some(if swapped {
                match sign {
                    RealSign::Positive => RealSign::Negative,
                    RealSign::Negative => RealSign::Positive,
                    RealSign::Zero => RealSign::Zero,
                }
            } else {
                sign
            })
        );
        for location in [contact.first(), contact.second()] {
            parameter_is(&location.parameter().unwrap(), x.clone());
        }
        for piece in topology.first() {
            assert!(piece.intersect_curve(second).unwrap().is_complete());
        }
    }
}

#[test]
fn original_quintic_parabola_pair_splits_and_requeries() {
    let f = polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]);
    let g = polynomial(&[&[0, 0, 1], &[-1]]);
    let first = curves(f.clone());
    let second = curves(g.clone());
    assert_eq!((first.curves().len(), second.curves().len()), (1, 2));
    let quintic = &first.curves()[0];
    // The unchanged frontier pairs the quintic with the POSITIVE parabola
    // branch. The quintic has y<0 throughout its source interval.
    let positive = &second.curves()[1];
    for (first, second) in [(quintic, positive), (positive, quintic)] {
        assert!(first.intersect_curve(second).unwrap().is_disjoint());
        let topology = first.intersection_topology(second).unwrap();
        assert_eq!((topology.first().len(), topology.second().len()), (1, 1));
        assert!(topology.result().is_disjoint());
    }
    let negative = &second.curves()[0];
    for a_reversed in [false, true] {
        for b_reversed in [false, true] {
            let a = if a_reversed {
                quintic.reversed().unwrap()
            } else {
                quintic.clone()
            };
            let b = if b_reversed {
                negative.reversed().unwrap()
            } else {
                negative.clone()
            };
            for (first, second, swapped) in [(&a, &b, false), (&b, &a, true)] {
                let topology = first.intersection_topology(second).unwrap();
                assert!(topology.result().is_complete() && topology.result().overlaps().is_empty());
                assert_eq!(topology.result().contacts().len(), 1);
                assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
                let contact = &topology.result().contacts()[0];
                on(contact.point(), f.clone());
                on(contact.point(), g.clone());
                // Eliminating y from x=y^2 and y(x^2+5)=x-5 gives this
                // independently derived x equation and isolating interval.
                on(
                    contact.point(),
                    polynomial(&[&[-25], &[35], &[-1], &[10], &[0], &[1]]),
                );
                let x = contact.point().affine_form(1.into(), 0.into(), 0.into());
                assert_eq!(x.compare_to_real(&q(3, 5)).unwrap(), Ordering::Greater);
                assert_eq!(x.compare_to_real(&q(7, 10)).unwrap(), Ordering::Less);
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
                    Some(if swapped ^ a_reversed ^ b_reversed {
                        RealSign::Positive
                    } else {
                        RealSign::Negative
                    })
                );
                assert!(contact.is_certified_transverse());
                for (curve, parameter) in [
                    (first, contact.first().parameter().unwrap()),
                    (second, contact.second().parameter().unwrap()),
                ] {
                    assert!(
                        curve
                            .point_at(&parameter)
                            .unwrap()
                            .coincides_with(contact.point())
                            .unwrap()
                    );
                }
                assert!(
                    contact
                        .point()
                        .definition()
                        .unwrap()
                        .into_point()
                        .unwrap()
                        .coincides_with(contact.point())
                        .unwrap()
                );
                let next = topology.first()[0]
                    .intersection_topology(&topology.second()[1])
                    .unwrap();
                assert_eq!((next.first().len(), next.second().len()), (1, 1));
                assert_eq!(next.result().contacts().len(), 1);
            }
        }
    }
}

#[test]
fn polynomial_pair_components_keep_branch_selection_and_trims() {
    let f = curves(polynomial(&[&[0, 0, 1], &[-1]]));
    // G=(y^2-x)(y-3). The extra line is outside the admitted rectangle;
    // both independently selected parabola branches retain G as authority.
    let g = curves(polynomial(&[&[0, 0, -3, 1], &[3, -1]]));
    assert_eq!((f.curves().len(), g.curves().len()), (2, 2));
    let beta = CurveParameter2::from(BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(), 0.into(), 2.into()])
                .unwrap(),
            BezierParameterInterval::try_new(q(1, 2), 1.into()).unwrap(),
        )
        .unwrap(),
    ));
    let a = f.curves()[0]
        .restrict_source(CurveParameterRange2::try_new(q(1, 4).into(), beta.clone()).unwrap())
        .unwrap();
    let b = g.curves()[0]
        .restrict_source(CurveParameterRange2::try_new(q(1, 2).into(), Real::one().into()).unwrap())
        .unwrap();
    for a_reversed in [false, true] {
        for b_reversed in [false, true] {
            let a = if a_reversed {
                a.reversed().unwrap()
            } else {
                a.clone()
            };
            let b = if b_reversed {
                b.reversed().unwrap()
            } else {
                b.clone()
            };
            for (first, second) in [(&a, &b), (&b, &a)] {
                let topology = first.intersection_topology(second).unwrap();
                assert!(topology.result().is_complete() && topology.result().contacts().is_empty());
                assert_eq!(topology.result().overlaps().len(), 1);
                assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
                let overlap = &topology.result().overlaps()[0];
                assert_eq!(
                    overlap.orientation(),
                    if a_reversed ^ b_reversed {
                        CurveOverlapOrientation2::Reversed
                    } else {
                        CurveOverlapOrientation2::Same
                    }
                );
                assert!(overlap.includes_start() && overlap.includes_end());
                for (s, t) in [
                    (
                        overlap.first_range().start(),
                        overlap.second_range().start(),
                    ),
                    (overlap.first_range().end(), overlap.second_range().end()),
                ] {
                    assert_eq!(s.compare(t).unwrap(), Ordering::Equal);
                    assert!(
                        s.compare(&q(1, 2).into()).unwrap() == Ordering::Equal
                            || s.compare(&beta).unwrap() == Ordering::Equal
                    );
                    assert!(
                        first
                            .point_at(s)
                            .unwrap()
                            .coincides_with(&second.point_at(t).unwrap())
                            .unwrap()
                    );
                }
                for piece in topology.first() {
                    assert!(piece.intersect_curve(second).unwrap().is_complete());
                }
            }
        }
    }
    assert!(a.intersect_curve(&g.curves()[1]).unwrap().is_disjoint());
    // The full opposite branches meet only at their smooth vertical event.
    // H_x=-1 proves a common tangent line there even though H_y=0.
    rational_contact(
        &f.curves()[0],
        &g.curves()[1],
        0.into(),
        0.into(),
        RealSign::Zero,
    );
}

#[test]
fn shared_polynomial_component_keeps_residual_and_mixed_contacts() {
    let f = curves(polynomial(&[&[0, 0, 1], &[0], &[-1]]));
    let g = curves(polynomial(&[&[0, -1, 2], &[1, -2]]));
    assert_eq!((f.curves().len(), g.curves().len()), (4, 4));
    // F=(y-x)(y+x), G=(y-x)(2y-1). The residual pair intersects at
    // (-1/2,1/2), away from the shared support y=x.
    rational_contact(
        &f.curves()[1],
        &g.curves()[1],
        q(-1, 2),
        q(1, 2),
        RealSign::Positive,
    );
    let overlap = f.curves()[0].intersect_curve(&g.curves()[0]).unwrap();
    assert!(overlap.is_complete() && overlap.contacts().is_empty());
    assert_eq!(overlap.overlaps().len(), 1);
    parameter_is(overlap.overlaps()[0].first_range().start(), (-1).into());
    parameter_is(overlap.overlaps()[0].first_range().end(), 0.into());
    // This mixed component/other-branch contact lies on y=x and therefore
    // is absent from the residual pair. Saturation must not discard it.
    rational_contact(
        &f.curves()[3],
        &g.curves()[1],
        q(1, 2),
        q(1, 2),
        RealSign::Negative,
    );
}
