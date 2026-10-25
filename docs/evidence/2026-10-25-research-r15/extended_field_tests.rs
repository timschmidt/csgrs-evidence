
/// Replaying positive radicals must work through complete equivalent towers,
/// while a different radicand remains a different coefficient authority.
#[test]
fn recursive_formula_comparisons_replay_equivalent_extension_towers() {
    use std::cmp::Ordering;
    let alpha = selected_square_root_source((Real::one() / Real::from(2)).unwrap());
    let tower = |depth: usize, conjugate: bool| {
        let mut field = selected_source_field(vec![alpha.clone()]);
        let alpha_value = doubled_source_value(&field, &alpha);
        let mut radicand = if conjugate {
            field.constant(Real::from(2)).unwrap().subtract(&alpha_value).unwrap()
        } else {
            field.constant(Real::from(2)).unwrap().add(&alpha_value).unwrap()
        };
        let mut generator = field.constant(Real::zero()).unwrap();
        for level in 0..depth {
            let parent = field.clone();
            field = field.extension(radicand).unwrap();
            generator = field.element(parent.constant(Real::zero()).unwrap(), parent.constant(Real::one()).unwrap()).unwrap();
            radicand = field.constant(Real::from(3 + level as i32)).unwrap().add(&generator).unwrap();
        }
        (field, generator)
    };
    let mut missing = Vec::new();
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
        for depth in [1, 2] {
            for gauge in [Real::one(), Real::from(-7)] {
                let (field, generator) = tower(depth, false);
                let bounds = (Real::from(depth as i32), Real::from(depth as i32 + 1));
                let Classification::Decided(formula) = BezierRecursiveProjectiveParameter2::new_with_certified_bounds(
                    RecursiveQuadraticProjectiveScalar { numerator: generator, denominator: field.constant(Real::one()).unwrap() }, Some(bounds.clone()), &policy,
                ).unwrap() else {panic!("positive finite formula")};
                let (rebuilt, value) = tower(depth, false);
                assert!(!field.same_field(&rebuilt));
                let relation = vec![value.scale(&-&gauge).unwrap(), rebuilt.constant(gauge.clone()).unwrap()];
                let signs = if gauge == Real::one() {[RealSign::Negative,RealSign::Positive]} else {[RealSign::Positive,RealSign::Negative]};
                let root = local_polynomial_root(&rebuilt, relation, bounds, signs, &policy);
                let outcome = crate::evaluate_under(policy.predicate_policy(), || {
                    (formula.order_against_polynomial_root(&root, &policy).unwrap(), formula.cmp_by_refinement(&root, &policy).unwrap(), root.cmp_by_refinement(&formula, &policy).unwrap())
                });
                assert_eq!(outcome.certainty(),crate::CurveCertainty::Certified);
                let actual = outcome.certified().unwrap();
                let projected = formula.data.projection.parameter.get().is_some() || root.data.projection.parameter.get().is_some();
                eprintln!("R15_TOWER depth={depth} gauge={gauge:?} policy={policy:?} actual={actual:?} projected={projected}");
                if actual != (Some(Ordering::Equal),Classification::Decided(Ordering::Equal),Classification::Decided(Ordering::Equal)) || projected {
                    missing.push(format!("depth={depth}, gauge={gauge:?}, policy={policy:?}, actual={actual:?}, projected={projected}"));
                }
                let (foreign, other_generator) = tower(depth, true);
                assert_eq!(formula.recursive_polynomial_sign_joined(&[other_generator.scale(&-Real::one()).unwrap(),foreign.constant(Real::one()).unwrap()],&policy).unwrap(), Classification::Uncertain(UncertaintyReason::Unsupported));
            }
        }
    }
    assert!(missing.is_empty(),"equivalent tower comparisons: {missing:#?}");
}

#[test]
fn recursive_formula_source_order_preserves_value_and_typed_local_decline() {
    use std::cmp::Ordering;
    let alpha = selected_square_root_source((Real::one()/Real::from(2)).unwrap());
    let beta = selected_square_root_source((Real::from(3)/Real::from(4)).unwrap());
    for policy in [CurveContext::STRICT,CurveContext::APPROXIMATE_512] {
        for reverse in [false,true] {
            let sources = if reverse { vec![beta.clone(),alpha.clone()] } else { vec![alpha.clone(),beta.clone()] };
            let base = selected_source_field(sources);
            let numerator = base.retained_root_value(&alpha).unwrap().add(&base.retained_root_value(&beta).unwrap()).unwrap();
            let Classification::Decided(formula) = BezierRecursiveProjectiveParameter2::new_with_certified_bounds(RecursiveQuadraticProjectiveScalar {numerator,denominator:base.constant(Real::one()).unwrap()},Some((Real::one(),Real::from(2))),&policy).unwrap() else {panic!("finite sum of selected roots")};
            let rebuilt = selected_source_field(vec![alpha.clone(),beta.clone()]);
            let value = rebuilt.retained_root_value(&alpha).unwrap().add(&rebuilt.retained_root_value(&beta).unwrap()).unwrap();
            let relation = vec![value.scale(&-Real::one()).unwrap(),rebuilt.constant(Real::one()).unwrap()];
            if reverse {
                // This candidate accepts identical ordered bases only. It
                // must decline an unproved permutation, then keep fallback.
                assert_eq!(formula.recursive_polynomial_sign_joined(&relation,&policy).unwrap(),Classification::Uncertain(UncertaintyReason::Unsupported));
            }
            let root = local_polynomial_root(&rebuilt,relation,(Real::one(),Real::from(2)),[RealSign::Negative,RealSign::Positive],&policy);
            let outcome = crate::evaluate_under(policy.predicate_policy(),|| {
                (formula.cmp_by_refinement(&root,&policy).unwrap(),root.cmp_by_refinement(&formula,&policy).unwrap())
            });
            assert_eq!(outcome.certainty(),crate::CurveCertainty::Certified);
            assert_eq!(outcome.certified().unwrap(),(Classification::Decided(Ordering::Equal),Classification::Decided(Ordering::Equal)));
        }
    }
}
