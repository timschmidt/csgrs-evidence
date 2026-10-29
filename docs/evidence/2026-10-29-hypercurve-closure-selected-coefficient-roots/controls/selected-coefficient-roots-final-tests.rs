
#[test]
fn selected_coefficient_roots_survive_restriction_reversal_and_similarity() {
    let point = simple_root();
    let parameter = form(&point, x()).parameter().unwrap();
    let curve: Curve2 = RationalBezier2::try_new(
        vec![Point2::from_values(0, 0), Point2::new(q(1, 2), 0.into()), Point2::from_values(1, 1)],
        vec![Real::one(); 3],
    ).unwrap().into();
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let outcome = evaluate_under(policy, || {
            let evaluated = curve.point_at(&parameter).unwrap();
            zero(&evaluated, p(&[&[0, -1], &[], &[1]]));
            let restricted = curve.restrict_source(CurveParameterRange2::try_new(parameter.clone(), 1.into()).unwrap()).unwrap();
            assert!(restricted.start().coincides_with(&evaluated).unwrap());
            assert!(restricted.reversed().unwrap().end().coincides_with(&evaluated).unwrap());
            let transform = Similarity2::try_from_real_affine(0.into(), (-2).into(), 2.into(), 0.into(), 1.into(), 3.into()).unwrap();
            let moved = CurvePointDefinition2::Similarity { source: evaluated, transform }.into_point().unwrap();
            assert_eq!(moved.affine_form(0.into(), q(1, 2), q(-3, 2)).parameter().unwrap().compare(&parameter).unwrap(), Ordering::Equal);
            let replay = moved.definition().unwrap().into_point().unwrap();
            assert!(replay.coincides_with(&moved).unwrap());
            assert_eq!(replay.affine_form(0.into(), q(1, 2), q(-3, 2)).parameter().unwrap().affine_point(1.into(), 0.into(), 0.into(), 0.into()).unwrap().coincides_with(&point).unwrap(), true);
        });
        assert_eq!(outcome.certainty(), CurveCertainty::Certified);
    }
}
