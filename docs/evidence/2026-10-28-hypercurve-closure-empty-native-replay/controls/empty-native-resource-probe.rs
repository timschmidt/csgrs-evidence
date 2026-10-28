
#[test]
fn exact_empty_native_chain_with_zero_instrumented_work_budget() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let attempt = hypercurve::evaluate_with_budget(policy, hypercurve::WorkBudget::ZERO, || {
            let mut region = CurveRegion2::empty();
            for distance in [0, 1, -1] {
                region = region.offset(Real::from(distance), &OffsetCornerStyle2::Round).unwrap();
            }
            region = region.transform_affine(&Real::one(), &Real::one(), &Real::zero(), &Real::one(), &Real::from(3), &Real::from(-2)).unwrap();
            let options = hypercurve::FiniteProjectionOptions::try_new(0.1).unwrap();
            assert!(region.project_to_finite_profiles(&options).unwrap().is_empty());
            assert!(region.project_to_finite_profiles_exact(&options).unwrap().is_empty());
            let text = export_svg_document(&SvgGeometry2::new(region.clone(), vec![], vec![])).unwrap();
            let restored = import_svg_document(&text).unwrap();
            assert!(restored.is_empty());
            for operation in [BooleanOp::Union, BooleanOp::Intersection, BooleanOp::Difference, BooleanOp::Xor] {
                region = region.boolean_region(restored.region(), operation).unwrap();
                assert!(region.is_empty());
            }
            assert_eq!(export_svg_document(&SvgGeometry2::new(region, vec![], vec![])).unwrap(), text);
        });
        eprintln!("empty chain policy {policy:?} usage {:?}", attempt.usage);
        assert_eq!(attempt.usage.refinements, 0);
        assert_eq!(attempt.usage.promotions, 0);
        assert_eq!(attempt.result.unwrap().certainty(), CurveCertainty::Certified);
    }
}
