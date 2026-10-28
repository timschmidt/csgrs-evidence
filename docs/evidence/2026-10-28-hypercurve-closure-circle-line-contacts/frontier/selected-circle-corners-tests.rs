
fn selected_corner_half_disk() -> hypercurve::CurvePath2 {
    let arc = circle_path().curves()[0].clone();
    let diameter = hypercurve::Curve2::try_line(arc.end(), arc.start()).unwrap();
    hypercurve::CurvePath2::try_new(vec![arc, diameter]).unwrap()
}

fn selected_corner_continuation(
    path: hypercurve::CurvePath2,
    previous: &CurvePoint2,
    next: &CurvePoint2,
) {
    use hypercurve::{BooleanOp, FillRule, OffsetCornerStyle2, RegionPointLocation};
    assert_eq!(path.curves().len(), 3);
    assert!(path.curves()[0].end().coincides_with(previous).unwrap());
    assert!(path.curves()[1].start().coincides_with(previous).unwrap());
    assert!(path.curves()[1].end().coincides_with(next).unwrap());
    assert!(path.curves()[2].start().coincides_with(next).unwrap());
    let original = selected_corner_half_disk();
    assert!(path.start().coincides_with(&original.start()).unwrap());
    assert!(path.end().coincides_with(&original.end()).unwrap());
    let region = CurveRegion2::try_from_boundary_paths(
        std::slice::from_ref(&path), FillRule::NonZero,
    ).unwrap();
    assert_eq!(region.loop_role_counts().unwrap(), (1, 0));
    let original_corner = translate(&center(), q(4, 5), q(-3, 5));
    let interior = translate(&center(), q(3, 20), q(1, 5));
    for (point, expected) in [
        (previous, RegionPointLocation::Boundary),
        (next, RegionPointLocation::Boundary),
        (&original_corner, RegionPointLocation::Outside),
        (&interior, RegionPointLocation::Inside),
    ] {
        assert_eq!(region.classify_point(point).unwrap(), expected);
    }
    let text = angular_svg(path);
    let path_replay = import_svg_document(&text).unwrap();
    assert_eq!(export_svg_document(&path_replay).unwrap(), text);
    let rebuilt = CurveRegion2::try_from_boundary_paths(path_replay.paths(), FillRule::NonZero).unwrap();
    assert!(rebuilt.boolean_region(&region, BooleanOp::Xor).unwrap().is_empty());
    let filled = export_svg_document(&SvgGeometry2::new(rebuilt.clone(), Vec::new(), Vec::new())).unwrap();
    let replay = import_svg_document(&filled).unwrap();
    assert_eq!(export_svg_document(&replay).unwrap(), filled);
    assert!(replay.region().boolean_region(&rebuilt, BooleanOp::Xor).unwrap().is_empty());
    let grown = replay.region().offset(q(1, 16), &OffsetCornerStyle2::Round).unwrap();
    let restored = grown.offset(q(-1, 16), &OffsetCornerStyle2::Round).unwrap();
    assert!(restored.boolean_region(&rebuilt, BooleanOp::Xor).unwrap().is_empty());
}

#[test]
fn selected_circle_diameter_chamfer_reconstructs_replays_and_offsets() {
    use hypercurve::CurveCornerMode2;
    let root = Real::from(63).sqrt().unwrap();
    let previous = translate(
        &center(), q(31, 40) + &root * q(3, 160), q(-93, 160) + &root * q(1, 40),
    );
    let next = translate(&center(), q(3, 5), q(-9, 20));
    let solutions = selected_corner_half_disk().chamfer_vertex_by_setbacks(
        1, q(1, 4), q(1, 4), CurveCornerMode2::TrimOnly,
    ).unwrap();
    assert_eq!(solutions.candidate_count(), 1);
    selected_corner_continuation(solutions.into_solutions().pop().unwrap(), &previous, &next);
}

#[test]
fn selected_circle_diameter_constrained_fillet_reconstructs_replays_and_offsets() {
    use hypercurve::{CurveCornerMode2, CurveFillet2, CurveFilletContact2};
    let s = q(1, 2).sqrt().unwrap();
    let fillet_center = translate(
        &center(), &s * q(4, 5) + q(3, 20), &s * q(-3, 5) + q(1, 5),
    );
    let previous = translate(
        &center(), &s * q(16, 15) + q(1, 5), &s * q(-4, 5) + q(4, 15),
    );
    let next = translate(&center(), &s * q(4, 5), &s * q(-3, 5));
    let request = CurveFillet2 {
        radius: q(1, 4),
        center: Some(fillet_center),
        contacts: [
            Some(CurveFilletContact2::Point(previous.clone())),
            Some(CurveFilletContact2::Point(next.clone())),
        ],
    };
    let solutions = selected_corner_half_disk()
        .fillet_vertex(1, &request, CurveCornerMode2::TrimOnly).unwrap();
    assert_eq!(solutions.candidate_count(), 1);
    selected_corner_continuation(solutions.into_solutions().pop().unwrap(), &previous, &next);
}
