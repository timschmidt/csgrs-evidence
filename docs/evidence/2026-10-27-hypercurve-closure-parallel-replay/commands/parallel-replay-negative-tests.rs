// Additional acceptance witnesses to append after the running prototype ends.
fn wire_real(bytes: &mut Vec<u8>, value: &Real) {
    let value = value.to_bytes();
    bytes.extend_from_slice(&u32::try_from(value.len()).unwrap().to_be_bytes());
    bytes.extend(value);
}

fn wire_quad(points: [Point2; 3]) -> Vec<u8> {
    let mut bytes = vec![0, 2];
    for point in points {
        wire_real(&mut bytes, point.x());
        wire_real(&mut bytes, point.y());
    }
    bytes
}

fn wire_scalar(value: Real) -> Vec<u8> {
    let mut bytes = vec![1];
    wire_real(&mut bytes, &value);
    bytes
}

fn wire_support(source: u32, distance: Real) -> Vec<u8> {
    let mut bytes = vec![5];
    bytes.extend_from_slice(&source.to_be_bytes());
    wire_real(&mut bytes, &distance);
    bytes
}

fn wire_parallel(support: u32, start: u32, end: u32, reversed: bool) -> Vec<u8> {
    let mut bytes = vec![6];
    for reference in [support, start, end] {
        bytes.extend_from_slice(&reference.to_be_bytes());
    }
    bytes.push(u8::from(reversed));
    bytes
}

fn wire_document(nodes: Vec<Vec<u8>>, paths: &[u32]) -> String {
    use std::fmt::Write;
    let mut bytes = b"HCP4".to_vec();
    bytes.extend_from_slice(&u32::try_from(nodes.len()).unwrap().to_be_bytes());
    bytes.extend(nodes.into_iter().flatten());
    bytes.extend_from_slice(&u32::try_from(paths.len()).unwrap().to_be_bytes());
    for reference in paths {
        bytes.extend_from_slice(&reference.to_be_bytes());
    }
    let mut extension = String::from("4:");
    for byte in bytes {
        write!(&mut extension, "{byte:02x}").unwrap();
    }
    format!(r#"<svg xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="black" data-hypercurve-path="{extension}" d="M0 0 L1 1"/></svg>"#)
}

#[test]
fn parallel_replay_rejects_invalid_references_and_changed_singular_ranges() {
    use hypercurve::{ExactCurveError, SvgError};
    let source = || wire_quad([point(0, 0), Point2::new(q(1, 2), 0.into()), point(1, 1)]);
    for support in [0, 2, 4, 99] {
        let encoded = wire_document(vec![source(), wire_support(0, q(-1, 4)), wire_scalar(Real::zero()), wire_scalar(Real::one()), wire_parallel(support, 2, 3, false)], &[4]);
        assert!(matches!(import_svg_document(&encoded), Err(SvgError::MalformedInput(_))));
    }
    let forward = wire_document(vec![source(), wire_support(2, Real::one())], &[]);
    assert!(matches!(import_svg_document(&forward), Err(SvgError::MalformedInput(_))));
    let wrong_kind = wire_document(vec![wire_scalar(Real::one()), wire_support(0, Real::one())], &[]);
    assert!(matches!(import_svg_document(&wrong_kind), Err(SvgError::MalformedInput(_))));
    for start_end in [(Real::one(), Real::zero()), (q(1, 2), q(1, 2))] {
        let encoded = wire_document(vec![source(), wire_support(0, q(-1, 4)), wire_scalar(start_end.0), wire_scalar(start_end.1), wire_parallel(1, 2, 3, false)], &[4]);
        assert!(matches!(import_svg_document(&encoded), Err(SvgError::Exact(ExactCurveError::Invalid { .. }))));
    }
    for source in [source(), wire_quad([point(0, 0), point(0, 0), point(1, 1)])] {
        let encoded = wire_document(vec![source, wire_support(0, Real::one()), wire_scalar(Real::zero()), wire_scalar(Real::one()), wire_parallel(1, 2, 3, false)], &[]);
        // The requested parallel range is invalid even when the final path is empty.
        assert!(matches!(import_svg_document(&encoded), Err(SvgError::Exact(ExactCurveError::Invalid { .. }))));
    }
    let regular_piece = wire_document(vec![source(), wire_support(0, Real::one()), wire_scalar(Real::zero()), wire_scalar(q(1, 4)), wire_parallel(1, 2, 3, true)], &[4]);
    let decoded = import_svg_document(&regular_piece).unwrap();
    assert!(decoded.paths()[0].curves()[0].analytic_parallel().unwrap().is_reversed());
}

#[test]
fn rational_parallel_replay_checks_only_the_declared_range_for_poles() {
    use hypercurve::{ExactCurveError, SvgError, UncertaintyReason};
    // C(t)=(t/(1-2t),0). The authored unit chart has a pole, but [2,3] does not.
    let mut source = vec![0, 5];
    source.extend_from_slice(&2_u32.to_be_bytes());
    for value in [0, 0, 1, 1, 0, -1] {
        wire_real(&mut source, &Real::from(value));
    }
    for distance in [Real::zero(), q(1, 4)] {
        let encoded = wire_document(vec![source.clone(), wire_support(0, distance.clone()), wire_scalar(2.into()), wire_scalar(3.into()), wire_parallel(1, 2, 3, false)], &[4]);
        let decoded = import_svg_document(&encoded).unwrap();
        let curve = &decoded.paths()[0].curves()[0];
        assert!(curve.start().coincides_with(&Point2::new(q(-2, 3), distance.clone()).into()).unwrap());
        assert!(curve.end().coincides_with(&Point2::new(q(-3, 5), distance.clone()).into()).unwrap());
        let invalid = wire_document(vec![source.clone(), wire_support(0, distance), wire_scalar(q(1, 4)), wire_scalar(q(3, 4)), wire_parallel(1, 2, 3, false)], &[4]);
        assert!(matches!(import_svg_document(&invalid), Err(SvgError::Exact(ExactCurveError::Blocked(ref blocker))) if blocker.reason == UncertaintyReason::Boundary));
    }
}
