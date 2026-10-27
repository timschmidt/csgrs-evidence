from pathlib import Path
import hashlib
import importlib.util
import json
import os
import re
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-fiber-point-order')
base = json.loads((root / 'circle-replay-final-commit.json').read_text())['commit']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=checkout, text=True).strip() == base
results = json.loads((root / 'fiber-point-order-final-results.json').read_text())
assert len(results) == 18 and all(r['exit_code'] == 0 and r['source_stable'] for r in results)
before = json.loads((root / 'fiber-point-order-final-files-before.json').read_text())
assert before == json.loads((root / 'fiber-point-order-final-files-after.json').read_text())
receipts = {'crates/hypercurve/FUTURE_WORK.md', 'docs/evidence-archive.md', 'docs/evidence-archive.tsv'}
transition = json.loads((root / 'fiber-point-order-parent-transition.json').read_text())
assert transition['all_non_receipt_bytes_unchanged'] and transition['new'] == base
qualified_source = json.loads((root / 'fiber-point-order-final-source-before.json').read_text())
assert qualified_source == json.loads((root / 'fiber-point-order-final-source-after.json').read_text())
for name, mode, digest in before:
    if mode in ['file', 'executable']:
        if name in receipts:
            assert (checkout / name).read_bytes() == subprocess.check_output(['git', 'show', base + ':' + name], cwd=checkout), name
        else:
            assert hashlib.sha256((checkout / name).read_bytes()).hexdigest() == digest, name

def test_counts(path):
    rows = re.findall(r'test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored;', path.read_text())
    assert rows and all(row[0] == 'ok' and row[2] == '0' for row in rows), path
    return {'suites': len(rows), **{key: sum(int(row[i]) for row in rows) for key, i in [('passed', 1), ('failed', 2), ('ignored', 3)]}}

full = test_counts(root / 'fiber-point-order-final-full-suite.log')
assert full == {'suites': 92, 'passed': 2839, 'failed': 0, 'ignored': 34}, full
downstream = test_counts(root / 'fiber-point-order-final-downstream.log')
assert downstream['suites'] == 11 and downstream['passed'] == 64 and downstream['ignored'] == 0, downstream
packages = ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']
package_counts = {name: test_counts(root / ('fiber-point-order-final-dependent-' + name + '.log')) for name in packages}
assert sum(count['passed'] for count in package_counts.values()) == 3012
assert all(count['passed'] > 0 and count['failed'] == 0 and count['ignored'] == 0 for count in package_counts.values())
assert re.search(r'Ran 16 tests', (root / 'fiber-point-order-final-matrix-guards.log').read_text())
run = Path('/tmp/hypercurve-fiber-point-order-capabilities')
report = json.loads((run / 'report.json').read_text())
assert report['status'] == 'witnesses_passed' and report['evidence_inputs_stable'] and len(report['fixtures']) == 188
repo = Path('/tmp/csgrs-closure-evidence.git')
branch = 'refs/heads/hypercurve-fiber-point-order-evidence-2026-10-27'
parent = json.loads((root / 'circle-replay-evidence-archive.json').read_text())['commit']
assert subprocess.check_output(['git', '--git-dir=' + str(repo), 'rev-parse', 'refs/heads/hypercurve-circle-replay-evidence-2026-10-27'], text=True).strip() == parent
assert subprocess.run(['git', '--git-dir=' + str(repo), 'show-ref', '--verify', '--quiet', branch]).returncode == 1
record = 'docs/evidence/2026-10-27-hypercurve-closure-fiber-point-order'
staging = Path('/tmp/hypercurve-fiber-point-order-evidence-archive')
out = staging / record
out.mkdir(parents=True, exist_ok=False)
manifest = []

def copy(source, relative):
    data = source.read_bytes()
    dest = out / relative
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(data)
    manifest.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()})

for source in sorted(root.glob('fiber-point-order-*')):
    if source.is_file() and source.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.c', '.svg']:
        copy(source, Path('commands') / source.name)
    elif source.is_dir():
        for child in sorted(source.rglob('*')):
            if child.is_file() and child.suffix in ['.json', '.jsonl', '.log', '.patch', '.rs', '.py']:
                copy(child, Path('commands') / source.name / child.relative_to(source))
for source in sorted(run.rglob('*')):
    if source.is_file():
        copy(source, Path('matrix') / source.relative_to(run))
scripts = set(root.glob('*fiber_point_order*.py')) | {root / 'check_increment_receipt.py'}
for source in sorted(scripts):
    copy(source, Path('commands') / source.name)
changed = subprocess.check_output(['git', 'diff', '--name-only'], cwd=checkout, text=True).splitlines()
untracked = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard'], cwd=checkout, text=True).splitlines()
for name in sorted(set(changed + untracked)):
    copy(checkout / name, Path('source') / name)
patch = (root / 'fiber-point-order-final-candidate.patch').read_bytes()
(out / 'source.json').write_text(json.dumps({
    'base': qualified_source['revision'], 'commit_parent': base,
    'patch_sha256': hashlib.sha256(patch).hexdigest(), 'recorded_epoch': time.time(),
    'owner': 'Hypercurve common rational point-field queries, selected-circle incidence and half chart, and retained chord unit-direction replay',
    'properties': ['P15', 'P18', 'P19', 'P20', 'P27', 'P29', 'P30'],
    'domain': 'Shared selected point fields reached through checked rational maps and similarities. Oblique linear projection and circle residual consume those fields without independent coordinate materialization. A certified incident point whose displacement reduces to represented constants in a represented normal frame uses the existing exact rational half chart. The original witness has 2*beta^7-1=0, beta in (3/4,1), gamma^5+beta-2=0, gamma in (1,2), and a chord-normal unit circle with a 3-4-5 frame.',
    'full_suite': full, 'root_downstream_tests': downstream, 'per_package_tests': package_counts,
    'guard_tests': 16, 'matrix_fixtures': 188, 'commands': results,
    'source_attribution': 'Every final command ran on identical full before/after source snapshots, based on S with the complete frozen T/U implementations and V changes. Validation overlapped independent U validation. Only after all 18 V groups passed and U was committed did reparenting import the three U receipts. The parent-transition record proves every other source byte unchanged. The full qualified patch is against source.json base; the V-only patch against commit_parent is retained in the post-reparent record. Three V ledger receipts follow archive creation. No non-receipt implementation or documentation edit followed final qualification.',
    'infrastructure_recovery': 'The host temporary filesystem quota interrupted the Hypercircuit output and qualification report after nine completed command groups. The truncated attempt is retained, without inferring a successful exit. Following verified storage recovery, the whole command and remaining groups were reexecuted on identical source.',
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
}, indent=2) + '\n')
(out / 'retained-files.json').write_text(json.dumps(manifest, indent=2) + '\n')
env = {**os.environ, 'GIT_INDEX_FILE': '/tmp/hypercurve-fiber-point-order-evidence.index'}
cmd = ['git', '--git-dir=' + str(repo), '--work-tree=' + str(staging)]
subprocess.run(cmd + ['read-tree', parent], env=env, check=True)
subprocess.run(cmd + ['add', '--', record], env=env, check=True)
tree = subprocess.check_output(cmd + ['write-tree'], env=env, text=True).strip()
commit = subprocess.check_output(cmd + ['commit-tree', tree, '-p', parent, '-m', 'Record correlated point and circle predicate qualification'], env=env, text=True).strip()
subprocess.run(cmd + ['update-ref', branch, commit, '0' * 40], check=True)
spec = importlib.util.spec_from_file_location('evidence_archive', checkout / 'scripts/evidence_archive.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOTS = {record: False}
rows = module.manifest(str(repo), commit)
assert len(rows) == 2
result = {'commit': commit, 'parent': parent, 'branch': branch, 'record': record, 'manifest_row': rows[1], 'full_suite': full, 'root_downstream_tests': downstream}
(root / 'fiber-point-order-evidence-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result))
