from pathlib import Path
import ast

c = Path(__file__).resolve().parent
s = (c / 'finalize_recovered_increment.py').read_text()
config = {'qualified-region-adapters': {
    'parent':'qualified-region-queries',
    'title':'Preserve inherited certainty through empty region membership adapters',
    'owner':'CSGRS native region membership adapter, delegating to CurveRegion2',
    'domain':'Canonical and generated exact empty regions, exact square controls, and qualified empty/nonempty descendants of the independently positive-height symbolic cap.',
    'proof':'The adapter removes its is_empty shortcut and always consumes the owning Hypercurve membership query through GeometryDecisions. Native strict blockers and Approximate512Consumed receipts survive the wrapper; a returned empty boundary alone cannot certify that the original source had no interior. No geometry algorithm is duplicated in the adapter.',
    'witness':'Three public Rust fixtures exercise strict/approximate/strict membership and bounds on exact and qualified empty/nonempty inputs, the strict convenience API, typed Predicate blockers, Boolean descendants and exact operand nonmutation. A separately proven positive source height and interior point prevent using collapsed topology as an exact oracle. Real Node binding controls also consume canonical empty and square-minus-itself results through strict and contextual membership and bounds. Those JavaScript additions exercise exact empty controls; the symbolic inherited-qualification witness is Rust-only.',
    'gaps':'This closes the reproduced CSGRS membership shortcut, not arbitrary algebraic operation closure or all ABI provenance surfaces. The adapter inherits the parent kernel support envelope and resource limits. Total work, coefficient/expression growth, retained-memory bounds, cooperative cancellation and full package delivery remain open.'
}}
start=s.index('CONFIG = {');end=s.index('\n\n\ndef save',start);s=s[:start]+'CONFIG = '+repr(config)+s[end:]
s=s.replace('args = parser.parse_args()',"parser.add_argument('--attempt', default='adapter6')\nargs = parser.parse_args()")
s=s.replace("name + '-qualification-recovered2'","name + '-qualification-' + args.attempt")
s=s.replace("assert len([row for row in rows if row['phase'] == 'qualification']) == 18", "assert len([row for row in rows if row['phase'] == 'qualification']) == 13\nassert len([row for row in rows if row['phase'] == 'focused']) == 2")
start=s.index("    full = counts(run / 'qualification-full-suite.log')");end=s.index("    old = output",start)
gate='''    intended_parent = json.loads((CONTROLS / 'qualified-region-adapter-parent-source.json').read_text())
    assert parent_result['qualification'] == intended_parent['parent_candidate']
    assert qualified == intended_parent['after']
    parent_run = CONTROLS / 'qualified-region-queries-qualification-query6'
    assert json.loads((parent_run / 'source-before.json').read_text()) == parent_result['qualification']
    assert json.loads((parent_run / 'complete.json').read_text())['all_passed']
    parent_files = {r[0]:r[1:] for r in json.loads((parent_run / 'files-before.json').read_text())}
    changed_paths = sorted(r[0] for r in files if parent_files.get(r[0]) != r[1:])
    assert changed_paths == ['CHANGELOG.md','src/curve/native.rs','tests/qualified_region_queries.rs','tests/wasm/geometry_certainty.cjs']
    assert changed_paths == intended_parent['intended_changes']
    root_suite = counts(run / 'qualification-full-root.log')
    parent_root = counts(parent_run / 'qualification-full-root.log')
    assert root_suite == {**parent_root, 'passed':parent_root['passed']+3, 'suites':parent_root['suites']+1}
    assert counts(run / 'focused-adapter-queries.log')['passed'] == 3
    assert counts(run / 'focused-receipt-consumers.log')['passed'] == 43
    assert counts(run / 'qualification-minimal-queries.log')['passed'] == 3
    consumers = {package:counts(run / ('qualification-'+package+'.log')) for package in ['hyperdrc','hypercircuit','ffi']}
    wasm = next(row for row in rows if row['name'] == 'wasm-consumers')
    assert wasm['command'] == ['bash','scripts/test-wasm-bindings.sh'] and wasm['exit_code'] == 0
    frontier = CONTROLS / 'qualified-region-adapter-baseline4'
    assert json.loads((frontier / 'source-before.json').read_text()) == parent_result['qualification']
    assert json.loads((frontier / 'source-after.json').read_text()) == parent_result['qualification']
    assert [r['exit_code'] for r in json.loads((frontier / 'results.json').read_text())] == [0,0,101,0]
'''
s=s[:start]+gate+s[end:]
s=s.replace('    assert old in [BASE, parent]', "    assert old in [qualified['revision'], parent]\n    subprocess.run(['git','merge-base','--is-ancestor',qualified['revision'],parent],cwd=checkout,check=True)")
s=s.replace("name + '-qualification-recovered*'","name + '-qualification-*'")
s=s.replace('        path = dest / relative\n        path.parent.mkdir(parents=True, exist_ok=True)', '        path = dest / relative\n        if path.exists():\n            assert path.read_bytes() == data\n            return\n        path.parent.mkdir(parents=True, exist_ok=True)')
s=s.replace("CONTROLS / 'qualify_increment.py'", "CONTROLS / 'qualify_region_adapters.py'")
start=s.index("    if name == 'circle-line-contacts':");end=s.index('    changed = output',start)
archive='''    excluded = []
    for folder in sorted(CONTROLS.iterdir()):
        if not folder.is_dir() or not folder.name.startswith('qualified-region-adapter-'):
            continue
        for item in sorted(folder.rglob('*')):
            if not item.is_file(): continue
            if item.suffix in {'.json','.jsonl','.log','.patch','.rs','.txt','.md'}:
                copy(item, Path('exploration') / folder.name / item.relative_to(folder))
            else:
                excluded.append({'path':str(item.relative_to(ROOT)),'bytes':item.stat().st_size,'sha256':hashlib.sha256(item.read_bytes()).hexdigest(),'reason':'Generated compiled artifact retained by digest only.'})
    save(dest / 'excluded-artifacts.json', excluded)
    for item in sorted(CONTROLS.iterdir()):
        if item.is_file() and item.name.startswith('qualified-region-adapter-') and item.suffix in {'.json','.log','.patch','.rs'}:
            copy(item, Path('controls') / item.name)
    for filename in ['prepare_qualified_region_adapters.py','apply_qualified_region_adapter_fix.py','probe_qualified_region_adapters.py','qualified-region-adapters-projection-migration-applied.json','correct_adapter_binding_control.py','prepare_adapter_finalizer.py']:
        copy(CONTROLS / filename, Path('controls') / filename)
'''
s=s[:start]+archive+s[end:]
start=s.index('    metadata = {');end=s.index("    save(dest / 'source.json'",start)
metadata='''    metadata = {**config, 'properties':['P9','P19','P25','P30'], 'qualification':qualified,
        'commit_parent':parent, 'evidence_parent':evidence_parent, 'transition':transition,
        'parent_qualification':parent_result['qualification'], 'root_suite':root_suite,
        'parent_root_suite':parent_root, 'consumers':consumers, 'commands':rows,
        'scope_check':changed_paths,
        'provenance':'The original membership witness fails on the final query parent while the bounds control already passes. The unchanged independent positive-height fixture now passes through the adapter. Adapter1 had an ambiguous test-only Real expectation; adapter2 exposed legacy receipt-composition migrations belonging to the parent. Adapter3 full CSGRS completed with 690 passes, one legacy finite-profile assertion failure and seven ignored cases. Its owning parent migration is copied unchanged. Adapter4 passed native and WASM lint groups, then its direct invocation of the non-executable binding script failed before tests ran. Adapter5 retained that successful prefix on identical source and invoked the script through Bash; the actual generated binding reproduced the new JavaScript control using the mesh method name on a curve. The only subsequent edit calls CurveRegionJs.difference, preserving every original assertion and ownership transfer. Adapter6 freshly reruns both focused and all 13 qualification groups on the final source. The final parent fixes are copied byte-for-byte and their separate qualification is required before closeout. Owned Hypercurve/CSGRS cache packages are rebuilt after switching from the corner baseline. Every incomplete attempt remains archived.',
        'limits':'No new total-work or memory bound is claimed. This wrapper consumes the parent kernel and retains its typed blockers and certainty; the parent zero-refinement query probe is separate owning-layer evidence. External timeouts and process peak RSS are measurements, not shared resource contracts. The JavaScript additions cover exact empty controls, not the symbolic Rust fixture. Full pre-push validation and publication remain pending.',
        'recorded_epoch':time.time(), 'rustc':output(['rustc','+1.98.1','--version','--verbose']), 'msrv':output(['rustc','+1.95.0','--version','--verbose'])}
'''
s=s[:start]+metadata+s[end:]
s=s.replace("'Record recovered ' + name + ' qualification'", "'Record CSGRS inherited region query certainty qualification'")
s=s.replace("'full_suite': full, 'downstream': downstream", "'root_suite': root_suite, 'consumers': consumers")
start=s.index("    text = f'''**");end=s.index("    path = checkout / 'crates/hypercurve/FUTURE_WORK.md'",start)
receipt='''    root_suite = archive['root_suite']
    consumer_total = sum(row['passed'] for row in archive['consumers'].values())
    text = f\'''**{label} increment (2026-10-28).** The owning layer is {config['owner']},
under P9, P19, P25 and P30. The measured domain is {config['domain']}

{config['proof']}

{config['witness']}

All 13 local qualification groups and two focused groups pass. The complete
CSGRS all-feature release run has {root_suite['passed']:,} passing cases in
{root_suite['suites']} suites, with {root_suite['ignored']} existing ignored
cases. Three new adapter fixtures also pass with only the curve feature.
Hyperdrc, Hypercircuit and the FFI crate contribute {consumer_total:,} passing
cases. Strict MSRV and WASM Clippy, denied-warning docs, formatting, typos,
repository budget and diff checks pass. Actual generated Node bindings run
five JavaScript programs; TypeScript declarations are checked and three typed
programs are compiled and executed by the repository's binding script.

Record {record} has SHA-256 {digest}. All non-receipt bytes match the qualified
source. The completed query parent is retained by commit; its full kernel and
consumer qualification is separate evidence. Only the four intended adapter
paths differ from that parent before synchronizing the three receipts.

{config['gaps']} Full pre-push validation and publication remain pending.

\'''
'''
s=s[:start]+receipt+s[end:]
start=s.index("    paragraph = f'''");end=s.index('    path.write_text(content.replace(marker',start)
paragraph='''    paragraph = f\'''The local `{archive['branch'].removeprefix('refs/heads/')}` branch ends at
`{archive['commit']}`, adding `{record}` ({int(count):,} files,
{int(size):,} bytes), SHA-256 `{digest}`. It records the CSGRS membership
adapter's inherited topology receipt. The complete CSGRS suite, three new
fixtures in full and minimal feature configurations, affected consumer and
FFI suites, strict native/WASM Clippy and actual Node/TypeScript binding
consumers pass. The four-path scope, final parent qualification and receipt-only
transition are checked. Earlier failures remain archived. This record is
unpushed; general closure, complete resource bounds and delivery remain open.

\'''
'''
s=s[:start]+paragraph+s[end:]
ast.parse(s)
(c/'finalize_adapter_increment.py').write_text(s)
print('Prepared gated adapter finalizer; no archive, receipt or commit executed.')
