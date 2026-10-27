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

fn parabola_region() -> CurveRegion2 {
    CurveRegion2::try_from_boundary_paths(&[parabola_path()], FillRule::NonZero).unwrap()
}

#[test]
fn reconstructed_polynomial_path_classifies_native_and_selected_points() {
    let region = parabola_region();
    let path = &region.boundary_paths().unwrap()[0];
    for (x, y, expected) in [
        (q(1, 8), Real::zero(), hypercurve::ContourPointLocation::Inside),
        (q(1, 8), q(1, 2), hypercurve::ContourPointLocation::Outside),
        (Real::zero(), Real::zero(), hypercurve::ContourPointLocation::Boundary),
    ] {
        assert_eq!(path.classify_point(&Point2::new(x, y).into()).unwrap(), expected);
    }
    for curve in path.curves().iter().filter(|curve| curve.polynomial_branch().is_some()) {
        let point = curve.point_at(&q(1, 8).into()).unwrap();
        assert_eq!(path.classify_point(&point).unwrap(), hypercurve::ContourPointLocation::Boundary);
    }
}

#[test]
fn polynomial_region_holes_follow_both_fill_rules_and_boolean_operations() {
    let region = parabola_region();
    // This entire rectangle is strictly inside y² <= x: y² <= 1/64 < 1/16 <= x.
    let hole = rectangle(q(1, 16), q(1, 8), q(-1, 8), q(1, 8));
    let punctured = region.boolean_region(&hole, BooleanOp::Difference).unwrap();
    let paths = punctured.boundary_paths().unwrap();
    assert_eq!(paths.len(), 2);
    let orientations: Vec<_> = paths.iter().map(|path| path.simple_loop_orientation().unwrap()).collect();
    assert!(orientations.contains(&CurveLoopOrientation2::Clockwise));
    assert!(orientations.contains(&CurveLoopOrientation2::Counterclockwise));
    let xor = region.boolean_region(&hole, BooleanOp::Xor).unwrap();
    assert!(xor.boolean_region(&punctured, BooleanOp::Xor).unwrap().is_empty());
    let reversed: Vec<_> = paths.iter().map(|path| path.reversed().unwrap()).collect();
    for fill in [FillRule::NonZero, FillRule::EvenOdd] {
        for authored in [&paths, &reversed] {
            let rebuilt = CurveRegion2::try_from_boundary_paths(authored, fill).unwrap();
            assert_eq!(rebuilt.boundary_loops().len(), 2);
            for (x, y, expected) in [
                (q(3, 32), Real::zero(), RegionPointLocation::Outside),
                (q(3, 16), Real::zero(), RegionPointLocation::Inside),
                (q(1, 16), Real::zero(), RegionPointLocation::Boundary),
                (q(1, 8), q(3, 8), RegionPointLocation::Outside),
            ] {
                assert_eq!(rebuilt.classify_point(&Point2::new(x, y).into()).unwrap(), expected);
            }
            assert!(rebuilt.boolean_region(&punctured, BooleanOp::Xor).unwrap().is_empty());
        }
    }
    let restored = punctured.boolean_region(&hole, BooleanOp::Union).unwrap();
    assert!(restored.boolean_region(&region, BooleanOp::Xor).unwrap().is_empty());
    let common = region.boolean_region(&hole, BooleanOp::Intersection).unwrap();
    assert!(common.boolean_region(&hole, BooleanOp::Xor).unwrap().is_empty());
}

#[test]
fn polynomial_regions_keep_disconnected_components_under_similarity() {
    let region = parabola_region();
    let translated = region.transform_affine(&1.into(), &0.into(), &0.into(), &1.into(), &3.into(), &0.into()).unwrap();
    let union = region.boolean_region(&translated, BooleanOp::Union).unwrap();
    assert_eq!(union.boundary_loops().len(), 2);
    assert!(region.boolean_region(&translated, BooleanOp::Intersection).unwrap().is_empty());
    // T(x,y) = (2-3y, -1+3x) is an invertible similarity; image membership
    // follows directly by applying its inverse to y² <= x and 0 <= x <= 1/4.
    let transform = |r: &CurveRegion2| r.transform_affine(&0.into(), &(-3).into(), &3.into(), &0.into(), &2.into(), &(-1).into()).unwrap();
    let image = transform(&union);
    let assembled = transform(&region).boolean_region(&transform(&translated), BooleanOp::Union).unwrap();
    assert_eq!(image.boundary_loops().len(), 2);
    assert!(image.boolean_region(&assembled, BooleanOp::Xor).unwrap().is_empty());
    for (x, y, expected) in [
        (q(1, 8), Real::zero(), RegionPointLocation::Inside),
        (q(25, 8), Real::zero(), RegionPointLocation::Inside),
        (Real::one(), Real::zero(), RegionPointLocation::Outside),
        (q(1, 8), q(1, 2), RegionPointLocation::Outside),
    ] {
        let point = Point2::new(Real::from(2) - Real::from(3) * y, Real::from(3) * x - Real::one());
        assert_eq!(image.classify_point(&point.into()).unwrap(), expected);
    }
    let paths = image.boundary_paths().unwrap();
    let branches: Vec<_> = paths.iter().flat_map(|path| path.curves()).filter_map(Curve2::polynomial_branch).collect();
    assert_eq!(branches.len(), 4);
    assert!(branches.iter().all(|branch| branch.rational_maps().is_empty() && branch.image_transform().is_some()));
    let rebuilt = CurveRegion2::try_from_boundary_paths(&paths, FillRule::EvenOdd).unwrap();
    assert!(rebuilt.boolean_region(&image, BooleanOp::Xor).unwrap().is_empty());
}

#[test]
fn polynomial_region_regularizes_contact_but_keeps_nearby_distinct_boundaries() {
    let region = parabola_region();
    let tangent = rectangle(q(1, 4), q(1, 2), (-1).into(), 1.into());
    let empty = region.boolean_region(&tangent, BooleanOp::Intersection).unwrap();
    assert!(empty.is_empty());
    let small = q(1, 1 << 20);
    let small = &small * &small;
    let small = &small * &small; // Exactly 2^-80, never a tolerance.
    let start = q(1, 4) - &small;
    let clip = rectangle(start.clone(), q(1, 2), (-1).into(), 1.into());
    let thin = region.boolean_region(&clip, BooleanOp::Intersection).unwrap();
    let paths = thin.boundary_paths().unwrap();
    assert_eq!(paths.len(), 1);
    assert_eq!(paths[0].curves().len(), 4);
    let mut count = 0;
    for curve in paths[0].curves() {
        if curve.polynomial_branch().is_some() {
            count += 1;
            assert_eq!(curve.parameter_domain().start().compare(&start.clone().into()).unwrap(), std::cmp::Ordering::Equal);
            assert_eq!(curve.parameter_domain().end().compare(&q(1, 4).into()).unwrap(), std::cmp::Ordering::Equal);
        }
    }
    assert_eq!(count, 2);
    let middle = q(1, 4) - small * q(1, 2);
    assert_eq!(thin.classify_point(&Point2::new(middle, 0.into()).into()).unwrap(), RegionPointLocation::Inside);
    assert!(thin.boolean_region(&empty, BooleanOp::Xor).unwrap().boolean_region(&thin, BooleanOp::Difference).unwrap().is_empty());
}

#[test]
fn polynomial_region_boolean_reuses_generic_quintic_trim_and_replay() {
    // y=f(x)=x^5+x²+5x-5 is strictly increasing on [0,1]. Its zero alpha
    // has degree five. Clipping f(x)<=y<=3 by y>=0 must retain f on [alpha,1].
    let equation = BivariatePolynomial::new(vec![
        vec![5.into(), 1.into()], vec![(-5).into()], vec![(-1).into()],
        vec![], vec![], vec![(-1).into()],
    ]);
    let topology = decompose_bivariate_curve(&equation, &BivariateCurveDomain {
        first: [0.into(), 1.into()], second: [(-6).into(), 4.into()],
    }, BivariateTopologyConfig::default()).unwrap();
    let set = PolynomialCurveSet2::from_topology(topology, AlgebraicFiberRootIsolationConfig::default()).unwrap();
    assert_eq!(set.curves().len(), 1);
    let points = [Point2::from_values(1, 2), Point2::from_values(1, 3), Point2::from_values(0, 3), Point2::from_values(0, -5)];
    let mut curves = vec![set.curves()[0].clone()];
    curves.extend((0..3).map(|i| Curve2::from(LineSeg2::try_new(points[i].clone(), points[i+1].clone()).unwrap())));
    let region = CurveRegion2::try_from_boundary_paths(&[CurvePath2::try_new(curves).unwrap()], FillRule::NonZero).unwrap();
    let clip = rectangle(0.into(), 1.into(), 0.into(), 3.into());
    let selected = region.boolean_region(&clip, BooleanOp::Intersection).unwrap();
    let roots = hypercurve::BezierParameterPolynomial::try_new_power_basis([-5, 5, 1, 0, 0, 1].into_iter().map(Real::from).collect()).unwrap().isolate_unit_interval_roots().unwrap();
    assert_eq!(roots.len(), 1);
    let alpha: hypercurve::CurveParameter2 = roots[0].clone().into();
    let paths = selected.boundary_paths().unwrap();
    assert_eq!(paths.len(), 1);
    assert_eq!(paths[0].curves().len(), 5);
    let branches: Vec<_> = paths[0].curves().iter().filter(|curve| curve.polynomial_branch().is_some()).collect();
    assert_eq!(branches.len(), 1);
    let curve = branches[0];
    assert_eq!(curve.polynomial_branch().unwrap().topology().equation(), &equation);
    assert_eq!(curve.parameter_domain().start().compare(&alpha).unwrap(), std::cmp::Ordering::Equal);
    assert_eq!(curve.parameter_domain().end().compare(&Real::one().into()).unwrap(), std::cmp::Ordering::Equal);
    let point = curve.point_at(&alpha).unwrap();
    let replay = point.definition().unwrap().into_point().unwrap();
    assert_eq!(selected.classify_point(&replay).unwrap(), RegionPointLocation::Boundary);
    let rebuilt = CurveRegion2::try_from_boundary_paths(&paths, FillRule::EvenOdd).unwrap();
    let further = rebuilt.boolean_region(&rectangle(q(3, 4), 1.into(), 0.into(), 3.into()), BooleanOp::Intersection).unwrap();
    let paths = further.boundary_paths().unwrap();
    assert_eq!(paths.len(), 1);
    assert_eq!(paths[0].curves().len(), 4);
    let curve = paths[0].curves().iter().find(|curve| curve.polynomial_branch().is_some()).unwrap();
    assert_eq!(curve.parameter_domain().start().compare(&q(3, 4).into()).unwrap(), std::cmp::Ordering::Equal);
    assert_eq!(curve.polynomial_branch().unwrap().topology().equation(), &equation);
}
