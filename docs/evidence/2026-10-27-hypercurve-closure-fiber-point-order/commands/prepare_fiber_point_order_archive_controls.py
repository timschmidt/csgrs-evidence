from pathlib import Path
import ast
root=Path(__file__).resolve().parent

def converted(name):
    return (root/name).read_text().replace('circle-replay','fiber-point-order').replace('circle_replay','fiber_point_order').replace('point-replay','circle-replay').replace('point_replay','circle_replay')

def write(name, text):
    p=root/name;assert not p.exists(),name;ast.parse(text);p.write_text(text)

s=converted('reparent_circle_replay.py')
a="assert not (root/'fiber-point-order-parent-transition.json').exists()"
s=s.replace(a,a+"\nqualification=json.loads((root/'fiber-point-order-final-results.json').read_text())\nassert len(qualification)==18 and all(row['exit_code']==0 and row['source_stable'] for row in qualification)")
a="before,files,patch=evidence.source_snapshot()"
s=s.replace(a,a+"\nassert before==json.loads((root/'fiber-point-order-final-source-before.json').read_text())\nassert files==json.loads((root/'fiber-point-order-final-files-after.json').read_text())")
write('reparent_fiber_point_order.py',s)

s=converted('archive_circle_replay_evidence.py')
s=s.replace("'suites': 91, 'passed': 2832", "'suites': 92, 'passed': 2839")
s=s.replace("len(report['fixtures']) == 181", "len(report['fixtures']) == 188")
s=s.replace("'.rs', '.c'", "'.rs', '.c', '.svg'")
a="for name, mode, digest in before:\n    if mode in ['file', 'executable']:\n        assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name"
b="""receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
transition = json.loads((root / 'fiber-point-order-parent-transition.json').read_text())
assert transition['all_non_receipt_bytes_unchanged'] and transition['new'] == base
qualified_source = json.loads((root / 'fiber-point-order-final-source-before.json').read_text())
assert qualified_source == json.loads((root / 'fiber-point-order-final-source-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        if name in receipts:
            assert (checkout / name).read_bytes() == subprocess.check_output(['git', 'show', base + ':' + name], cwd=checkout), name
        else:
            assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name"""
assert a in s;s=s.replace(a,b)
a=s.index("scripts = set(");b=s.index("for source in sorted(scripts):",a)
s=s[:a]+"scripts = set(root.glob('*fiber_point_order*.py')) | {root / 'check_increment_receipt.py'}\n"+s[b:]
a=s.index("(out / 'source.json').write_text(json.dumps({");b=s.index("(out / 'retained-files.json')",a)
s=s[:a]+'''(out / 'source.json').write_text(json.dumps({
    'base': qualified_source['revision'], 'commit_parent': base,
    'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve common rational point-field queries, selected-circle incidence and half chart, and retained chord unit-direction replay',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P29', 'P30'],
    'domain': 'Shared selected point fields reached through checked rational maps and similarities. Oblique linear projection and circle residual consume those fields without independent coordinate materialization. A certified incident point whose displacement reduces to represented constants in a represented normal frame uses the existing exact rational half chart. The original witness has 2*beta^7-1=0, beta in (3/4,1), gamma^5+beta-2=0, gamma in (1,2), and a chord-normal unit circle with a 3-4-5 frame.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 188, 'commands': results,
    'source_attribution': 'Every final command ran on identical full before/after source snapshots, based on S with the complete frozen T/U implementations and V changes. Validation overlapped independent U validation. Only after all 18 V groups passed and U was committed did reparenting import the three U receipts. The parent-transition record proves every other source byte unchanged. The full qualified patch is against source.json base; the V-only patch against commit_parent is retained in the post-reparent record. Three V ledger receipts follow archive creation. No non-receipt implementation or documentation edit followed final qualification.',
    'compiler': subprocess.check_output(['rustc', '+1.98.1', '--version', '--verbose'], text=True),
    'msrv': subprocess.check_output(['rustc', '+1.95.0', '--version', '--verbose'], text=True),
    'platform': subprocess.check_output(['uname', '-a'], text=True),
    'baseline_findings': 'The original U fiber-center probe is copied byte-for-byte and reproduced against a fresh unchanged-source build. Import and independent endpoints pass; the positive midpoint assertion fails Blocked(Ordering). A separate exact rational-query control already proves its squared radius one, while the oblique (-4,3) affine query fails Ordering. Baseline1 only failed to supply the dependency library search directory; baseline2 corrects that harness setting and retains both records.',
    'change': 'Extract the existing rational-query common-source alignment so public arithmetic and geometric predicates share it. Pull back both point forms, preserve original immutable input guards, and compare in their certified common field. Circle residuals square checked nonzero denominators. The existing normal/tangent half-chart inverse also accepts proved constant displacements; centers stay jointly selected. Preserve radius sign, traversal and complement ownership. Native unit-direction omission now requires identical serialized scalar definitions from the ordinary chord owner; semantic equality alone proves validity but cannot discard the transported expression. On read, retain the checked incoming definition even if another vector is equal in value.',
    'closure_argument': 'Checked coordinate pullbacks are exact rational functions of the same selected point. After proving the canonical sources coincide, cross multiplication preserves rational differences with nonzero denominator guards. The circle residual has a positive squared denominator. A certified incident displacement supplies n and b in the orthonormal frame; the already used half-chart inverse u=b/(r+n+b), with diameter endpoints and signed half handling, selects the same point. This does not solve arbitrary independent-field joins or nonconstant angular inversion.',
    'qualification': 'Seven new witnesses retain the original degree-seven/five center with no independent coordinates; exact dot products 0,5,-5 in both orders; complete midpoint evaluation, splitting, reversed boundary reconstruction and another native archive; both signed radii and traversal directions, endpoints, quarter point, excluded half and 2^-80 separation; negative denominators and original zero poles; algebraic similarities and reflection with exact geometric assertions separate from full SVG determinism; actual reached zero work limits followed by 512-refinement/zero-promotion retries and Certified strict/approximate/strict policy sequences. All earlier replay and point tests remain. The original external positive program also succeeds unchanged.',
    'attempts': 'Prototype1 fixes oblique comparison and the circle residual; the midpoint then reaches a distinct Unsupported angular-inversion gap. Prototype2 reuses the existing half-chart inverse for proved constant displacements and passes the original positive program plus four witnesses. Prototype3 adds algebraic transforms, denominator/pole and budget/policy checks; six of seven pass, while reflected full SVG differs in one display coordinate. Exact metadata and viewBox remain identical. A source/cold/warm diagnostic proves this is direction-definition loss, not query mutation. Prototype4 preserves the checked unit definition, passes all seven witnesses, original program, and twelve old point/replay suites. Both MSRV probes are clean. Final qualification adds only documentation/catalog and an explicit non-materialized-center assertion before freezing the source.',
    'limitations': [
        'The finite corpus does not prove the complete arbitrary-degree algebraic curve and operation closure target. General independent point fields, nonconstant angular selections, other generated circle frames and general chart transport remain required work.',
        'The counted work witness bounds only instrumented root refinements and promotions for the named midpoint query. It does not bound total arithmetic, coefficient growth, expression expansion, heap use or cancellation. External timeouts are containment only.',
        'Native stroke replay remains separate from a filled-region archive. Full pre-push workflow/Clippy qualification and published-package delivery remain pending for these bytes.',
        'Byte equality is used only for deterministic encoding omission. Exact predicates, selected relations, original domains and policy receipts continue to establish mathematical equality.'
    ],
}, indent=2) + '\\n')
''' + s[b:]
s=s.replace('Record selected circle frame replay qualification','Record correlated point and circle predicate qualification')
write('archive_fiber_point_order_evidence.py',s)

s=converted('close_circle_replay_increment.py').replace('Replay exact selected circle frames and angular contacts','Preserve common-field point queries through circle replay')
write('close_fiber_point_order_increment.py',s)
s=converted('persist_circle_replay_increment.py');write('persist_fiber_point_order_increment.py',s)

s=converted('close_circle_replay_when_qualified.py')
a="    if len(rows) == 18 and (root / 'fiber-point-order-final-dependent-packages.log').is_file():\n        subprocess.run([sys.executable, str(root / 'close_fiber_point_order_increment.py')], check=True)"
b="""    if len(rows) == 18 and (root / 'fiber-point-order-final-dependent-packages.log').is_file() and (root / 'circle-replay-final-commit.json').is_file():
        subprocess.run([sys.executable, str(root / 'reparent_fiber_point_order.py')], check=True)
        subprocess.run([sys.executable, str(root / 'close_fiber_point_order_increment.py')], check=True)"""
assert a in s;s=s.replace(a,b)
write('close_fiber_point_order_when_qualified.py',s)
print('Prepared V parent transition, archive, closeout, persistence and watcher controls; no checkout edited.')
