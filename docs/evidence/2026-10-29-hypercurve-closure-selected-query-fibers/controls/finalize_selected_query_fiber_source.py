from pathlib import Path
import json,re
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-query-fibers'
focus=json.loads((c/'selected-query-fibers-fix3/complete.json').read_text())
lint=json.loads((c/'selected-query-fibers-preflight-1/complete.json').read_text())
owners=json.loads((c/'selected-query-fibers-owners-1/complete.json').read_text())
assert focus['all_passed'] and focus['groups']==11 and owners['all_passed'] and owners['groups']==3
assert lint['exit_code']==0 and lint['source_stable'] and focus['source']==lint['source']==owners['source']
assert json.loads((c/'selected-query-fibers-operation-baseline1/complete.json').read_text())['expected_failure_reproduced']
def edit(name,old,new):
 p=w/name;s=p.read_text();assert s.count(old)==1,(name,s.count(old),old[:70]);p.write_text(s.replace(old,new,1))
edit('crates/hypercurve/src/polynomial_point/selected_fiber.rs',
'''fn resolve<T>(operation: impl FnOnce() -> field::Result<T>) -> ExactCurveResult<T> {
    ExactCurveError::decided(
        CurveOperation2::Evaluation,
        field::finish(operation).map_err(|cause| {
            ExactCurveError::invalid(
                CurveOperation2::Evaluation,
                crate::CurveFamily2::ImplicitPolynomial,
                cause,
            )
        })?,
    )
}''',
'''fn resolve<T>(kind: CurveOperation2, operation: impl FnOnce() -> field::Result<T>) -> ExactCurveResult<T> {
    ExactCurveError::decided(
        kind,
        field::finish(operation).map_err(|cause| {
            ExactCurveError::invalid(kind, crate::CurveFamily2::ImplicitPolynomial, cause)
        })?,
    )
}''')
p=w/'crates/hypercurve/src/polynomial_point/selected_fiber.rs';s=p.read_text();assert s.count('        resolve(|| {')==2
s=s.replace('        resolve(|| {','        resolve(CurveOperation2::Evaluation, || {',1)
s=s.replace('        resolve(|| {','        resolve(CurveOperation2::Construction, || {',1);p.write_text(s)
edit('crates/hypersolve/src/ordered_field_roots.rs',
'''/// Work limits for division-free ordered-field Bernstein isolation.''',
'''/// Dyadic subdivision and refinement controls for ordered-field root isolation.''')
edit('crates/hypersolve/src/ordered_field_roots.rs',
'''    /// Maximum dyadic subdivision depth before the complete caller fallback.''',
'''    /// Maximum dyadic subdivision depth for a bounded attempt. Bernstein
    /// requests its complete caller fallback; configured Sturm reports
    /// `BudgetExhausted` when this limit prevents a required subdivision.''')
test=w/'crates/hypercurve/tests/polynomial_query_fibers.rs';s=test.read_text()
old='''            let moved = point'''
addition='''            let gap = (Real::one() / Real::from(1_000_000_000_000_u64)).unwrap();
            let nearby_parameter = parameter.affine_image(&Real::one(), &gap).unwrap();
            let nearby = branch.point_at(&nearby_parameter).unwrap();
            assert!(!nearby.coincides_with(&point).unwrap());
            assert_eq!(form(&nearby, x()).subtract(&form(&point, x())).unwrap().compare_to_real(&gap).unwrap(), Ordering::Equal);
            zero(&nearby, equation.clone());
            let moved = point'''
assert s.count(old)==1;s=s.replace(old,addition,1)
original=(c/'selected-query-fibers-operation-baseline1/original.rs').read_text()
new_test=original[original.index('\n#[test]\nfn invalid_query_fiber_preserves_construction_operation'):]
assert new_test not in s;s+=new_test;test.write_text(s)
(c/'polynomial_query_fibers_tests.rs').write_text(s)

specs=[
 ('query_fiber_source_relations','selected_fiber_abscissa_has_independent_exact_relations','u>0, 8u^2=1 and v>0, 16v^3=u; v retains its source query.', [('representation','exact_success','The source relations and rational-query parameter survive without a native Bezier scalar view.')]),
 ('query_fiber_composition','polynomial_branch_consumes_a_nested_selected_fiber_query','The positive branch y^2=x consumes the selected cubic fiber ordinate and its output feeds a second polynomial.', [('evaluation','exact_success','The point satisfies y^2=x, x=v, 2048x^6=1 and y>0.'),('incidence_order','exact_success','The source graph has exactly the retained parameter preimage.'),('exact_replay','exact_success','Definition replay feeds a further y=x^2 evaluation with the original exact value.')]),
 ('query_fiber_depth','selected_query_fiber_respects_the_configured_subdivision_limit','Dependent-fiber discovery with a zero local subdivision-depth limit and an ordinary larger-limit retry.', [('resource_recovery','exhausted','The reached configured depth limit returns BudgetExhausted before publishing a fiber.'),('resource_recovery','exact_success','The same selected parameter succeeds with the default depth and satisfies the original equation.')]),
 ('query_fiber_selectors','selected_query_fibers_keep_opposite_roots_repeated_equations_and_exact_events','Opposite selected roots of (y^2-x)^2, an exact rational ordinate, and malformed singleton requests.', [('representation','exact_success','Repeated equations preserve opposite roots and their zero sum; an exact event remains exact despite untrusted root-count metadata.'),('evaluation','invalid','Multiple roots, rootless and zero equations, false exact-root claims and reversed bounds are rejected.')]),
 ('query_fiber_degree17','selected_query_fibers_admit_degree_seventeen_and_feed_rational_geometry','A degree-seventeen fiber over a retained degree-six abscissa, then an affine point image.', [('evaluation','exact_success','The original y^17=x relation holds and the output feeds an exact affine point with 3X-2Y=5.'),('exact_replay','exact_success','Point-definition replay preserves semantic equality.')]),
 ('query_fiber_domains','selected_query_fibers_preserve_trim_reversal_transform_and_certainty','A quotient of correlated coordinates, selected restrictions, wrong-branch incidence, similarity, near-distinct parameters and changed maps.', [('restriction_reconstruction','exact_success','The selected trim endpoint and reversed endpoint coincide with the evaluated point.'),('incidence_order','exact_success','The opposite branch is absent and a 10^-12 abscissa change remains distinct.'),('transforms','exact_success','Inverse coordinate relations and changed-image queries hold through strict/approximate/strict policy transitions with certified receipts.')]),
 ('query_fiber_work','selected_query_fibers_share_work_limits_and_retry_after_exhaustion','Zero shared refinement/promotion allowance followed by an ordinary retry on the same source.', [('resource_recovery','exhausted','Actual shared work exhaustion remains typed and publishes no complete point.'),('resource_recovery','exact_success','Retry succeeds and satisfies the original polynomial.')]),
 ('query_fiber_mixed','selected_query_fibers_consume_mixed_authored_and_generated_sources','A generated cubic-fiber ordinate plus one quarter of an authored positive sqrt(1/3).', [('evaluation','exact_success','The root fiber consumes the joint query and retains the exact 1/48 squared remainder.'),('exact_replay','exact_success','Definition replay preserves the mixed point.')]),
 ('query_fiber_cold_replay','selected_query_fibers_replay_in_a_fresh_process_and_remain_consumable','A dependent fiber used by a generated line, exact SVG export and cold child-process replay, then another polynomial evaluation.', [('exact_replay','exact_success','Fresh replay preserves defining relations, positive selection, further evaluation and deterministic re-export.'),('resource_recovery','exhausted','Zero point-definition-depth export and import reject the nested dependency.')]),
 ('query_fiber_error_operation','invalid_query_fiber_preserves_construction_operation','A rootless polynomial fiber over a retained query parameter.', [('evaluation','invalid','The error remains Invalid and identifies Construction, matching the public constructor.')]),
]
p=w/'crates/hypercurve/qualification/capabilities.json';d=json.loads(p.read_text());assert len(d['fixtures'])==285
for identifier,test,domain,claims in specs:
 d['fixtures'].append({'id':identifier,'target':'polynomial_query_fibers','test':test,'owner':'Hypercurve polynomial point/source charts; Hypersolve selected fields and ordered-field Sturm isolation','properties':['P2','P14','P18','P19','P20','P26'],'domain':domain,'origins':['authored','generated','selected_implicit'],'families':['ImplicitPolynomial'],'policies':['STRICT','APPROXIMATE_512'] if identifier=='query_fiber_domains' else ['STRICT'],'semantics':'Exact source-bound scalar queries and selected polynomial fibers. Native scalar paths remain supported. This does not claim general implicit-region operations or a total arithmetic/memory bound.','claims':[{'stage':stage,'outcome':outcome,'assertion':assertion} for stage,outcome,assertion in claims],'oracle':'Independent defining equations, exact sign and branch expectations, original guard/selector rejection, and explicit resource-limit outcomes; equality and serialization assertions are separate.','timeout_seconds':180})
p.write_text(json.dumps(d,indent=2)+'\n')
print('Final candidate source, migration documentation and ten capability fixtures prepared.')
