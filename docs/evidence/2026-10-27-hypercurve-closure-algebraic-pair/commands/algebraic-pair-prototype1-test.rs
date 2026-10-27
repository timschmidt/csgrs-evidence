//! Shared algebraic similarities preserve selected polynomial pair incidence.

use hypercurve::{Curve2, CurvePoint2, PolynomialCurveSet2, Real, Similarity2};
use hyperreal::RealSign;
use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_topology::{BivariateCurveDomain, decompose_bivariate_curve};
use std::cmp::Ordering;

fn polynomial(rows: &[&[i64]]) -> BivariatePolynomial {
    BivariatePolynomial::new(
        rows.iter()
            .map(|row| row.iter().copied().map(Real::from).collect())
            .collect(),
    )
}

fn curves(equation: BivariatePolynomial) -> Vec<Curve2> {
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        Default::default(),
    )
    .unwrap();
    PolynomialCurveSet2::from_topology(topology, Default::default())
        .unwrap()
        .curves()
        .to_vec()
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

fn check_image(transform: Similarity2, world_f: BivariatePolynomial, world_g: BivariatePolynomial) {
    let f = polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]);
    let g = polynomial(&[&[0, 0, 1], &[-1]]);
    let first = curves(f.clone());
    let second = curves(g.clone());
    assert_eq!((first.len(), second.len()), (1, 2));
    let a = &first[0];
    let b = &second[0];
    let control = a.intersection_topology(b).unwrap();
    assert!(control.result().is_complete());
    assert_eq!(control.result().contacts().len(), 1);
    let (aa, ab, ba, bb, tx, ty) = transform.affine_components();
    let independent = Similarity2::try_from_real_affine(
        aa.clone(),
        ab.clone(),
        ba.clone(),
        bb.clone(),
        tx.clone(),
        ty.clone(),
    )
    .unwrap();
    let image_a = a.transform_similarity(&transform).unwrap();
    let image_b = b.transform_similarity(&independent).unwrap();
    for (image, equation) in [(&image_a, &f), (&image_b, &g)] {
        assert_eq!(
            image.polynomial_branch().unwrap().topology().equation(),
            equation
        );
    }
    for reverse_a in [false, true] {
        for reverse_b in [false, true] {
            let a = if reverse_a {
                image_a.reversed().unwrap()
            } else {
                image_a.clone()
            };
            let b = if reverse_b {
                image_b.reversed().unwrap()
            } else {
                image_b.clone()
            };
            for (a, b, swapped) in [(&a, &b, false), (&b, &a, true)] {
                let topology = a.intersection_topology(b).unwrap();
                assert!(topology.result().is_complete());
                assert!(topology.result().overlaps().is_empty());
                assert_eq!(topology.result().contacts().len(), 1);
                assert_eq!((topology.first().len(), topology.second().len()), (2, 2));
                let contact = &topology.result().contacts()[0];
                on(contact.point(), &world_f);
                on(contact.point(), &world_g);
                assert_eq!(
                    contact.tangent_cross_sign(),
                    Some(
                        if transform.reverses_orientation() ^ reverse_a ^ reverse_b ^ swapped {
                            RealSign::Positive
                        } else {
                            RealSign::Negative
                        }
                    )
                );
                let s = contact.first().parameter().unwrap();
                let t = contact.second().parameter().unwrap();
                assert_eq!(s.compare(&t).unwrap(), Ordering::Equal);
                // Eliminating y gives x^5+10x^3-x^2+35x-25. The retained
                // contact is the root in (3/5,7/10), on the negative y branch.
                let low = (Real::from(3) / Real::from(5)).unwrap();
                let high = (Real::from(7) / Real::from(10)).unwrap();
                assert_eq!(s.compare(&low.into()).unwrap(), Ordering::Greater);
                assert_eq!(s.compare(&high.into()).unwrap(), Ordering::Less);
                assert!(
                    a.point_at(&s)
                        .unwrap()
                        .coincides_with(contact.point())
                        .unwrap()
                );
                assert!(
                    b.point_at(&t)
                        .unwrap()
                        .coincides_with(contact.point())
                        .unwrap()
                );
                let replay = contact.point().definition().unwrap().into_point().unwrap();
                assert!(replay.coincides_with(contact.point()).unwrap());
                let next = topology.first()[0]
                    .intersection_topology(&topology.second()[1])
                    .unwrap();
                assert!(next.result().is_complete());
                assert_eq!((next.first().len(), next.second().len()), (1, 1));
                assert_eq!(next.result().contacts().len(), 1);
                assert!(
                    next.result().contacts()[0]
                        .point()
                        .coincides_with(&replay)
                        .unwrap()
                );
            }
        }
    }
}

#[test]
fn polynomial_pairs_consume_shared_algebraic_scale() {
    let s = Real::from(2).sqrt().unwrap();
    check_image(
        Similarity2::try_from_real_affine(
            s.clone(),
            0.into(),
            0.into(),
            s.clone(),
            0.into(),
            0.into(),
        )
        .unwrap(),
        // X=sqrt(2)x, Y=sqrt(2)y.
        BivariatePolynomial::new(vec![
            vec![
                Real::from(20) * &s,
                20.into(),
                0.into(),
                0.into(),
                0.into(),
                1.into(),
            ],
            vec![(-4).into()],
        ]),
        BivariatePolynomial::new(vec![vec![0.into(), 0.into(), 1.into()], vec![-s]]),
    );
}

#[test]
fn polynomial_pairs_consume_shared_algebraic_translation() {
    let a = Real::from(3).sqrt().unwrap();
    let b = Real::from(2).sqrt().unwrap();
    check_image(
        Similarity2::try_from_real_affine(
            1.into(),
            0.into(),
            0.into(),
            1.into(),
            a.clone(),
            b.clone(),
        )
        .unwrap(),
        // X=x+sqrt(3), Y=y+sqrt(2); expanded independently in world coordinates.
        BivariatePolynomial::new(vec![
            vec![
                Real::from(5) + &a - Real::from(9) * &b,
                25.into(),
                -Real::from(20) * &b,
                20.into(),
                -Real::from(5) * &b,
                1.into(),
            ],
            vec![(-1).into()],
        ]),
        BivariatePolynomial::new(vec![
            vec![Real::from(2) + a, -Real::from(2) * b, 1.into()],
            vec![(-1).into()],
        ]),
    );
}
