//! Composition witnesses for independently qualified selected-branch features.

use hypercurve::{
    BooleanOp, Curve2, CurveLoopOrientation2, CurvePath2, CurveRegion2, FillRule, LineSeg2, Point2,
    PolynomialCurveSet2, Real, RegionPointLocation,
};
use hypersolve::BivariatePolynomial;
use hypersolve::bivariate_topology::{BivariateCurveDomain, decompose_bivariate_curve};
use std::cmp::Ordering;

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn line(a: Point2, b: Point2) -> Curve2 {
    LineSeg2::try_new(a, b).unwrap().into()
}

fn rectangle(x0: Real, x1: Real, y0: Real, y1: Real) -> CurveRegion2 {
    let vertices = [
        Point2::new(x0.clone(), y0.clone()),
        Point2::new(x1.clone(), y0),
        Point2::new(x1, y1.clone()),
        Point2::new(x0, y1),
    ];
    let curves = (0..4)
        .map(|index| line(vertices[index].clone(), vertices[(index + 1) % 4].clone()))
        .collect();
    CurveRegion2::try_from_boundary_paths(
        &[CurvePath2::try_new(curves).unwrap()],
        FillRule::NonZero,
    )
    .unwrap()
}

#[test]
fn closed_domain_components_remain_filled_boundaries_after_boolean_reconstruction() {
    // The two selected components y=0 and y=1 lie on the closed source bounds.
    // Together with x=-1 and x=1 they enclose exactly [-1,1] x [0,1].
    let equation = BivariatePolynomial::new(vec![vec![0.into(), (-1).into(), 1.into()]]);
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [0.into(), 1.into()],
        },
        Default::default(),
    )
    .unwrap();
    let source = PolynomialCurveSet2::from_topology(topology, Default::default()).unwrap();
    assert_eq!(source.curves().len(), 2);
    let path = CurvePath2::try_new(vec![
        source.curves()[0].clone(),
        line(Point2::from_values(1, 0), Point2::from_values(1, 1)),
        source.curves()[1].reversed().unwrap(),
        line(Point2::from_values(-1, 1), Point2::from_values(-1, 0)),
    ])
    .unwrap();
    assert_eq!(
        path.simple_loop_orientation().unwrap(),
        CurveLoopOrientation2::Counterclockwise
    );
    assert_eq!(
        path.reversed().unwrap().simple_loop_orientation().unwrap(),
        CurveLoopOrientation2::Clockwise
    );
    let clip = rectangle(q(-1, 2), q(1, 2), (-1).into(), 2.into());
    for fill in [FillRule::NonZero, FillRule::EvenOdd] {
        for boundary in [path.clone(), path.reversed().unwrap()] {
            let region = CurveRegion2::try_from_boundary_paths(&[boundary], fill).unwrap();
            let selected = region
                .boolean_region(&clip, BooleanOp::Intersection)
                .unwrap();
            let paths = selected.boundary_paths().unwrap();
            assert_eq!(paths.len(), 1);
            assert_eq!(paths[0].curves().len(), 4);
            let mut roots = Vec::new();
            let mut verticals = Vec::new();
            for curve in paths[0].curves() {
                let endpoints = curve.parameter_endpoints();
                if let Some(branch) = curve.polynomial_branch() {
                    assert_eq!(branch.topology().equation(), &equation);
                    let index = branch.root_index();
                    assert!(
                        branch.shares_source(source.curves()[index].polynomial_branch().unwrap())
                    );
                    assert!(
                        branch.rational_maps().is_empty() && branch.image_transform().is_none()
                    );
                    roots.push(index);
                    for (parameter, x) in [
                        (curve.parameter_domain().start(), q(-1, 2)),
                        (curve.parameter_domain().end(), q(1, 2)),
                    ] {
                        assert_eq!(
                            parameter.compare(&x.clone().into()).unwrap(),
                            Ordering::Equal
                        );
                        let point = curve.point_at(parameter).unwrap();
                        assert!(
                            point
                                .coincides_with(&Point2::new(x, Real::from(index)).into())
                                .unwrap()
                        );
                        let replay = point.definition().unwrap().into_point().unwrap();
                        assert!(replay.coincides_with(&point).unwrap());
                        assert_eq!(
                            selected.classify_point(&replay).unwrap(),
                            RegionPointLocation::Boundary
                        );
                    }
                } else {
                    let start = curve.point_at(endpoints.0).unwrap();
                    let end = curve.point_at(endpoints.1).unwrap();
                    let x = start.affine_form(1.into(), 0.into(), 0.into());
                    let side = if x.compare_to_real(&q(-1, 2)).unwrap() == Ordering::Equal {
                        -1
                    } else {
                        assert_eq!(x.compare_to_real(&q(1, 2)).unwrap(), Ordering::Equal);
                        1
                    };
                    let x = q(side, 2);
                    assert_eq!(
                        end.affine_form(1.into(), 0.into(), -x.clone())
                            .compare_to_real(&Real::zero())
                            .unwrap(),
                        Ordering::Equal
                    );
                    assert!(
                        (start
                            .coincides_with(&Point2::new(x.clone(), 0.into()).into())
                            .unwrap()
                            && end
                                .coincides_with(&Point2::new(x.clone(), 1.into()).into())
                                .unwrap())
                            || (start
                                .coincides_with(&Point2::new(x.clone(), 1.into()).into())
                                .unwrap()
                                && end
                                    .coincides_with(&Point2::new(x, 0.into()).into())
                                    .unwrap())
                    );
                    verticals.push(side);
                }
            }
            roots.sort_unstable();
            verticals.sort_unstable();
            assert_eq!(roots, vec![0, 1]);
            assert_eq!(verticals, vec![-1, 1]);
            let rebuilt = CurveRegion2::try_from_boundary_paths(&paths, fill).unwrap();
            let empty = rebuilt
                .boolean_region(&selected, BooleanOp::Difference)
                .unwrap();
            assert!(empty.is_empty());
            let restored = empty.boolean_region(&rebuilt, BooleanOp::Union).unwrap();
            assert_eq!(restored.boundary_paths().unwrap()[0].curves().len(), 4);
            let remainder = region
                .boolean_region(&restored, BooleanOp::Difference)
                .unwrap();
            assert_eq!(remainder.boundary_paths().unwrap().len(), 2);
            assert!(
                remainder
                    .boolean_region(&restored, BooleanOp::Intersection)
                    .unwrap()
                    .is_empty()
            );
        }
    }
}
