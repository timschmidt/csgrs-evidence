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

fn fixture(case: usize, control: bool) -> (Expr, Real, Real, bool) {
    let zero = if control {
        Real::zero()
    } else {
        terminal_zero()
    };
    let one = Real::one();
    let tiny = Real::from(2).powi_i64(-2048).unwrap();
    let (value, threshold, valid) = match case {
        0..=2 | 4 | 5 => (zero, Real::zero(), false),
        3 => (zero, Real::zero(), true),
        6 => (zero - &one, -one.clone(), true),
        7 | 8 => (zero + &one, one, true),
        9 => (zero + &one, one, false),
        10 => (zero + tiny, Real::zero(), true),
        11 => (zero - tiny, Real::zero(), false),
        _ => panic!("case"),
    };
    let x = Expr::real(value.clone());
    let residual = match case {
        0 | 10 => Expr::int(1) / x,
        1 => x.powi(-1),
        2 => x.powi(0),
        3 | 11 => x.sqrt(),
        4 => x.log10(),
        5 => x.ln(),
        6 => x.asin(),
        7 => x.acos(),
        8 => x.acosh(),
        9 => x.atanh(),
        _ => unreachable!(),
    };
    (residual, value, threshold, valid)
}

fn verify(control: bool, case: usize) {
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
        let (residual, value, threshold, valid) = fixture(case, control);
        let predicate = compare_reals(&value, &threshold, policy);
        println!("PREDICATE case={case} policy={policy:?} outcome={predicate:?}");
        if control {
            assert!(matches!(
                predicate,
                PredicateOutcome::Decided {
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
        problem.add_constraint(Constraint::equality("domain receipt", residual));
        hyperreal::dispatch_trace::reset();
        let report = hyperreal::dispatch_trace::with_recording(|| {
            certify_candidate_domains(&problem, &EvaluationContext::default(), policy)
        });
        let trace = hyperreal::dispatch_trace::take_trace();
        assert_eq!(report.active_constraint_count, 1);
        assert_eq!(report.checks.len(), 1);
        let check = &report.checks[0];
        assert_eq!(check.constraint_index, 0);
        assert_eq!(check.constraint_name, "domain receipt");
        assert!(check.operand.is_some());
        println!(
            "CHECK kind={:?} path={} status={:?} mathematically_valid={valid}",
            check.kind, check.expression_path, check.status
        );
        println!(
            "COUNTS {} {} {} {}",
            report.certified_valid_checks,
            report.certified_invalid_checks,
            report.unknown_checks,
            report.evaluation_failure_checks
        );
        println!("TRACE {trace:?}");
        if control {
            assert_eq!(
                check.status,
                if valid {
                    DomainCheckStatus::CertifiedValid
                } else {
                    DomainCheckStatus::CertifiedInvalid
                }
            );
            assert_eq!(report.all_checks_certified_valid(), valid);
            assert_eq!(report.has_certified_invalid_domain(), !valid);
        } else {
            assert_eq!(
                report.certified_valid_checks + report.certified_invalid_checks,
                0,
                "an unknown or approximate predicate cannot be counted as an exact domain proof"
            );
            assert!(!report.all_checks_certified_valid());
            assert!(!report.has_certified_invalid_domain());
        }
    }
}

#[test]
fn control_0() {
    verify(true, 0);
}

#[test]
fn receipt_0() {
    verify(false, 0);
}

#[test]
fn control_1() {
    verify(true, 1);
}

#[test]
fn receipt_1() {
    verify(false, 1);
}

#[test]
fn control_2() {
    verify(true, 2);
}

#[test]
fn receipt_2() {
    verify(false, 2);
}

#[test]
fn control_3() {
    verify(true, 3);
}

#[test]
fn receipt_3() {
    verify(false, 3);
}

#[test]
fn control_4() {
    verify(true, 4);
}

#[test]
fn receipt_4() {
    verify(false, 4);
}

#[test]
fn control_5() {
    verify(true, 5);
}

#[test]
fn receipt_5() {
    verify(false, 5);
}

#[test]
fn control_6() {
    verify(true, 6);
}

#[test]
fn receipt_6() {
    verify(false, 6);
}

#[test]
fn control_7() {
    verify(true, 7);
}

#[test]
fn receipt_7() {
    verify(false, 7);
}

#[test]
fn control_8() {
    verify(true, 8);
}

#[test]
fn receipt_8() {
    verify(false, 8);
}

#[test]
fn control_9() {
    verify(true, 9);
}

#[test]
fn receipt_9() {
    verify(false, 9);
}

#[test]
fn control_10() {
    verify(true, 10);
}

#[test]
fn receipt_10() {
    verify(false, 10);
}

#[test]
fn control_11() {
    verify(true, 11);
}

#[test]
fn receipt_11() {
    verify(false, 11);
}
