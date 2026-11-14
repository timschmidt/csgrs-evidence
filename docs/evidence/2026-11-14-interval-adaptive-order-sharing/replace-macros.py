from pathlib import Path
import re,json,subprocess
s=Path(__file__).parent;r=Path('/mnt/development/csgrs-adaptive-order-sharing')
(s/'macro-candidate.patch').write_bytes(subprocess.check_output(['git','diff','--binary',json.loads((s/'BASELINE.json').read_text())['csgrs']['head'],'HEAD'],cwd=r));(s/'additional-test.patch').write_bytes(subprocess.check_output(['git','diff','--binary'],cwd=r))
p=r/'crates/hyperdynamics/src/field/taylor_flow.rs';t=p.read_text();start=t.index('// One normalized Lie recurrence');end=t.index('impl<const N: usize> ExpressionField<N> {',start);loop=(s/'original-recurrence.rs').read_text().replace('2..=count','first..=count').replace('self.data','field.data');helper='''// Preserve the original in-place recurrence while sharing one mathematical owner.
// Always inline this extracted kernel to avoid a new call boundary in existing preparation.
#[inline(always)]
fn append_flow_stages<const N: usize>(
    field: &ExpressionField<N>,
    stages: &mut Vec<FlowTaylorStage<N>>,
    first: usize,
    count: usize,
    columns: usize,
    requests_len: usize,
    budget: &mut EnclosureBudget,
) -> Result<(), FlowTaylorError> {
'''+loop+'''    Ok(())
}

''';t=t[:start]+helper+t[end:];pattern=r'append_flow_stages!\(\s*self,\s*stages,\s*2,\s*count,\s*columns,\s*requests_len,\s*budget,\s*N,?\s*\);';t,n=re.subn(pattern,'append_flow_stages(self, &mut stages, 2, count, columns, requests_len, budget)?;',t);assert n==1;p.write_text(t)
p=r/'crates/hyperdynamics/src/field/taylor_flow/orders.rs';t=p.read_text();pattern=r'append_flow_stages!\(\s*field,\s*stages,\s*first,\s*count,\s*columns,\s*requests_len,\s*budget,\s*N,?\s*\);';t,n=re.subn(pattern,'append_flow_stages(field, &mut stages, first, count, columns, requests_len, budget)?;',t);assert n==1;p.write_text(t)
p=r/'crates/hyperdynamics/src/field/taylor_flow/adaptive.rs';t=p.read_text();start=t.index('// Identical adaptive search/proof/quality');end=t.index('impl<const N: usize> AdaptiveTaylorField<N> {',start);t=t[:start]+t[end:];start=t.index('    adaptive_evolution!(');end=t.index('\n}\n\n/// Explicit lazy',start)
method=(s/'original-adaptive-method.rs').read_text().replace('fn evolve(', 'fn evolve<const SHARED_PREPARATION: bool>(')
old='let prepared = self.field.flow_taylor(order, budget)?;';new='''let prepared = if SHARED_PREPARATION {
                            match report.programs.last() {
                                Some(previous) => previous.extend_order(
                                    order.checked_sub(previous.order())
                                        .expect("new ascending order exceeds every cached order"),
                                    budget,
                                )?,
                                None => self.field.flow_taylor(order, budget)?,
                            }
                        } else {
                            self.field.flow_taylor(order, budget)?
                        };''';assert method.count(old)==1;method=method.replace(old,new);t=t[:start]+method.rstrip()+t[end:];t=t.replace('self.evolve(&mut report, budget)','self.evolve::<false>(&mut report, budget)');p.write_text(t)
p=r/'crates/hyperdynamics/src/field/taylor_flow/adaptive/shared.rs';t=p.read_text().replace('self.controller.evolve_shared(&mut report, budget)','self.controller.evolve::<true>(&mut report, budget)');p.write_text(t)
(s/'MACRO-REJECTION.md').write_text('''# Unretained macro extraction

Candidate62ecffb2c matches default complete proof/work/dispatch artifacts and
passes initial extension/shared tests. Source extraction-only control shrinks
or preserves all measured raw binaries. New API changes nine LLVM symbol suffixes
from19 to20 digits in two executables (+8 aligned file bytes), with every allocated
section/address unchanged there except build ID. No code/data growth occurs there.

Initial35-row six-run sweep finds adverse separation in several cases. A fixed
executable-path, ASLR-disabled, CPU-pinned six-run recheck of five Criterion cases
plus the four manual adaptive rows finds about3.1% slower existing order3 preparation
for extraction and3.5% for the full candidate. This fails the refactor retention
gate; the candidate is not integrated. Both raw campaigns and all variants remain.

Replace macro-expanded kernels with a typed inlined recurrence helper and a
compile-time preparation choice. This preserves one mathematical/control owner
without merging distinct invariant panic locations at macro invocation sites.
The new inline directive is confined to the extracted previously in-place recurrence;
it restores that call structure, rather than hinting unrelated benchmark code.
All correctness/default artifacts, size and affected timings require revalidation.
''')
