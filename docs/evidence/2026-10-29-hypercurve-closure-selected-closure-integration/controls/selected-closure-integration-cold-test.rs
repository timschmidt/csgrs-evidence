
#[cfg(feature = "svg")]
#[test]
fn integration_dependent_fiber_derivative_replays_cold_and_feeds_geometry() {
    const INPUT: &str = "HYPERCURVE_INTEGRATED_FIBER_DERIVATIVE_REPLAY";
    fn rational() -> Curve2 {
        RationalBezier2::try_new(
            vec![Point2::from_values(0, 0), Point2::new(q(1, 2), 0.into()), Point2::from_values(1, 1)],
            vec![Real::one(); 3],
        ).unwrap().into()
    }
    fn verify(text: &str) {
        let geometry = import_svg_document(text).unwrap();
        let first = geometry.paths()[0].curves()[0].start();
        assert_eq!(form(&first, x()).compare_to_real(&Real::one()).unwrap(), Ordering::Equal);
        assert_eq!(form(&first, y()).compare_to_real(&Real::zero()).unwrap(), Ordering::Greater);
        // 2048 v^6=1, t^2=v and dy=2t imply dy^12=2.
        let mut coefficients = vec![Real::zero(); 13];
        coefficients[0] = (-2).into();
        coefficients[12] = 1.into();
        zero(&first, BivariatePolynomial::new(vec![coefficients]));
        let parameter = form(&first, y()).scaled(&q(1, 2)).unwrap().parameter().unwrap();
        let next = curves(p(&[&[0, 1], &[], &[-1]])).curves()[0].point_at(&parameter).unwrap();
        zero(&next, p(&[&[0, 1], &[], &[-1]]));
        zero(&next, p(&[&[-1, 0, 0, 0, 0, 0, 2048]]));
        let derivative = rational().derivative_at(&parameter).unwrap().coordinate_image().unwrap();
        assert!(derivative.coincides_with(&first).unwrap());
        assert_eq!(export_svg_document(&geometry).unwrap(), text);
    }
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let point = integration_dependent_fiber();
    let parameter = form(&point, y()).parameter().unwrap();
    let first = rational().derivative_at(&parameter).unwrap().coordinate_image().unwrap();
    let end = first.rational_image(&RationalMap2::new(
        [p(&[&[1], &[1]]), y()], p(&[&[1]]),
    )).unwrap();
    let curve = Curve2::try_line(first, end).unwrap();
    let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![curve]).unwrap()]);
    let text = export_svg_document(&geometry).unwrap();
    verify(&text);
    let path = std::env::temp_dir().join(format!("hypercurve-integrated-fiber-derivative-{}.svg", std::process::id()));
    std::fs::write(&path, &text).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap())
        .args(["--exact", "integration_dependent_fiber_derivative_replays_cold_and_feeds_geometry", "--nocapture"])
        .env(INPUT, &path).output().unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}
