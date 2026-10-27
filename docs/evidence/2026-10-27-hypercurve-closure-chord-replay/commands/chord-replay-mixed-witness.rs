
#[test]
fn mixed_replay_preserves_a_hole_and_disconnected_material_through_operations() {
    use hypercurve::{CircularArc2, LineSeg2};
    let x = Real::from(2).sqrt().unwrap();
    let rectangle = |left: i32, right: i32, bottom: i32, top: i32, mixed: bool| {
        let points = [
            Point2::new(&x + Real::from(left), bottom.into()),
            Point2::new(&x + Real::from(right), bottom.into()),
            Point2::new(&x + Real::from(right), top.into()),
            Point2::new(&x + Real::from(left), top.into()),
        ];
        CurvePath2::try_new(
            (0..4)
                .map(|i| {
                    let start = points[i].clone();
                    let end = points[(i + 1) % 4].clone();
                    if mixed && i % 2 == 0 {
                        Curve2::from(LineSeg2::try_new(start, end).unwrap())
                    } else {
                        Curve2::try_line(start.into(), end.into()).unwrap()
                    }
                })
                .collect(),
        )
        .unwrap()
    };
    let outer = rectangle(-3, 3, -3, 3, true);
    let circle_start = Point2::new(&x + Real::one(), 0.into());
    let hole = CurvePath2::try_new(vec![Curve2::from(
        CircularArc2::try_from_center(
            circle_start.clone(),
            circle_start,
            Point2::new(x.clone(), 0.into()),
            true,
        )
        .unwrap(),
    )])
    .unwrap();
    let separate = rectangle(6, 8, -1, 1, false);
    let original = vec![outer, hole, separate];
    let encoded = export_svg_document(&SvgGeometry2::new(
        CurveRegion2::empty(),
        vec![],
        original.clone(),
    ))
    .unwrap();
    let replay = import_svg_document(&encoded).unwrap();
    assert_eq!(replay.paths().len(), 3);
    for (source, decoded) in original.iter().zip(replay.paths()) {
        assert_eq!(source.curves().len(), decoded.curves().len());
        for (source, decoded) in source.curves().iter().zip(decoded.curves()) {
            assert!(source.start().coincides_with(&decoded.start()).unwrap());
            assert!(source.end().coincides_with(&decoded.end()).unwrap());
            assert_eq!(source.geometry().is_some(), decoded.geometry().is_some());
        }
    }
    let region = CurveRegion2::try_from_boundary_paths(replay.paths(), FillRule::NonZero).unwrap();
    assert_eq!(region.loop_role_counts().unwrap(), (2, 1));
    let mut holes = region
        .boundary_profiles()
        .unwrap()
        .iter()
        .map(|profile| profile.holes().len())
        .collect::<Vec<_>>();
    holes.sort_unstable();
    assert_eq!(holes, [0, 1]);
    for (dx, expected) in [
        (0, RegionPointLocation::Outside),
        (1, RegionPointLocation::Boundary),
        (2, RegionPointLocation::Inside),
        (4, RegionPointLocation::Outside),
        (7, RegionPointLocation::Inside),
    ] {
        assert_eq!(
            region
                .classify_point(&Point2::new(&x + Real::from(dx), 0.into()).into())
                .unwrap(),
            expected
        );
    }
    let reconstructed = CurveRegion2::try_from_boundary_paths(
        &region.boundary_paths().unwrap(),
        FillRule::NonZero,
    )
    .unwrap();
    let compared = region.boolean_regions(&reconstructed).unwrap();
    assert!(compared.difference().is_empty());
    assert!(compared.xor().is_empty());
    let empty = compared.xor();
    let recovered = empty.boolean_regions(&region).unwrap().union().clone();
    assert_eq!(recovered.loop_role_counts().unwrap(), (2, 1));
    let expanded = recovered.offset(q(1, 4), &OffsetCornerStyle2::Round).unwrap();
    assert_eq!(expanded.loop_role_counts().unwrap(), (2, 1));
    for (dx, expected) in [
        (Real::zero(), RegionPointLocation::Outside),
        (q(3, 4), RegionPointLocation::Boundary),
        (q(7, 8), RegionPointLocation::Inside),
    ] {
        assert_eq!(
            expanded
                .classify_point(&Point2::new(&x + dx, 0.into()).into())
                .unwrap(),
            expected
        );
    }
    assert!(
        expanded
            .boolean_regions(&expanded)
            .unwrap()
            .difference()
            .is_empty()
    );
    assert_eq!(
        export_svg_document(&SvgGeometry2::new(
            CurveRegion2::empty(),
            vec![],
            replay.paths().to_vec(),
        ))
        .unwrap(),
        encoded
    );
}
