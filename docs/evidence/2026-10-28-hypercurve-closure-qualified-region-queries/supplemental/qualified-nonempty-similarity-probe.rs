
#[test]
fn qualified_nonempty_similarity_output_retains_source_topology_receipt() {
    let (_, collapsed) = positive_height_qualified_empty_region();
    let square = exact_square_region();
    let built = hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        collapsed.boolean_region(&square, hypercurve::BooleanOp::Union).unwrap()
    });
    assert_eq!(built.certainty(), CurveCertainty::Approximate512Consumed);
    let source = built.into_unverified();
    let transform = hypercurve::Similarity2::try_from_real_affine(
        Real::one(), Real::zero(), Real::zero(), Real::one(), Real::from(3), Real::from(-2),
    ).unwrap();
    let transformed = hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        source.transform_similarity(&transform).unwrap()
    });
    assert_eq!(transformed.certainty(), CurveCertainty::Approximate512Consumed);
    let transformed = transformed.into_unverified();
    drop(source);
    assert!(matches!(transformed.regularized_region(),
        Err(hypercurve::ExactCurveError::Blocked(reason))
            if reason.reason() == hypercurve::UncertaintyReason::Predicate),
        "A native nonempty similarity must retain the removed positive-height source cap, not certify only the reconstructed square");
    let readback = hypercurve::evaluate_under(PredicatePolicy::APPROXIMATE_512, || {
        transformed.classify_point(&point(8,3).into()).unwrap()
    });
    assert_eq!(readback.certainty(), CurveCertainty::Approximate512Consumed);
    assert_eq!(readback.into_unverified(), hypercurve::RegionPointLocation::Inside);
}
