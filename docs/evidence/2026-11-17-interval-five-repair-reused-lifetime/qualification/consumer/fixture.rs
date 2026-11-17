use hyperlimit::{Certainty, PredicatePolicy};
use hyperreal::{Real, RealSign};
use hypersolve::jacobian::{FiniteDifferenceConfig, finite_difference_jacobian};
use hypersolve::{
    CandidateCertificationReport, CandidateDomainReport, CandidateResidualBall,
    CertifiedCandidateStatus, Constraint, DenseLinearBackend, EvaluationContext, Expr,
    FailedConstraintReport, FailedConstraintStatus, LinearAdapterPrecision, LinearBackend,
    LinearSolveReport, Problem, ProblemAnalysis, SymbolId, UnivariateQuadraticAlphaReport,
    UnivariateQuadraticAlphaStatus, certify_candidate, certify_candidate_domains,
    certify_candidate_with_residual_balls, certify_univariate_quadratic_alpha,
    context_from_problem, diagnose_failed_constraints_from_certification, evaluate_residuals,
};

pub struct Fixture {
    #[cfg(feature = "added")]
    pub case: usize,
    pub problem: Problem,
    pub context: EvaluationContext,
    pub variables: usize,
}

pub fn fixture(case: usize) -> Fixture {
    let variables = match case {
        0 | 4..=6 => 1,
        1 => 4,
        2 => 16,
        3 => 64,
        _ => panic!("case"),
    };
    assert!(case < 4 || cfg!(feature = "added"));
    let mut problem = Problem::default();
    for i in 0..variables {
        let name = format!("x{i}");
        let id = problem.add_variable(&name, Real::from(if case == 4 { 1 } else { 3 }));
        let x = Expr::symbol(SymbolId(id.0), &name);
        problem.add_constraint(Constraint::equality(
            format!("quadratic{i}"),
            x.clone().powi(2) - Expr::int(4),
        ));
        problem.add_constraint(Constraint::equality(
            format!("logarithmic{i}"),
            x.ln() - Expr::int(2).ln(),
        ));
    }
    let mut context = context_from_problem(&problem);
    if case == 4 {
        context.bind(SymbolId(0), Real::from(3));
    }
    Fixture {
        #[cfg(feature = "added")]
        case,
        problem,
        context,
        variables,
    }
}

#[derive(Debug)]
pub struct ChainOutput {
    jacobian: Vec<Vec<f64>>,
    residuals: Vec<f64>,
    step: Vec<f64>,
    linear: LinearSolveReport,
    proposed_values: Vec<Real>,
    domain: CandidateDomainReport,
    alpha: UnivariateQuadraticAlphaReport,
    replay: CandidateCertificationReport,
    exact_alpha: UnivariateQuadraticAlphaReport,
    exact_replay: CandidateCertificationReport,
    proposed_ball_diagnostics: FailedConstraintReport,
    exact_ball_diagnostics: FailedConstraintReport,
    #[cfg(feature = "added")]
    qualified_ball_diagnostics: Vec<FailedConstraintReport>,
    #[cfg(feature = "added")]
    qualified: Vec<(UnivariateQuadraticAlphaReport, CandidateDomainReport)>,
    #[cfg(feature = "added")]
    qualified_replay: Option<CandidateCertificationReport>,
}

fn residual_diagnostics(
    analysis: &ProblemAnalysis<'_>,
    context: &EvaluationContext,
    ball_rows: usize,
    policy: PredicatePolicy,
) -> FailedConstraintReport {
    let balls = (0..ball_rows)
        .map(|active_row| CandidateResidualBall {
            active_row,
            radius: Real::zero(),
        })
        .collect::<Vec<_>>();
    let certification = certify_candidate_with_residual_balls(analysis, context, &balls, policy);
    diagnose_failed_constraints_from_certification(analysis, certification, -512)
}

pub fn operation(f: &Fixture, policy: PredicatePolicy) -> ChainOutput {
    let generation = f.context.generation();
    let jacobian = finite_difference_jacobian(
        &f.problem,
        &f.context,
        FiniteDifferenceConfig { step: Real::one() },
    )
    .unwrap();
    let residuals = evaluate_residuals(&f.problem, &f.context)
        .unwrap()
        .into_iter()
        .map(|r| r.weighted_dense_solver_estimate.unwrap())
        .collect::<Vec<_>>();
    let backend = DenseLinearBackend;
    #[cfg(feature = "added")]
    if f.case == 5 {
        assert_eq!(
            backend
                .solve_damped_normal(&[vec![f64::NAN]], &[1.0], 0.0)
                .unwrap_err(),
            hypersolve::LinearSolveError::NonFiniteInput
        );
    }
    let (step, linear) = backend
        .solve_damped_normal(&jacobian, &residuals, 0.0)
        .unwrap();
    let proposed_values = step
        .iter()
        .map(|v| Real::from(3) + Real::try_from(*v).unwrap())
        .collect::<Vec<_>>();
    let mut context = f.context.clone();
    for (i, value) in proposed_values.iter().enumerate() {
        context.bind(SymbolId(i as u32), value.clone());
    }
    let analysis = f.problem.analyze();
    let domain = certify_candidate_domains(&f.problem, &context, policy);
    let alpha = certify_univariate_quadratic_alpha(&analysis, &context, policy);
    let replay = certify_candidate(&analysis, &context);
    let proposed_ball_diagnostics =
        residual_diagnostics(&analysis, &context, 2 * f.variables, policy);
    for i in 0..f.variables {
        context.bind(SymbolId(i as u32), Real::from(2));
    }
    let exact_alpha = certify_univariate_quadratic_alpha(&analysis, &context, policy);
    let exact_replay = certify_candidate(&analysis, &context);
    let exact_ball_diagnostics = residual_diagnostics(&analysis, &context, 2 * f.variables, policy);
    #[cfg(feature = "added")]
    let mut qualified_ball_diagnostics = Vec::new();
    assert_eq!(f.context.generation(), generation);
    #[cfg(feature = "added")]
    let (qualified, qualified_replay) = if f.case == 6 {
        let zero = (Real::e() + Real::one()).sin()
            - Real::e().sin() * Real::one().cos()
            - Real::e().cos() * Real::one().sin();
        let mut problem = Problem::default();
        problem.add_variable("x0", Real::one());
        problem.add_constraint(Constraint::equality(
            "near quadratic",
            Expr::symbol(SymbolId(0), "x0").powi(2) - Expr::int(4)
                + Expr::real(zero.clone() + Real::from(2).powi_i64(-600).unwrap()),
        ));
        problem.add_constraint(Constraint::equality(
            "qualified domain",
            Expr::real(zero).sqrt(),
        ));
        let reports = [
            PredicatePolicy::STRICT,
            PredicatePolicy::APPROXIMATE_512,
            PredicatePolicy::STRICT,
        ]
        .into_iter()
        .map(|p| {
            let original_pair = (
                certify_univariate_quadratic_alpha(&problem.analyze(), &context, p),
                certify_candidate_domains(&problem, &context, p),
            );
            qualified_ball_diagnostics.push(residual_diagnostics(
                &problem.analyze(),
                &context,
                1,
                p,
            ));
            original_pair
        })
        .collect();
        (
            reports,
            Some(certify_candidate(&problem.analyze(), &context)),
        )
    } else {
        (Vec::new(), None)
    };
    ChainOutput {
        jacobian,
        residuals,
        step,
        linear,
        proposed_values,
        domain,
        alpha,
        replay,
        exact_alpha,
        exact_replay,
        proposed_ball_diagnostics,
        exact_ball_diagnostics,
        #[cfg(feature = "added")]
        qualified_ball_diagnostics,
        #[cfg(feature = "added")]
        qualified,
        #[cfg(feature = "added")]
        qualified_replay,
    }
}

pub fn validate(case: usize, _policy: PredicatePolicy, o: &ChainOutput) {
    let n = match case {
        0 | 4..=6 => 1,
        1 => 4,
        2 => 16,
        3 => 64,
        _ => panic!("case"),
    };
    assert_eq!(o.jacobian.len(), 2 * n);
    assert_eq!(o.residuals.len(), 2 * n);
    for i in 0..n {
        assert_eq!(o.residuals[2 * i], 5.0);
        assert!(o.residuals[2 * i + 1] > 0.0);
        assert_eq!(o.jacobian[2 * i].len(), n);
        assert_eq!(o.jacobian[2 * i + 1].len(), n);
        for j in 0..n {
            assert_eq!(o.jacobian[2 * i][j], if i == j { 7.0 } else { 0.0 });
            if i == j {
                assert!(o.jacobian[2 * i + 1][j] > 0.0);
            } else {
                assert_eq!(o.jacobian[2 * i + 1][j], 0.0);
            }
        }
    }
    assert_eq!(o.linear.precision(), LinearAdapterPrecision::LossyF64);
    assert!(o.linear.is_lossy());
    assert_eq!(o.step.len(), n);
    assert_eq!(o.proposed_values.len(), n);
    for (step, value) in o.step.iter().zip(&o.proposed_values) {
        assert!(step.is_finite() && *step > -1.0 && *step < -0.5);
        assert_eq!(*value, Real::from(3) + Real::try_from(*step).unwrap());
    }
    assert_eq!(o.domain.checks.len(), 2 * n);
    assert!(o.domain.all_checks_certified_valid());
    for (i, checks) in o.domain.checks.chunks_exact(2).enumerate() {
        assert_eq!(checks[0].constraint_index, 2 * i + 1);
        assert_eq!(checks[1].constraint_index, 2 * i + 1);
        assert_eq!(checks[0].expression_path, "$.left.arg");
        assert_eq!(checks[1].expression_path, "$.right.arg");
    }
    assert_eq!(o.alpha.examined_rows, n);
    assert_eq!(o.alpha.rows.len(), n);
    assert_eq!(o.alpha.certified_rows, n);
    for (i, row) in o.alpha.rows.iter().enumerate() {
        assert_eq!(row.constraint_index, 2 * i);
        assert_eq!(row.symbol, SymbolId(i as u32));
    }
    assert!(
        o.alpha
            .rows
            .iter()
            .all(|r| r.status == UnivariateQuadraticAlphaStatus::CertifiedSmaleAlphaBound)
    );
    assert!(!o.replay.all_satisfied());
    assert!(o.replay.has_certified_violation());
    assert_eq!(o.exact_alpha.examined_rows, n);
    assert_eq!(o.exact_alpha.rows.len(), n);
    assert_eq!(o.exact_alpha.certified_rows, n);
    assert!(
        o.exact_alpha
            .rows
            .iter()
            .all(|r| r.status == UnivariateQuadraticAlphaStatus::ExactSimpleRoot)
    );
    assert!(o.exact_replay.all_satisfied());
    for (diagnostic, satisfied) in [
        (&o.proposed_ball_diagnostics, false),
        (&o.exact_ball_diagnostics, true),
    ] {
        let certification = &diagnostic.certification;
        assert_eq!(certification.rows.len(), 2 * n);
        assert_eq!(certification.all_satisfied(), satisfied);
        assert_eq!(certification.has_certified_violation(), !satisfied);
        assert_eq!(
            certification.certified_satisfied_rows,
            if satisfied { 2 * n } else { 0 }
        );
        assert_eq!(
            certification.certified_violation_rows,
            if satisfied { 0 } else { 2 * n }
        );
        assert_eq!(certification.bounded_unknown_rows, 0);
        assert_eq!(certification.domain_failure_rows, 0);
        assert_eq!(certification.lossy_adapter_only_rows, 0);
        assert_eq!(diagnostic.rows.len(), if satisfied { 0 } else { 2 * n });
        assert_eq!(diagnostic.blocking_rows, diagnostic.rows.len());
        assert_eq!(
            diagnostic.certified_candidate_violations,
            diagnostic.rows.len()
        );
        assert_eq!(diagnostic.certified_contradictions, 0);
        assert_eq!(diagnostic.bounded_unknown_rows, 0);
        for (i, row) in certification.rows.iter().enumerate() {
            assert_eq!(row.constraint_index, i);
            let CertifiedCandidateStatus::BallCertified {
                sign,
                certainty,
                satisfied: receipt_satisfied,
            } = row.status
            else {
                panic!("missing ball receipt")
            };
            assert!(matches!(certainty, Certainty::Exact | Certainty::Filtered));
            assert_eq!(
                sign,
                if satisfied {
                    RealSign::Zero
                } else {
                    RealSign::Positive
                }
            );
            assert_eq!(receipt_satisfied, satisfied);
        }
        for row in &diagnostic.rows {
            assert_eq!(
                row.status,
                FailedConstraintStatus::CertifiedCandidateViolation
            );
            assert_eq!(
                row.certification.as_ref(),
                Some(&certification.rows[row.constraint_index])
            );
        }
    }
    #[cfg(feature = "added")]
    {
        assert_eq!(
            o.qualified_ball_diagnostics.len(),
            if case == 6 { 3 } else { 0 }
        );
        for (i, diagnostic) in o.qualified_ball_diagnostics.iter().enumerate() {
            let certification = &diagnostic.certification;
            assert_eq!(certification.rows.len(), 2);
            assert!(!certification.all_satisfied());
            assert!(!certification.has_certified_violation());
            let row = &certification.rows[0];
            assert_eq!(row.constraint_index, 0);
            assert!(
                row.status.is_unknown(),
                "qualified ball receipt must remain unresolved"
            );
            assert!(!row.status.is_certified_satisfied());
            assert!(!row.status.is_certified_violation());
            if i == 1 {
                assert!(matches!(
                    row.status,
                    CertifiedCandidateStatus::BallCertified {
                        certainty: Certainty::Approximate,
                        sign: RealSign::Zero,
                        satisfied: true
                    }
                ));
            } else {
                assert!(matches!(
                    row.status,
                    CertifiedCandidateStatus::BoundedUnknown { .. }
                ));
            }
            let projected = diagnostic
                .rows
                .iter()
                .find(|r| r.constraint_index == 0)
                .unwrap();
            assert_eq!(projected.status, FailedConstraintStatus::BoundedUnknown);
            assert_eq!(projected.certification.as_ref(), Some(row));
        }
    }

    #[cfg(feature = "added")]
    {
        assert_eq!(o.qualified.len(), if case == 6 { 3 } else { 0 });
        for (i, (alpha, domain)) in o.qualified.iter().enumerate() {
            assert_eq!(alpha.examined_rows, 1);
            assert_eq!(
                alpha.rows[0].status,
                UnivariateQuadraticAlphaStatus::CertifiedSmaleAlphaBound
            );
            assert_eq!(domain.checks.len(), 1);
            assert!(!domain.all_checks_certified_valid());
            assert!(!domain.has_certified_invalid_domain());
            assert_eq!(domain.approximate_checks(), usize::from(i == 1));
            assert_eq!(
                domain.checks[0].status,
                if i == 1 {
                    hypersolve::DomainCheckStatus::Approximate {
                        valid: true,
                        stage: hyperlimit::Escalation::Refined,
                    }
                } else {
                    hypersolve::DomainCheckStatus::Unknown
                }
            );
        }
        assert_eq!(o.qualified_replay.is_some(), case == 6);
        if let Some(report) = &o.qualified_replay {
            assert!(!report.all_satisfied());
        }
    }
}
