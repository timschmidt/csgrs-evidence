use hyperlimit::{Certainty, PredicateOutcome, PredicatePolicy, compare_reals};
use hyperreal::Real;
use hypersolve::{
    Constraint, DomainCheckStatus, EvaluationContext, Expr, Problem, certify_candidate_domains,
};

fn terminal_zero() -> Real {
    (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
}

fn main() {
    let mode = std::env::args().nth(1).expect("control or witness");
    let control = mode == "control";
    assert!(control || mode == "witness");
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let value = if control {
            Real::zero()
        } else {
            terminal_zero()
        };
        let predicate = compare_reals(&value, &Real::zero(), policy);
        println!("PREDICATE {policy:?} {predicate:?}");
        if control {
            assert!(matches!(
                predicate,
                PredicateOutcome::Decided {
                    value: std::cmp::Ordering::Equal,
                    certainty: Certainty::Exact | Certainty::Filtered,
                    ..
                }
            ));
        } else if policy == PredicatePolicy::STRICT {
            assert!(matches!(predicate, PredicateOutcome::Unknown { .. }));
        } else {
            assert!(matches!(
                predicate,
                PredicateOutcome::Decided {
                    value: std::cmp::Ordering::Equal,
                    certainty: Certainty::Approximate,
                    ..
                }
            ));
        }
        let mut problem = Problem::default();
        problem.add_constraint(Constraint::equality(
            "sqrt boundary",
            Expr::real(value).sqrt(),
        ));
        hyperreal::dispatch_trace::reset();
        let report = hyperreal::dispatch_trace::with_recording(|| {
            certify_candidate_domains(&problem, &EvaluationContext::new(), policy)
        });
        let trace = hyperreal::dispatch_trace::take_trace();
        println!("REPORT {report:?}");
        println!("TRACE {trace:?}");
        assert_eq!(report.active_constraint_count, 1);
        assert_eq!(report.checks.len(), 1);
        if control {
            assert_eq!(report.checks[0].status, DomainCheckStatus::CertifiedValid);
            assert!(report.all_checks_certified_valid());
        } else {
            assert!(
                !report.all_checks_certified_valid(),
                "a missing exact proof must not be published as certified validity"
            );
            assert_eq!(report.certified_valid_checks, 0);
            assert_eq!(report.certified_invalid_checks, 0);
        }
    }
}
