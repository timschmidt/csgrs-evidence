use hyperlimit::{Certainty, PredicatePolicy};
use hyperreal::{Real, RealSign};
use hypersolve::{
    CandidateResidualBall, CertifiedCandidateStatus, Constraint, ConstraintKind, EvaluationContext,
    Expr, Problem, certify_candidate_with_residual_balls,
};

fn terminal_zero() -> Real {
    (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
}

fn main() {
    let args: Vec<_> = std::env::args().skip(1).collect();
    assert_eq!(args.len(), 2);
    let control = args[0] == "control";
    assert!(control || args[0] == "witness");
    let case: usize = args[1].parse().unwrap();
    assert!(case < 8);
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let tiny = Real::from(2).powi_i64(-2048).unwrap();
        let exact = if case.is_multiple_of(2) { tiny } else { -tiny };
        let value = if control {
            exact
        } else {
            terminal_zero() + exact
        };
        let kind = match case / 2 {
            0 => ConstraintKind::Equality,
            1 => ConstraintKind::Soft,
            2 => ConstraintKind::LessOrEqual,
            3 => ConstraintKind::GreaterOrEqual,
            _ => unreachable!(),
        };
        let mut problem = Problem::default();
        problem.add_constraint(Constraint {
            name: "residual certainty witness".to_owned(),
            kind,
            residual: Expr::real(value),
            weight: Real::one(),
            active: true,
        });
        hyperreal::dispatch_trace::reset();
        let report = hyperreal::dispatch_trace::with_recording(|| {
            certify_candidate_with_residual_balls(
                &problem.analyze(),
                &EvaluationContext::default(),
                &[CandidateResidualBall {
                    active_row: 0,
                    radius: Real::zero(),
                }],
                policy,
            )
        });
        let trace = hyperreal::dispatch_trace::take_trace();
        assert_eq!(report.rows.len(), 1);
        let status = &report.rows[0].status;
        println!("case={case} policy={policy:?} status={status:?}");
        println!(
            "counts satisfied={} violation={} unknown={} domain={} all_satisfied={} has_violation={} only_uncertainty={}",
            report.certified_satisfied_rows,
            report.certified_violation_rows,
            report.bounded_unknown_rows,
            report.domain_failure_rows,
            report.all_satisfied(),
            report.has_certified_violation(),
            report.has_only_uncertainty()
        );
        println!("TRACE {trace:?}");
        if control {
            let satisfied = (case / 2 == 2 && !case.is_multiple_of(2))
                || (case / 2 == 3 && case.is_multiple_of(2));
            assert!(matches!(
                status,
                CertifiedCandidateStatus::BallCertified {
                    certainty: Certainty::Exact | Certainty::Filtered,
                    ..
                }
            ));
            assert_eq!(report.all_satisfied(), satisfied);
            assert_eq!(report.has_certified_violation(), !satisfied);
            assert_eq!(report.bounded_unknown_rows, 0);
        } else {
            if policy == PredicatePolicy::STRICT {
                assert!(matches!(
                    status,
                    CertifiedCandidateStatus::BoundedUnknown { .. }
                ));
            } else {
                assert!(matches!(
                    status,
                    CertifiedCandidateStatus::BallCertified {
                        sign: RealSign::Zero,
                        certainty: Certainty::Approximate,
                        satisfied: true
                    }
                ));
            }
            assert_eq!(
                report.certified_satisfied_rows + report.certified_violation_rows,
                0,
                "approximate or unknown evidence must not count as an exact residual certificate"
            );
            assert!(!status.is_certified_satisfied());
            assert!(!status.is_certified_violation());
            assert!(status.is_unknown());
            assert!(!report.all_satisfied());
            assert!(!report.has_certified_violation());
            assert!(report.has_only_uncertainty());
        }
    }
}
