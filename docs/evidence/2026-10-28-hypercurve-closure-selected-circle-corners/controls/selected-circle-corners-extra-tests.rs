
#[test]
fn selected_circle_shared_center_contacts_retry_and_keep_certainty() {
    let first = circle_path().curves()[0].clone();
    let second = shifted_selected_circle(Real::one(), false);
    let query = || first.intersect_curve(&second);
    let verify = |result: hypercurve::CurveIntersectionResult2| {
        assert!(result.blockers().is_empty(), "{:?}", result.blockers());
        assert_eq!(result.contacts().len(), 2);
        assert!(result.overlaps().is_empty());
        for contact in result.contacts() {
            assert_circle_chord_contact_parameters(&first, &second, contact);
        }
    };
    for _ in 0..2 {
        let small = hypersolve::work_budget::with_budget(
            hypersolve::work_budget::WorkBudget::ZERO, query,
        );
        assert_eq!((small.usage.refinements, small.usage.promotions), (0, 0));
        match small.result {
            Ok(result) => verify(result.unwrap()),
            Err(reached) => {
                assert_eq!((reached.limit, reached.used), (0, 0));
                assert!(reached.requested > 0);
            }
        }
        let retry = hypersolve::work_budget::with_budget(
            hypersolve::work_budget::WorkBudget { refinements: 4096, promotions: 0 }, query,
        );
        verify(retry.result.unwrap().unwrap());
        assert_eq!(retry.usage.promotions, 0);
    }
    for policy in [hypercurve::PredicatePolicy::STRICT,
        hypercurve::PredicatePolicy::APPROXIMATE_512, hypercurve::PredicatePolicy::STRICT] {
        let outcome = hypercurve::evaluate_under(policy, || verify(query().unwrap()));
        assert_eq!(outcome.certainty(), hypercurve::CurveCertainty::Certified);
    }
}

#[test]
fn selected_circle_shared_center_contact_replays_before_further_intersection() {
    const INPUT: &str = "HYPERCURVE_RETAINED_CIRCLE_PAIR_REPLAY";
    let verify = |text: &str| {
        let replay = import_svg_document(text).unwrap();
        assert_eq!(export_svg_document(&replay).unwrap(), text);
        let root = Real::from(3).sqrt().unwrap();
        let upper = translate(&center(), q(3, 10)-&root*q(2, 5), q(2, 5)+&root*q(3, 10));
        assert!(replay.paths()[0].curves()[0].end().coincides_with(&upper).unwrap());
        let second = shifted_selected_circle(Real::one(), false);
        for curve in replay.paths()[0].curves() {
            let result = curve.intersect_curve(&second).unwrap();
            assert!(result.blockers().is_empty(), "{:?}", result.blockers());
            for contact in result.contacts() {
                assert_circle_chord_contact_parameters(curve, &second, contact);
            }
        }
        assert_eq!(replay.paths()[0].curves().len(), 2);
    };
    if let Some(file) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(file).unwrap());
        return;
    }
    let first = circle_path().curves()[0].clone();
    let second = shifted_selected_circle(Real::one(), false);
    let root = Real::from(3).sqrt().unwrap();
    let upper = translate(&center(), q(3, 10)-&root*q(2, 5), q(2, 5)+&root*q(3, 10));
    let result = first.intersect_curve(&second).unwrap();
    assert!(result.blockers().is_empty());
    let contact = result.contacts().iter()
        .find(|contact| contact.point().coincides_with(&upper).unwrap()).unwrap();
    let (a, b) = first.split_at(contact.first().parameter().unwrap()).unwrap();
    let text = angular_svg(hypercurve::CurvePath2::try_new(vec![a, b]).unwrap());
    verify(&text);
    let file = std::env::temp_dir().join(format!("hypercurve-retained-circle-pair-{}.svg", std::process::id()));
    std::fs::write(&file, &text).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args(["selected_circle_shared_center_contact_replays_before_further_intersection", "--exact", "--nocapture"])
        .env(INPUT, &file).output().unwrap();
    std::fs::remove_file(file).unwrap();
    assert!(output.status.success(), "{}{}", String::from_utf8_lossy(&output.stdout), String::from_utf8_lossy(&output.stderr));
}

#[test]
fn selected_circle_corner_reversal_preserves_set_and_constraints() {
    use hypercurve::{BooleanOp, CurveCornerMode2, CurveFillet2, CurveFilletContact2, FillRule};
    let s = q(1, 2).sqrt().unwrap();
    let center = translate(&center(), &s*q(4, 5)+q(3, 20), &s*q(-3, 5)+q(1, 5));
    let previous = translate(&crate::center(), &s*q(16, 15)+q(1, 5), &s*q(-4, 5)+q(4, 15));
    let next = translate(&crate::center(), &s*q(4, 5), &s*q(-3, 5));
    let source = selected_corner_half_disk();
    let mut references = Vec::new();
    for reverse in [false, true] {
        let path = if reverse { source.reversed().unwrap() } else { source.clone() };
        let contacts = if reverse { [next.clone(), previous.clone()] } else { [previous.clone(), next.clone()] };
        let request = CurveFillet2 { radius: q(1, 4), center: Some(center.clone()), contacts: contacts.map(|p| Some(CurveFilletContact2::Point(p))) };
        for (index, solutions) in [
            path.chamfer_vertex_by_setbacks(1, q(1, 4), q(1, 4), CurveCornerMode2::TrimOnly).unwrap(),
            path.fillet_vertex(1, &request, CurveCornerMode2::TrimOnly).unwrap(),
        ].into_iter().enumerate() {
            assert_eq!(solutions.candidate_count(), 1);
            let region = CurveRegion2::try_from_boundary_paths(&solutions.into_solutions(), FillRule::NonZero).unwrap();
            if reverse {
                assert!(region.boolean_region(&references[index], BooleanOp::Xor).unwrap().is_empty());
            } else {
                references.push(region);
            }
        }
        for request in [
            CurveFillet2 { center: Some(crate::center()), ..request.clone() },
            CurveFillet2 { contacts: [Some(CurveFilletContact2::Point(crate::center())), request.contacts[1].clone()], ..request },
        ] {
            assert_eq!(path.fillet_vertex(1, &request, CurveCornerMode2::TrimOnly).unwrap().candidate_count(), 0);
        }
    }
}
