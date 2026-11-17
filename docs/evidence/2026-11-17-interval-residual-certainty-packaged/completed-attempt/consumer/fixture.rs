use hyperlimit::{Certainty, PredicatePolicy};
use hyperreal::{Real, RealSign};
use hypersolve::{
    CandidateCertificationReport, CandidateResidualBall, CertifiedCandidateStatus, Constraint,
    ConstraintKind, EvaluationContext, Expr, FailedConstraintReport,
    IntervalBoxCertificationPackage, IntervalBoxCertificationReport,
    IntervalBoxCertificationStatus, Problem, SymbolId, certify_candidate_with_residual_balls,
    certify_interval_box_candidate, context_from_problem,
    diagnose_failed_constraints_from_certification,
};

pub struct Fixture {
    pub problem: Problem,
    pub context: EvaluationContext,
    pub balls: Vec<CandidateResidualBall>,
}

#[derive(Debug)]
pub enum Report {
    Direct(CandidateCertificationReport),
    Box(IntervalBoxCertificationReport),
    Diagnostic(FailedConstraintReport),
}
impl Report {
    pub fn certification(&self) -> &CandidateCertificationReport {
        match self {
            Self::Direct(r) => r,
            Self::Box(r) => r
                .certification
                .as_ref()
                .expect("valid fixture produces a report"),
            Self::Diagnostic(r) => &r.certification,
        }
    }
    pub fn all_satisfied(&self) -> bool {
        self.certification().all_satisfied()
    }
    pub fn has_violation(&self) -> bool {
        self.certification().has_certified_violation()
    }
}

fn terminal_zero() -> Real {
    (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin()
}
fn kind(i: usize) -> ConstraintKind {
    match i % 4 {
        0 => ConstraintKind::Equality,
        1 => ConstraintKind::Soft,
        2 => ConstraintKind::LessOrEqual,
        _ => ConstraintKind::GreaterOrEqual,
    }
}
fn constraint(kind: ConstraintKind, value: Expr) -> Constraint {
    Constraint {
        name: "resource row".to_owned(),
        kind,
        residual: value,
        weight: Real::one(),
        active: true,
    }
}
fn tiny(positive: bool) -> Real {
    let value = Real::from(2).powi_i64(-2048).unwrap();
    if positive { value } else { -value }
}

pub fn fixture(case: usize) -> Fixture {
    assert!(case < 120);
    let n = case % 40;
    let mut problem = Problem::default();
    let mut balls = vec![CandidateResidualBall {
        active_row: 0,
        radius: Real::zero(),
    }];
    let row = match n {
        0..=7 => constraint(kind(n / 2), Expr::real(tiny(n.is_multiple_of(2)))),
        8..=11 => constraint(kind(n - 8), Expr::zero()),
        12..=15 => {
            balls[0].radius = Real::one();
            constraint(kind(n - 12), Expr::real(Real::pi()))
        }
        16 => {
            balls[0].radius = Real::from(-1);
            constraint(ConstraintKind::Equality, Expr::zero())
        }
        17 => {
            balls.clear();
            return Fixture {
                context: context_from_problem(&problem),
                problem,
                balls,
            };
        }
        18 => constraint(
            ConstraintKind::Equality,
            Expr::symbol(SymbolId(9), "missing"),
        ),
        19 => {
            let mut inactive = constraint(ConstraintKind::Equality, Expr::int(-1).sqrt());
            inactive.active = false;
            problem.add_constraint(inactive);
            let x = problem.add_variable("x", Real::from(3));
            constraint(ConstraintKind::Equality, Expr::symbol(x.into(), "x"))
        }
        20 | 21 => {
            balls[0].radius = Real::from(if n == 20 { -1 } else { 0 });
            balls.push(CandidateResidualBall {
                active_row: 0,
                radius: Real::from(if n == 20 { 0 } else { -1 }),
            });
            constraint(ConstraintKind::Equality, Expr::zero())
        }
        22 | 31 => {
            balls[0].active_row = 99;
            balls[0].radius = Real::from(if n == 31 { -1 } else { 0 });
            constraint(ConstraintKind::Equality, Expr::zero())
        }
        23 => {
            balls[0].radius = Real::one();
            constraint(ConstraintKind::Equality, Expr::zero())
        }
        24 | 25 => constraint(
            if n == 24 {
                ConstraintKind::Equality
            } else {
                ConstraintKind::LessOrEqual
            },
            Expr::real(terminal_zero() + tiny(n == 24)),
        ),
        26..=28 => {
            let count = match n {
                26 => 1,
                27 => 16,
                _ => 128,
            };
            balls.clear();
            for i in 0..count {
                problem.add_constraint(constraint(
                    ConstraintKind::LessOrEqual,
                    Expr::int(-(i as i64) - 1),
                ));
                balls.push(CandidateResidualBall {
                    active_row: i,
                    radius: Real::zero(),
                });
            }
            return Fixture {
                context: context_from_problem(&problem),
                problem,
                balls,
            };
        }
        29 => constraint(
            ConstraintKind::LessOrEqual,
            Expr::real(Real::from(2).sqrt().unwrap() - Real::from(2)),
        ),
        30 => constraint(ConstraintKind::Equality, Expr::int(1) / Expr::zero()),
        32..=39 => constraint(
            kind((n - 32) / 2),
            Expr::real(terminal_zero() + tiny(n.is_multiple_of(2))),
        ),
        _ => unreachable!(),
    };
    problem.add_constraint(row);
    Fixture {
        context: context_from_problem(&problem),
        problem,
        balls,
    }
}

pub fn operation(case: usize, f: &Fixture, policy: PredicatePolicy) -> Report {
    let analysis = f.problem.analyze();
    match case / 40 {
        0 => Report::Direct(certify_candidate_with_residual_balls(
            &analysis, &f.context, &f.balls, policy,
        )),
        1 => Report::Box(certify_interval_box_candidate(
            &analysis,
            &f.context,
            &[],
            IntervalBoxCertificationPackage::Affine,
            policy,
        )),
        2 => {
            let report =
                certify_candidate_with_residual_balls(&analysis, &f.context, &f.balls, policy);
            Report::Diagnostic(diagnose_failed_constraints_from_certification(
                &analysis, report, -512,
            ))
        }
        _ => unreachable!(),
    }
}

pub fn validate(case: usize, policy: PredicatePolicy, report: &Report) {
    let n = case % 40;
    let r = report.certification();
    let unknown = matches!(n, 23..=25 | 32..=39);
    let invalid = matches!(n, 16 | 18 | 21 | 30);
    let empty = n == 17;
    let rows = match n {
        17 => 0,
        27 => 16,
        28 => 128,
        _ => 1,
    };
    assert_eq!(r.rows.len(), rows);
    assert_eq!(r.lossy_adapter_only_rows, 0);
    let satisfied = match n {
        0..=7 => (n / 2 == 2 && !n.is_multiple_of(2)) || (n / 2 == 3 && n.is_multiple_of(2)),
        8..=11 | 20 | 22 | 26..=29 | 31 => true,
        12..=15 => n == 15,
        _ => false,
    };
    assert_eq!(r.certified_satisfied_rows, if satisfied { rows } else { 0 });
    assert_eq!(
        r.certified_violation_rows,
        if !satisfied && !unknown && !invalid && !empty {
            rows
        } else {
            0
        }
    );
    assert_eq!(r.bounded_unknown_rows, usize::from(unknown));
    assert_eq!(r.domain_failure_rows, usize::from(invalid));
    assert_eq!(r.all_satisfied(), satisfied && !empty);
    assert_eq!(r.has_only_uncertainty(), unknown);
    for (i, row) in r.rows.iter().enumerate() {
        assert_eq!(row.constraint_index, if n == 19 { 1 } else { i });
        if n >= 32 {
            assert_eq!(policy, PredicatePolicy::APPROXIMATE_512);
            assert!(matches!(
                row.status,
                CertifiedCandidateStatus::BallCertified {
                    certainty: Certainty::Approximate,
                    sign: RealSign::Zero,
                    satisfied: true
                }
            ));
        }
        if n == 24 || n == 25 {
            assert_eq!(policy, PredicatePolicy::STRICT);
            assert!(matches!(
                row.status,
                CertifiedCandidateStatus::BoundedUnknown { .. }
            ));
        }
        if n == 16 || n == 21 {
            assert_eq!(row.status, CertifiedCandidateStatus::InvalidBallRadius);
        }
        if n == 18 || n == 30 {
            assert!(matches!(
                row.status,
                CertifiedCandidateStatus::DomainFailure { .. }
            ));
        }
    }
    if let Report::Box(b) = report {
        assert_eq!(
            b.status,
            if r.all_satisfied() {
                IntervalBoxCertificationStatus::Certified
            } else if r.has_certified_violation() {
                IntervalBoxCertificationStatus::Violation
            } else {
                IntervalBoxCertificationStatus::Unknown
            }
        );
    }
    if let Report::Diagnostic(d) = report {
        assert_eq!(d.bounded_unknown_rows, usize::from(unknown));
        if unknown {
            assert_eq!(d.rows.len(), 1);
            assert_eq!(d.rows[0].certification.as_ref(), Some(&r.rows[0]));
        }
    }
}
