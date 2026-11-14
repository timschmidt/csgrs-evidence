from pathlib import Path
import re
r=Path('/mnt/development/csgrs-adaptive-order-sharing');s=Path(__file__).parent
# Extract the recurrence as one private source definition, preserving default statements.
p=r/'crates/hyperdynamics/src/field/taylor_flow.rs';before=p.read_text();start=before.index('        for degree in 2..=count {');end=before.index('        budget.graph.charge(count)?;',start);loop=before[start:end];(s/'original-recurrence.rs').write_text(loop)
body=loop.replace('2..=count','$start..=count')
for a,b in [('self','field'),('stages','stages'),('count','count'),('columns','columns'),('requests_len','requests_len'),('budget','budget'),('N','n')]:body=re.sub(r'\b'+a+r'\b',lambda m:'$'+b,body)
recurrence_body=body
macro='''// One normalized Lie recurrence for fresh and incremental preparation.
macro_rules! append_flow_stages {
    ($field:ident, $stages:ident, $start:expr, $count:ident, $columns:ident,
     $requests_len:ident, $budget:ident, $n:ident) => {
'''+body+'''    };
}

'''
call='        append_flow_stages!(self, stages, 2, count, columns, requests_len, budget, N);\n'
after=before[:start]+call+before[end:];marker='impl<const N: usize> ExpressionField<N> {';assert after.count(marker)==1;after=after.replace(marker,macro+marker,1);p.write_text(after)
# One adaptive algorithm; default and shared variants differ only at preparation.
p=r/'crates/hyperdynamics/src/field/taylor_flow/adaptive.rs';before=p.read_text();start=before.index('    fn evolve(\n');assert before.endswith('    }\n}\n');method=before[start:-2];(s/'original-adaptive-method.rs').write_text(method)
old='let prepared = self.field.flow_taylor(order, budget)?;';assert method.count(old)==1;body=method.replace(old,'let prepared = $prepare?;').replace('fn evolve(','fn $method(')
for a,b in [('self','this'),('report','report'),('budget','budget'),('order','order'),('N','n')]:body=re.sub(r'\b'+a+r'\b',lambda m:'$'+b,body)
macro='''// Identical adaptive search/proof/quality sequence under two preparation choices.
macro_rules! adaptive_evolution {
    ($method:ident, $this:ident, $report:ident, $budget:ident, $order:ident,
     $n:ident, $prepare:expr) => {
'''+body+'''    };
}

'''
invocations='''    adaptive_evolution!(evolve, self, report, budget, order, N,
        self.field.flow_taylor(order, budget));
    adaptive_evolution!(evolve_shared, self, report, budget, order, N, {
        match report.programs.last() {
            Some(previous) => previous.extend_order(
                order.checked_sub(previous.order())
                    .expect("new ascending order exceeds every cached order"),
                budget,
            ),
            None => self.field.flow_taylor(order, budget),
        }
    });
'''
after=before[:start]+invocations+'}\n';marker='impl<const N: usize> AdaptiveTaylorField<N> {';assert after.count(marker)==1;after=after.replace(marker,macro+marker,1);after+='\n/// Explicit lazy cross-order preparation sharing with retained adaptive history.\npub mod shared;\n';p.write_text(after)
# The macro's default substitution recovers every original statement exactly.
recovered=recurrence_body.replace('$start','2')
for macro_name, original in [('field','self'),('stages','stages'),('count','count'),('columns','columns'),('requests_len','requests_len'),('budget','budget'),('n','N')]:
 recovered=recovered.replace('$'+macro_name,original)
assert recovered==loop
recovered=body.replace('$method','evolve').replace('$prepare','self.field.flow_taylor(order, budget)')
for macro_name, original in [('this','self'),('report','report'),('budget','budget'),('order','order'),('n','N')]:
 recovered=recovered.replace('$'+macro_name,original)
assert recovered==method
(s/'mechanical-extraction.json').write_text(__import__('json').dumps(dict(default_recurrence_statements_identical=True,default_adaptive_statements_identical=True),indent=2)+'\n')
