
fn rational_point_line_across_coarse_pole() -> hypercurve::CurvePath2 {
    // The selected beta lies above 4/5, but its authored isolator [3/4,1]
    // contains that pole. Refining the retained selection is sufficient;
    // the exact point itself has a nonzero original denominator.
    let start = center().rational_image(&RationalMap2::new([
        polynomial(&[&[1]]), polynomial(&[&[0,1]]),
    ],BivariatePolynomial::new(vec![vec![q(-4,5)],vec![1.into()]]))).unwrap();
    let end = translate(&start,Real::one(),Real::zero());
    hypercurve::CurvePath2::try_new(vec![hypercurve::Curve2::try_line(start,end).unwrap()]).unwrap()
}

#[test]
fn retained_rational_point_bounds_refine_original_pole_guards() {
    let path = rational_point_line_across_coarse_pole();
    let bounds = path.bounds().unwrap();
    let line = &path.curves()[0];
    for point in [line.start(),line.end()] {
        for (a,b,lo,hi) in [
            (Real::one(),Real::zero(),bounds.min_x(),bounds.max_x()),
            (Real::zero(),Real::one(),bounds.min_y(),bounds.max_y()),
        ] {
            let value=point.affine_form(a,b,Real::zero());
            assert_ne!(value.compare_to_real(lo).unwrap(),Ordering::Less);
            assert_ne!(value.compare_to_real(hi).unwrap(),Ordering::Greater);
        }
    }
    let text=angular_svg(path);
    assert_eq!(export_svg_document(&import_svg_document(&text).unwrap()).unwrap(),text);
}

#[test]
fn retained_point_bounds_retry_after_actual_exhaustion_without_cached_failure() {
    for _ in 0..2 {
        let path = rational_point_line_across_coarse_pole();
        let query=||path.bounds().cloned();
        let denied=hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO,query);
        let reached=denied.result.unwrap_err();
        assert_eq!((reached.limit,reached.used),(0,0));
        assert!(reached.requested>0);
        let retry=hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget{refinements:4096,promotions:0},query);
        let bounds=retry.result.unwrap().unwrap();
        assert_eq!(retry.usage.promotions,0);
        let warm=hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO,query);
        assert_eq!(warm.result.unwrap().unwrap(),bounds);
        assert_eq!((warm.usage.refinements,warm.usage.promotions),(0,0));
    }
}
