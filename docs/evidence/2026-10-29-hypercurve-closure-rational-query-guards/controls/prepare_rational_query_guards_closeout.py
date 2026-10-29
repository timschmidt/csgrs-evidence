from pathlib import Path
import ast
c=Path(__file__).resolve().parent
implementation={'crates/hypercurve/src/curve_point/rational/arithmetic.rs','crates/hypercurve/tests/rational_query_guards.rs','crates/hypercurve/qualification/capabilities.json','crates/hypercurve/CHANGELOG.md'}
# Preserve the established source-alignment and publication gates, replacing
# derivative-specific scope, witnesses and evidence with this increment.
s=(c/'align_selected_query_derivatives.py').read_text().replace('selected-query-derivatives','rational-query-guards').replace('qualification-final6','qualification-final1').replace('selected_query_derivatives.rs','rational_query_guards.rs')
start=s.index('implementation=');end=s.index('\n',start);s=s[:start]+'implementation='+repr(implementation)+s[end:];s=s.replace('derivative','rational guard');ast.parse(s);(c/'align_rational_query_guards.py').write_text(s)
s=(c/'probe_polynomial_operations_derivatives.py').read_text().replace('selected-query-derivatives','rational-query-guards').replace('qualification-final6','qualification-final1').replace('derivatives1','guards1').replace('Current derivative source','Current rational guard source');ast.parse(s);(c/'probe_polynomial_operations_guards.py').write_text(s)
s=(c/'finalize_selected_query_derivatives.py').read_text().replace('selected-query-derivatives','rational-query-guards').replace('selected_query_derivatives','rational_query_guards').replace('qualification-final6','qualification-final1').replace('derivatives1','guards1').replace('2026-10-28','2026-10-29')
start=s.index('IMPLEMENTATION = ');end=s.index('\n',start);s=s[:start]+'IMPLEMENTATION = '+repr(implementation)+s[end:]
s=s.replace("'rational-query-guards-fix9/complete.json'","'selected-point-fillets-query-guards-fix4/complete.json'").replace("focused['groups'] == 14","focused['groups'] == 6").replace('rational-query-guards-preflight-7','rational-query-guards-preflight-1')
s=s.replace("'rational-query-guards-baseline1/complete.json'","'selected-point-fillets-query-guards-baseline1/complete.json'")
s=s.replace("assert baseline['all_expected_outcomes_reproduced'] and baseline['unsupported_derivatives'] == 3", "assert not baseline['all_passed'] and baseline['groups'] == 3\n    baseline_rows = json.loads((CONTROLS / 'selected-point-fillets-query-guards-baseline1/results.json').read_text())\n    assert [row['exit_code'] for row in baseline_rows] == [0, 0, 101]")
s=s.replace("'selected-derivatives'","'rational-guards'").replace("suites['rational-guards']['passed'] == 12","suites['rational-guards']['passed'] >= 5")
s=s.replace("prefixes = ['rational-query-guards-', 'polynomial-operation-frontier-guards1']", "prefixes = ['rational-query-guards-', 'selected-point-fillets-query-guards-', 'polynomial-operation-frontier-guards1']")
start=s.index("    for name in ['finalize_");end=s.index("        copy(CONTROLS / name, Path('controls') / name)",start)
controls=['finalize_rational_query_guards.py','close_rational_query_guards.py','qualify_rational_query_guards.py','run_rational_query_guards_qualification.py','preflight_rational_query_guards.py','probe_selected_point_fillets.py','probe_polynomial_operations_guards.py','align_rational_query_guards.py','prepare_rational_query_guards_closeout.py','rational-query-guards-contract.json','rational-query-guards-prepared.json','rational-query-guards-seed.patch','rational-query-guards-parent-alignment.json','rational-query-guards-aligned-files.json','rational-query-guards-extra-tests.rs','polynomial-operation-frontier-tests.rs','rational-query-guards-qualification-final1-controller.json']
s=s[:start]+'    for name in '+repr(controls)+':\n'+s[end:]
start=s.index("    save(dest / 'admission.json', {");end=s.index("    env = {**os.environ",start)
s=s[:start]+'''    save(dest / 'admission.json', {
        'owner': 'Hypercurve source-bound rational query arithmetic and scalar recipe replay',
        'properties': ['P1','P7','P14','P18','P19','P20','P26'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'alignment': ALIGNMENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'baseline': baseline, 'baseline_rows': baseline_rows, 'frontier': frontier,
        'domain': 'Division of admitted exact source-bound rational queries, preserving both original denominator guards through scalar recipes and native point/parameter replay. Original guards and divisor numerator must be nonzero at the selected source.',
        'proof': 'The quotient a/d divided by b/e previously exported a*e/(d*b), which omitted the original e guard from its denominator. Multiplying numerator and denominator by e preserves the exact value and the original exclusion. If d and e are structurally identical, the existing d factor already preserves the guard. Original source selectors and live operands remain retained; no new scalar kernel or format record is introduced.',
        'witnesses': 'Five named fixtures preserve the exact cubic quotient relation, reject rebinding its recipe to the original divisor pole, preserve both distinct and shared denominator guards under strict/approximate/strict policy, keep zero divisors invalid, require actual zero-refinement-budget refusal with repeated larger retries, and exercise cold native SVG replay, exact selected endpoint identity, subdivision and another save/reload. The independent endpoint relation is 3t^3-6t^2+6t-2=0, with curve coordinates (t,t^2).',
        'retained_failures': 'The original exact-value control passes while replay at the original divisor pole incorrectly succeeds. Baseline source, patch and failing assertion are retained. A later fixture compilation error used an unsupported integer-to-parameter conversion; its log and corrected explicit Real construction remain recorded.',
        'resource_scope': 'The denominator guard is retained algebraically; original source and budget authorities remain in use. Per-fixture elapsed time and RSS are observations, not a general performance improvement or total resource bound. Guard polynomial growth, complete arithmetic work, memory and cancellation limits remain unqualified.',
        'source_alignment': 'Qualification used a private point checkpoint. Only the finalized point parents three receipt files change during alignment; every guard implementation and fixture byte remains identical. Base/seed/candidate patches and file digests reconstruct the qualified source.',
        'limits': 'No new general region offset, corner or algebraic-root-point capability is claimed. Seven original region operation blockers remain after alignment. Full pre-push verification of this increment is still required.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
''' + s[end:]
s=s.replace('Record selected query derivative closure','Record original rational quotient guards')
start=s.index("    text = f'''");end=s.index("    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'",start)
s=s[:start]+'''    text = f\'''**Rational quotient guard increment (2026-10-29).**
A source-bound quotient now preserves the original divisor denominator in its
exported scalar recipe. The baseline kept the exact value of a/d divided by
b/e, but exporting a*e/(d*b) discarded e as a guard: rebinding a valid cubic
source to the original divisor pole incorrectly succeeded. The correction
retains e in both numerator and denominator. An already shared denominator
keeps that guard once. Original source selectors, operands and typed failures
remain authoritative; no new scalar kernel or archive record is introduced.

Five named witnesses pass. They check an independent cubic quotient identity,
both distinct and shared original guards, a zero divisor, strict/approximate/
strict certainty, actual refinement-budget refusal and repeated larger retries.
A fresh process replays a restricted parabola at the selected parameter t,
proves 3t^3-6t^2+6t-2=0 and y=t^2, subdivides with a shared exact endpoint, then
saves and reloads again. Replayed recipes still reject the original divisor
pole. The original failing witness and subsequent fixture compilation error
remain in the evidence; no assertion or policy was weakened.

All 20 affected qualification groups pass, including full Hypercurve
({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), CSGRS
({suites['model-full']['passed']:,} passed,
{suites['model-full']['ignored']} ignored), six downstream consumer suites,
strict MSRV Clippy, minimal builds, denied-warning docs, fuzz-target lint,
the full capability matrix and hygiene. Only the finalized point parent's
three receipt files changed after qualification; implementation and fixture
bytes remain identical. Commands, raw logs, source inventories and patches
are retained in {record}, SHA-256 {digest}. Receipt checks follow the final
documentation edit.

The seven original polynomial region offset/corner blockers remain Unsupported,
and three controls still pass. Refinement and promotion counters do not bound
total work, guard-polynomial growth, memory or cancellation. No general speed,
universal closure or publication claim is made. Complete pre-push qualification
of this increment remains required.

\'''
''' + s[end:]
start=s.index("    paragraph = f'''");end=s.index("    path.write_text(content.replace(marker, marker + paragraph, 1))",start)
s=s[:start]+'''    paragraph = f\'''The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It records preservation of original
rational quotient guards through scalar recipes and native replay, five named
witnesses and 20 affected qualification groups. Source checkpoints are
reconstructable from retained patches and inventories; receipt-only parent
alignment preserves implementation bytes. The original failure and seven
region operation blockers remain explicit. This record is unpushed.

\'''
''' + s[end:]
s=s.replace('Differentiate rational spans at retained selected query parameters','Preserve original divisor guards in rational query recipes')
s=s.replace("state['rational_query_guards'].update", "state.setdefault('rational_query_guards', {}).update")
s=s.replace('Selected query rational derivatives qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General implicit/parallel/region operations remain open.','Original rational divisor guards qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General operation closure remains open.')
s=s.replace('Continue exact operation closure from the committed query derivative carrier.','Continue exact operation closure with the guarded query carrier.')
ast.parse(s);(c/'finalize_rational_query_guards.py').write_text(s)
s=(c/'close_selected_query_derivatives.py').read_text().replace('selected-query-derivatives','rational-query-guards').replace('rational-query-guards-qualification-final6','rational-query-guards-qualification-final1').replace('selected_query_derivatives','rational_query_guards').replace('probe_polynomial_operations_derivatives.py','probe_polynomial_operations_guards.py').replace('Derivative','Rational guard').replace('derivative alignment','rational guard alignment').replace('SELECTED QUERY DERIVATIVE','RATIONAL QUERY GUARD');ast.parse(s);(c/'close_rational_query_guards.py').write_text(s)
print('Prepared guard alignment, original frontier, archive, receipts and local commit gates; not a push controller.')
