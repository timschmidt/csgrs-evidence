
#[test]
fn csgrs_region_query_controls_preserve_exact_and_inherited_certainty() {
    let square = exact_square_region();
    for region in [CurveRegion2::empty(), square.clone()] {
        let expected = Some(!region.is_empty());
        for context in [csgrs::GeometryContext::STRICT, csgrs::GeometryContext::APPROXIMATE_512, csgrs::GeometryContext::STRICT] {
            let query = csgrs::curve::contains_xy_with_context(&region, 5.into(), 5.into(), &context).unwrap();
            assert_eq!(query.value, expected);
            assert_eq!(query.certainty, csgrs::GeometryCertainty::Certified);
            assert_eq!(csgrs::curve::contains_xy(&region, 5.into(), 5.into()).unwrap(), expected);
            let bounds = csgrs::curve::try_bounding_box_with_context(&region, &context).unwrap();
            assert_eq!(bounds.value.is_none(), region.is_empty());
            assert_eq!(bounds.certainty, csgrs::GeometryCertainty::Certified);
        }
    }
    let (_, collapsed) = positive_height_qualified_empty_region();
    let constructed = hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        collapsed.boolean_region(&square, hypercurve::BooleanOp::Union).unwrap()
    });
    assert_eq!(constructed.certainty(), CurveCertainty::Approximate512Consumed);
    let region = constructed.into_unverified();
    for context in [csgrs::GeometryContext::STRICT, csgrs::GeometryContext::APPROXIMATE_512, csgrs::GeometryContext::STRICT] {
        let query = csgrs::curve::contains_xy_with_context(&region, 5.into(), 5.into(), &context);
        let bounds = csgrs::curve::try_bounding_box_with_context(&region, &context);
        if context == csgrs::GeometryContext::STRICT {
            assert_eq!(query.unwrap_err().kind(), csgrs::errors::ValidationErrorKind::Undecided);
            assert_eq!(bounds.unwrap_err().kind(), csgrs::errors::ValidationErrorKind::Undecided);
        } else {
            let query = query.unwrap();
            assert_eq!(query.value, Some(true));
            assert_eq!(query.certainty, csgrs::GeometryCertainty::Approximate512Consumed);
            let bounds = bounds.unwrap();
            assert_eq!(bounds.certainty, csgrs::GeometryCertainty::Approximate512Consumed);
            let bounds = bounds.value.unwrap();
            assert_eq!([bounds.mins.x, bounds.mins.y, bounds.maxs.x, bounds.maxs.y], [4.into(), 4.into(), 6.into(), 6.into()]);
        }
        assert_eq!(csgrs::curve::contains_xy(&square, 5.into(), 5.into()).unwrap(), Some(true));
    }
}
