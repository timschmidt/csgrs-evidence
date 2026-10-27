from pathlib import Path
root=Path(__file__).resolve().parent
checkout=Path('/tmp/hypercurve-closure-selected-circle-points')
tests=r'''

#[test]
fn selected_circle_point_derivative_keeps_joint_field_and_exact_magnitude() {
    use hypersolve::bivariate_arithmetic::bivariate_multiply;
    let path = circle_path();
    let curve = &path.curves()[0];
    let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
    let parameter = angular_location(curve, &point);
    let denominator = polynomial(&[&[1], &[-2], &[2]]);
    // Differentiate the rational circle chart while holding its center fixed.
    // n'=-4u(1-u)/D^2, b'=2(1-2u)/D^2, N=(-4/5,3/5), T=(3/5,4/5).
    let expected = center().rational_image(&RationalMap2::new([
        BivariatePolynomial::new(vec![vec![q(6,5)],vec![q(4,5)],vec![q(-16,5)]]),
        BivariatePolynomial::new(vec![vec![q(8,5)],vec![q(-28,5)],vec![q(12,5)]]),
    ], bivariate_multiply(&denominator,&denominator))).unwrap();
    let derivative = curve.derivative_at(&parameter).unwrap();
    assert!(derivative.coordinate_image().unwrap().coincides_with(&expected).unwrap());
}

#[test]
fn selected_circle_cuts_enter_region_and_repeated_round_offsets() {
    use hypercurve::{BooleanOp,CurvePath2,FillRule,OffsetCornerStyle2,RegionPointLocation};
    let path = circle_path();
    let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
    let curve = &path.curves()[0];
    let (first,second) = curve.split_at(angular_location(curve,&point)).unwrap();
    let complement = circle_path_in_frame(1,false);
    let full = CurvePath2::try_new(vec![first,second,complement.curves()[0].reversed().unwrap()]).unwrap();
    let text = angular_svg(full);
    let replay = import_svg_document(&text).unwrap();
    eprintln!("exact split, complement, and replay completed");
    let region = CurveRegion2::try_from_boundary_paths(replay.paths(),FillRule::NonZero).unwrap();
    assert_eq!(region.loop_role_counts().unwrap(),(1,0));
    assert_eq!(region.classify_point(&center()).unwrap(),RegionPointLocation::Inside);
    assert_eq!(region.classify_point(&point).unwrap(),RegionPointLocation::Boundary);
    eprintln!("region admission and independent interior/boundary completed");
    let union = region.boolean_region(&CurveRegion2::empty(),BooleanOp::Union).unwrap();
    let grown = union.offset(q(1,4),&OffsetCornerStyle2::Round).unwrap();
    assert_eq!(grown.classify_point(&translate(&center(),q(3,4),1.into())).unwrap(),RegionPointLocation::Boundary);
    let restored = grown.offset(q(-1,4),&OffsetCornerStyle2::Round).unwrap();
    assert!(restored.boolean_region(&region,BooleanOp::Xor).unwrap().is_empty());
    assert_eq!(restored.classify_point(&point).unwrap(),RegionPointLocation::Boundary);
}
'''
p=root/'selected-circle-points-next-consumers.rs';assert not p.exists();p.write_text((checkout/'crates/hypercurve/tests/fiber_point_incidence.rs').read_text()+tests)
print(p)
