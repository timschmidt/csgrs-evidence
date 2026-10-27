
#[cfg(all(test, feature = "svg"))]
mod tests {
    use super::*;

    fn q(n: i32, d: i32) -> Real {
        (Real::from(n) / Real::from(d)).unwrap()
    }

    fn selected_center_and_point() -> (CurvePoint2, CurvePoint2) {
        let mut coefficients = vec![Real::zero(); 8];
        coefficients[0] = (-1).into();
        coefficients[7] = 2.into();
        let center = crate::CurvePointDefinition2::PolynomialFiber {
            equation: BivariatePolynomial::new(vec![vec![(-2).into(), 0.into(), 0.into(), 0.into(), 0.into(), 1.into()], vec![1.into()]]),
            parameter: BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
                crate::BezierParameterPolynomial::try_new_power_basis(coefficients).unwrap(),
                BezierParameterInterval::try_new(q(3, 4), Real::one()).unwrap(),
            ).unwrap()),
            root: hypersolve::IsolatedRootInterval {lower: 1.into(), upper: 2.into(), exact_root: None, distinct_root_count: 1},
        }.into_point().unwrap();
        let point = center.rational_image(&crate::RationalMap2::new([
            BivariatePolynomial::new(vec![vec![q(-4, 5)], vec![q(19, 5)], vec![q(-16, 5)], vec![2.into()]]),
            BivariatePolynomial::new(vec![vec![q(3, 5), 1.into()], vec![q(2, 5), (-2).into()], vec![q(-8, 5), 2.into()]]),
        ], BivariatePolynomial::new(vec![vec![1.into()], vec![(-2).into()], vec![2.into()]]))).unwrap();
        (center, point)
    }

    fn circle(center: CurvePoint2, policy: &CurveContext) -> BezierAlgebraicCuspSemicircle2 {
        let Classification::Decided(chord) = BezierAlgebraicChord2::try_new(
            Point2::from_values(0, 0).into(), Point2::from_values(3, 4).into(), policy,
        ).unwrap() else {panic!("nonzero exact anchor")};
        let Classification::Decided(Some(circle)) = BezierAlgebraicCuspSemicircle2::from_retained_center_and_chord_normal(center, chord, Real::one(), true, policy).unwrap() else {panic!("nonzero circle")};
        circle
    }

    #[test]
    fn selected_point_angular_authority_keeps_inherited_frame_policy() {
        let (center, point) = selected_center_and_point();
        let qualified = crate::policy::resolve_certified_operation(&CurveContext::APPROXIMATE_512, |policy| {
            policy.observe_approximate_512();
            Ok::<_, CurveError>(circle(center.clone(), policy))
        }).unwrap().into_value();
        let parameter = crate::policy::resolve_certified_operation(&CurveContext::APPROXIMATE_512, |policy| {
            qualified.parameter_at_certified_incident_point(&point, policy)
        }).unwrap().into_value();
        let Classification::Decided(parameter) = parameter else {panic!("retained exact point")};
        let parameter = parameter.as_algebraic_cusp().unwrap();
        assert!(parameter.validate_policy(&CurveContext::STRICT).is_err());
        assert!(qualified.native_parameter_definition(parameter).is_none());
        let strict = circle(center.clone(), &CurveContext::STRICT);
        let Classification::Decided(parameter) = strict.parameter_at_certified_incident_point(&point, &CurveContext::APPROXIMATE_512).unwrap() else {panic!("strict dependencies")};
        parameter.as_algebraic_cusp().unwrap().validate_policy(&CurveContext::STRICT).unwrap();
    }

    #[test]
    fn selected_point_angular_replay_checks_incidence_half_and_point_policy() {
        let (center, point) = selected_center_and_point();
        let strict = circle(center.clone(), &CurveContext::STRICT);
        let Classification::Decided(parameter) = strict.replay_parameter_definition(
            CircleParameterDefinition2::IncidentPoint(point.clone()), &CurveContext::STRICT,
        ).unwrap() else {panic!("checked angular point")};
        assert!(matches!(parameter, BezierAlgebraicCuspSemicircleParameter2::Mapped(ref data) if matches!(data.as_ref(), BezierAlgebraicCuspSemicircleMappedParameterData2::IncidentPoint { .. })));
        assert!(matches!(strict.replay_parameter_definition(CircleParameterDefinition2::IncidentPoint(center.clone()), &CurveContext::STRICT), Err(CurveError::InvalidCurveParameter)));
        assert!(matches!(strict.complementary_half().replay_parameter_definition(CircleParameterDefinition2::IncidentPoint(point.clone()), &CurveContext::STRICT), Err(CurveError::InvalidBezierRange)));
        let qualified = crate::policy::resolve_certified_operation(&CurveContext::APPROXIMATE_512, |policy| {
            policy.observe_approximate_512();
            Ok::<_, CurveError>(CurvePoint2::from(BezierSimilarityPoint2::new(point.clone(), Similarity2::identity(), policy)))
        }).unwrap().into_value();
        assert!(matches!(strict.selected_incident_point_parameter(&qualified, &center, (&q(-4, 5), &q(3, 5)), &CurveContext::APPROXIMATE_512).unwrap(), Classification::Uncertain(UncertaintyReason::Unsupported)));
    }
}
