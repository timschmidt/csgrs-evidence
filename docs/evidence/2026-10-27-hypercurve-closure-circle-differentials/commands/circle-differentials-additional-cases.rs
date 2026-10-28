
// Independent closed form: z=(1-u+iu)/(1-u-iu), so for k>=1,
// z^(k)=2i*k!*(1+i)^(k-1)/(1-(1+i)u)^(k+1).
// Rationalizing this expression supplies all orders without the evaluator's
// Leibniz recurrence or differentiation of a reduced selected-field value.
fn circle_derivative_expectation(order: usize, radius: i32, clockwise: bool,
    scale: Real, shift: Real) -> RationalMap2 {
    use hypersolve::bivariate_arithmetic::{bivariate_add as add,
        bivariate_multiply as mul, bivariate_subtract as sub, bivariate_scale as times};
    let u = BivariatePolynomial::new(vec![vec![shift], vec![scale]]);
    let a = sub(&polynomial(&[&[1]]), &u);
    let d = add(&mul(&a, &a), &mul(&u, &u));
    let complex_product = |left: &[BivariatePolynomial; 2], right: &[BivariatePolynomial; 2]| {
        [sub(&mul(&left[0], &right[0]), &mul(&left[1], &right[1])),
         add(&mul(&left[0], &right[1]), &mul(&left[1], &right[0]))]
    };
    let mut constant = [polynomial(&[&[0]]), polynomial(&[&[2]])];
    for k in 1..=order {
        if k > 1 {
            constant = complex_product(&constant, &[polynomial(&[&[1]]), polynomial(&[&[1]])]);
        }
        constant = constant.map(|value| times(value, &Real::from(u128::try_from(k).unwrap())));
    }
    let mut numerator = constant;
    let mut denominator = polynomial(&[&[1]]);
    for _ in 0..=order {
        numerator = complex_product(&numerator, &[a.clone(), u.clone()]);
        denominator = mul(&denominator, &d);
    }
    let direction = if clockwise { radius } else { -radius };
    RationalMap2::new([
        add(&times(numerator[0].clone(), &q(-4 * radius, 5)),
            &times(numerator[1].clone(), &q(3 * direction, 5))),
        add(&times(numerator[0].clone(), &q(3 * radius, 5)),
            &times(numerator[1].clone(), &q(4 * direction, 5))),
    ], denominator)
}

#[test]
fn selected_circle_derivatives_match_independent_complex_formula() {
    for (radius, clockwise) in [(1, true), (-2, false)] {
        let path = circle_path_in_frame(radius, clockwise);
        let point = algebraic_angular_point(radius, clockwise, q(1, 2), q(1, 4));
        let parameter = angular_location(&path.curves()[0], &point);
        let derivatives = path.curves()[0].derivatives_at(&parameter, 3).unwrap();
        assert_eq!(derivatives.len(), 3);
        for (index, derivative) in derivatives.iter().enumerate() {
            let expected = center().rational_image(&circle_derivative_expectation(
                index + 1, radius, clockwise, q(1, 2), q(1, 4))).unwrap();
            let image = derivative.coordinate_image().unwrap();
            assert!(image.coordinates().is_none());
            assert!(image.coincides_with(&expected).unwrap(), "order {}", index + 1);
            let replay = image.definition().unwrap().into_point().unwrap();
            assert!(replay.coincides_with(&expected).unwrap());
        }
    }
}

#[test]
fn selected_circle_scalar_derivatives_keep_chart_endpoints_and_orders() {
    for radius in [-2, 1] {
        for clockwise in [false, true] {
            let path = circle_path_in_frame(radius, clockwise);
            let curve = &path.curves()[0];
            for value in [Real::zero(), q(1, 2), Real::one()] {
                let parameter = hypercurve::CurveParameter2::from(value.clone());
                let derivatives = curve.derivatives_at(&parameter, 8).unwrap();
                assert_eq!(derivatives.len(), 8);
                for (index, derivative) in derivatives.iter().enumerate() {
                    let source: CurvePoint2 = hypercurve::Point2::new(value.clone(), Real::zero()).into();
                    let expected = source.rational_image(&circle_derivative_expectation(
                        index + 1, radius, clockwise, Real::one(), Real::zero())).unwrap();
                    assert!(derivative.coordinate_image().unwrap().coincides_with(&expected).unwrap());
                }
                assert!(curve.derivatives_at(&parameter, 0).unwrap().is_empty());
            }
            for outside in [-1, 2] {
                assert!(curve.derivatives_at(&Real::from(outside).into(), 0).is_err());
                assert!(curve.derivatives_at(&Real::from(outside).into(), 3).is_err());
            }
        }
    }
}

#[test]
fn selected_circle_derivatives_survive_restriction_reversal_and_similarity() {
    let path = circle_path();
    let point = algebraic_angular_point(1, true, q(1, 2), q(1, 4));
    let parameter = angular_location(&path.curves()[0], &point);
    let expected = center().rational_image(&circle_derivative_expectation(
        1, 1, true, q(1, 2), q(1, 4))).unwrap();
    let (left, right) = path.curves()[0].split_at(parameter).unwrap();
    let split = hypercurve::CurvePath2::try_new(vec![
        right.reversed().unwrap(), left.reversed().unwrap()]).unwrap();
    // Retained ranges use the original source chart, including reversed traversal.
    for piece in split.curves() {
        let at = angular_location(piece, &point);
        assert!(piece.derivative_at(&at).unwrap().coordinate_image().unwrap()
            .coincides_with(&expected).unwrap());
    }
    let root = Real::from(2).sqrt().unwrap();
    for (a,b,c,d) in [
        (root.clone(), -root.clone(), root.clone(), root.clone()),
        (-root.clone(), Real::zero(), Real::zero(), root),
    ] {
        let transform = hypercurve::Similarity2::try_from_real_affine(
            a.clone(),b.clone(),c.clone(),d.clone(),3.into(),(-2).into()).unwrap();
        let linear = hypercurve::Similarity2::try_from_real_affine(
            a,b,c,d,0.into(),0.into()).unwrap();
        let target = CurvePointDefinition2::Similarity{source:point.clone(),transform:transform.clone()}
            .into_point().unwrap();
        let expected = CurvePointDefinition2::Similarity{source:expected.clone(),transform:linear}
            .into_point().unwrap();
        let text = angular_svg(split.transform_similarity(&transform).unwrap());
        let replay = import_svg_document(&text).unwrap();
        for piece in replay.paths()[0].curves() {
            let at = angular_location(piece,&target);
            assert!(piece.derivative_at(&at).unwrap().coordinate_image().unwrap()
                .coincides_with(&expected).unwrap());
        }
        assert_eq!(angular_svg(replay.paths()[0].clone()),text);
    }
}

#[test]
fn selected_circle_derivatives_retry_and_keep_requested_policy_certainty() {
    let path = circle_path();
    let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
    let parameter = angular_location(&path.curves()[0], &point);
    let query = || path.curves()[0].derivative_at(&parameter);
    // This retained exact derivative needs no charged refinement or promotion.
    // Zero budget must permit it; exhaustion may only report work actually denied.
    let exact = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, query);
    assert!(exact.result.unwrap().unwrap().coordinate_image().is_ok());
    assert_eq!((exact.usage.refinements, exact.usage.promotions), (0, 0));
    let compare = || query()?.compare_linear_form(&Real::one(), &Real::zero(), &Real::from(-1));
    let exact_compare = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, compare);
    assert_eq!(exact_compare.result.unwrap().unwrap(), Ordering::Less);
    assert_eq!((exact_compare.usage.refinements,exact_compare.usage.promotions),(0,0));
    // The whole incidence -> derivative -> vector-query chain requires charged
    // work in incidence. Retained rational arithmetic itself has no total-work
    // bound from these counters; its successful ZERO queries above remain valid.
    let chain = || {
        let CurvePointLocations2::Locations(locations)=path.curves()[0].point_locations(&point)? else { panic!("one exact angular location"); };
        assert_eq!(locations.len(),1);
        path.curves()[0].derivative_at(&locations[0].parameter().unwrap())?
            .compare_linear_form(&Real::one(),&Real::zero(),&Real::from(-1))
    };
    for _ in 0..2 {
        let denied = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, chain);
        let reached = denied.result.unwrap_err();
        assert_eq!((reached.limit, reached.used),(0,0));
        assert!(reached.requested>0);
        let retry = hypersolve::work_budget::with_budget(
            hypersolve::work_budget::WorkBudget {refinements:4096,promotions:0}, chain);
        assert_eq!(retry.result.unwrap().unwrap(), Ordering::Less);
        assert_eq!(retry.usage.promotions,0);
    }
    for policy in [hypercurve::PredicatePolicy::STRICT,
        hypercurve::PredicatePolicy::APPROXIMATE_512,hypercurve::PredicatePolicy::STRICT] {
        let outcome=hypercurve::evaluate_under(policy,|| {
            let vector=query().unwrap();
            assert!(vector.coordinate_image().unwrap().definition().unwrap().into_point().is_ok());
        });
        assert_eq!(outcome.certainty(),hypercurve::CurveCertainty::Certified);
    }
}

#[test]
fn selected_circle_derivative_size_guard() {
    let path = circle_path();
    assert!(path.curves()[0].derivatives_at(&Real::zero().into(), usize::MAX).is_err());
}

#[test]
fn selected_circle_derivative_points_replay_before_another_exact_split() {
    const INPUT: &str = "HYPERCURVE_CIRCLE_DIFFERENTIAL_REPLAY_INPUT";
    let verify = |text: &str| {
        let replay = import_svg_document(text).unwrap();
        let expected = center().rational_image(&circle_derivative_expectation(
            1, 1, true, Real::one(), Real::zero())).unwrap();
        let line = &replay.paths()[0].curves()[0];
        assert!(line.start().coincides_with(&expected).unwrap());
        assert!(line.end().coincides_with(&translate(&expected, Real::one(), Real::zero())).unwrap());
        let midpoint = translate(&expected, q(1,2), Real::zero());
        let at = angular_location(line, &midpoint);
        let (first, second) = line.split_at(at).unwrap();
        assert!(first.end().coincides_with(&midpoint).unwrap());
        assert!(second.start().coincides_with(&midpoint).unwrap());
        let next = angular_svg(hypercurve::CurvePath2::try_new(vec![first, second]).unwrap());
        assert_eq!(export_svg_document(&import_svg_document(&next).unwrap()).unwrap(), next);
        assert_eq!(export_svg_document(&replay).unwrap(), text);
    };
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let path = circle_path();
    let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
    let parameter = angular_location(&path.curves()[0], &point);
    let vector = path.curves()[0].derivative_at(&parameter).unwrap().coordinate_image().unwrap();
    let line = hypercurve::Curve2::try_line(vector.clone(), translate(&vector, Real::one(), Real::zero())).unwrap();
    let text = angular_svg(hypercurve::CurvePath2::try_new(vec![line]).unwrap());
    verify(&text);
    let file = std::env::temp_dir().join(format!("hypercurve-circle-differential-{}.svg",std::process::id()));
    std::fs::write(&file,&text).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args(["--exact","selected_circle_derivative_points_replay_before_another_exact_split","--nocapture"])
        .env(INPUT,&file).output().unwrap();
    std::fs::remove_file(file).unwrap();
    assert!(output.status.success(),"{}{}",String::from_utf8_lossy(&output.stdout),String::from_utf8_lossy(&output.stderr));
}
