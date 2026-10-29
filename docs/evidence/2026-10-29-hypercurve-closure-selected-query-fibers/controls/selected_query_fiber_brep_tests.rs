
#[test]
fn dependent_polynomial_fiber_replays_in_a_fresh_process_and_feeds_geometry() {
    const INPUT: &str = "HYPERBREP_DEPENDENT_POLYNOMIAL_FIBER_REPLAY";
    fn verify(text: &str) {
        let model = replay(text);
        let curve = model.pcurves().next().unwrap().curve().clone();
        let point = curve.start();
        for equation in [polynomial(&[&[-2], &[], &[], &[1]]), polynomial(&[&[0, 0, 1], &[-1]])] {
            assert_eq!(point.rational_form(equation, polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
        }
        assert_eq!(point.affine_form(0.into(), 1.into(), 0.into()).compare_to_real(&Real::one()).unwrap(), Ordering::Greater);
        let root = point.rational_form(polynomial(&[&[0, 1]]), polynomial(&[&[1]])).unwrap().parameter().unwrap();
        let next = root.affine_point(2.into(), 1.into(), 3.into(), (-1).into()).unwrap();
        assert_eq!(next.rational_form(polynomial(&[&[-5, -2], &[3]]), polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
        assert_eq!(model.to_json().unwrap(), text);
    }
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let parameter = fiber(2).rational_form(polynomial(&[&[0, 1]]), polynomial(&[&[1]])).unwrap().parameter().unwrap();
    let point = CurvePointDefinition2::PolynomialFiber {
        equation: polynomial(&[&[0, 0, 1], &[-1]]), parameter,
        root: IsolatedRootInterval { lower: 1.into(), upper: 2.into(), exact_root: None, distinct_root_count: 1 },
    }.into_point().unwrap();
    let end = point.rational_image(&RationalMap2::new([polynomial(&[&[1], &[1]]), polynomial(&[&[0, 1]])], polynomial(&[&[1]]))).unwrap();
    let mut builder = ModelBuilder::new();
    builder.pcurve(Pcurve::new(Curve2::try_line(point, end).unwrap())).unwrap();
    let text = builder.finish().unwrap().to_json().unwrap();
    verify(&text);
    let path = std::env::temp_dir().join(format!("hyperbrep-dependent-fiber-{}.json", std::process::id()));
    std::fs::write(&path, &text).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap()).args([
        "--exact", "dependent_polynomial_fiber_replays_in_a_fresh_process_and_feeds_geometry", "--nocapture",
    ]).env(INPUT, &path).output().unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}
