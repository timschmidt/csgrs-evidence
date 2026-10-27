//! The original polynomial-boundary region witness must reach one arrangement.

use hypercurve::{
    BooleanOp, Curve2, CurveFamily2, CurveLoopOrientation2, CurveParameterRange2, CurvePath2,
    CurveRegion2, FillRule, LineSeg2, Point2, PolynomialCurveSet2, Real, RegionPointLocation,
};
use hypersolve::bivariate_topology::{
    BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
};
use hypersolve::{AlgebraicFiberRootIsolationConfig, BivariatePolynomial};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn parabola_path() -> CurvePath2 {
    let equation = BivariatePolynomial::new(vec![
        vec![Real::zero(), Real::zero(), Real::one()],
        vec![(-1).into()],
    ]);
    let topology = decompose_bivariate_curve(
        &equation,
        &BivariateCurveDomain {
            first: [(-1).into(), 1.into()],
            second: [(-2).into(), 2.into()],
        },
        BivariateTopologyConfig::default(),
    )
    .unwrap();
    let set =
        PolynomialCurveSet2::from_topology(topology, AlgebraicFiberRootIsolationConfig::default())
            .unwrap();
    assert_eq!(set.curves().len(), 2);
    let range = CurveParameterRange2::try_new(Real::zero().into(), q(1, 4).into()).unwrap();
    CurvePath2::try_new(vec![
        set.curves()[0].restrict_source(range.clone()).unwrap(),
        Curve2::from(
            LineSeg2::try_new(
                Point2::new(q(1, 4), q(-1, 2)),
                Point2::new(q(1, 4), q(1, 2)),
            )
            .unwrap(),
        ),
        set.curves()[1]
            .restrict_source(range)
            .unwrap()
            .reversed()
            .unwrap(),
    ])
    .unwrap()
}

#[test]
fn original_parabola_path_has_exact_loop_orientation() {
    let path = parabola_path();
    assert_eq!(
        path.simple_loop_orientation().unwrap(),
        CurveLoopOrientation2::Counterclockwise
    );
    assert_eq!(
        path.reversed().unwrap().simple_loop_orientation().unwrap(),
        CurveLoopOrientation2::Clockwise
    );
}

#[test]
fn original_parabola_path_is_admitted_to_the_shared_region() {
    let path = parabola_path();
    for fill in [FillRule::NonZero, FillRule::EvenOdd] {
        let region =
            CurveRegion2::try_from_boundary_paths(std::slice::from_ref(&path), fill).unwrap();
        assert_eq!(region.boundary_loops().len(), 1);
        assert_eq!(region.boundary_loops()[0].curves().len(), 3);
    }
}

#[test]
fn polynomial_region_classifies_native_and_retained_points() {
    let path = parabola_path();
    let region = CurveRegion2::try_from_boundary_paths(std::slice::from_ref(&path), FillRule::NonZero).unwrap();
    // Independent filled-set contract: 0 <= x <= 1/4 and y² <= x.
    for (x, y, expected) in [
        (q(1, 8), Real::zero(), RegionPointLocation::Inside),
        (q(1, 8), q(1, 2), RegionPointLocation::Outside),
        (q(1, 4), Real::zero(), RegionPointLocation::Boundary),
        (Real::zero(), Real::zero(), RegionPointLocation::Boundary),
        (q(-1, 8), Real::zero(), RegionPointLocation::Outside),
    ] {
        assert_eq!(region.classify_point(&Point2::new(x, y).into()).unwrap(), expected);
    }
    for index in [0, 2] {
        let point = path.curves()[index].point_at(&q(1, 8).into()).unwrap();
        assert_eq!(region.classify_point(&point).unwrap(), RegionPointLocation::Boundary);
    }
}

fn rectangle(x0: Real, x1: Real, y0: Real, y1: Real) -> CurveRegion2 {
    let points = [Point2::new(x0.clone(), y0.clone()), Point2::new(x1.clone(), y0), Point2::new(x1, y1.clone()), Point2::new(x0, y1)];
    let curves = (0..4).map(|i| Curve2::from(LineSeg2::try_new(points[i].clone(), points[(i + 1) % 4].clone()).unwrap())).collect();
    CurveRegion2::try_from_boundary_paths(&[CurvePath2::try_new(curves).unwrap()], FillRule::NonZero).unwrap()
}

#[test]
fn polynomial_region_boolean_reconstruction_keeps_selected_supports() {
    let path = parabola_path();
    let region = CurveRegion2::try_from_boundary_paths(std::slice::from_ref(&path), FillRule::NonZero).unwrap();
    let clip = rectangle(q(1, 16), q(1, 8), (-1).into(), 1.into());
    let selected = region.boolean_region(&clip, BooleanOp::Intersection).unwrap();
    let paths = selected.boundary_paths().unwrap();
    assert_eq!(paths.len(), 1);
    assert_eq!(paths[0].curves().len(), 4);
    let mut roots = Vec::new();
    for curve in paths[0].curves() {
        if let Some(branch) = curve.polynomial_branch() {
            let source = path.curves()[0].polynomial_branch().unwrap();
            assert_eq!(branch.topology().equation(), source.topology().equation());
            assert_eq!(branch.slab_index(), source.slab_index());
            assert!(branch.rational_maps().is_empty() && branch.image_transform().is_none());
            roots.push(branch.root_index());
            assert_eq!(curve.parameter_domain().start().compare(&q(1, 16).into()).unwrap(), std::cmp::Ordering::Equal);
            assert_eq!(curve.parameter_domain().end().compare(&q(1, 8).into()).unwrap(), std::cmp::Ordering::Equal);
        } else {
            assert_eq!(curve.family(), CurveFamily2::Line);
        }
    }
    roots.sort_unstable();
    assert_eq!(roots, vec![0, 1]);
    let rebuilt = CurveRegion2::try_from_boundary_paths(&paths, FillRule::EvenOdd).unwrap();
    let empty = rebuilt.boolean_region(&selected, BooleanOp::Difference).unwrap();
    assert!(empty.is_empty());
    let restored = empty.boolean_region(&rebuilt, BooleanOp::Union).unwrap();
    assert_eq!(restored.boundary_paths().unwrap()[0].curves().len(), 4);
}
