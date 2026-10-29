from pathlib import Path
import ast,json,re
r=Path(__file__).resolve().parents[1];c=r/'controls';name='selected-join-correspondence'
implementation={'crates/hypersolve/CHANGELOG.md','crates/hypersolve/src/selected_polynomial_field.rs','crates/hypersolve/src/selected_polynomial_field/definition.rs','crates/hypersolve/src/selected_polynomial_field/definition/encode.rs','crates/hypersolve/src/selected_polynomial_field/definition/replay.rs','crates/hypersolve/src/selected_polynomial_field/join.rs','crates/hypersolve/tests/selected_polynomial_join_retention.rs','crates/hypersolve/tests/support/selected_polynomial_replay.rs'}
p=c/'align_rational_query_guards.py';s=p.read_text().replace('rational-query-guards',name).replace('qualification-final2','qualification-final1').replace('len(rows)==20','len(rows)==24')
s=re.sub(r'^implementation=.*$', 'implementation='+repr(implementation),s,flags=re.M)
s='\n'.join(line for line in s.splitlines() if "'git','add','-N'" not in line)+'\n'
s=s.replace('All rational guard working files','All selected-field implementation files')
ast.parse(s);(c/'align_selected_join_correspondence.py').write_text(s)
p=c/'probe_polynomial_operations_guards.py';s=p.read_text().replace('rational-query-guards',name).replace('hypercurve-selected-join-correspondence-admission','hypersolve-selected-join-correspondence-admission').replace('qualification-final2','qualification-final1').replace("default='guards1'","default='correspondence1'").replace('Current rational guard source built after all 20 qualification groups','Current selected-field correspondence source built after all 24 qualification groups')
ast.parse(s);(c/'probe_polynomial_operations_correspondence.py').write_text(s)
s=(c/'finalize_rational_query_guards.py').read_text().replace('rational-query-guards',name).replace('rational_query_guards','selected_join_correspondence').replace('qualification-final2','qualification-final1').replace("len(rows) == 20","len(rows) == 24").replace('polynomial-operation-frontier-guards1','polynomial-operation-frontier-correspondence1')
s=re.sub(r'^IMPLEMENTATION = .*$', 'IMPLEMENTATION = '+repr(implementation),s,flags=re.M)
s=s.replace('selected-point-fillets-query-guards-fix5','selected-join-correspondence-fix5').replace("focused['groups'] == 6","focused['groups'] == 10").replace('selected-join-correspondence-preflight-2','selected-join-correspondence-preflight-4')
s=s.replace('selected-point-fillets-query-guards-baseline1','selected-join-correspondence-baseline2').replace("baseline['groups'] == 3","baseline['groups'] == 4").replace("[0, 0, 101]","[0, 0, 0, 101]")
s=s.replace("suite_names = ['rational-guards', 'predecessors', 'curve-full', 'model-full']", "suite_names = ['selected-points', 'selected-join-retention', 'solver-full', 'solver-minimal', 'curve-full', 'model-full']").replace("suites['rational-guards']['passed'] >= 5","suites['selected-join-retention']['passed'] >= 9")
s=s.replace("prefixes = ['selected-join-correspondence-', 'selected-point-fillets-query-guards-', 'polynomial-operation-frontier-correspondence1']", "prefixes = ['selected-join-correspondence-', 'polynomial-operation-frontier-correspondence1']")
a=s.index("    for name in ['finalize_selected_join_correspondence.py'");b=s.index('\n        copy(CONTROLS / name',a)
controls=['finalize_selected_join_correspondence.py','close_selected_join_correspondence.py','qualify_selected_join_correspondence.py','qualify_selected_join_correspondence_owner.py','run_selected_join_correspondence_qualification.py','preflight_selected_join_correspondence.py','probe_selected_join_correspondence.py','probe_selected_join_correspondence_candidate.py','probe_polynomial_operations_correspondence.py','align_selected_join_correspondence.py','prepare_selected_join_correspondence_closeout.py','implement_selected_join_correspondence.py','selected-join-correspondence-contract.json','selected-join-correspondence-prepared.json','selected-join-correspondence-seed.patch','selected-join-correspondence-parent-alignment.json','selected-join-correspondence-aligned-files.json','selected-join-correspondence-extra-tests.rs','polynomial-operation-frontier-tests.rs','selected-join-correspondence-qualification-final1-controller.json']
s=s[:a]+'    for name in '+repr(controls)+':'+s[b:]
a=s.index("    save(dest / 'admission.json', {");b=s.index("    env = {**os.environ",a)
s=s[:a]+'''    save(dest / 'admission.json', {
        'owner': 'Hypersolve selected-field generator correspondences and definition replay',
        'properties': ['P2','P10','P18','P19','P20','P36'],
        'qualified': qualified, 'parent': PARENT, 'evidence_parent': EVIDENCE_PARENT, 'alignment': ALIGNMENT,
        'commands': rows, 'suites': suites, 'focused': focused, 'preflight': preflight, 'baseline': baseline, 'baseline_rows': baseline_rows, 'frontier': frontier,
        'domain': 'Repeated joins of admitted selected polynomial coefficient fields, consumption of both original operands, dependent and native-field inputs, exact definition replay and further joins.',
        'proof': 'A generator created by a validated join retains its original source authority. Reuse follows those immutable correspondences and existing ancestry; allocation identity only locates a construction proof. Independent equal selections do not acquire a correspondence from polynomial or interval equality. JoinedField graph records replay the actual join and validate original source selections, references and coefficient maps. Native and polynomial ratios validate original denominators before constructing shared value nodes; positive ratios preserve sharing, negative ratios normalize exactly, and zero guards are invalid.',
        'witnesses': 'Nine named tests retain original first and second operands, repeated and diamond joins, independent equal, opposite and nearby selections, dependent and foreign-native coefficient fields, exact cubic equations, actual configured refusal and retry, malformed references and selectors, fresh-process graph replay followed by further joins, deterministic re-export, and positive, negative and zero guard controls.',
        'retained_failures': 'The first-operand controls pass while reusing the original second operand increases field depth from two to three. The exact cubic equation still passes, distinguishing needless generator growth from a false scalar answer. The first replay implementation preserved values but exported 83 nodes instead of 87; the original byte-equality assertion remains. A later new fixture used a forward reference and was corrected without changing its arithmetic assertions. All source-attributed attempts remain archived.',
        'resource_scope': 'Known generator reuse avoids the measured additional depth in the named fixtures. This is not a general speed or memory claim. Strong source references keep the proof DAG alive; total retained memory, coefficient growth, arithmetic work and cancellation remain unbounded by the existing refinement and record counters.',
        'source_alignment': 'Qualification used a private point checkpoint. Only the finalized point parents three receipts change during alignment; every implementation and fixture byte remains identical. Base/seed/candidate patches and file digests reconstruct the qualified source.',
        'migration': 'SelectedPolynomialDefinitionNode adds JoinedField. Exhaustive consumers and external graph-format owners must handle it; existing records retain their meaning. Joined-field export intentionally preserves construction dependencies. Semantic equality and deterministic serialization are checked separately.',
        'limits': 'General field equality, complete algebraic region closure and seven original region offset/corner blockers remain open. Full pre-push qualification of this increment is still required.',
        'rustc': output(['rustc', '+1.98.1', '--version', '--verbose']),
        'msrv': output(['rustc', '+1.95.0', '--version', '--verbose']), 'epoch': time.time(),
    })
'''+s[b:]
s=s.replace('Record original rational quotient guards','Record retained selected-field generator correspondences')
a=s.index("    text = f'''");b=s.index("    path = CHECKOUT / 'crates/hypercurve/FUTURE_WORK.md'",a)
s=s[:a]+"""    text = f'''**Selected-field join correspondence increment (2026-10-29).**
Repeated joins now retain the validated correspondence to each original source
generator. The baseline preserved exact cubic values but appended a duplicate
generator when consuming its original second operand: depth grew from two to
three. Immutable construction links now preserve both operands through repeated
and diamond joins. Independent equal selections remain distinct unless an
existing validated construction supplies their correspondence.

Definition graphs retain a `JoinedField` operation and replay the original join,
source selections and coefficient maps. Original denominator checks precede
native and polynomial ratio reconstruction. Positive ratios keep shared nodes;
negative ratios normalize exactly, and zero guards remain invalid. The new
public enum variant and joined-field export representation are documented in
the solver changelog. Semantic equality and deterministic re-export are separate
claims; the original failing cold byte comparison remains unchanged.

Nine named witnesses pass, including both original operands, repeated and
diamond joins, independent equal/opposite/nearby roots, foreign-native fields,
invalid selectors/references, configured refusal and larger retries, fresh-process
replay followed by further joins, and negative-denominator controls. All 24
qualification groups pass: full Hypersolve ({suites['solver-full']['passed']:,}
passed, {suites['solver-full']['ignored']} ignored), minimal solver configuration,
Hypercurve ({suites['curve-full']['passed']:,} passed,
{suites['curve-full']['ignored']} ignored), CSGRS
({suites['model-full']['passed']:,} passed,
{suites['model-full']['ignored']} ignored), six downstream consumer suites,
strict MSRV Clippy, minimal builds, denied-warning docs and fuzz lint,
allocation lifetime control, the capability matrix and hygiene.

Only the finalized point parent's three receipts changed after qualification;
implementation and fixture bytes remain identical. Commands, source inventories,
patches and raw failures are in {record}, SHA-256 {digest}. Receipt checks follow
the final documentation edit. Seven original region offset/corner operations
remain Unsupported while their three controls pass. The named depth reduction
is not a general speed or memory result; total work, coefficient growth, retained
memory and cancellation remain outside the existing counters. General algebraic
closure and this increment's full pre-push qualification remain open.

'''
"""+s[b:]
a=s.index("    paragraph = f'''");b=s.index('    path.write_text(content.replace(marker, marker + paragraph, 1))',a)
s=s[:a]+"""    paragraph = f'''The local {archive['branch'].removeprefix('refs/heads/')} branch ends at
{archive['commit']}, adding {record} ({int(count):,} files,
{int(size):,} bytes), SHA-256 {digest}. It records retained selected-field
generator correspondences, original-guard validation and fresh-process graph
replay, nine named fixtures and 24 qualification groups. Source checkpoints are
reconstructable from patches and inventories. Original duplicate-generator and
cold re-export failures remain explicit, along with seven region-operation
blockers. This record is unpushed.

'''
"""+s[b:]
s=s.replace('Preserve original divisor guards in rational query recipes','Retain selected-field generator correspondences across joins and replay').replace('Original rational divisor guards qualified through local/downstream suites, aligned to finalized point parent, archived and committed locally. General operation closure remains open.','Selected-field generator correspondence and replay qualified locally/downstream, aligned to point parent, archived and committed locally. General closure remains open.').replace('Continue exact operation closure with the guarded query carrier.','Continue exact operation closure with retained selected-field correspondence.')
ast.parse(s);(c/'finalize_selected_join_correspondence.py').write_text(s)
s=(c/'close_rational_query_guards.py').read_text().replace('rational-query-guards',name).replace('rational_query_guards','selected_join_correspondence').replace('qualification-final2','qualification-final1').replace('probe_polynomial_operations_guards.py','probe_polynomial_operations_correspondence.py').replace('RATIONAL QUERY GUARD','SELECTED-FIELD CORRESPONDENCE')
ast.parse(s);(c/'close_selected_join_correspondence.py').write_text(s)
print('Prepared join alignment, frontier reproduction, evidence archive, receipt checks and guarded local commit.')
