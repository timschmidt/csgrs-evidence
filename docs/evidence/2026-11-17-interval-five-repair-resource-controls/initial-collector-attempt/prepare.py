from pathlib import Path
import hashlib,json,shutil,subprocess,difflib
s=Path(__file__).parent;old=s.parent/'solver-combined-admission';h=s/'consumer';h.mkdir();r=Path('/mnt/development/interval-solver-five-repair/csgrs')
for name in ['main.rs','allocation.rs','stack.c','build.rs']:
 shutil.copy2(old/'chain-resource'/name,h/name)
shutil.copy2(old/'chain-lifetime/main.rs',h/'lifetime.rs')
original=(old/'chain-resource/fixture.rs').read_text();text=original
text=text.replace('use hyperlimit::PredicatePolicy;','use hyperlimit::{Certainty, PredicatePolicy};').replace('use hyperreal::Real;','use hyperreal::{Real, RealSign};')
text=text.replace('    CandidateCertificationReport, CandidateDomainReport, Constraint, DenseLinearBackend,','    CandidateCertificationReport, CandidateDomainReport, CandidateResidualBall, CertifiedCandidateStatus, Constraint, DenseLinearBackend,')
text=text.replace('    EvaluationContext, Expr, LinearAdapterPrecision, LinearBackend, LinearSolveReport, Problem,','    EvaluationContext, Expr, FailedConstraintReport, FailedConstraintStatus, LinearAdapterPrecision, LinearBackend, LinearSolveReport, Problem, ProblemAnalysis,')
text=text.replace('    evaluate_residuals,','    evaluate_residuals, certify_candidate_with_residual_balls, diagnose_failed_constraints_from_certification,')
text=text.replace('    exact_replay: CandidateCertificationReport,','    exact_replay: CandidateCertificationReport,\n    proposed_ball_diagnostics: FailedConstraintReport,\n    exact_ball_diagnostics: FailedConstraintReport,\n    #[cfg(feature = "added")]\n    qualified_ball_diagnostics: Vec<FailedConstraintReport>,')
needle='pub fn operation(f: &Fixture, policy: PredicatePolicy) -> ChainOutput {'
helper='''fn residual_diagnostics(
    analysis: &ProblemAnalysis<'_>,
    context: &EvaluationContext,
    ball_rows: usize,
    policy: PredicatePolicy,
) -> FailedConstraintReport {
    let balls = (0..ball_rows)
        .map(|active_row| CandidateResidualBall { active_row, radius: Real::zero() })
        .collect::<Vec<_>>();
    let certification = certify_candidate_with_residual_balls(analysis, context, &balls, policy);
    diagnose_failed_constraints_from_certification(analysis, certification, -512)
}

'''
assert needle in text;text=text.replace(needle,helper+needle)
needle='    let replay = certify_candidate(&analysis, &context);';assert text.count(needle)==1;text=text.replace(needle,needle+'\n    let proposed_ball_diagnostics = residual_diagnostics(&analysis, &context, 2 * f.variables, policy);')
needle='    let exact_replay = certify_candidate(&analysis, &context);';assert text.count(needle)==1;text=text.replace(needle,needle+'\n    let exact_ball_diagnostics = residual_diagnostics(&analysis, &context, 2 * f.variables, policy);\n    #[cfg(feature = "added")]\n    let mut qualified_ball_diagnostics = Vec::new();')
needle='''            (
                certify_univariate_quadratic_alpha(&problem.analyze(), &context, p),
                certify_candidate_domains(&problem, &context, p),
            )'''
assert text.count(needle)==1;text=text.replace(needle,'''            let original_pair = (
                certify_univariate_quadratic_alpha(&problem.analyze(), &context, p),
                certify_candidate_domains(&problem, &context, p),
            );
            qualified_ball_diagnostics.push(residual_diagnostics(&problem.analyze(), &context, 1, p));
            original_pair''')
needle='        exact_replay,';assert text.count(needle)==1;text=text.replace(needle,needle+'\n        proposed_ball_diagnostics,\n        exact_ball_diagnostics,\n        #[cfg(feature = "added")]\n        qualified_ball_diagnostics,')
needle='    assert!(o.exact_replay.all_satisfied());';assert text.count(needle)==1
addition='''
    for (diagnostic, satisfied) in [(&o.proposed_ball_diagnostics, false), (&o.exact_ball_diagnostics, true)] {
        let certification = &diagnostic.certification;
        assert_eq!(certification.rows.len(), 2 * n);
        assert_eq!(certification.all_satisfied(), satisfied);
        assert_eq!(certification.has_certified_violation(), !satisfied);
        assert_eq!(certification.certified_satisfied_rows, if satisfied { 2 * n } else { 0 });
        assert_eq!(certification.certified_violation_rows, if satisfied { 0 } else { 2 * n });
        assert_eq!(certification.bounded_unknown_rows, 0);
        assert_eq!(certification.domain_failure_rows, 0);
        assert_eq!(certification.lossy_adapter_only_rows, 0);
        assert_eq!(diagnostic.rows.len(), if satisfied { 0 } else { 2 * n });
        assert_eq!(diagnostic.blocking_rows, diagnostic.rows.len());
        assert_eq!(diagnostic.certified_candidate_violations, diagnostic.rows.len());
        assert_eq!(diagnostic.certified_contradictions, 0);
        assert_eq!(diagnostic.bounded_unknown_rows, 0);
        for (i, row) in certification.rows.iter().enumerate() {
            assert_eq!(row.constraint_index, i);
            let CertifiedCandidateStatus::BallCertified { sign, certainty, satisfied: receipt_satisfied } = row.status else { panic!("missing ball receipt") };
            assert!(matches!(certainty, Certainty::Exact | Certainty::Filtered));
            assert_eq!(sign, if satisfied { RealSign::Zero } else { RealSign::Positive });
            assert_eq!(receipt_satisfied, satisfied);
        }
        for row in &diagnostic.rows {
            assert_eq!(row.status, FailedConstraintStatus::CertifiedCandidateViolation);
            assert_eq!(row.certification.as_ref(), Some(&certification.rows[row.constraint_index]));
        }
    }
    #[cfg(feature = "added")]
    {
        assert_eq!(o.qualified_ball_diagnostics.len(), if case == 6 { 3 } else { 0 });
        for (i, diagnostic) in o.qualified_ball_diagnostics.iter().enumerate() {
            let certification = &diagnostic.certification;
            assert_eq!(certification.rows.len(), 2);
            assert!(!certification.all_satisfied());
            assert!(!certification.has_certified_violation());
            let row = &certification.rows[0];
            assert_eq!(row.constraint_index, 0);
            assert!(row.status.is_unknown(), "qualified ball receipt must remain unresolved");
            assert!(!row.status.is_certified_satisfied());
            assert!(!row.status.is_certified_violation());
            if i == 1 {
                assert!(matches!(row.status, CertifiedCandidateStatus::BallCertified { certainty: Certainty::Approximate, sign: RealSign::Zero, satisfied: true }));
            } else {
                assert!(matches!(row.status, CertifiedCandidateStatus::BoundedUnknown { .. }));
            }
            let projected = diagnostic.rows.iter().find(|r| r.constraint_index == 0).unwrap();
            assert_eq!(projected.status, FailedConstraintStatus::BoundedUnknown);
            assert_eq!(projected.certification.as_ref(), Some(row));
        }
    }
'''
text=text.replace(needle,needle+addition);(h/'fixture.rs').write_text(text)
manifest=(old/'chain-resource/Cargo.toml').read_text().replace('solver-combined-chain-resource','solver-five-chain-resource').replace('/mnt/development/interval-solver-combined/csgrs/',str(r)+'/')
manifest=manifest.replace('[features]','[[bin]]\nname = "solver-five-chain-lifetime"\npath = "lifetime.rs"\n\n[features]')
(h/'Cargo.toml').write_text(manifest)
lock=(old/'chain-resource/Cargo.lock').read_text().replace('name = "solver-combined-chain-resource"','name = "solver-five-chain-resource"');(h/'Cargo.lock').write_text(lock)
# Rustfmt is confined to the newly extended fixture, not unchanged monitors.
subprocess.run(['rustfmt','+1.95.0','--edition','2024',str(h/'fixture.rs')],check=True)
(s/'fixture-extension.patch').write_text(''.join(difflib.unified_diff(original.splitlines(keepends=True),(h/'fixture.rs').read_text().splitlines(keepends=True),fromfile='original-chain/fixture.rs',tofile='five-repair-chain/fixture.rs')))
provenance={}
for name,source in [(n,old/'chain-resource'/n) for n in ['main.rs','allocation.rs','stack.c','build.rs']]+[('lifetime.rs',old/'chain-lifetime/main.rs')]:
 assert (h/name).read_bytes()==source.read_bytes();provenance[name]=dict(source=str(source),sha256=hashlib.sha256(source.read_bytes()).hexdigest(),byte_identical=True)
(s/'monitor-provenance.json').write_text(json.dumps(provenance,indent=2)+'\n')
print('Prepared extended fixture and two unchanged resource runners.')
