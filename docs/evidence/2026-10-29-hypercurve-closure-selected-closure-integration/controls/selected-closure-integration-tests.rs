
fn integration_dependent_fiber() -> CurvePoint2 {
    let parameter = form(&source(), y()).parameter().unwrap();
    curves(p(&[&[0, 0, 1], &[-1]])).curves()[1]
        .point_at(&parameter)
        .unwrap()
}

#[test]
fn integration_dependent_fiber_source_control() {
    let point = integration_dependent_fiber();
    zero(&point, p(&[&[0, 0, 1], &[-1]]));
    zero(&point, p(&[&[-1], &[], &[], &[], &[], &[], &[2048]]));
    assert_eq!(
        form(&point, y()).compare_to_real(&Real::zero()).unwrap(),
        Ordering::Greater,
    );
}

#[test]
fn integration_dependent_fiber_feeds_derivatives_and_another_polynomial() {
    let point = integration_dependent_fiber();
    let parameter = form(&point, y()).parameter().unwrap();
    let rational: Curve2 = RationalBezier2::try_new(
        vec![
            Point2::from_values(0, 0),
            Point2::new(q(1, 2), 0.into()),
            Point2::from_values(1, 1),
        ],
        vec![Real::one(); 3],
    )
    .unwrap()
    .into();
    // C(t)=(t,t^2), so the independent derivative is (1,2t).
    let jet = rational
        .derivatives_at(&parameter, 3)
        .expect("a generated dependent fiber must feed the next derivative operation");
    assert_eq!(jet.len(), 3);
    let first = jet[0].coordinate_image().unwrap();
    assert_eq!(form(&first, x()).compare_to_real(&Real::one()).unwrap(), Ordering::Equal);
    assert_eq!(
        form(&first, y()).scaled(&q(1, 2)).unwrap().compare(&form(&point, y())).unwrap(),
        Ordering::Equal,
    );
    for (vector, expected) in [(&jet[1], Point2::from_values(0, 2)), (&jet[2], Point2::from_values(0, 0))] {
        assert!(vector.coordinate_image().unwrap().coincides_with(&expected.into()).unwrap());
    }
    let replay = first.definition().unwrap().into_point().unwrap();
    let next_parameter = form(&replay, y()).scaled(&q(1, 2)).unwrap().parameter().unwrap();
    let next = curves(p(&[&[0, 1], &[], &[-1]])).curves()[0].point_at(&next_parameter).unwrap();
    // The next graph squares the derivative's retained t and recovers v.
    assert_eq!(form(&next, y()).compare(&form(&point, x())).unwrap(), Ordering::Equal);
    zero(&next, p(&[&[0, 1], &[], &[-1]]));
}

#[test]
fn integration_dependent_fiber_quotient_replay_retains_the_original_pole() {
    let point = integration_dependent_fiber();
    let first = point.rational_form(p(&[&[1]]), p(&[&[1, 1]])).unwrap();
    let second = point.rational_form(p(&[&[1]]), p(&[&[-1, 0, 1]])).unwrap();
    let quotient = first.divide(&second).unwrap();
    assert_eq!(quotient.compare(&form(&point, p(&[&[-1, 1]]))).unwrap(), Ordering::Equal);
    let recipe = quotient.parameter().unwrap().rational_form_source().unwrap();
    // The reduced value y-1 is finite at y=1, but the original divisor is
    // undefined there. Rebinding the exact recipe must retain that exclusion.
    let pole = curves(p(&[&[0, 0, 1], &[-1]])).curves()[1]
        .point_at(&Real::one().into())
        .unwrap();
    zero(&pole, p(&[&[-1, 0, 1]]));
    let rebound = CurvePointDefinition2::RationalQueryPair {
        sources: [pole, Point2::from_values(0, 0).into()],
        numerators: [recipe.numerator().clone(), p(&[&[0]])],
        denominators: [recipe.denominator().clone(), p(&[&[1]])],
    }
    .into_point();
    assert!(
        matches!(rebound, Err(ExactCurveError::Invalid { cause: CurveError::ZeroRationalPointDenominator, .. })),
        "the original divisor pole must survive generated-fiber composition: {rebound:?}",
    );
}
