
#[test]
fn native_arc_producers_preserve_nonconstant_tiny_circle_images() {
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
        for radius in [Real::one(),Real::from(2).powi_i64(-100).unwrap()] {
            let arc=CircularArc2::try_from_center(Point2::new(radius.clone(),Real::zero()),Point2::new(Real::zero(),radius),Point2::from_values(0,0),false).unwrap();
            let decomposition=arc.rational_bezier_decomposition().unwrap();
            for span in decomposition.spans() {
                let native=span.curve();
                assert!(native.retained_circular_conic().is_some());
                assert!(matches!(native.fit_exact_line_image_with_policy(&policy).unwrap(),Classification::Decided(BezierLineImageFitRelation::NotLine)));
                for degree in [2,3,5] {
                    let curve=RationalBezier2::from(native.clone()).elevated_to_degree(degree).unwrap();
                    assert!(matches!(fit(&curve,&policy),Classification::Decided(BezierLineImageFitRelation::NotLine)));
                    assert!(matches!(fit(&curve.reversed(),&policy),Classification::Decided(BezierLineImageFitRelation::NotLine)));
                }
            }
        }
    }
}

#[test]
fn unresolved_collapsed_circle_keeps_policy_qualification() {
    let zero=crate::test_support::terminally_unresolved_zero();
    let (implicit,circle)=unit_circle();
    // The angle-addition identity makes this exactly the point (1,0), but
    // its endpoint equality is deliberately beyond bounded normalization.
    let native=RationalQuadraticBezier2::try_new(Point2::from_values(1,0),Point2::from_values(1,0),Point2::new(Real::one()+zero,Real::zero()),Real::one(),Real::one(),Real::one()).unwrap().with_retained_conic_provenance(Some(implicit),Some(circle));
    let general=RationalBezier2::from(native.clone());
    for policy in [CurveContext::STRICT,CurveContext::APPROXIMATE_512,CurveContext::STRICT] {
        for general_form in [false,true] {
            let outcome=crate::evaluate_under(policy.predicate_policy(),|| {
                if general_form {general.fit_exact_line_image_with_policy(&policy)} else {native.fit_exact_line_image_with_policy(&policy)}
            });
            eprintln!("R28_TERMINAL general={general_form} policy={policy:?} certainty={:?} value={:?}",outcome.certainty(),outcome.as_unverified());
            if policy==CurveContext::STRICT {
                assert_eq!(outcome.certainty(),CurveCertainty::Certified);
                assert_eq!(outcome.certified().unwrap().unwrap(),Classification::Uncertain(UncertaintyReason::RealSign));
            } else {
                assert_eq!(outcome.certainty(),CurveCertainty::Approximate512Consumed);
                assert!(matches!(outcome.into_unverified().unwrap(),Classification::Decided(BezierLineImageFitRelation::NotLine)));
            }
        }
    }
}
