use hypercurve::{
    Aabb2, Axis2, BoxBoundary2, Curve2, CurveBoxContainment2, CurveCertainty, CurveParameter2,
    CurvePath2, CurvePoint2, Point2, PredicatePolicy, RationalBezier2, Real, evaluate_under,
};

fn ratio(n: i64, d: i64) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

#[test]
fn rational_cubic_containment_matches_its_exact_peak() {
    let source = Curve2::from(
        RationalBezier2::try_new(
            [(0, 0), (1, 3), (2, 3), (3, 0)]
                .map(|(x, y)| Point2::new(x.into(), y.into()))
                .to_vec(),
            [1, 2, 2, 1].map(Real::from).to_vec(),
        )
        .unwrap(),
    );
    let peak = Point2::new(ratio(3, 2), ratio(18, 7));
    assert!(
        source
            .point_at(&CurveParameter2::from(ratio(1, 2)))
            .unwrap()
            .coincides_with(&CurvePoint2::from(peak.clone()))
            .unwrap()
    );
    let (left_half, right_half) = source.split_at(ratio(1, 2).into()).unwrap();
    let (left_third, right_third) = source.split_at(ratio(1, 3).into()).unwrap();
    let original = CurvePath2::try_new(vec![source.clone()]).unwrap();
    let reversed = original.reversed().unwrap();
    let paths = [
        ("native", original),
        ("reversed", reversed),
        (
            "halves",
            CurvePath2::try_new(vec![left_half, right_half]).unwrap(),
        ),
        (
            "thirds",
            CurvePath2::try_new(vec![left_third, right_third]).unwrap(),
        ),
    ];
    drop(source);
    let tiny = Real::from(2).powi_i64(-200).unwrap();
    let bounds = [
        ("loose", ratio(14, 5), true),
        ("tangent", ratio(18, 7), true),
        ("above", ratio(18, 7) + &tiny, true),
        ("below", ratio(18, 7) - &tiny, false),
        ("outside", Real::from(2), false),
    ];
    let mut correct = 0;
    let mut total = 0;
    for (path_name, path) in paths {
        for (bound_name, max_y, contained) in &bounds {
            let envelope = Aabb2::new_unchecked(
                Point2::new((-10).into(), (-10).into()),
                Point2::new(10.into(), max_y.clone()),
            );
            for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
                total += 1;
                let outcome = evaluate_under(policy, || path.box_containment(&envelope));
                assert_eq!(outcome.certainty(), CurveCertainty::Certified);
                match outcome.into_unverified() {
                    Ok(CurveBoxContainment2::Contained) => {
                        assert!(*contained, "false containment at {path_name}/{bound_name}");
                        correct += 1;
                        println!("R23 {path_name} {bound_name} {policy:?} Contained");
                    }
                    Ok(CurveBoxContainment2::Escapes(witness)) => {
                        assert!(!*contained, "false escape at {path_name}/{bound_name}");
                        assert_eq!(
                            (witness.axis(), witness.boundary()),
                            (Axis2::Y, BoxBoundary2::Maximum)
                        );
                        // A split endpoint may be the first escaping member.
                        // The contract does not require the global maximum.
                        let independent_candidates =
                            [peak.clone(), Point2::new(ratio(17, 15), ratio(12, 5))];
                        assert!(independent_candidates.iter().any(|expected| {
                            witness
                                .point()
                                .coincides_with(&CurvePoint2::from(expected.clone()))
                                .unwrap()
                        }));
                        assert_eq!(
                            witness
                                .point()
                                .compare_coordinate(
                                    &CurvePoint2::from(Point2::new(Real::zero(), max_y.clone())),
                                    Axis2::Y,
                                )
                                .unwrap(),
                            std::cmp::Ordering::Greater
                        );
                        correct += 1;
                        println!("R23 {path_name} {bound_name} {policy:?} Escapes exact member");
                    }
                    Err(error) => println!("R23 {path_name} {bound_name} {policy:?} {error:?}"),
                }
            }
        }
    }
    assert_eq!(
        correct, total,
        "every form must decide its exact image; correct={correct}, total={total}"
    );
}
