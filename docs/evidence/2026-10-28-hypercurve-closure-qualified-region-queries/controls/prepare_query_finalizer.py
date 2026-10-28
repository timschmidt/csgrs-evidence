from pathlib import Path
import ast

controls = Path(__file__).resolve().parent
source = (controls / 'finalize_recovered_increment.py').read_text()
config = {'qualified-region-queries': {
    'parent':'empty-native-replay', 'tests':2931, 'suites':95,
    'root_tests':67, 'root_suites':12, 'matrix':271,
    'title':'Preserve inherited topology certainty in region queries',
    'owner':'CurveRegion2 geometric queries, policy-aware native contour caching and native similarity lowering',
    'domain':'Canonical exact empty and rational-square regions, plus existing symbolic approximate normalization and its empty or nonempty Boolean successors. Structural collection accessors remain structural observations.',
    'proof':'A shared owning-layer validator checks and observes the retained normalization policy before geometric queries interpret empty boundaries or reuse cached facts. Membership, signed and filled area, roles and profiles, filled sides, native facts and contours, and bounds share this requirement. The native cache keeps an internal strict policy barrier as typed uncertainty so an authorized approximate request can continue without promoting the result. Native similarity lowering also attaches the consumed dependency to its returned region. Requesting approximation alone leaves exact controls certified.',
    'witness':'Ten public integration fixtures preserve the eight original probes and add exact empty/square controls and a qualified nonempty union. The independent positive-height cap has source area 2h/3>0 and interior point (1,h/4), although approximate normalization retained no boundary. Its disjoint square union has intended area 4+2h/3. Repeated queries, strict/approximate/strict cache transitions, bounds, native views, similarity output and separately consumed material components preserve their qualification; exact operands remain unchanged.',
    'gaps':'A fresh CSGRS public probe still returns Certified false for qualified empty membership because its adapter bypasses the native query. Its bounds control already preserves the receipt. This reproduced wrapper gap is archived as a separate follow-on increment; no end-to-end adapter completion is claimed here. These fixtures qualify the named query and receipt paths, not arbitrary algebraic operation closure or universal symbolic decisions. General coefficient fields, all representation/degeneracy combinations, complete total-work and coefficient/expression growth accounting, retained-memory bounds, cooperative cancellation and package delivery remain open.'
}}
start=source.index('CONFIG = {'); end=source.index('\n\n\ndef save',start)
source=source[:start]+'CONFIG = '+repr(config)+source[end:]
source=source.replace('args = parser.parse_args()',"parser.add_argument('--attempt', default='query6')\nargs = parser.parse_args()")
source=source.replace("name + '-qualification-recovered2'","name + '-qualification-' + args.attempt")
needle="assert len([row for row in rows if row['phase'] == 'qualification']) == 18"
assert needle in source
source=source.replace(needle,needle.replace('== 18','== 19')+"\nassert len([row for row in rows if row['phase'] == 'focused']) == 24")
needle="    full = counts(run / 'qualification-full-suite.log')"
gate='''    resource = CONTROLS / 'qualified-region-query-resource-final5'
    assert json.loads((resource / 'source-before.json').read_text()) == qualified
    assert json.loads((resource / 'source-after.json').read_text()) == qualified
    resource_rows = json.loads((resource / 'results.json').read_text())
    assert len(resource_rows) == 3 and all(r['exit_code'] == 0 and r['source_stable'] for r in resource_rows)
    assert counts(resource / 'region_query_receipts_under_zero_instrumented_budget.log')['passed'] == 1
    resource_log = (resource / 'region_query_receipts_under_zero_instrumented_budget-stderr.log').read_text()
    assert resource_log.count('WorkUsage { refinements: 0, promotions: 0 }') == 6
    expected_focused = {'selected-points':54, 'region-replay':18, 'root-region-replay':3, 'native-svg-contract':20, 'qualified-queries':10, 'receipt-composition':5}
    for row in rows:
        if row['phase'] == 'focused':
            assert counts(run / ('focused-' + row['name'] + '.log'))['passed'] == expected_focused.get(row['name'], 1)
    intended_parent = json.loads((CONTROLS / 'qualified-region-query-parent-source.json').read_text())
    assert parent_result['qualification'] == intended_parent['parent_candidate']
    full_root = counts(run / 'qualification-full-root.log')
    assert full_root == {'suites':75,'passed':688,'failed':0,'ignored':7}
'''
assert needle in source;source=source.replace(needle,gate+needle)
needle='    assert old in [BASE, parent]'
assert needle in source
source=source.replace(needle,"    assert old in [qualified['revision'], parent]\n    subprocess.run(['git', 'merge-base', '--is-ancestor', qualified['revision'], parent], cwd=checkout, check=True)")
source=source.replace("name + '-qualification-recovered*'","name + '-qualification-*'")
needle='        path = dest / relative\n        path.parent.mkdir(parents=True, exist_ok=True)'
assert needle in source
source=source.replace(needle,'        path = dest / relative\n        if path.exists():\n            assert path.read_bytes() == data\n            return\n        path.parent.mkdir(parents=True, exist_ok=True)')
start=source.index("    if name == 'circle-line-contacts':");end=source.index('    changed = output',start)
archive='''    excluded = []
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not folder.name.startswith('qualified-region-query-'):
            continue
        for item in sorted(folder.rglob('*')):
            if not item.is_file():
                continue
            if item.suffix in {'.json','.jsonl','.log','.patch','.rs','.txt','.tsv','.md'}:
                copy(item, Path('exploration') / folder.name / item.relative_to(folder))
            else:
                excluded.append({'path':str(item.relative_to(ROOT)), 'bytes':item.stat().st_size, 'sha256':hashlib.sha256(item.read_bytes()).hexdigest(), 'reason':'Compiled or temporary artifact retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for item in sorted(CONTROLS.iterdir()):
        if item.is_file() and item.name.startswith('qualified-region-query-') and item.suffix in {'.json','.log','.patch','.rs'}:
            copy(item, Path('controls') / item.name)
    for filename in ['prepare_qualified_region_queries.py', 'probe_qualified_region_queries.py', 'build_probe_qualified_region_queries.py', 'apply_qualified_region_query_fix1.py', 'apply_qualified_region_query_fix2.py', 'integrate_qualified_region_queries.py', 'probe_qualified_region_query_resources.py', 'migrate_qualified_query_assertions.py', 'migrate_region_receipt_consumers.py', 'migrate_projection_receipt_assertion.py', 'probe_existing_receipt_consumers.py', 'qualified-region-queries-projection-migration-applied.json', 'prepare_query_finalizer.py']:
        copy(CONTROLS / filename, Path('controls') / filename)
    frontier = CONTROLS / 'qualified-region-adapter-baseline4'
    assert json.loads((frontier / 'source-before.json').read_text()) == qualified
    assert json.loads((frontier / 'source-after.json').read_text()) == qualified
    frontier_rows = json.loads((frontier / 'results.json').read_text())
    assert [r['exit_code'] for r in frontier_rows] == [0, 0, 101, 0]
    assert all(r['source_stable'] for r in frontier_rows)
    for item in sorted(frontier.iterdir()):
        if item.is_file() and item.suffix in {'.json','.jsonl','.log','.rs','.patch'}:
            copy(item, Path('frontier') / frontier.name / item.name)
    for filename in ['qualified-region-adapter-tests.rs', 'qualified-region-adapter-baseline-contract.json', 'probe_qualified_region_adapters.py']:
        copy(CONTROLS / filename, Path('frontier') / filename)
    supplemental = CONTROLS / 'qualified-nonempty-similarity-baseline1'
    assert json.loads((supplemental / 'source-before.json').read_text()) == qualified
    assert json.loads((supplemental / 'source-after.json').read_text()) == qualified
    supplemental_rows = json.loads((supplemental / 'results.json').read_text())
    assert len(supplemental_rows) == 2 and all(r['exit_code'] == 0 and r['source_stable'] for r in supplemental_rows)
    for item in sorted(supplemental.iterdir()):
        if item.is_file() and item.suffix in {'.json','.log','.rs','.patch'}:
            copy(item, Path('supplemental') / supplemental.name / item.name)
    for filename in ['probe_nonempty_similarity.py','qualified-nonempty-similarity-probe.rs']:
        copy(CONTROLS / filename, Path('supplemental') / filename)
    binary = supplemental / 'original'
    excluded.append({'path':str(binary.relative_to(ROOT)), 'bytes':binary.stat().st_size, 'sha256':hashlib.sha256(binary.read_bytes()).hexdigest(), 'reason':'Compiled supplemental probe retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
'''
source=source[:start]+archive+source[end:]
start=source.index("        'recovery':");end=source.index("        'limits':",start)
metadata={
    'provenance':'Seven failing public query probes and the already-correct material-component control are reproduced on the final parent candidate. The first guard fix blocked four authorized approximate paths; their unchanged assertions pass after native-cache strict trials preserve internal uncertainty. Two exact/nonempty acceptance controls also pass. All earlier failures, interrupted qualification and source snapshots are retained; none counts as completed final qualification.',
    'regressions':'Inherited point, circle, original native-fillet, affine-chord, SVG and positive-height tests remain unchanged relative to the final parent. Query1 was intentionally stopped for the parent export migration; query2 stopped on its integer-format assumption. Query3 completed with seven obsolete strict readback expectations on explicitly approximate Boolean, miter-option and stroke constructions. The documented certainty migration preserves their original inputs, construction policies and geometric expectations, and adds strict Predicate rejection, authorized Approximate512Consumed readback and strict rejection on reentry. Query4 found an inconsistent Certified-only assertion helper in the migrated miter test; it now reads the same area34 only after asserting the required approximate receipt. Two CSGRS receipt fixtures also required the explicit migration: strict source claims stay blocked, authorized consumers keep the geometry and receipts, and an intentionally adopted retained boundary is a separate model. The added symbolic area2 control explicitly requires approximate comparison because its sine-addition identity is outside the admitted scalar normal form. No qualified fixture is credited as exact success. Query5 completed the full CSGRS suite with 687 passes, one legacy finite-profile assertion failure and seven ignored cases. That projection certainty migration is owned by the empty parent and copied unchanged. Query6 reruns all focused and qualification groups on the final source, including the complete CSGRS suite; earlier failures are retained.',
    'complete_root_suite': 'The full CSGRS all-feature release suite is also executed on the final source; its counts and log are recorded separately from the 67-case downstream subset.',
    'supplemental_similarity':'A separate final-source probe confirms that the qualified nonempty union retains its strict topology blocker and authorized Approximate512Consumed membership after a similarity and source drop. It uses the source-attributed final library without concurrent Cargo writes. This is one observed composition, not proof of every internal native lowering route.',
    'resource_measurement':{'record':'qualified-region-query-resource-final5', 'requested_policies':['STRICT','APPROXIMATE_512','STRICT'], 'observed_refinements':[0,0,0,0,0,0], 'observed_promotions':[0,0,0,0,0,0], 'outcome':'Exact empty/square queries remain certified under WorkBudget::ZERO; qualified empty queries return typed strict Predicate blockers or authorized Approximate512Consumed results. Blocker handling is not certified geometry.', 'scope':'Instrumented root refinements and promotions only; not total work, memory, cancellation or elapsed time.'},
}
source=source[:start]+''.join('        '+repr(k)+': '+repr(v)+',\n' for k,v in metadata.items())+source[end:]
source=source.replace("'Record recovered ' + name + ' qualification'","'Record inherited region query certainty qualification'")
source=source.replace("'properties': ['P12', 'P15', 'P17', 'P18', 'P19', 'P20', 'P26']","'properties': ['P9', 'P12', 'P14', 'P19']")
source=source.replace('under P12, P15 and P17–P20, with native adapter obligations under P26.','under P9, P12, P14 and P19.')
start=source.index('capability fixtures, typos, repository budget and diff checks. Both unchanged')
end=source.index("\n\n{config['gaps']}",start)
source=source[:start]+'''capability fixtures, typos, repository budget and diff checks. All 24 focused
groups pass, including ten query fixtures, unchanged exact parent regressions,
and seven documented readback migrations. Those seven preserve the original
geometry expectations while requiring inherited approximation receipts;
strict readback rejects the unproved source claim before and after warming.
The complete CSGRS suite also passes, including migrated receipt-composition
consumers whose explicit boundary-adoption control has a separate source claim.
Record {record} has SHA-256 {digest}. Every non-receipt byte matches the final
qualified snapshot. The completed empty-replay parent is retained by commit;
only its three admission receipts were synchronized afterward.

A separate source-attributed zero-budget probe records zero root refinements
and promotions for exact and qualified query controls under strict,
approximate-requested and strict policies. Exact controls stay certified;
qualified inputs keep typed strict blockers or authorized consumed certainty.
This is instrumentation of those units, not a total computational bound.
Original failures and all incomplete or rejected attempts remain archived.'''+source[end:]
start=source.index('The recovered source is freshly qualified; lost pre-restart attempts are not')
end=source.index('delivery remain open.',start)
source=source[:start]+'''Every final implementation and acceptance byte is freshly qualified. Original
query failures, rejected guard behavior, exact/nonempty controls and zero-budget
instrumentation are archived separately. Parent {parent[:10]} and the receipt-only
transition are recorded. This record is unpushed; full closure and package
'''+source[end:]
source=source.replace('All 18 fresh local qualification groups pass:', 'All 19 local qualification groups pass:')
source=source.replace("'complete_root_suite': 'The full CSGRS all-feature release suite is also executed on the final source; its counts and log are recorded separately from the 67-case downstream subset.'", "'complete_root_suite': full_root")
ast.parse(source)
(controls/'finalize_query_increment.py').write_text(source)
print('Prepared gated query finalizer; no archive, receipt or commit executed.')
