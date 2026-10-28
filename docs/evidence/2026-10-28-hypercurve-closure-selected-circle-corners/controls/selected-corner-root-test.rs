
#[test]
fn svg_adapter_consumes_generated_selected_circle_fillet_and_offsets() {
    use hypercurve::{
        BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
        BezierParameterPolynomial, CurvePointDefinition2, RationalMap2, Curve2, CurveCornerMode2, CurveFillet2, CurveFilletContact2,
    };
    use hypersolve::{BivariatePolynomial, IsolatedRootInterval};
    let q = |n: i32, d: i32| (Real::from(n) / Real::from(d)).unwrap();
    let center = CurvePointDefinition2::PolynomialFiber {
        equation: BivariatePolynomial::new(vec![
            vec![Real::from(-2), Real::zero(), Real::zero(), Real::zero(), Real::zero(), Real::one()],
            vec![Real::one()],
        ]),
        parameter: BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(vec![
                Real::from(-1), Real::zero(), Real::zero(), Real::zero(), Real::zero(), Real::zero(), Real::zero(), Real::from(2),
            ]).unwrap(),
            BezierParameterInterval::try_new(q(3, 4), Real::one()).unwrap(),
        ).unwrap()),
        root: IsolatedRootInterval {
            lower: Real::one(), upper: Real::from(2), exact_root: None, distinct_root_count: 1,
        },
    }.into_point().unwrap();
    let at = |x: Real, y: Real| center.rational_image(&RationalMap2::new([
        BivariatePolynomial::new(vec![vec![x], vec![Real::one()]]),
        BivariatePolynomial::new(vec![vec![y, Real::one()]]),
    ], BivariatePolynomial::new(vec![vec![Real::one()]]))).unwrap();
    // Original half disk: N=(-4/5,3/5), T=(3/5,4/5). Radius 1/4
    // fillet at C-N has M=C-sN+T/4, s=sqrt(1/2), and these contacts.
    let s = q(1, 2).sqrt().unwrap();
    let previous = at(&s*q(16, 15)+q(1, 5), &s*q(-4, 5)+q(4, 15));
    let next = at(&s*q(4, 5), &s*q(-3, 5));
    let fixture = include_str!("fixtures/selected_circle_source.svg");
    let (empty, wires, paths) = import_svg(fixture).unwrap();
    assert!(empty.is_empty() && wires.is_empty());
    assert_eq!(paths.len(), 1);
    assert_eq!(paths[0].curves().len(), 1);
    let arc = paths[0].curves()[0].clone();
    let diameter = Curve2::try_line(arc.end(), arc.start()).unwrap();
    let source = CurvePath2::try_new(vec![arc, diameter]).unwrap();
    let request = CurveFillet2 {
        radius: q(1, 4),
        center: Some(at(&s*q(4, 5)+q(3, 20), &s*q(-3, 5)+q(1, 5))),
        contacts: [Some(CurveFilletContact2::Point(previous.clone())), Some(CurveFilletContact2::Point(next.clone()))],
    };
    let solutions = source.fillet_vertex(1, &request, CurveCornerMode2::TrimOnly).unwrap();
    assert_eq!(solutions.candidate_count(), 1);
    let region = CurveRegion2::try_from_boundary_paths(&solutions.into_solutions(), FillRule::NonZero).unwrap();
    assert_eq!(region.loop_role_counts().unwrap(), (1, 0));
    assert_eq!(region.boundary_paths().unwrap()[0].curves().len(), 3);
    for (point, expected) in [
        (previous, RegionPointLocation::Boundary),
        (next, RegionPointLocation::Boundary),
        (at(q(4, 5), q(-3, 5)), RegionPointLocation::Outside),
        (at(q(3, 20), q(1, 5)), RegionPointLocation::Inside),
    ] {
        assert_eq!(region.classify_point(&point).unwrap(), expected);
    }
    let text = export_svg(&region, &[], &[]).unwrap();
    let (replay, wires, paths) = import_svg(&text).unwrap();
    assert!(wires.is_empty() && paths.is_empty());
    assert_eq!(export_svg(&replay, &wires, &paths).unwrap(), text);
    assert!(replay.boolean_region(&region, BooleanOp::Xor).unwrap().is_empty());
    let grown = replay.offset(q(1, 16), &OffsetCornerStyle2::Round).unwrap();
    let restored = grown.offset(q(-1, 16), &OffsetCornerStyle2::Round).unwrap();
    assert!(restored.boolean_region(&region, BooleanOp::Xor).unwrap().is_empty());
}
