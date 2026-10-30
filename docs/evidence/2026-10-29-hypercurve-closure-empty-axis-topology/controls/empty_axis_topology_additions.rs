
#[test]
fn repeated_and_higher_degree_axis_sources_keep_empty_domains() {
    // (x-3)^2, x^6+1 and x^2-2 have no zero in [-1, 1].
    for coefficients in [
        vec![9, -6, 1],
        vec![1, 0, 0, 0, 0, 0, 1],
        vec![-2, 0, 1],
    ] {
        assert_empty(BivariatePolynomial::new(
            coefficients.into_iter().map(|c| vec![c.into()]).collect(),
        ));
    }
}

#[test]
fn algebraic_and_repeated_boundary_roots_remain_live_vertical_components() {
    let mut rectangle = domain();
    rectangle.first = [(-2_i32).into(), 2_i32.into()];
    let irrational = BivariatePolynomial::new(vec![
        vec![(-2_i32).into()],
        vec![],
        vec![1_i32.into()],
    ]);
    assert_eq!(
        decompose_bivariate_curve(&irrational, &rectangle, Default::default()),
        Err(BivariateTopologyError::VerticalComponent)
    );
    let boundary = BivariatePolynomial::new(vec![
        vec![1_i32.into()],
        vec![(-2_i32).into()],
        vec![1_i32.into()],
    ]);
    assert_eq!(
        decompose_bivariate_curve(&boundary, &domain(), Default::default()),
        Err(BivariateTopologyError::VerticalComponent)
    );
}

#[test]
fn empty_axis_degree_and_work_refusals_allow_a_larger_retry() {
    use hypersolve::bivariate_topology::BivariateTopologyConfig;
    use hypersolve::work_budget::{self, WorkBudget};
    let equation = BivariatePolynomial::new(vec![
        vec![1_i32.into()],
        vec![],
        vec![1_i32.into()],
    ]);
    for config in [
        BivariateTopologyConfig { max_axis_degree: 1, ..Default::default() },
        BivariateTopologyConfig { max_projection_degree: 2, ..Default::default() },
    ] {
        assert_eq!(
            decompose_bivariate_curve(&equation, &domain(), config),
            Err(BivariateTopologyError::DegreeLimit)
        );
    }
    for budget in [WorkBudget::ZERO, WorkBudget { refinements: 100_000, promotions: 1 }] {
        let denied = work_budget::with_budget(budget, || {
            let result = decompose_bivariate_curve(&equation, &domain(), Default::default());
            assert_eq!(result, Err(BivariateTopologyError::BudgetExhausted));
            result
        });
        assert!(denied.result.is_err());
    }
    let recovered = work_budget::with_budget(
        WorkBudget { refinements: 100_000, promotions: 100_000 },
        || decompose_bivariate_curve(&equation, &domain(), Default::default()),
    );
    assert!(recovered.result.unwrap().unwrap().is_empty());
    assert_empty(equation);
}
