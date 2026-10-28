
#[test]
fn csgrs_empty_membership_preserves_inherited_topology_receipt() {
    let (height, region) = positive_height_qualified_empty_region();
    let y = (height / Real::from(4)).unwrap();
    for context in [csgrs::GeometryContext::STRICT, csgrs::GeometryContext::APPROXIMATE_512, csgrs::GeometryContext::STRICT] {
        let result = csgrs::curve::contains_xy_with_context(&region, Real::one(), y.clone(), &context);
        if context == csgrs::GeometryContext::STRICT {
            let error = result.expect_err("the original cap contains this point; qualified emptiness cannot certify Outside");
            assert_eq!(error.kind(), csgrs::errors::ValidationErrorKind::Undecided);
            assert!(matches!(error, csgrs::errors::ValidationError::ExactCurve(hypercurve::ExactCurveError::Blocked(reason)) if reason.reason()==hypercurve::UncertaintyReason::Predicate));
        } else {
            let outcome = result.unwrap();
            assert_eq!(outcome.value, Some(false));
            assert_eq!(outcome.certainty, csgrs::GeometryCertainty::Approximate512Consumed);
        }
    }
    let error = csgrs::curve::contains_xy(&region, Real::one(), y).unwrap_err();
    assert_eq!(error.kind(), csgrs::errors::ValidationErrorKind::Undecided);
}

#[test]
fn csgrs_empty_bounds_preserve_inherited_topology_receipt() {
    let (_, region) = positive_height_qualified_empty_region();
    for context in [csgrs::GeometryContext::STRICT, csgrs::GeometryContext::APPROXIMATE_512, csgrs::GeometryContext::STRICT] {
        let result = csgrs::curve::try_bounding_box_with_context(&region, &context);
        if context == csgrs::GeometryContext::STRICT {
            assert_eq!(result.unwrap_err().kind(), csgrs::errors::ValidationErrorKind::Undecided);
        } else {
            let outcome = result.unwrap();
            assert!(outcome.value.is_none());
            assert_eq!(outcome.certainty, csgrs::GeometryCertainty::Approximate512Consumed);
        }
    }
}
