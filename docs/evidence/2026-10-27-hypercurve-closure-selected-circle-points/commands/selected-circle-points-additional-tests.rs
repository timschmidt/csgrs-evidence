
fn algebraic_angular_point(radius: i32, clockwise: bool, scale: Real, shift: Real) -> CurvePoint2 {
    use hypersolve::bivariate_arithmetic::{bivariate_add, bivariate_multiply, bivariate_scale, bivariate_subtract};
    let u = BivariatePolynomial::new(vec![vec![shift], vec![scale]]);
    let twice = bivariate_scale(u.clone(), &Real::from(2));
    let square = bivariate_scale(bivariate_multiply(&u, &u), &Real::from(2));
    let normal = bivariate_subtract(&polynomial(&[&[1]]), &twice);
    let tangent = bivariate_subtract(&twice, &square);
    let denominator = bivariate_add(&normal, &square);
    let direction = if clockwise { radius } else { -radius };
    let x = bivariate_add(
        &bivariate_multiply(&polynomial(&[&[0], &[1]]), &denominator),
        &bivariate_add(&bivariate_scale(normal.clone(), &q(-4 * radius, 5)), &bivariate_scale(tangent.clone(), &q(3 * direction, 5))),
    );
    let y = bivariate_add(
        &bivariate_multiply(&polynomial(&[&[0, 1]]), &denominator),
        &bivariate_add(&bivariate_scale(normal, &q(3 * radius, 5)), &bivariate_scale(tangent, &q(4 * direction, 5))),
    );
    center().rational_image(&RationalMap2::new([x, y], denominator)).unwrap()
}

fn angular_location(curve: &hypercurve::Curve2, point: &CurvePoint2) -> hypercurve::CurveParameter2 {
    let CurvePointLocations2::Locations(locations) = curve.point_locations(point).unwrap() else {
        panic!("one selected angular location")
    };
    assert_eq!(locations.len(), 1);
    locations[0].parameter().unwrap()
}

fn angular_svg(path: hypercurve::CurvePath2) -> String {
    export_svg_document(&SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![path])).unwrap()
}

#[test]
fn selected_circle_points_order_independent_definitions_and_nearby_cuts() {
    let path = circle_path();
    let curve = &path.curves()[0];
    let delta = (Real::one() / Real::from(1_u128 << 80)).unwrap();
    let points = [-delta.clone(), Real::zero(), delta].map(|shift| algebraic_angular_point(1, true, Real::one(), shift));
    let parameters = points.each_ref().map(|point| angular_location(curve, point));
    for index in 0..2 {
        assert_eq!(parameters[index].compare(&parameters[index + 1]).unwrap(), Ordering::Less);
        assert_eq!(parameters[index + 1].compare(&parameters[index]).unwrap(), Ordering::Greater);
        assert!(!points[index].coincides_with(&points[index + 1]).unwrap());
    }
    let independent = algebraic_angular_point(1, true, Real::one(), Real::zero());
    assert!(independent.coordinates().is_none());
    assert_eq!(parameters[1].compare(&angular_location(curve, &independent)).unwrap(), Ordering::Equal);
    let range = hypercurve::CurveParameterRange2::try_new(parameters[0].clone(), parameters[2].clone()).unwrap();
    let restricted = curve.restrict_source(range).unwrap();
    assert!(restricted.start().coincides_with(&points[0]).unwrap());
    assert!(restricted.end().coincides_with(&points[2]).unwrap());
    let middle = angular_location(&restricted, &points[1]);
    let (left, right) = restricted.split_at(middle).unwrap();
    let reversed = hypercurve::CurvePath2::try_new(vec![right.reversed().unwrap(), left.reversed().unwrap()]).unwrap();
    let svg = angular_svg(reversed);
    let replay = import_svg_document(&svg).unwrap();
    assert!(replay.paths()[0].start().coincides_with(&points[2]).unwrap());
    assert!(replay.paths()[0].end().coincides_with(&points[0]).unwrap());
    assert_eq!(angular_svg(replay.paths()[0].clone()), svg);
}

#[test]
fn selected_circle_points_keep_signed_halves_and_similarity_transport() {
    for radius in [-1, 1] {
        for clockwise in [false, true] {
            let path = circle_path_in_frame(radius, clockwise);
            let point = algebraic_angular_point(radius, clockwise, q(1, 2), q(1, 4));
            let opposite = algebraic_angular_point(-radius, clockwise, q(1, 2), q(1, 4));
            let curve = &path.curves()[0];
            let parameter = angular_location(curve, &point);
            assert!(curve.point_at(&parameter).unwrap().coincides_with(&point).unwrap());
            let near = translate(&point, (Real::one() / Real::from(1_u128 << 80)).unwrap(), Real::zero());
            for excluded in [opposite, near] {
                let CurvePointLocations2::Locations(locations) = curve.point_locations(&excluded).unwrap() else {panic!("finite excluded point")};
                assert!(locations.is_empty());
            }
            let (first, second) = curve.split_at(parameter).unwrap();
            let split = hypercurve::CurvePath2::try_new(vec![first, second]).unwrap();
            let root = Real::from(2).sqrt().unwrap();
            for transform in [
                hypercurve::Similarity2::try_from_real_affine(root.clone(), -root.clone(), root.clone(), root.clone(), 3.into(), (-2).into()).unwrap(),
                hypercurve::Similarity2::try_from_real_affine(-root.clone(), 0.into(), 0.into(), root, 1.into(), 4.into()).unwrap(),
            ] {
                let transformed = split.transform_similarity(&transform).unwrap();
                let expected = CurvePointDefinition2::Similarity {source: point.clone(), transform}.into_point().unwrap();
                let svg = angular_svg(transformed);
                let replay = import_svg_document(&svg).unwrap();
                for piece in replay.paths()[0].curves() {
                    let parameter = angular_location(piece, &expected);
                    assert!(piece.point_at(&parameter).unwrap().coincides_with(&expected).unwrap());
                }
                assert_eq!(angular_svg(replay.paths()[0].clone()), svg);
            }
        }
    }
}

#[test]
fn selected_circle_points_replay_in_a_fresh_process_before_another_split() {
    const INPUT: &str = "HYPERCURVE_SELECTED_CIRCLE_POINTS_REPLAY_INPUT";
    let verify = |text: &str| {
        let replay = import_svg_document(text).unwrap();
        let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
        assert!(replay.paths()[0].curves()[0].end().coincides_with(&point).unwrap());
        assert!(replay.paths()[0].curves()[1].start().coincides_with(&point).unwrap());
        let next = algebraic_angular_point(1, true, q(1, 2), Real::zero());
        let curve = &replay.paths()[0].curves()[1];
        let parameter = angular_location(curve, &next);
        let (first, second) = curve.split_at(parameter).unwrap();
        assert!(first.end().coincides_with(&next).unwrap());
        assert!(second.start().coincides_with(&next).unwrap());
        let next_svg = angular_svg(hypercurve::CurvePath2::try_new(vec![first, second]).unwrap());
        assert_eq!(export_svg_document(&import_svg_document(&next_svg).unwrap()).unwrap(), next_svg);
        assert_eq!(export_svg_document(&replay).unwrap(), text);
    };
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let path = circle_path();
    let curve = &path.curves()[0];
    let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
    let (first, second) = curve.split_at(angular_location(curve, &point)).unwrap();
    let text = angular_svg(hypercurve::CurvePath2::try_new(vec![second.reversed().unwrap(), first.reversed().unwrap()]).unwrap());
    verify(&text);
    let directory = tempfile::tempdir().unwrap();
    let file = directory.path().join("selected-circle.svg");
    std::fs::write(&file, &text).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap()).args([
        "--exact", "selected_circle_points_replay_in_a_fresh_process_before_another_split", "--nocapture",
    ]).env(INPUT, file).output().unwrap();
    assert!(output.status.success(), "{}{}", String::from_utf8_lossy(&output.stdout), String::from_utf8_lossy(&output.stderr));
}

#[test]
fn selected_circle_point_queries_retry_without_promoting_requested_policy() {
    let path = circle_path();
    let point = algebraic_angular_point(1, true, Real::one(), Real::zero());
    let query = || path.curves()[0].point_locations(&point);
    for _ in 0..2 {
        let denied = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, query);
        let reached = denied.result.unwrap_err();
        assert_eq!((reached.limit, reached.used), (0, 0));
        assert!(reached.requested > 0);
        let retry = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget { refinements: 4096, promotions: 0 }, query);
        let CurvePointLocations2::Locations(locations) = retry.result.unwrap().unwrap() else {panic!("one point after retry")};
        assert_eq!(locations.len(), 1);
        assert_eq!(retry.usage.promotions, 0);
    }
    for policy in [hypercurve::PredicatePolicy::STRICT, hypercurve::PredicatePolicy::APPROXIMATE_512, hypercurve::PredicatePolicy::STRICT] {
        let outcome = hypercurve::evaluate_under(policy, || {
            let parameter = angular_location(&path.curves()[0], &point);
            let (first, second) = path.curves()[0].split_at(parameter).unwrap();
            let text = angular_svg(hypercurve::CurvePath2::try_new(vec![first, second]).unwrap());
            assert_eq!(export_svg_document(&import_svg_document(&text).unwrap()).unwrap(), text);
        });
        assert_eq!(outcome.certainty(), hypercurve::CurveCertainty::Certified);
    }
}
