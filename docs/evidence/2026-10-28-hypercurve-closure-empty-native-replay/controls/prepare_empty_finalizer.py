from pathlib import Path
import ast

controls = Path(__file__).resolve().parent
source = (controls / 'finalize_recovered_increment.py').read_text()
config = {'empty-native-replay': {
    'parent': 'selected-circle-corners', 'tests': 2921, 'suites': 94,
    'root_tests': 67, 'root_suites': 12, 'matrix': 261,
    'title': 'Preserve empty region replay and inherited topology receipts',
    'owner': 'CurveRegion2 normalization publication and replay, Boolean identity dependencies, affine transforms, finite projection and strict native SVG export',
    'domain': 'Canonical and generated exact empty regions, supported finite strokes, and existing symbolic approximation-dependent empty topology; exact empty results remain valid subsequent operands.',
    'proof': 'Empty arrangement publication retains actual consumed policy before removing the last boundary. Consumers validate and observe that retained topology before shortcuts. Boolean identities validate both operands and retain dependencies on each returned normalized carrier; affine identities validate the same receipt. Exact unchanged policies preserve shared storage. A changed dependency keeps boundary definitions, incidence and ownership while isolating policy caches. Whole empty SVG documents reuse the existing zero-root version-five graph and an explicit unit display viewport; the viewport adds no geometry. Both public finite profile projection APIs and CSGRS use these owning checks.',
    'witness': 'Ten added Hypercurve fixtures and one CSGRS fixture cover canonical and generated empty export, independent zero graph cardinalities, changed display data, deterministic and fresh-process replay, all four subsequent Booleans, offsets, identity/translation/reflection/shear, both projection APIs and invalid options. Qualified empty input is exercised in both operand orders and batched Booleans, with each returned region reconsumed separately under strict and approximate policies. An existing positive-height symbolic collapse regression now also checks returned-object replay; its independent exact positive-height assertion is preserved.',
    'gaps': 'Fresh probes on this qualified source still reproduce inherited-qualification loss in membership, area, role/profile, native-view, side/fact and bounds queries, and similarity native lowering. Those seven failing probes and the passing material-component control are archived as an explicit follow-on frontier; this increment does not claim to fix them. Two older CSGRS receipt-composition fixtures also still expect strict boundary readback after approximate construction. Their failures reproduce on both the committed corner parent after an owned-package rebuild and this candidate. Their explicit certainty migration belongs to the following query increment; the 67-case downstream subset here is not a claim that the complete CSGRS suite passes. The measured domain does not establish arbitrary algebraic operation closure or universal symbolic decisions. Complete total-work, expression/coefficient growth, retained-memory and cancellation bounds remain open.'
}}
start = source.index('CONFIG = {')
end = source.index('\n\n\ndef save', start)
source = source[:start] + 'CONFIG = ' + repr(config) + source[end:]
source = source.replace('args = parser.parse_args()', "parser.add_argument('--attempt', default='empty5')\nargs = parser.parse_args()")
source = source.replace("name + '-qualification-recovered2'", "name + '-qualification-' + args.attempt")
assert "default='empty5'" in source
needle = "assert len([row for row in rows if row['phase'] == 'qualification']) == 18"
assert needle in source
source = source.replace(needle, needle + "\nassert len([row for row in rows if row['phase'] == 'focused']) == 15")
needle = "    full = counts(run / 'qualification-full-suite.log')"
gate = '''    resource = CONTROLS / 'empty-native-resource-final4'
    assert json.loads((resource / 'source-before.json').read_text()) == qualified
    assert json.loads((resource / 'source-after.json').read_text()) == qualified
    resource_rows = json.loads((resource / 'results.json').read_text())
    assert len(resource_rows) == 3 and all(r['exit_code'] == 0 and r['source_stable'] for r in resource_rows)
    assert counts(resource / 'exact_empty_native_chain_with_zero_instrumented_work_budget.log')['passed'] == 1
    resource_log = (resource / 'exact_empty_native_chain_with_zero_instrumented_work_budget-stderr.log').read_text()
    assert resource_log.count('WorkUsage { refinements: 0, promotions: 0 }') == 3
    assert counts(run / 'focused-selected-points.log')['passed'] == 54
    assert counts(run / 'focused-region-replay.log')['passed'] == 18
    assert counts(run / 'focused-root-region-replay.log')['passed'] == 3
    assert counts(run / 'focused-native-svg-contract.log')['passed'] == 20
    for row in rows:
        if row['phase'] == 'focused' and row['name'] not in ['selected-points', 'region-replay', 'root-region-replay', 'native-svg-contract']:
            assert counts(run / ('focused-' + row['name'] + '.log'))['passed'] == 1
    intended_parent = json.loads((CONTROLS / 'empty-native-parent-source.json').read_text())
    assert parent_result['qualification'] == intended_parent['parent_candidate']
'''
assert needle in source; source = source.replace(needle, gate + needle)
needle = '    assert old in [BASE, parent]'
assert needle in source
source = source.replace(needle, "    assert old in [qualified['revision'], parent]\n    subprocess.run(['git', 'merge-base', '--is-ancestor', qualified['revision'], parent], cwd=checkout, check=True)")
source = source.replace("name + '-qualification-recovered*'", "name + '-qualification-*'")
needle = '        path = dest / relative\n        path.parent.mkdir(parents=True, exist_ok=True)'
assert needle in source
source = source.replace(needle, '        path = dest / relative\n        if path.exists():\n            assert path.read_bytes() == data\n            return\n        path.parent.mkdir(parents=True, exist_ok=True)')
start = source.index("    if name == 'circle-line-contacts':")
end = source.index('    changed = output', start)
archive = '''    excluded = []
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not folder.name.startswith('empty-') or '-qualification-' in folder.name:
            continue
        for item in sorted(folder.rglob('*')):
            if not item.is_file():
                continue
            if item.suffix in {'.json', '.jsonl', '.log', '.patch', '.rs', '.svg', '.txt', '.tsv', '.md'}:
                copy(item, Path('exploration') / folder.name / item.relative_to(folder))
            else:
                excluded.append({'path': str(item.relative_to(ROOT)), 'bytes': item.stat().st_size, 'sha256': hashlib.sha256(item.read_bytes()).hexdigest(), 'reason': 'Compiled or temporary artifact retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for item in sorted(CONTROLS.iterdir()):
        if item.is_file() and item.name.startswith('empty-') and item.suffix in {'.json', '.log', '.patch', '.rs'}:
            copy(item, Path('controls') / item.name)
    for filename in ['prepare_empty_native_worktree.py', 'prepare_empty_native_final_baseline.py', 'probe_empty_native_replay.py', 'apply_empty_native_fix1.py', 'apply_empty_native_fix2.py', 'integrate_empty_native_acceptance.py', 'integrate_empty_composition_acceptance.py', 'probe_empty_native_composition.py', 'probe_empty_native_resources.py', 'prepare_empty_finalizer.py', 'migrate_projection_receipt_assertion.py', 'complete_empty_export_migration.py', 'run_corner_native_probe.py']:
        copy(CONTROLS / filename, Path('controls') / filename)
    for folder_name, expected_failures in [('qualified-region-query-baseline4', 4), ('qualified-region-query-extra-baseline4', 3)]:
        folder = CONTROLS / folder_name
        assert json.loads((folder / 'source-before.json').read_text()) == qualified
        assert json.loads((folder / 'source-after.json').read_text()) == qualified
        frontier_rows = json.loads((folder / 'results.json').read_text())
        assert all(row['source_stable'] for row in frontier_rows)
        assert sum(row['exit_code'] == 101 for row in frontier_rows) == expected_failures
        for item in sorted(folder.rglob('*')):
            if item.is_file() and item.suffix in {'.json', '.log', '.rs', '.patch'}:
                copy(item, Path('frontier') / folder_name / item.relative_to(folder))
    for filename in ['qualified-region-query-baseline-contract.json', 'qualified-region-query-tests.rs', 'qualified-region-query-extra-tests.rs', 'probe_qualified_region_queries.py']:
        copy(CONTROLS / filename, Path('frontier') / filename)
    for folder_name in ['empty-existing-receipts-baseline2', 'corner-existing-receipts-baseline2']:
        folder = CONTROLS / folder_name
        receipt_source = json.loads((folder / 'source-before.json').read_text())
        assert receipt_source == json.loads((folder / 'source-after.json').read_text())
        if folder_name.startswith('empty-'):
            assert receipt_source == qualified
        else:
            assert receipt_source['revision'] == parent
        receipt_rows = json.loads((folder / 'results.json').read_text())
        assert len(receipt_rows) == 1 and receipt_rows[0]['source_stable'] and receipt_rows[0]['exit_code'] == 101
        assert '3 passed; 2 failed;' in (folder / 'receipt-composition.log').read_text()
        for item in sorted(folder.iterdir()):
            if item.is_file():
                copy(item, Path('frontier') / folder_name / item.name)
    for filename in ['probe_existing_receipt_consumers.py', 'corner-existing-receipts-baseline1-invalidated.json']:
        copy(CONTROLS / filename, Path('frontier') / filename)
'''
source = source[:start] + archive + source[end:]
start = source.index("        'recovery':")
end = source.index("        'limits':", start)
source = source[:start] + '''        'provenance': 'All six original empty failures were freshly reproduced on the final frozen corner candidate. Separate source-attributed probes reproduced Boolean and affine receipt loss after empty publication was fixed, while offsets already retained receipts. All prior failing attempts, partial preparation patch, exact programs, source snapshots and final qualifications are archived. No earlier or interrupted run counts as completed qualification. The original empty-export rejection is intentionally extended through the documented migration; its replacement verifies native empty replay and deterministic serialization. The later finite-profile receipt migration preserves the original symbolic closure source and single-profile result while requiring strict rejection and authorized consumed certainty. The first replacement assumed integer viewport spelling; that test-only error is retained and corrected to the existing decimal display format.',
        'regressions': 'All inherited native oblique-fillet, composite chord-role, collapsed-circle and affine-chord regressions remain unchanged and pass. The positive-height collapse fixture preserves its independent strict sign witness. Exact unchanged inputs retain shared storage; qualified output does not mutate exact operand receipts. Two legacy receipt-composition failures are separately reproduced on the committed parent after an owned-package rebuild and on this candidate; the query successor owns their explicit certainty migration.',
        'qualification_continuation': 'Empty3 passed 23 command groups on the final frozen source before hypercircuit doctest linking failed while another Cargo invocation shared its target. Empty4 verifies identical complete source and file hashes, retains those successful executions, reruns the failed complete package group with exclusive cache use, and executes every remaining group. The failed original attempt is archived and is not a passed check. No geometric or work-budget exhaustion is inferred from the link failure. After empty4 passed every required group, full CSGRS testing in the query child exposed an obsolete finite-profile Certified assertion. It was freshly reproduced on empty4, then explicitly migrated with original source and single-profile expectation intact. Only cfg(test) bytes and migration documentation changed; empty5 reruns the entire local qualification on the final source.',
        'resource_measurement': {'record': resource.name, 'requested_policies': ['STRICT', 'APPROXIMATE_512', 'STRICT'], 'observed_refinements': [0, 0, 0], 'observed_promotions': [0, 0, 0], 'outcome': 'Certified completion of the canonical empty offset/affine/projection/native replay/Boolean chain under WorkBudget::ZERO', 'scope': 'Instrumented root refinements and promotions only; not total work, memory, cancellation or elapsed time.'},
''' + source[end:]
source = source.replace("'Record recovered ' + name + ' qualification'", "'Record exact empty region closure qualification'")
source = source.replace("'properties': ['P12', 'P15', 'P17', 'P18', 'P19', 'P20', 'P26']", "'properties': ['P12', 'P17', 'P18', 'P19', 'P20', 'P26']")
source = source.replace('under P12, P15 and P17–P20, with native adapter obligations under P26.', 'under P12 and P17–P20, with native adapter obligations under P26.')
start = source.index('capability fixtures, typos, repository budget and diff checks. Both unchanged')
end = source.index("\n\n{config['gaps']}", start)
source = source[:start] + '''capability fixtures, typos, repository budget and diff checks. The 15 focused
groups also pass, including the unchanged native regressions and strengthened
positive-height collapse test. Record {record} has SHA-256 {digest}.
Every non-receipt byte matches the freshly qualified snapshot. The completed
corner parent is retained by commit; synchronizing its three receipts did not
change implementation or acceptance bytes. Original failing probes and every
subsequent attempt are archived, with outcomes kept distinct.

A separate source-attributed canonical empty offset/affine/projection/native
replay/Boolean chain completes under WorkBudget::ZERO, recording zero root
refinements and zero promotions under strict, approximate-requested and strict
policies. Each result remains certified. This measures those instrumented units;
it does not establish a total computational or memory bound. Existing extension
byte/depth limits, invalid-option checks and later retries remain exercised.''' + source[end:]
start = source.index('The recovered source is freshly qualified; lost pre-restart attempts are not')
end = source.index('delivery remain open.', start)
source = source[:start] + '''Every final implementation and acceptance byte is freshly qualified. Exact
empty graphs, separate qualified topology receipts and subsequent consumers
are covered, including original failures and source-attributed zero-work
instrumentation. Parent {parent[:10]} and the receipt-only transition are
recorded. This record is unpushed; complete closure, resource bounds and package
''' + source[end:]
source = source.replace('All 18 fresh local qualification groups pass:', 'All 18 local qualification groups pass:')
ast.parse(source)
(controls / 'finalize_empty_increment.py').write_text(source)
print('Prepared gated empty increment finalizer; not executed.')

