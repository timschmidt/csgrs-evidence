
fn rebound(recipe: &CurvePointRationalForm2, source: CurvePoint2) -> ExactCurveResult<CurvePoint2> {
    CurvePointDefinition2::RationalQueryPair {
        sources: [source, Point2::from_values(0, 0).into()],
        numerators: [recipe.numerator().clone(), polynomial(&[&[0]])],
        denominators: [recipe.denominator().clone(), polynomial(&[&[1]])],
    }.into_point()
}

fn assert_pole(recipe: &CurvePointRationalForm2, source: CurvePoint2) {
    assert!(matches!(rebound(recipe, source), Err(ExactCurveError::Invalid { cause: CurveError::ZeroRationalPointDenominator, .. })));
}

#[test]
fn rational_quotients_keep_both_guards_and_shared_denominators() {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let outcome = evaluate_under(policy, || {
            let source = cube_point(2);
            let first = source.rational_form(polynomial(&[&[1]]), polynomial(&[&[-3, 0, 0, 1]])).unwrap();
            for shared in [false, true] {
                let second = source.rational_form(polynomial(&[&[1]]), polynomial(&[&[if shared { -3 } else { -5 }, 0, 0, 1]])).unwrap();
                let quotient = first.divide(&second).unwrap();
                assert_eq!(quotient.compare_to_real(&Real::from(if shared { 1 } else { 3 })).unwrap(), Ordering::Equal);
                let recipe = quotient.parameter().unwrap().rational_form_source().unwrap();
                assert_pole(&recipe, cube_point(3));
                if !shared { assert_pole(&recipe, cube_point(5)); }
                let valid = rebound(&recipe, cube_point(4)).unwrap();
                assert_eq!(valid.affine_form(1.into(), 0.into(), 0.into()).compare_to_real(&Real::from(if shared { 1 } else { -1 })).unwrap(), Ordering::Equal);
            }
        });
        assert_eq!(outcome.certainty(), CurveCertainty::Certified);
        assert!(outcome.certified().is_some());
    }
}

#[test]
fn rational_quotient_zero_divisor_and_exhaustion_do_not_become_success() {
    use hypersolve::work_budget::{with_budget, WorkBudget};
    let source = cube_point(2);
    let one = source.rational_form(polynomial(&[&[1]]), polynomial(&[&[1]])).unwrap();
    let zero = source.rational_form(polynomial(&[&[-2, 0, 0, 1]]), polynomial(&[&[-3, 0, 0, 1]])).unwrap();
    assert!(matches!(one.divide(&zero), Err(ExactCurveError::Invalid { cause: CurveError::ZeroRationalPointDenominator, .. })));
    let quotient = quotient();
    let denied = with_budget(WorkBudget::ZERO, || {
        assert!(matches!(quotient.parameter(), Err(ExactCurveError::Blocked(ref blocker)) if blocker.reason() == UncertaintyReason::BudgetExhausted));
    });
    assert!(denied.result.is_err());
    for _ in 0..2 {
        let retry = with_budget(WorkBudget { refinements: 4096, promotions: 64 }, || {
            let recipe = quotient.parameter().unwrap().rational_form_source().unwrap();
            assert_eq!(recipe.compare(&quotient).unwrap(), Ordering::Equal);
            assert_pole(&recipe, cube_point(3));
        });
        assert!(retry.result.is_ok());
    }
}

#[cfg(feature = "svg")]
#[test]
fn rational_quotient_guards_survive_cold_native_replay_and_subdivision() {
    const INPUT: &str = "HYPERCURVE_RATIONAL_QUOTIENT_GUARD_REPLAY";
    fn verify(text: &str) {
        let geometry = import_svg_document(text).unwrap();
        let curve = &geometry.paths()[0].curves()[0];
        let end = curve.parameter_domain().end();
        let recipe = end.rational_form_source().expect("retained original query recipe");
        assert_pole(&recipe, cube_point(3));
        assert_eq!(curve.end().rational_form(polynomial(&[&[-2], &[6], &[-6], &[3]]), polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
        assert_eq!(curve.end().rational_form(polynomial(&[&[0, -1], &[], &[1]]), polynomial(&[&[1]])).unwrap().compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
        assert_eq!(export_svg_document(&geometry).unwrap(), text);
        let half = end.affine_image(&(Real::one() / Real::from(2)).unwrap(), &Real::zero()).unwrap();
        let (first, second) = curve.split_at(half).unwrap();
        assert!(first.end().coincides_with(&second.start()).unwrap());
        let again = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![first, second]).unwrap()]);
        let replay = import_svg_document(&export_svg_document(&again).unwrap()).unwrap();
        let final_end = replay.paths()[0].curves()[1].parameter_domain().end().clone();
        assert_eq!(final_end.compare(end).unwrap(), Ordering::Equal);
        assert_pole(&final_end.rational_form_source().unwrap(), cube_point(3));
        assert!(replay.paths()[0].end().coincides_with(&curve.end()).unwrap());
    }
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let quotient = quotient();
    let one = quotient.source().rational_form(polynomial(&[&[1]]), polynomial(&[&[1]])).unwrap();
    let end = quotient.add(&one).unwrap().parameter().unwrap();
    let source: Curve2 = RationalBezier2::try_new(vec![Point2::from_values(0, 0), Point2::new((Real::one() / Real::from(2)).unwrap(), 0.into()), Point2::from_values(1, 1)], vec![Real::one(); 3]).unwrap().into();
    let curve = source.restrict_source(CurveParameterRange2::try_new(0.into(), end).unwrap()).unwrap();
    let geometry = SvgGeometry2::new(CurveRegion2::empty(), vec![], vec![CurvePath2::try_new(vec![curve]).unwrap()]);
    let text = export_svg_document(&geometry).unwrap();
    verify(&text);
    let path = std::env::temp_dir().join(format!("hypercurve-query-guard-{}-{}.svg", std::process::id(), std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos()));
    std::fs::write(&path, text).unwrap();
    let child = std::process::Command::new(std::env::current_exe().unwrap()).args(["--exact", "rational_quotient_guards_survive_cold_native_replay_and_subdivision", "--nocapture"]).env(INPUT, &path).output().unwrap();
    std::fs::remove_file(path).unwrap();
    assert!(child.status.success(), "{}{}", String::from_utf8_lossy(&child.stdout), String::from_utf8_lossy(&child.stderr));
}
