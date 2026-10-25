#![cfg(feature = "dispatch-trace")]
//! R11: a strict directed-image rewrite must retain its loop-role proof.

use hypercurve::{
    BooleanOp, CircularArc2, Contour2, CurveRegion2, LineSeg2, Point2, Real, RegionPointLocation,
    Segment2,
};
fn p(x: i64, y: i64) -> Point2 {
    Point2::from_values(x, y)
}
fn circle() -> Contour2 {
    Contour2::try_new(vec![
        Segment2::Arc(CircularArc2::try_from_center(p(11, 0), p(9, 0), p(10, 0), false).unwrap()),
        Segment2::Arc(CircularArc2::try_from_center(p(9, 0), p(11, 0), p(10, 0), false).unwrap()),
    ])
    .unwrap()
}
fn cap() -> Contour2 {
    Contour2::try_new(vec![
        Segment2::Line(LineSeg2::try_new(p(0, 0), p(2, 0)).unwrap()),
        Segment2::Line(LineSeg2::try_new(p(2, 0), p(2, 1)).unwrap()),
        Segment2::Arc(CircularArc2::try_from_center(p(2, 1), p(0, 1), p(1, 1), false).unwrap()),
        Segment2::Line(LineSeg2::try_new(p(0, 1), p(0, 0)).unwrap()),
    ])
    .unwrap()
}

fn rectangle(x0: Real, y0: Real, x1: Real, y1: Real) -> Contour2 {
    Contour2::from_real_ring(&[
        [x0.clone(), y0.clone()],
        [x1.clone(), y0.clone()],
        [x1, y1.clone()],
        [x0.clone(), y1],
        [x0, y0],
    ])
    .unwrap()
}

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn assert_location(region: &CurveRegion2, x: Real, y: Real, location: RegionPointLocation) {
    assert_eq!(
        region.classify_point(&Point2::new(x, y).into()).unwrap(),
        location
    );
}

fn assert_area(region: &CurveRegion2, expected: Real) {
    let actual = region.filled_area().unwrap().unwrap();
    assert_eq!(
        hyperlimit::compare_reals(&actual, &expected, hyperlimit::PredicatePolicy::STRICT).value(),
        Some(std::cmp::Ordering::Equal)
    );
}

fn require_retained_roles(region: &CurveRegion2) {
    for _ in 0..2 {
        let roles = hyperreal::dispatch_trace::with_recording(|| region.loop_roles()).unwrap();
        assert_eq!(roles, vec![hypercurve::CurveRegionLoopRole::Material; 2]);
        let trace = hyperreal::dispatch_trace::take_trace();
        assert_eq!(
            trace.path_count(
                "hypercurve",
                "curve-region-disjoint-loop-roles",
                "pairwise-disjoint"
            ),
            0,
            "the Boolean already proved these roles before merging its lines"
        );
    }
}

#[test]
fn coalesced_mixed_boolean_retains_disjoint_loop_roles() {
    let a = CurveRegion2::try_from_native_contours(vec![cap(), circle()], vec![]).unwrap();
    let rectangle = Contour2::from_real_ring(&[
        [1.into(), 0.into()],
        [3.into(), 0.into()],
        [3.into(), 1.into()],
        [1.into(), 1.into()],
        [1.into(), 0.into()],
    ])
    .unwrap();
    let b = CurveRegion2::try_from_native_contours(vec![rectangle], vec![]).unwrap();
    hyperreal::dispatch_trace::reset();
    let union =
        hyperreal::dispatch_trace::with_recording(|| a.boolean_region(&b, BooleanOp::Union))
            .unwrap();
    let trace = hyperreal::dispatch_trace::take_trace();
    assert_eq!(
        trace.path_count(
            "hypercurve",
            "curve-region-disjoint-loop-roles",
            "pairwise-disjoint"
        ),
        1
    );
    assert_eq!(union.len(), 2);
    // The union's bottom edge spans both operands, proving that its adjacent
    // collinear fragments were actually coalesced.
    assert!(
        union
            .boundary_loops()
            .iter()
            .flat_map(|b| b.curves())
            .any(|c| {
                c.start().coordinates() == Some(&p(0, 0)) && c.end().coordinates() == Some(&p(3, 0))
            })
    );
    drop(a);
    drop(b);
    require_retained_roles(&union);
    assert_area(&union, Real::from(3) + q(3, 2) * Real::pi());
    assert_location(&union, 10.into(), 0.into(), RegionPointLocation::Inside);
    assert_location(&union, 5.into(), 0.into(), RegionPointLocation::Outside);
    assert_location(&union, 2.into(), 0.into(), RegionPointLocation::Boundary);
}

#[test]
fn cyclic_seams_reversal_and_swapped_operands_preserve_classification() {
    for reversed in [false, true] {
        for seam in 0..4 {
            for swapped in [false, true] {
                let mut segments = cap().segments().to_vec();
                segments.rotate_left(seam);
                if reversed {
                    segments = segments.iter().rev().map(Segment2::reversed).collect();
                }
                let a = CurveRegion2::try_from_native_contours(
                    vec![Contour2::try_new(segments).unwrap(), circle()],
                    vec![],
                )
                .unwrap();
                let b = CurveRegion2::try_from_native_contours(
                    vec![rectangle(1.into(), 0.into(), 3.into(), 1.into())],
                    vec![],
                )
                .unwrap();
                let union = if swapped {
                    b.boolean_region(&a, BooleanOp::Union)
                } else {
                    a.boolean_region(&b, BooleanOp::Union)
                }
                .unwrap();
                hyperreal::dispatch_trace::reset();
                require_retained_roles(&union);
                assert_area(&union, Real::from(3) + q(3, 2) * Real::pi());
                let cut = union.boolean_region(&b, BooleanOp::Difference).unwrap();
                assert_location(&cut, q(1, 2), q(1, 2), RegionPointLocation::Inside);
                assert_location(&cut, q(5, 2), q(1, 2), RegionPointLocation::Outside);
                assert_location(&cut, 10.into(), 0.into(), RegionPointLocation::Inside);
            }
        }
    }
}

#[test]
fn coalescing_keeps_exact_hole_ownership() {
    let hole = rectangle(q(19, 2), q(-1, 4), q(21, 2), q(1, 4));
    let a =
        CurveRegion2::try_from_native_contours(vec![cap(), circle()], vec![hole.clone()]).unwrap();
    let b = CurveRegion2::try_from_native_contours(
        vec![rectangle(1.into(), 0.into(), 3.into(), 1.into())],
        vec![],
    )
    .unwrap();
    let union = a.boolean_region(&b, BooleanOp::Union).unwrap();
    assert_eq!(union.loop_role_counts().unwrap(), (2, 1));
    assert_area(&union, q(5, 2) + q(3, 2) * Real::pi());
    assert_location(&union, 10.into(), 0.into(), RegionPointLocation::Outside);
    assert_location(&union, 10.into(), q(1, 2), RegionPointLocation::Inside);
    let hole = CurveRegion2::try_from_native_contours(vec![hole], vec![]).unwrap();
    assert!(
        union
            .boolean_region(&hole, BooleanOp::Intersection)
            .unwrap()
            .is_empty()
    );
    let filled = union.boolean_region(&hole, BooleanOp::Union).unwrap();
    assert_eq!(filled.loop_role_counts().unwrap(), (2, 0));
    assert_area(&filled, Real::from(3) + q(3, 2) * Real::pi());
}

#[test]
fn selected_arc_endpoints_keep_the_transported_roles() {
    let a = CurveRegion2::try_from_native_contours(vec![cap(), circle()], vec![]).unwrap();
    let b = CurveRegion2::try_from_native_contours(
        vec![rectangle(1.into(), 0.into(), 3.into(), q(3, 2))],
        vec![],
    )
    .unwrap();
    let union = a.boolean_region(&b, BooleanOp::Union).unwrap();
    drop(a);
    drop(b);
    hyperreal::dispatch_trace::reset();
    require_retained_roles(&union);
    // The trim selects the irrational circle/line contact 1+sqrt(3)/2.
    assert_location(
        &union,
        Real::one() + q(1, 2) * Real::from(3).sqrt().unwrap(),
        q(3, 2),
        RegionPointLocation::Boundary,
    );
    assert_location(&union, 1.into(), q(7, 4), RegionPointLocation::Inside);
    assert_location(&union, q(5, 2), q(5, 4), RegionPointLocation::Inside);
    assert_location(&union, q(5, 2), q(7, 4), RegionPointLocation::Outside);
}

#[test]
fn point_touching_components_keep_separate_material_ownership() {
    let a = CurveRegion2::try_from_native_contours(vec![cap(), circle()], vec![]).unwrap();
    let b = CurveRegion2::try_from_native_contours(
        vec![
            rectangle(1.into(), 0.into(), 3.into(), 1.into()),
            rectangle((-1).into(), (-1).into(), 0.into(), 0.into()),
        ],
        vec![],
    )
    .unwrap();
    for policy in [
        hyperlimit::PredicatePolicy::STRICT,
        hyperlimit::PredicatePolicy::APPROXIMATE_512,
    ] {
        let result = hypercurve::evaluate_under(policy, || a.boolean_region(&b, BooleanOp::Union));
        assert!(result.is_certified());
        let union = result.into_unverified().unwrap();
        assert_eq!(union.loop_role_counts().unwrap(), (3, 0));
        assert_area(&union, Real::from(4) + q(3, 2) * Real::pi());
        assert_location(&union, 0.into(), 0.into(), RegionPointLocation::Boundary);
        assert_location(&union, q(-1, 2), q(-1, 2), RegionPointLocation::Inside);
        assert_location(&union, q(-1, 2), q(1, 2), RegionPointLocation::Outside);
        let restored = union.boolean_region(&b, BooleanOp::Difference).unwrap();
        assert_location(&restored, q(-1, 2), q(-1, 2), RegionPointLocation::Outside);
        assert_location(&restored, 10.into(), 0.into(), RegionPointLocation::Inside);
    }
}

#[test]
fn authored_backtracking_does_not_change_the_regularized_mixed_set() {
    let mut segments = cap().segments().to_vec();
    segments.splice(
        1..1,
        [
            Segment2::Line(LineSeg2::try_new(p(2, 0), p(1, 0)).unwrap()),
            Segment2::Line(LineSeg2::try_new(p(1, 0), p(2, 0)).unwrap()),
        ],
    );
    let a = CurveRegion2::try_from_native_contours(
        vec![Contour2::try_new(segments).unwrap(), circle()],
        vec![],
    )
    .unwrap();
    let b = CurveRegion2::try_from_native_contours(
        vec![rectangle(1.into(), 0.into(), 3.into(), 1.into())],
        vec![],
    )
    .unwrap();
    let union = a.boolean_region(&b, BooleanOp::Union).unwrap();
    assert_eq!(union.loop_role_counts().unwrap(), (2, 0));
    assert_area(&union, Real::from(3) + q(3, 2) * Real::pi());
    assert_location(&union, q(3, 2), q(1, 2), RegionPointLocation::Inside);
    assert!(
        union
            .boolean_region(&union, BooleanOp::Difference)
            .unwrap()
            .is_empty()
    );
}
