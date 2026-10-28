
#[test]
fn selected_corner_composition_resource_retry_and_policy_probe() {
    use hypercurve::{BooleanOp, CurveCornerMode2, FillRule, OffsetCornerStyle2};
    let path = selected_corner_half_disk().chamfer_vertex_by_setbacks(
        1, q(1, 4), q(1, 4), CurveCornerMode2::TrimOnly,
    ).unwrap().into_solutions().pop().unwrap();
    let source = CurveRegion2::try_from_boundary_paths(&[path], FillRule::NonZero).unwrap();
    let grown = source.offset(q(1, 16), &OffsetCornerStyle2::Round).unwrap();
    let erosion = || grown.offset(q(-1, 16), &OffsetCornerStyle2::Round);
    for _ in 0..2 {
        let small = hypersolve::work_budget::with_budget(
            hypersolve::work_budget::WorkBudget::ZERO, erosion,
        );
        eprintln!("small usage: {:?}", small.usage);
        match small.result {
            Ok(result) => {
                eprintln!("small outcome: completed");
                assert!(result.unwrap().boolean_region(&source, BooleanOp::Xor).unwrap().is_empty());
            }
            Err(reached) => {
                eprintln!("small outcome: exhausted {reached:?}");
                assert_eq!((reached.limit, reached.used), (0, 0));
                assert!(reached.requested > 0);
            }
        }
        let medium = hypersolve::work_budget::with_budget(
            hypersolve::work_budget::WorkBudget { refinements: 65536, promotions: 4096 }, erosion,
        );
        eprintln!("medium usage: {:?}", medium.usage);
        match medium.result {
            Ok(result) => {
                eprintln!("medium outcome: completed");
                assert!(result.unwrap().boolean_region(&source, BooleanOp::Xor).unwrap().is_empty());
            }
            Err(reached) => {
                eprintln!("medium outcome: exhausted {reached:?}");
                assert_eq!((reached.limit, reached.used), (65536, 65536));
                assert!(reached.requested > 0);
            }
        }
        let retry = hypersolve::work_budget::with_budget(
            hypersolve::work_budget::WorkBudget { refinements: 4_194_304, promotions: 4096 }, erosion,
        );
        eprintln!("retry usage: {:?}", retry.usage);
        assert!(retry.result.unwrap().unwrap().boolean_region(&source, BooleanOp::Xor).unwrap().is_empty());
    }
    for policy in [hypercurve::PredicatePolicy::STRICT,
        hypercurve::PredicatePolicy::APPROXIMATE_512, hypercurve::PredicatePolicy::STRICT] {
        let outcome = hypercurve::evaluate_under(policy, || {
            let restored = erosion().unwrap();
            let text = export_svg_document(&SvgGeometry2::new(restored.clone(), Vec::new(), Vec::new())).unwrap();
            let replay = import_svg_document(&text).unwrap();
            assert!(replay.region().boolean_region(&source, BooleanOp::Xor).unwrap().is_empty());
        });
        assert_eq!(outcome.certainty(), hypercurve::CurveCertainty::Certified);
    }
}
