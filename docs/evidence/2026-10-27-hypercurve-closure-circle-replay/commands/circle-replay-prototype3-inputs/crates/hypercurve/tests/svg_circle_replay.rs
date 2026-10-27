#![cfg(feature = "svg")]

use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, BooleanOp, Curve2, CurveCornerMode2, CurveFamily2, CurveFillet2,
    CurveParameter2, CurvePath2, CurvePoint2, CurvePointDefinition2, CurvePointLocations2,
    CurveRegion2, ExactCurveError, FillRule, Point2, Real, RegionPointLocation, Similarity2,
    SvgError, SvgGeometry2, SvgOptions, export_svg_document, export_svg_document_with_options,
    import_svg_document, import_svg_document_with_options,
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn selected() -> CurveParameter2 {
    let mut coefficients = vec![Real::zero(); 8];
    coefficients[0] = (-1).into();
    coefficients[7] = 2.into();
    BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(coefficients).unwrap(),
            BezierParameterInterval::try_new(q(3, 4), 1.into()).unwrap(),
        )
        .unwrap(),
    )
    .into()
}
fn at(beta: &CurveParameter2, x: Real, y: Real) -> CurvePoint2 {
    beta.affine_point(1.into(), x, 0.into(), y).unwrap()
}
fn encode(path: CurvePath2) -> String {
    export_svg_document(&SvgGeometry2::new(
        CurveRegion2::empty(),
        vec![],
        vec![path],
    ))
    .unwrap()
}
fn fillet() -> CurvePath2 {
    let beta = selected();
    let path = CurvePath2::try_new(vec![
        Curve2::try_line(at(&beta, 0.into(), 0.into()), at(&beta, 1.into(), 0.into())).unwrap(),
        Curve2::try_line(at(&beta, 1.into(), 0.into()), at(&beta, 1.into(), 1.into())).unwrap(),
    ])
    .unwrap();
    let mut solutions = path
        .fillet_vertex(1, &CurveFillet2::new(q(1, 4)), CurveCornerMode2::TrimOnly)
        .unwrap()
        .into_solutions();
    assert_eq!(solutions.len(), 1);
    solutions.pop().unwrap()
}
fn verify(text: &str) {
    let replay = import_svg_document(text).unwrap();
    let path = &replay.paths()[0];
    assert_eq!(path.curves().len(), 3);
    let circle = &path.curves()[1];
    assert_eq!(circle.family(), CurveFamily2::CircularArc);
    assert!(circle.geometry().is_none());
    let beta = selected();
    assert!(
        circle
            .start()
            .coincides_with(&at(&beta, q(3, 4), 0.into()))
            .unwrap()
    );
    assert!(
        circle
            .end()
            .coincides_with(&at(&beta, 1.into(), q(1, 4)))
            .unwrap()
    );
    // C=(beta+3/4,1/4), r=1/4. The rational chart at u=1/4
    // has radial components (3/5,-4/5), so this point is exact.
    let interior = at(&beta, q(9, 10), q(1, 20));
    let CurvePointLocations2::Locations(locations) = circle.point_locations(&interior).unwrap()
    else {
        panic!("one selected point on the retained quarter circle")
    };
    assert_eq!(locations.len(), 1);
    let parameter = locations[0].parameter().unwrap().clone();
    assert!(
        circle
            .point_at(&parameter)
            .unwrap()
            .coincides_with(&interior)
            .unwrap()
    );
    let (first, second) = circle.split_at(parameter).unwrap();
    assert!(first.end().coincides_with(&interior).unwrap());
    assert!(second.start().coincides_with(&interior).unwrap());
    let reversed =
        CurvePath2::try_new(vec![second.reversed().unwrap(), first.reversed().unwrap()]).unwrap();
    let second_text = encode(reversed);
    let twice = import_svg_document(&second_text).unwrap();
    assert!(
        twice.paths()[0]
            .start()
            .coincides_with(&circle.end())
            .unwrap()
    );
    assert!(
        twice.paths()[0]
            .end()
            .coincides_with(&circle.start())
            .unwrap()
    );
    assert_eq!(encode(twice.paths()[0].clone()), second_text);
    assert_eq!(encode(path.clone()), text);
}

#[test]
fn selected_circular_fillet_replays_in_a_fresh_process_before_split_and_reversal() {
    const INPUT: &str = "HYPERCURVE_CIRCLE_SVG_REPLAY_INPUT";
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let path = fillet();
    let text = encode(path);
    verify(&text);
    let file =
        std::env::temp_dir().join(format!("hypercurve-circle-svg-{}.svg", std::process::id()));
    std::fs::write(&file, &text).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args([
            "--exact",
            "selected_circular_fillet_replays_in_a_fresh_process_before_split_and_reversal",
            "--nocapture",
        ])
        .env(INPUT, &file)
        .output()
        .unwrap();
    std::fs::remove_file(file).unwrap();
    assert!(
        output.status.success(),
        "{}{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}

#[test]
fn replayed_fillet_reenters_region_boolean_and_boundary_reconstruction() {
    let beta = selected();
    let mut pieces = fillet().curves().to_vec();
    pieces.extend([
        Curve2::try_line(at(&beta, 1.into(), 1.into()), at(&beta, 0.into(), 1.into())).unwrap(),
        Curve2::try_line(at(&beta, 0.into(), 1.into()), at(&beta, 0.into(), 0.into())).unwrap(),
    ]);
    let text = encode(CurvePath2::try_new(pieces).unwrap());
    let replay = import_svg_document(&text).unwrap();
    let region = CurveRegion2::try_from_boundary_paths(replay.paths(), FillRule::NonZero).unwrap();
    assert_eq!(region.loop_role_counts().unwrap(), (1, 0));
    // Independent coordinates relative to the degree-seven corner. In the
    // rounded corner, (x-3/4)^2+(y-1/4)^2 compares exactly with 1/16.
    for (x, y, expected) in [
        (q(1, 2), q(1, 2), RegionPointLocation::Inside),
        (q(9, 10), q(1, 10), RegionPointLocation::Inside),
        (q(99, 100), q(1, 100), RegionPointLocation::Outside),
        (q(9, 10), q(1, 20), RegionPointLocation::Boundary),
    ] {
        assert_eq!(region.classify_point(&at(&beta, x, y)).unwrap(), expected);
    }
    let empty = CurveRegion2::empty();
    for operation in [BooleanOp::Union, BooleanOp::Difference] {
        let result = region.boolean_region(&empty, operation).unwrap();
        assert_eq!(result.loop_role_counts().unwrap(), (1, 0));
        assert!(
            result
                .boolean_region(&region, BooleanOp::Difference)
                .unwrap()
                .is_empty()
        );
        let boundaries = result.boundary_paths().unwrap();
        assert_eq!(boundaries.len(), 1);
        let again = import_svg_document(&encode(boundaries[0].clone())).unwrap();
        let rebuilt =
            CurveRegion2::try_from_boundary_paths(again.paths(), FillRule::NonZero).unwrap();
        assert!(
            rebuilt
                .boolean_region(&region, BooleanOp::Difference)
                .unwrap()
                .is_empty()
        );
        assert!(
            region
                .boolean_region(&rebuilt, BooleanOp::Difference)
                .unwrap()
                .is_empty()
        );
    }
    for operation in [BooleanOp::Intersection, BooleanOp::Difference] {
        assert!(empty.boolean_region(&region, operation).unwrap().is_empty());
    }
    assert!(
        region
            .boolean_region(&empty, BooleanOp::Intersection)
            .unwrap()
            .is_empty()
    );
}

#[test]
fn algebraic_similarity_and_reflection_keep_selected_circle_replay() {
    let source = fillet();
    let scale = Real::from(2).sqrt().unwrap();
    for transform in [
        Similarity2::try_from_real_affine(
            scale.clone(),
            -scale.clone(),
            scale.clone(),
            scale.clone(),
            3.into(),
            (-2).into(),
        )
        .unwrap(),
        Similarity2::try_from_real_affine(
            -scale.clone(),
            0.into(),
            0.into(),
            scale,
            1.into(),
            4.into(),
        )
        .unwrap(),
    ] {
        let transformed = source.transform_similarity(&transform).unwrap();
        let text = encode(transformed.clone());
        let replay = import_svg_document(&text).unwrap();
        for (before, after) in transformed.curves().iter().zip(replay.paths()[0].curves()) {
            assert_eq!(before.family(), after.family());
            assert!(before.start().coincides_with(&after.start()).unwrap());
            assert!(before.end().coincides_with(&after.end()).unwrap());
        }
        let interior = CurvePointDefinition2::Similarity {
            source: at(&selected(), q(9, 10), q(1, 20)),
            transform,
        }
        .into_point()
        .unwrap();
        let CurvePointLocations2::Locations(locations) = replay.paths()[0].curves()[1]
            .point_locations(&interior)
            .unwrap()
        else {
            panic!("the independently transformed point remains on the selected arc")
        };
        assert_eq!(locations.len(), 1);
        assert_eq!(encode(replay.paths()[0].clone()), text);
    }
}

fn wire_real(bytes: &mut Vec<u8>, value: Real) {
    let value = value.to_bytes();
    bytes.extend_from_slice(&u32::try_from(value.len()).unwrap().to_be_bytes());
    bytes.extend(value);
}
fn record(tag: u8, references: &[u32]) -> Vec<u8> {
    let mut bytes = vec![tag];
    for reference in references {
        bytes.extend_from_slice(&reference.to_be_bytes());
    }
    bytes
}
fn point(x: i32, y: i32) -> Vec<u8> {
    let mut bytes = vec![7];
    wire_real(&mut bytes, x.into());
    wire_real(&mut bytes, y.into());
    bytes
}
fn chord(tag: u8, references: &[u32]) -> Vec<u8> {
    let mut bytes = record(tag, references);
    bytes.extend([0, 1]);
    bytes
}
fn circle(center: u32, anchor: u32, radius: i32) -> Vec<u8> {
    let mut bytes = record(20, &[center, anchor]);
    wire_real(&mut bytes, radius.into());
    bytes.push(1); // clockwise from the left normal, hence the right half circle
    bytes
}
fn parameter(support: u32, value: Real) -> Vec<u8> {
    let mut bytes = record(21, &[support]);
    wire_real(&mut bytes, value);
    bytes
}
fn range(support: u32, start: u32, end: u32) -> Vec<u8> {
    let mut bytes = record(23, &[support, start, end]);
    bytes.push(0);
    bytes
}
fn base() -> Vec<Vec<u8>> {
    vec![
        point(0, 0),
        point(1, 0),
        chord(11, &[0, 1]),
        chord(12, &[2, 0, 1]),
        circle(0, 3, 1),
    ]
}
fn wire(nodes: Vec<Vec<u8>>, paths: &[u32]) -> String {
    use std::fmt::Write;
    let mut bytes = b"HCP4".to_vec();
    bytes.extend_from_slice(&u32::try_from(nodes.len()).unwrap().to_be_bytes());
    bytes.extend(nodes.into_iter().flatten());
    bytes.extend_from_slice(&u32::try_from(paths.len()).unwrap().to_be_bytes());
    for path in paths {
        bytes.extend_from_slice(&path.to_be_bytes());
    }
    let mut metadata = String::from("4:");
    for byte in bytes {
        write!(&mut metadata, "{byte:02x}").unwrap();
    }
    format!(
        r#"<svg xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="black" data-hypercurve-path="{metadata}" d="M0 0 L1 1"/></svg>"#
    )
}
fn invalid(nodes: Vec<Vec<u8>>) {
    assert!(matches!(
        import_svg_document(&wire(nodes, &[])),
        Err(SvgError::Exact(ExactCurveError::Invalid { .. }))
    ));
}

#[test]
fn unused_circle_records_reject_wrong_typed_forward_and_cross_circle_references() {
    for extra in [
        circle(4, 3, 1),
        circle(0, 0, 1),
        circle(5, 3, 1),
        parameter(0, 0.into()),
        parameter(5, 0.into()),
        record(24, &[4, 4]),
        record(24, &[4, 5]),
        record(24, &[0, 1]),
        range(4, 0, 1),
    ] {
        let mut nodes = base();
        nodes.push(extra);
        assert!(matches!(
            import_svg_document(&wire(nodes, &[])),
            Err(SvgError::MalformedInput(_))
        ));
    }
    let mut nodes = base();
    nodes.extend([
        circle(0, 3, 1),
        parameter(4, 0.into()),
        parameter(5, 1.into()),
        range(4, 6, 7),
    ]);
    assert!(matches!(
        import_svg_document(&wire(nodes, &[])),
        Err(SvgError::MalformedInput(_))
    ));
}

#[test]
fn replay_reproves_radius_incidence_selected_half_and_ascending_domain() {
    let mut zero = base();
    zero[4] = circle(0, 3, 0);
    invalid(zero);
    for value in [Real::from(-1), Real::from(2)] {
        let mut nodes = base();
        nodes.push(parameter(4, value));
        invalid(nodes);
    }
    for (start, end) in [(1, 0), (0, 0)] {
        let mut nodes = base();
        nodes.extend([
            parameter(4, start.into()),
            parameter(4, end.into()),
            range(4, 5, 6),
        ]);
        invalid(nodes);
    }
    for (x, y) in [(0, 0), (1, 1), (-1, 0)] {
        let mut nodes = base();
        nodes.extend([point(x, y), record(24, &[4, 5])]);
        invalid(nodes);
    }
    let mut nodes = base();
    // Both valid scalar chart boundaries and an independently supplied radial
    // point must survive without trusting the SVG display polyline.
    nodes.extend([
        parameter(4, 0.into()),
        parameter(4, 1.into()),
        record(24, &[4, 1]),
        range(4, 5, 7),
    ]);
    let replay = import_svg_document(&wire(nodes, &[8])).unwrap();
    assert!(
        replay.paths()[0]
            .start()
            .coincides_with(&Point2::new(0.into(), 1.into()).into())
            .unwrap()
    );
    assert!(
        replay.paths()[0]
            .end()
            .coincides_with(&Point2::new(1.into(), 0.into()).into())
            .unwrap()
    );
}

#[test]
fn circle_dependency_depth_is_reached_before_publication_and_retry_succeeds() {
    let mut nodes = base();
    nodes.extend([
        parameter(4, 0.into()),
        parameter(4, 1.into()),
        range(4, 5, 6),
    ]);
    let text = wire(nodes, &[7]);
    let small = SvgOptions {
        max_point_definition_depth: 0,
        ..SvgOptions::default()
    };
    let large = SvgOptions {
        max_point_definition_depth: 1,
        ..small
    };
    for _ in 0..2 {
        assert!(matches!(
            import_svg_document_with_options(&text, small),
            Err(SvgError::SizeOverflow {
                limit: "configured exact point-definition depth"
            })
        ));
        let replay = import_svg_document_with_options(&text, large).unwrap();
        assert!(matches!(
            export_svg_document_with_options(&replay, small),
            Err(SvgError::SizeOverflow {
                limit: "configured exact point-definition depth"
            })
        ));
        let exported = export_svg_document_with_options(&replay, large).unwrap();
        assert_eq!(
            export_svg_document_with_options(
                &import_svg_document_with_options(&exported, large).unwrap(),
                large
            )
            .unwrap(),
            exported
        );
    }
}
