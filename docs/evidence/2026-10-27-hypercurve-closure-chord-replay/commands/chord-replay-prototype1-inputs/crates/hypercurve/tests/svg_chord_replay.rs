#![cfg(feature = "svg")]

use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveParameter2, CurvePath2, CurvePoint2,
    CurvePointDefinition2, CurvePointLocations2, CurveRegion2, ExactCurveError, FillRule,
    OffsetCornerStyle2, Point2, Real, RegionPointLocation, SvgError, SvgGeometry2,
    export_svg_document, import_svg_document,
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
            BezierParameterInterval::try_new(q(3, 4), Real::one()).unwrap(),
        )
        .unwrap(),
    )
    .into()
}

fn at(parameter: &CurveParameter2, y: i32) -> CurvePoint2 {
    parameter
        .affine_point(1.into(), 0.into(), 0.into(), y.into())
        .unwrap()
}

fn document(path: CurvePath2) -> String {
    export_svg_document(&SvgGeometry2::new(
        CurveRegion2::empty(),
        vec![],
        vec![path],
    ))
    .unwrap()
}

fn verify_selected(document_text: &str) {
    let replay = import_svg_document(document_text).unwrap();
    let path = &replay.paths()[0];
    assert_eq!(path.curves().len(), 3);
    let beta = selected();
    for (curve, (start, end)) in path.curves().iter().zip([(0, 1), (1, 2), (2, 0)]) {
        assert!(curve.geometry().is_none());
        assert!(curve.start().coordinates().is_none());
        assert!(curve.start().coincides_with(&at(&beta, start)).unwrap());
        assert!(curve.end().coincides_with(&at(&beta, end)).unwrap());
        let CurvePointDefinition2::Rational { parameter, .. } = curve.start().definition().unwrap()
        else {
            panic!("selected native source point remains authoritative")
        };
        assert_eq!(parameter.compare(&beta).unwrap(), std::cmp::Ordering::Equal);
    }
    let contacts = path.curves()[0].intersect_curve(&path.curves()[2]).unwrap();
    assert!(contacts.is_complete());
    assert_eq!(contacts.overlaps().len(), 1);
    let CurvePointLocations2::Locations(locations) =
        path.curves()[2].point_locations(&at(&beta, 1)).unwrap()
    else {
        panic!("one selected midpoint")
    };
    assert_eq!(locations.len(), 1);
    let (first, second) = path.curves()[2]
        .split_at(locations[0].parameter().unwrap().clone())
        .unwrap();
    assert!(first.end().coincides_with(&at(&beta, 1)).unwrap());
    assert!(second.start().coincides_with(&first.end()).unwrap());
    let second_replay =
        import_svg_document(&document(CurvePath2::try_new(vec![first, second]).unwrap())).unwrap();
    assert!(
        second_replay.paths()[0]
            .start()
            .coincides_with(&at(&beta, 2))
            .unwrap()
    );
    assert!(
        second_replay.paths()[0]
            .end()
            .coincides_with(&at(&beta, 0))
            .unwrap()
    );
    assert_eq!(document(path.clone()), document_text);
}

#[test]
fn selected_chord_split_replays_in_a_fresh_process_before_further_incidence() {
    const INPUT: &str = "HYPERCURVE_CHORD_SVG_REPLAY_INPUT";
    if let Some(path) = std::env::var_os(INPUT) {
        verify_selected(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let beta = selected();
    let chord = Curve2::try_line(at(&beta, 0), at(&beta, 2)).unwrap();
    let CurvePointLocations2::Locations(locations) = chord.point_locations(&at(&beta, 1)).unwrap()
    else {
        panic!("one selected midpoint")
    };
    let (first, second) = chord
        .split_at(locations[0].parameter().unwrap().clone())
        .unwrap();
    let encoded =
        document(CurvePath2::try_new(vec![first, second, chord.reversed().unwrap()]).unwrap());
    let path =
        std::env::temp_dir().join(format!("hypercurve-chord-svg-{}.svg", std::process::id()));
    std::fs::write(&path, encoded).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args([
            "--exact",
            "selected_chord_split_replays_in_a_fresh_process_before_further_incidence",
            "--nocapture",
        ])
        .env(INPUT, &path)
        .output()
        .unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(
        output.status.success(),
        "{}{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}

#[test]
fn algebraic_coordinate_chords_replay_before_region_boolean_and_offset() {
    let x = Real::from(2).sqrt().unwrap();
    let points: [CurvePoint2; 4] = [
        Point2::new(x.clone(), 0.into()).into(),
        Point2::new(&x + Real::one(), 0.into()).into(),
        Point2::new(&x + Real::one(), 2.into()).into(),
        Point2::new(x.clone(), 2.into()).into(),
    ];
    let path = CurvePath2::try_new(
        (0..4)
            .map(|i| Curve2::try_line(points[i].clone(), points[(i + 1) % 4].clone()).unwrap())
            .collect(),
    )
    .unwrap();
    let replay = import_svg_document(&document(path)).unwrap();
    for (i, curve) in replay.paths()[0].curves().iter().enumerate() {
        assert!(curve.start().coincides_with(&points[i]).unwrap());
        assert!(curve.end().coincides_with(&points[(i + 1) % 4]).unwrap());
    }
    let region = CurveRegion2::try_from_boundary_paths(replay.paths(), FillRule::NonZero).unwrap();
    let inside = Point2::new(&x + q(1, 2), 1.into()).into();
    let outside = Point2::new(&x - q(1, 2), 1.into()).into();
    assert_eq!(
        region.classify_point(&inside).unwrap(),
        RegionPointLocation::Inside
    );
    assert_eq!(
        region.classify_point(&outside).unwrap(),
        RegionPointLocation::Outside
    );
    assert!(
        region
            .boolean_regions(&region)
            .unwrap()
            .difference()
            .is_empty()
    );
    let expanded = region.offset(q(1, 8), &OffsetCornerStyle2::Round).unwrap();
    assert_eq!(
        expanded.classify_point(&inside).unwrap(),
        RegionPointLocation::Inside
    );
    assert!(
        expanded
            .boolean_regions(&expanded)
            .unwrap()
            .difference()
            .is_empty()
    );
}

fn wire_real(bytes: &mut Vec<u8>, value: Real) {
    let value = value.to_bytes();
    bytes.extend_from_slice(&u32::try_from(value.len()).unwrap().to_be_bytes());
    bytes.extend(value);
}

fn wire_point(x: i32, y: i32) -> Vec<u8> {
    let mut bytes = vec![7];
    wire_real(&mut bytes, x.into());
    wire_real(&mut bytes, y.into());
    bytes
}

fn wire_support(start: u32, end: u32, axis: u8, increases: bool) -> Vec<u8> {
    let mut bytes = vec![11];
    bytes.extend_from_slice(&start.to_be_bytes());
    bytes.extend_from_slice(&end.to_be_bytes());
    bytes.extend([axis, u8::from(increases)]);
    bytes
}

fn wire_range(support: u32, start: u32, end: u32, axis: u8, increases: bool) -> Vec<u8> {
    let mut bytes = vec![12];
    for reference in [support, start, end] {
        bytes.extend_from_slice(&reference.to_be_bytes());
    }
    bytes.extend([axis, u8::from(increases)]);
    bytes
}

fn wire(nodes: Vec<Vec<u8>>, paths: &[u32]) -> (String, String) {
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
    (
        format!(
            r#"<svg xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="black" data-hypercurve-path="{metadata}" d="M0 0 L1 1"/></svg>"#
        ),
        metadata,
    )
}

#[test]
fn replay_retains_a_valid_alternative_chart_and_exterior_support_range() {
    let (input, metadata) = wire(
        vec![
            wire_point(0, 0),
            wire_point(2, 1),
            wire_support(0, 1, 1, true),
            wire_point(6, 3),
            wire_point(4, 2),
            wire_range(2, 3, 4, 1, false),
        ],
        &[5],
    );
    let decoded = import_svg_document(&input).unwrap();
    let curve = &decoded.paths()[0].curves()[0];
    assert!(
        curve
            .start()
            .coincides_with(&Point2::from_values(6, 3).into())
            .unwrap()
    );
    assert!(
        curve
            .end()
            .coincides_with(&Point2::from_values(4, 2).into())
            .unwrap()
    );
    let output = document(decoded.paths()[0].clone());
    assert!(
        output.contains(&format!(r#"data-hypercurve-path="{metadata}""#)),
        "the supplied y chart must survive even though the ordinary constructor schedules x first"
    );
}

#[test]
fn invalid_chord_definitions_are_checked_before_an_empty_final_path() {
    for (axis, increases) in [(1, true), (0, false)] {
        let (input, _) = wire(
            vec![
                wire_point(0, 0),
                wire_point(2, 0),
                wire_support(0, 1, axis, increases),
            ],
            &[],
        );
        assert!(matches!(
            import_svg_document(&input),
            Err(SvgError::Exact(ExactCurveError::Invalid { .. }))
        ));
    }
    for (start, end) in [(0, 0), (1, 0), (3, 1)] {
        let (input, _) = wire(
            vec![
                wire_point(0, 0),
                wire_point(2, 0),
                wire_support(0, 1, 0, true),
                wire_point(1, 1),
                wire_range(2, start, end, 0, true),
            ],
            &[],
        );
        assert!(matches!(
            import_svg_document(&input),
            Err(SvgError::Exact(ExactCurveError::Invalid { .. }))
        ));
    }
    for support in [0, 3, 99] {
        let (input, _) = wire(
            vec![
                wire_point(0, 0),
                wire_point(2, 0),
                wire_support(0, 1, 0, true),
                wire_range(support, 0, 1, 0, true),
            ],
            &[],
        );
        assert!(matches!(
            import_svg_document(&input),
            Err(SvgError::MalformedInput(_))
        ));
    }
}
