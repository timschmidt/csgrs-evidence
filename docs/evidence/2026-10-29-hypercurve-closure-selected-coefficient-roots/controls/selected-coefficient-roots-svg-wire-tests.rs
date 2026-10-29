
#[test]
fn selected_coefficient_root_records_validate_source_guards_and_selection() {
    let root = |reference: u32, denominator: BivariatePolynomial, lower: Real, upper: Real| {
        let mut bytes = vec![28];
        bytes.extend_from_slice(&3_u32.to_be_bytes());
        for numerator in [polynomial(&[&[-2]]), polynomial(&[&[0]]), polynomial(&[&[1]])] {
            bytes.extend_from_slice(&reference.to_be_bytes());
            wire_polynomial(&mut bytes, &numerator);
            wire_polynomial(&mut bytes, &denominator);
        }
        wire_real(&mut bytes, &lower);
        wire_real(&mut bytes, &upper);
        bytes.push(0);
        bytes
    };
    for nodes in [
        vec![root(0, polynomial(&[&[1]]), 1.into(), 2.into())],
        vec![wire_parameter(0), root(0, polynomial(&[&[1]]), 1.into(), 2.into())],
        vec![root(1, polynomial(&[&[1]]), 1.into(), 2.into()), wire_point(0, 0)],
    ] {
        assert!(matches!(import_svg_document(&wire(nodes, &[])), Err(SvgError::MalformedInput(_))));
    }
    for (denominator, lower, upper) in [
        (polynomial(&[&[0]]), Real::one(), Real::from(2)),
        (polynomial(&[&[1]]), Real::from(2), Real::from(3)),
        (polynomial(&[&[1]]), Real::from(-2), Real::from(2)),
    ] {
        // Even unused definitions must be checked; invalid roots are not empty geometry.
        invalid(&wire(vec![wire_point(0, 0), root(0, denominator, lower, upper)], &[]));
    }
    let text = wire(vec![
        wire_point(0, 0), root(0, polynomial(&[&[1]]), 1.into(), 2.into()),
        wire_point(3, 0), wire_support(1, 2), wire_range(3, 1, 2),
    ], &[4]);
    let geometry = import_svg_document(&text).unwrap();
    let point = geometry.paths()[0].curves()[0].start();
    assert_eq!(point.rational_form(polynomial(&[&[-2], &[], &[1]]), polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
    assert_eq!(point.affine_form(1.into(), 0.into(), 0.into()).compare_to_real(&Real::zero()).unwrap(), Ordering::Greater);
}
