from pathlib import Path
import json
r=Path(__file__).resolve().parents[1];c=r/'controls';w=r/'selected-query-fibers'
baseline=json.loads((c/'selected-query-fibers-fix2/complete.json').read_text())
assert baseline['statuses']==[0,0,0,0,101]
def edit(name,old,new):
    p=w/name;s=p.read_text();assert s.count(old)==1,(name,s.count(old),old[:70]);p.write_text(s.replace(old,new,1))
edit('crates/hypersolve/src/ordered_field_roots.rs',
'pub use complete::isolate_ordered_field_polynomial_roots_complete;',
'''pub use complete::{
    isolate_ordered_field_polynomial_roots_complete,
    isolate_ordered_field_polynomial_roots_complete_with_config,
};''')
edit('crates/hypersolve/src/lib.rs',
'    isolate_ordered_field_polynomial_roots, isolate_ordered_field_polynomial_roots_complete,',
'''    isolate_ordered_field_polynomial_roots, isolate_ordered_field_polynomial_roots_complete,
    isolate_ordered_field_polynomial_roots_complete_with_config,''')
edit('crates/hypersolve/src/ordered_field_roots.rs',
'    /// The enclosing operation budget declined a required subdivision.\n    BudgetExhausted,',
'''    /// The enclosing work budget or configured Sturm subdivision-depth limit
    /// declined a required subdivision. No partial roots are published.
    BudgetExhausted,''')
name='crates/hypersolve/src/ordered_field_roots/complete.rs'
edit(name,'    refinements: usize,\n','    refinements: usize,\n    depth: usize,\n')
signature='''pub fn isolate_ordered_field_polynomial_roots_complete<C, F>(
    mut polynomial: Vec<C>,
    lower: &Real,
    upper: &Real,
    refinement_steps: usize,
    field: &mut F,
) -> Result<OrderedFieldRootIsolationReport, F::Error>
where
    C: Clone,
    F: OrderedFieldPolynomialContext<C>,
{'''
replacement='''pub fn isolate_ordered_field_polynomial_roots_complete<C, F>(
    polynomial: Vec<C>,
    lower: &Real,
    upper: &Real,
    refinement_steps: usize,
    field: &mut F,
) -> Result<OrderedFieldRootIsolationReport, F::Error>
where
    C: Clone,
    F: OrderedFieldPolynomialContext<C>,
{
    isolate(polynomial, lower, upper, refinement_steps, None, field)
}

/// Runs the same complete Sturm algorithm with a local subdivision-depth limit.
///
/// The configured depth applies to separation and requested refinement in each
/// segment between discovered exact roots, as for native algebraic fibers.
/// Discovering an exact root creates new segments; this depth limit is not a
/// bound on total subdivisions or on arithmetic, coefficient size or memory.
/// Shared work accounting remains active across all segments and nested calls.
/// Reaching the depth limit returns `BudgetExhausted` without partial output;
/// a later larger-limit retry remains valid. The unrestricted entry point keeps
/// its existing behavior and shares this implementation.
pub fn isolate_ordered_field_polynomial_roots_complete_with_config<C, F>(
    polynomial: Vec<C>,
    lower: &Real,
    upper: &Real,
    config: OrderedFieldRootIsolationConfig,
    field: &mut F,
) -> Result<OrderedFieldRootIsolationReport, F::Error>
where
    C: Clone,
    F: OrderedFieldPolynomialContext<C>,
{
    isolate(polynomial, lower, upper, config.refinement_steps, Some(config.max_subdivision_depth), field)
}

fn isolate<C, F>(
    mut polynomial: Vec<C>,
    lower: &Real,
    upper: &Real,
    refinement_steps: usize,
    depth_limit: Option<usize>,
    field: &mut F,
) -> Result<OrderedFieldRootIsolationReport, F::Error>
where
    C: Clone,
    F: OrderedFieldPolynomialContext<C>,
{'''
edit(name,signature,replacement)
edit(name,'                refinements: 0,\n','                refinements: 0,\n                depth: 0,\n')
edit(name,'''                if crate::work_budget::consume(crate::work_budget::WorkKind::RootRefinement, 1)''',
'''                if depth_limit.is_some_and(|limit| node.depth >= limit) {
                    return Ok(finish(Status::BudgetExhausted, Vec::new(), steps));
                }
                if crate::work_budget::consume(crate::work_budget::WorkKind::RootRefinement, 1)''')
p=w/name;s=p.read_text();assert s.count('                    refinements,\n')==2
s=s.replace('                    refinements,\n','                    refinements,\n                    depth: node.depth.saturating_add(1),\n');p.write_text(s)
edit('crates/hypercurve/src/polynomial_curve.rs',
'            self.source.fiber_config.refinement_steps,\n            policy,',
'            self.source.fiber_config,\n            policy,')
edit('crates/hypercurve/src/polynomial_point/selected_fiber.rs',
'        refinement_steps: usize,\n',
'        config: hypersolve::AlgebraicFiberRootIsolationConfig,\n')
edit('crates/hypercurve/src/polynomial_point/selected_fiber.rs',
'hypersolve::isolate_ordered_field_polynomial_roots_complete(',
'hypersolve::isolate_ordered_field_polynomial_roots_complete_with_config(')
edit('crates/hypercurve/src/polynomial_point/selected_fiber.rs',
'                refinement_steps,\n',
'''                hypersolve::OrderedFieldRootIsolationConfig {
                    max_subdivision_depth: config.max_subdivision_depth,
                    refinement_steps: config.refinement_steps,
                },
''')
# Match existing rational/parallel parameter dependency depth. A native base
# parameter remains a depth-zero leaf; a query already includes its source edge.
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
'''                    depth =
                        next_depth(self.point_depths[parameter as usize], self.max_point_depth)?;
                    let index = self.begin(POLYNOMIAL_FIBER)?;''',
'''                    depth = self.point_depths[parameter as usize];
                    let index = self.begin(POLYNOMIAL_FIBER)?;''')
edit('crates/hypercurve/src/svg/exact/graph/points.rs',
'''            depth = next_depth(point_depths[index], max_point_depth)?;
            let equation = read_polynomial(reader)?;''',
'''            depth = point_depths[index];
            let equation = read_polynomial(reader)?;''')
tests=(c/'polynomial_query_fibers_tests.rs').read_text()+(c/'polynomial_query_fibers_acceptance.rs').read_text()
(w/'crates/hypercurve/tests/polynomial_query_fibers.rs').write_text(tests)
(c/'polynomial_query_fibers_tests.rs').write_text(tests)
