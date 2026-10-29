
fn polynomial_chamfer_circle_sections(source: CurveRegion2, center: Point2) {
    let paths = source.boundary_paths().unwrap();
    let branch = &paths[0].curves()[0];
    assert!(branch.polynomial_branch().is_some());
    assert!(branch.end().coincides_with(&center.clone().into()).unwrap());
    eprintln!("native endpoint coordinate view: {}", branch.end().coordinates().is_some());
    let radius = q(1, 64);
    let right = Point2::new(center.x() + &radius, center.y().clone());
    let left = Point2::new(center.x() - &radius, center.y().clone());
    let residual = BivariatePolynomial::new(vec![
        vec![center.x() * center.x() + center.y() * center.y() - &radius * &radius,
             Real::from(-2) * center.y(), Real::one()],
        vec![Real::from(-2) * center.x()], vec![Real::one()],
    ]);
    let mut cuts = Vec::new();
    for (start, end) in [(right.clone(), left.clone()), (left, right)] {
        let circle = Curve2::from(hypercurve::CircularArc2::try_from_center(
            start, end, center.clone(), false,
        ).unwrap());
        let section = branch.intersect_curve(&circle).unwrap();
        assert!(section.overlaps().is_empty());
        for contact in section.contacts() {
            let point = contact.point();
            assert_eq!(point.rational_form(
                residual.clone(), BivariatePolynomial::new(vec![vec![Real::one()]]),
            ).unwrap().compare_to_real(&Real::zero()).unwrap(), std::cmp::Ordering::Equal);
            assert_eq!(contact.first().local_parameter().compare(branch.parameter_domain().start()).unwrap(), std::cmp::Ordering::Greater);
            assert_eq!(contact.first().local_parameter().compare(branch.parameter_domain().end()).unwrap(), std::cmp::Ordering::Less);
            cuts.push(point.clone());
        }
    }
    assert_eq!(cuts.len(), 1, "the entire source branch has one interior chord-setback cut");
}

#[test]
fn polynomial_chamfer_parabola_circle_section_control() {
    polynomial_chamfer_circle_sections(parabola_region(), Point2::new(q(1, 4), q(-1, 2)));
}

#[test]
fn polynomial_chamfer_elliptic_circle_section_control() {
    polynomial_chamfer_circle_sections(elliptic_operation_frontier_region(), Point2::new(0.into(), (-1).into()));
}
