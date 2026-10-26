//! Exact expectations for a line that is a component of an implicit zero set.
//! The remaining branches are retained separately, including their contacts
//! with that line. These tests do not construct filled polynomial regions.

use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveOverlapOrientation2, CurveParameter2,
    CurveParameterRange2, LineSeg2, Point2, PolynomialCurveSet2, Real,
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

fn set(coefficients: &[(usize, usize, i64)]) -> PolynomialCurveSet2 {
    let mut rows = Vec::<Vec<Real>>::new();
    for &(i, j, coefficient) in coefficients {
        rows.resize_with(rows.len().max(i + 1), Vec::new);
        let width = rows[i].len().max(j + 1);
        rows[i].resize(width, Real::zero());
        rows[i][j] = coefficient.into();
    }
    let topology = decompose_bivariate_curve(
        &BivariatePolynomial::new(rows),
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

fn line(x0: Real, y0: Real, x1: Real, y1: Real) -> Curve2 {
    LineSeg2::try_new(Point2::new(x0, y0), Point2::new(x1, y1))
        .unwrap()
        .into()
}

fn diagonal(a: Real, b: Real) -> Curve2 {
    line(a.clone(), a, b.clone(), b)
}

fn equals(parameter: &CurveParameter2, expected: Real) {
    assert_eq!(
        parameter.compare(&expected.into()).unwrap(),
        Ordering::Equal
    );
}

#[test]
fn component_overlap_keeps_algebraic_trims_and_original_correspondence() {
    // F = y - x, with one complete graph branch on [-1, 1].
    let source = set(&[(0, 1, 1), (1, 0, -1)]);
    assert_eq!(source.curves().len(), 1);
    let curve = &source.curves()[0];
    let native = diagonal((-2).into(), 2.into());
    // beta is the positive root of 2 beta^2 - 1. The line restriction
    // t in [1/2, beta] corresponds to x in [0, 4 beta - 2].
    let beta = CurveParameter2::from(BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![(-1).into(), 0.into(), 2.into()])
                .unwrap(),
            BezierParameterInterval::try_new(q(1, 2), 1.into()).unwrap(),
        )
        .unwrap(),
    ));
    let native = native
        .restrict_source(CurveParameterRange2::try_new(q(1, 2).into(), beta.clone()).unwrap())
        .unwrap();
    for curve_reversed in [false, true] {
        for line_reversed in [false, true] {
            let curve = if curve_reversed {
                curve.reversed().unwrap()
            } else {
                curve.clone()
            };
            let native = if line_reversed {
                native.reversed().unwrap()
            } else {
                native.clone()
            };
            for (first, second, branch_first) in [(&curve, &native, true), (&native, &curve, false)]
            {
                let result = first.intersect_curve(second).unwrap();
                assert!(result.is_complete());
                assert!(result.contacts().is_empty() && result.parameter_components().is_empty());
                assert_eq!(result.overlaps().len(), 1);
                let overlap = &result.overlaps()[0];
                assert_eq!(
                    overlap.orientation(),
                    if curve_reversed ^ line_reversed {
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
                    assert!(
                        first
                            .point_at(s)
                            .unwrap()
                            .coincides_with(&second.point_at(t).unwrap())
                            .unwrap()
                    );
                }
                let (branch_range, line_range) = if branch_first {
                    (overlap.first_range(), overlap.second_range())
                } else {
                    (overlap.second_range(), overlap.first_range())
                };
                assert!(
                    [branch_range.start(), branch_range.end()]
                        .iter()
                        .any(|p| p.compare(&Real::zero().into()).unwrap() == Ordering::Equal)
                );
                assert!(
                    [line_range.start(), line_range.end()]
                        .iter()
                        .any(|p| p.compare(&beta).unwrap() == Ordering::Equal)
                );

                // This clips both active domains using the original map
                // t = (x + 2)/4, not a map rebased on the current overlap.
                let branch_limit = [q(1, 4).into(), q(1, 2).into()];
                let line_limit = [q(3, 5).into(), Real::one().into()];
                let clipped = if branch_first {
                    overlap.restrict(branch_limit, line_limit)
                } else {
                    overlap.restrict(line_limit, branch_limit)
                }
                .unwrap()
                .unwrap();
                let (s, t) = if branch_first {
                    (clipped.first_range(), clipped.second_range())
                } else {
                    (clipped.second_range(), clipped.first_range())
                };
                for (s, t) in [(s.start(), t.start()), (s.end(), t.end())] {
                    if s.compare(&q(2, 5).into()).unwrap() == Ordering::Equal {
                        equals(t, q(3, 5));
                    } else {
                        equals(s, q(1, 2));
                        equals(t, q(5, 8));
                    }
                }
                let topology = first.intersection_topology(second).unwrap();
                assert_eq!(
                    (topology.first().len(), topology.second().len()),
                    if branch_first { (3, 1) } else { (1, 3) }
                );
                let (branch_piece, line_piece) = if branch_first {
                    (&topology.first()[1], &topology.second()[0])
                } else {
                    (&topology.second()[1], &topology.first()[0])
                };
                assert!(
                    branch_piece
                        .polynomial_branch()
                        .unwrap()
                        .shares_source(source.curves()[0].polynomial_branch().unwrap())
                );
                let next = line_piece.intersection_topology(branch_piece).unwrap();
                assert_eq!((next.first().len(), next.second().len()), (1, 1));
                assert_eq!(next.result().overlaps().len(), 1);
            }
        }
    }
    for native in [
        diagonal((-3).into(), (-2).into()),
        diagonal(Real::one() + q(1, 1_000_000_000_000), 2.into()),
    ] {
        assert!(curve.intersect_curve(&native).unwrap().is_disjoint());
    }
    let touching = diagonal(1.into(), 2.into());
    let result = curve.intersect_curve(&touching).unwrap();
    assert!(result.is_complete() && result.overlaps().is_empty());
    assert_eq!(result.contacts().len(), 1);
    let contact = &result.contacts()[0];
    equals(&contact.first().parameter().unwrap(), Real::one());
    equals(&contact.second().parameter().unwrap(), Real::zero());
    assert_eq!(contact.tangent_cross_sign(), Some(RealSign::Zero));
}

#[test]
fn component_line_keeps_transverse_contacts_with_other_branches() {
    // y^2 - x^2 = (y - x)(y + x). On each side of the node,
    // one ordered branch overlaps y=x; the other crosses it at the origin.
    let source = set(&[(0, 2, 1), (2, 0, -1)]);
    assert_eq!(source.curves().len(), 4);
    let native = diagonal((-2).into(), 2.into());
    for (curve, component) in source.curves().iter().zip([true, false, false, true]) {
        for reversed in [false, true] {
            let curve = if reversed {
                curve.reversed().unwrap()
            } else {
                curve.clone()
            };
            for (first, second, branch_first) in [(&curve, &native, true), (&native, &curve, false)]
            {
                let result = first.intersect_curve(second).unwrap();
                assert!(result.is_complete());
                if component {
                    assert_eq!(result.overlaps().len(), 1);
                    assert!(result.contacts().is_empty());
                } else {
                    assert!(result.overlaps().is_empty());
                    assert_eq!(result.contacts().len(), 1);
                    let contact = &result.contacts()[0];
                    assert!(
                        contact
                            .point()
                            .coincides_with(&Point2::new(0.into(), 0.into()).into())
                            .unwrap()
                    );
                    assert!(contact.is_certified_transverse());
                    assert_eq!(
                        contact.tangent_cross_sign(),
                        Some(if reversed ^ !branch_first {
                            RealSign::Negative
                        } else {
                            RealSign::Positive
                        })
                    );
                }
                let topology = first.intersection_topology(second).unwrap();
                for piece in topology.first() {
                    assert!(piece.intersect_curve(second).unwrap().is_complete());
                }
            }
        }
    }
}

#[test]
fn component_line_keeps_tangent_contacts_with_other_branches() {
    // y(y-x^2) has a line branch and a parabola tangent to it at the origin.
    // Both are split at x=0 by the original topology authority.
    let source = set(&[(0, 2, 1), (2, 1, -1)]);
    assert_eq!(source.curves().len(), 4);
    let native = line((-2).into(), 0.into(), 2.into(), 0.into());
    for (curve, component) in source.curves().iter().zip([true, false, true, false]) {
        for (first, second) in [(curve, &native), (&native, curve)] {
            let result = first.intersect_curve(second).unwrap();
            assert!(result.is_complete());
            if component {
                assert_eq!(result.overlaps().len(), 1);
                assert!(result.contacts().is_empty());
            } else {
                assert!(result.overlaps().is_empty());
                assert_eq!(result.contacts().len(), 1);
                let contact = &result.contacts()[0];
                assert!(
                    contact
                        .point()
                        .coincides_with(&Point2::new(0.into(), 0.into()).into())
                        .unwrap()
                );
                assert_eq!(contact.tangent_cross_sign(), Some(RealSign::Zero));
                assert!(!contact.is_certified_transverse());
            }
        }
    }
}
