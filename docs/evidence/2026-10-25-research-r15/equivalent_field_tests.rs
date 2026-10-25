/// Independent formula and polynomial authorities name sqrt(2+sqrt(2)),
/// its reciprocal, negative image, shifted relation and selected conjugate.
/// Equivalent rebuilt fields must retain the relation without projection.
#[test]
fn recursive_formula_roots_compare_in_equivalent_rebuilt_fields() {
    use std::cmp::Ordering;
    let half = (Real::one() / Real::from(2)).unwrap();
    let tiny = Real::from(2).powi_i64(-600).unwrap();
    let mut missing = Vec::new();
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
        for name in ["same", "scaled_positive", "scaled_negative", "nearby", "reciprocal", "negative", "conjugate"] {
            let source = selected_square_root_source((Real::one() / Real::from(2)).unwrap());
            // alpha=2sqrt(1/2)=sqrt(2), z=sqrt(2+alpha), so 1<z<2.
            let base = selected_source_field(vec![source.clone()]);
            let radicand = base.constant(Real::from(2)).unwrap()
                .add(&doubled_source_value(&base, &source)).unwrap();
            let field = base.extension(radicand).unwrap();
            let generator = field.element(base.constant(Real::zero()).unwrap(), base.constant(Real::one()).unwrap()).unwrap();
            let (numerator, denominator, bounds) = match name {
                "reciprocal" => (field.constant(Real::one()).unwrap(), generator, (half.clone(), Real::one())),
                "negative" => (generator.scale(&-Real::one()).unwrap(), field.constant(Real::one()).unwrap(), (Real::from(-2), -Real::one())),
                _ => (generator, field.constant(Real::one()).unwrap(), (Real::one(), Real::from(2))),
            };
            let Classification::Decided(formula) = BezierRecursiveProjectiveParameter2::new_with_certified_bounds(
                RecursiveQuadraticProjectiveScalar { numerator, denominator }, Some(bounds), &policy,
            ).unwrap() else { panic!("positive finite formula denominator") };
            let rebuilt = selected_source_field(vec![source.clone()]);
            let mut relation = shifted_square_relation(&rebuilt, &source);
            let (bounds, signs, expected) = match name {
                "scaled_positive" => {
                    relation = relation.into_iter().map(|v| v.scale(&Real::from(7)).unwrap()).collect();
                    ((Real::one(), Real::from(2)), [RealSign::Negative, RealSign::Positive], Ordering::Equal)
                }
                "scaled_negative" => {
                    relation = relation.into_iter().map(|v| v.scale(&Real::from(-7)).unwrap()).collect();
                    ((Real::one(), Real::from(2)), [RealSign::Positive, RealSign::Negative], Ordering::Equal)
                }
                "nearby" => {
                    // Increasing the positive square root's radicand moves it right.
                    relation[0] = relation[0].subtract(&rebuilt.constant(tiny.clone()).unwrap()).unwrap();
                    ((Real::one(), Real::from(2)), [RealSign::Negative, RealSign::Positive], Ordering::Less)
                }
                "reciprocal" => {
                    relation = vec![rebuilt.constant(-Real::one()).unwrap(), rebuilt.constant(Real::zero()).unwrap(),
                        rebuilt.constant(Real::from(2)).unwrap().add(&doubled_source_value(&rebuilt, &source)).unwrap()];
                    ((half.clone(), Real::one()), [RealSign::Negative, RealSign::Positive], Ordering::Equal)
                }
                "negative" => ((Real::from(-2), -Real::one()), [RealSign::Positive, RealSign::Negative], Ordering::Equal),
                "conjugate" => {
                    // sqrt(2-alpha) lies in (1/2,1), strictly below z.
                    relation[0] = rebuilt.constant(Real::from(-2)).unwrap().add(&doubled_source_value(&rebuilt, &source)).unwrap();
                    ((half.clone(), Real::one()), [RealSign::Negative, RealSign::Positive], Ordering::Greater)
                }
                _ => ((Real::one(), Real::from(2)), [RealSign::Negative, RealSign::Positive], Ordering::Equal),
            };
            let root = local_polynomial_root(&rebuilt, relation, bounds, signs, &policy);
            drop(base); drop(field); drop(rebuilt); drop(source);
            let local = policy.bounded_exact_predicate_pass(|| formula.order_against_polynomial_root(&root, &policy)).unwrap();
            let complete = formula.cmp_by_refinement(&root, &policy).unwrap();
            let reverse = root.cmp_by_refinement(&formula, &policy).unwrap();
            let projected = formula.data.projection.parameter.get().is_some() || root.data.projection.parameter.get().is_some();
            eprintln!("R15_ORACLE {name} {policy:?} local={local:?} complete={complete:?} reverse={reverse:?} projected={projected}");
            if local != Some(expected) || complete != Classification::Decided(expected)
                || reverse != Classification::Decided(expected.reverse()) || projected {
                missing.push(format!("{name}/{policy:?}: {local:?}, {complete:?}, {reverse:?}, projected={projected}"));
            }
        }
    }
    assert!(missing.is_empty(), "missing local exact comparisons: {missing:#?}");
}

#[test]
fn recursive_formula_rebasing_keeps_foreign_sources_and_denominators_typed() {
    let source = selected_square_root_source((Real::one() / Real::from(2)).unwrap());
    let foreign_source = selected_square_root_source((Real::from(3) / Real::from(4)).unwrap());
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
        let field = selected_source_field(vec![source.clone()]);
        for denominator in [Real::zero(), -Real::one()] {
            assert!(matches!(BezierRecursiveProjectiveParameter2::new_with_certified_bounds(
                RecursiveQuadraticProjectiveScalar {
                    numerator: field.constant(Real::one()).unwrap(),
                    denominator: field.constant(denominator).unwrap(),
                }, Some((Real::zero(), Real::one())), &policy,
            ), Err(CurveError::Topology(_))));
        }
        let Classification::Decided(formula) = BezierRecursiveProjectiveParameter2::new_with_certified_bounds(
            RecursiveQuadraticProjectiveScalar {
                numerator: field.retained_root_value(&source).unwrap(),
                denominator: field.constant(Real::one()).unwrap(),
            }, Some((Real::zero(), Real::one())), &policy,
        ).unwrap() else { panic!("finite selected scalar") };
        let foreign = selected_source_field(vec![foreign_source.clone()]);
        let query = vec![foreign.retained_root_value(&foreign_source).unwrap(), foreign.constant(Real::one()).unwrap()];
        assert_eq!(formula.recursive_polynomial_sign_joined(&query, &policy).unwrap(), Classification::Uncertain(UncertaintyReason::Unsupported));
        assert!(formula.data.projection.parameter.get().is_none());
    }
}
