
#[test]
fn query_parameter_over_original_fiber_survives_reexport() {
    let mut query = vec![27];
    query.extend_from_slice(&1_u32.to_be_bytes());
    wire_polynomial(&mut query, &polynomial(&[&[0, 1]]));
    wire_polynomial(&mut query, &polynomial(&[&[2]]));
    let mut curve = vec![0, 2];
    for coordinate in [Real::zero(), Real::zero(), q(1, 2), Real::zero(), Real::one(), Real::one()] {
        wire_real(&mut curve, coordinate);
    }
    let mut restriction = vec![4];
    for reference in [3_u32, 4, 2] {
        restriction.extend_from_slice(&reference.to_be_bytes());
    }
    restriction.push(0);
    let text = wire(vec![
        wire_parameter(2),
        wire_fiber(0, &polynomial(&[&[0, 0, 0, 1], &[-1]]), 1.into(), 2.into(), None),
        query, curve, wire_parameter(0), restriction,
    ], &[5]);
    let imported = import_svg_document(&text).expect("valid source query record imports");
    let endpoint = imported.paths()[0].end();
    assert_eq!(endpoint.rational_form(polynomial(&[&[0, -1], &[], &[1]]), polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
    assert_eq!(endpoint.rational_form(polynomial(&[&[0], &[], &[], &[4]]), polynomial(&[&[1]])).unwrap().compare_to_real(&Real::one()).unwrap(), Ordering::Equal);
    let saved = export_svg_document(&imported).expect("an admitted query parameter must remain exportable");
    let replay = import_svg_document(&saved).unwrap();
    assert!(replay.paths()[0].end().coincides_with(&endpoint).unwrap());
    let curve = &replay.paths()[0].curves()[0];
    let middle = curve.parameter_domain().end().affine_image(&q(1, 2), &Real::zero()).unwrap();
    let (first, second) = curve.split_at(middle).unwrap();
    assert!(first.end().coincides_with(&second.start()).unwrap());
}
