
#[test]
fn mapped_circle_cut_ray_retains_concentric_offsets_and_reversal() {
    use crate::tests::decided;
    let policy = CurveContext::STRICT;
    let origin = CurvePoint2::from(Point2::from_values(0, 0));
    let anchor = decided(BezierAlgebraicChord2::try_new(
        origin.clone(), Point2::from_values(1, 0).into(), &policy,
    ).unwrap());
    let circle = decided(BezierAlgebraicCuspSemicircle2::from_retained_center_and_chord_normal(
        origin.clone(), anchor, Real::one(), true, &policy,
    ).unwrap()).unwrap();
    let endpoint = CurvePoint2::from(Point2::from_values(1, 0));
    assert_eq!(circle.retained_point_incidence_sign(&endpoint, &policy).unwrap(),
        Classification::Decided(RealSign::Zero));
    let radial = decided(common_point_displacement(&endpoint, &origin, &policy).unwrap());
    let cut = BezierAlgebraicCuspSemicircleParameter2::Mapped(Arc::new(
        BezierAlgebraicCuspSemicircleMappedParameterData2::IncidentPoint {
            semicircle: circle.clone(), point: endpoint, radial: Arc::new(radial), policy,
        },
    ));
    let fragment = decided(BezierAlgebraicCuspSemicircleFragment2::try_new(
        circle, BezierAlgebraicCuspSemicircleParameter2::Exact(Real::zero()), cut, false, &policy,
    ).unwrap());
    for reverse in [false, true] {
        let source = if reverse { fragment.reversed() } else { fragment.clone() };
        let distance = Real::from(if reverse { -1 } else { 1 });
        let grown = decided(source.offset_left(&distance, &policy).unwrap()).unwrap();
        assert!(matches!(grown.data.end, BezierAlgebraicCuspSemicircleParameter2::Mapped(_)));
        let ray = decided(grown.algebraic_ray_evaluator(&policy).unwrap());
        let endpoints = if reverse { [(2, 0), (0, 2)] } else { [(0, 2), (2, 0)] };
        for (actual, (x, y)) in [&ray.start, &ray.end].into_iter().zip(endpoints) {
            assert_eq!(actual.same_point(&Point2::from_values(x, y).into(), &policy),
                Classification::Decided(true));
        }
        let root = Real::from(2).sqrt().unwrap();
        for (point, expected) in [
            (Point2::new(root.clone(), root.clone()), true),
            (Point2::new(-root.clone(), -root), false),
            (Point2::from_values(0, 1), false),
        ] {
            assert_eq!(ray.contains_point_for_point(&point.into(), &policy).unwrap(),
                Classification::Decided(expected));
        }
        assert_eq!(ray.forward_ray_winding_delta_for_point(
            &Point2::from_values(-3, 1).into(), &Real::one(), &Real::zero(), false, &policy,
        ).unwrap(), Classification::Decided(if reverse { 1 } else { -1 }));
    }
}
