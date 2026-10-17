"""Publish completed integration checks without re-admitting historical costs."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

OUT = Path(__file__).resolve().parent
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from qualify import hashes
from ledger_spans import replace_brep

read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
merge = read(OUT / 'merge-review.json')
source = hashes()
attempts = read(OUT / 'commands.json')
labels = ['native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
          'rustdoc', 'fuzz-check', 'format-debug', 'format-release', 'format-clippy',
          'example-features', 'example-clippy', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check']
qualification = [[row for row in attempts if row['label'] == label][-1] for label in labels]
for row in qualification:
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert read(OUT / row['source']) == source, row['label']
counts = {}
for row in qualification:
    if row['command'][:2] != ['cargo', 'test']:
        continue
    groups = re.findall(r'^test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',
                        (OUT / row['log']).read_text(), re.M)
    counts[row['label']] = dict(zip(['passed', 'failed', 'ignored'],
                                   [sum(int(group[i]) for group in groups) for i in range(3)]))
for label, expected in [('native-release', 512), ('native-minimal', 504),
                         ('format-debug', 15), ('format-release', 15)]:
    assert counts[label] == dict(passed=expected, failed=0, ignored=0), (label, counts[label])
wasm_row = [row for row in qualification if row['label'] == 'wasm-runtime'][0]
wasm = read(OUT / wasm_row['log'])
assert (wasm['probe_groups'], wasm['preserved_groups'], wasm['prism_groups'], wasm['imports']) == (83, 71, 12, 0)
prior = read(OUT.parent / '2026-10-16-prism-continuation/manifest.json')
assert wasm['wasm_sha256'] == prior['wasm']['wasm_sha256']
validation = (
    'On the integrated tree, BREP/IO release tests pass 512 with all features '
    'and 504 with minimal features; neither configuration has failures or ignored '
    'tests. Both warning-denied all-target Clippy configurations, rustdoc and '
    'fuzz-target compilation pass. The unchanged source-path WASM consumer passes '
    '83 groups with zero imports and retains the preceding binary hash. The '
    'incoming seven OBJ and eight STL regressions pass in both debug and release '
    'with obj-io,stl-io and no default features; targeted format Clippy and the '
    'curve,stl-io basic_shapes build/Clippy pass. Counts overlap across '
    'configurations and are not coverage metrics. Formatting passes.')
limits = (
    'No BREP, IO or numerical/geometry dependency runtime bytes change in this '
    'merge. The earlier prism correctness, exact representation migrations and '
    '96-process costs remain source-bound historical evidence, with no new timing '
    'or speedup claim. Nineteen adverse timing rows, sixty allocation increases, '
    'the two inherited scalar zero-factor failures, upstream native timing gates '
    'and three format export defects remain open. Fresh physical validation does '
    'not repair historical nested-FUSE identity failures or missing artifacts. '
    'All 28 BREP work packages remain open; this is not full-workspace/pre-push, '
    'package/MSRV, binding distribution, resource-bound, coverage, fuzz-runtime '
    'or formal-proof admission. No push.')
write(OUT / 'manifest.json', dict(
    baseline=merge['baseline'], upstream=merge['upstream'],
    decision='kept', scope='Upstream merge, BREP consumer qualification and downstream guidance; no local production patch.',
    source=qualification[0]['source'],
    source_identity=hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest(),
    source_comparison='source-comparison.json', merge_review='merge-review.json',
    qualification=qualification, all_attempts='commands.json', test_counts=counts,
    environment='environment.json', wasm=wasm, validation=validation, limits=limits,
    prior_feature_evidence='../2026-10-16-prism-continuation/manifest.json',
    script_inputs={name:hashlib.sha256((OUT / name).read_bytes()).hexdigest()
                   for name in ['qualify.py', 'finalize.py', 'audit.py', 'ledger_spans.py']},
    idea_ledger=[
        dict(idea='Consume upstream OBJ/STL corrections through their existing owning APIs', decision='kept', evidence='Incoming production/regression bytes exactly match upstream; both 15-test feature configurations and affected BREP paths pass.'),
        dict(idea='Reimplement format validation inside BREP', decision='already-satisfied', evidence='Hypermesh owns index/topology validation and CSGRS retains it at the format boundary. BREP needs guidance and qualification, not duplicated code.'),
        dict(idea='Interpret STL validation as exact analytic reconstruction or historical evidence repair', decision='rejected', evidence='Parsed binary32 topology does not prove prior source fidelity, and fresh physical builds do not establish historical dependency identity. Keep these gates separate.'),
    ]))

status_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = read(status_path)
entry_id = 'upstream-format-integration-2026-10-16'
assert all(item['id'] != entry_id for item in status['increments'])
status['increments'].append(dict(id=entry_id,
    work_packages=['WP00', 'WP14a', 'WP21', 'WP23'],
    properties=['P6', 'P17', 'P18', 'P19', 'P20', 'P22', 'P25', 'P26', 'P27', 'P35', 'P36', 'P37', 'P39'],
    change='Merge upstream OBJ/STL format corrections, retain both histories and ledger ownership, and apply parsed-topology/source-fidelity guidance to future BREP consumers.',
    evidence='evidence/' + OUT.name + '/manifest.json', decision='kept',
    validation=validation, limits=limits))
status['updated_on'] = '2026-10-16'
status['acceptance_contract']['upstream_revision'] = merge['upstream']
status['acceptance_contract']['latest_integration'] = 'evidence/' + OUT.name + '/README.md'
status['next_actions'][1] = (
    'Use the integrated prism continuation as the next exact feature baseline. '
    'Investigate repeated BREP builder certificate construction as specified in '
    'evidence/2026-10-16-prism-continuation/performance-investigation.md; causal '
    'contribution remains unmeasured. Preserve every old receipt, reviewed '
    'migration, adverse cost and complete workflow. Keep per-call conic comparison '
    'reuse. Persistent caches need separate identity, lifetime, resource and '
    'state-matrix admission; do not skip validation or output materialization.')
status['next_actions'][15] = (
    'Upstream c9410688b is integrated and affected BREP consumers are requalified. '
    'Fetch again at coherent development boundaries, keep each qualification '
    'source fixed, preserve both histories and ledger ownership, and requalify '
    'affected consumers. Preserve typed text/distribution contracts, source '
    'qualification, concatenation-versus-union and material-set Minkowski '
    'semantics. Parsed STL closed-PWN validity does not prove manifoldness or '
    'analytic fidelity; preserve native error causes and explicit empty outcomes. '
    'The three format export defects and unrelated native runtime failures remain '
    'upstream-owned. Fresh builds do not repair historical storage evidence.')
write(status_path, status)

ledger_path = ROOT / 'docs/properties-status.json'
ledger = read(ledger_path)
work = ledger['current_work']['hyperbrep']
work['latest_evidence'] = str((OUT / 'manifest.json').relative_to(ROOT))
work['latest_feature_evidence'] = 'crates/hyperbrep/docs/evidence/2026-10-16-prism-continuation/manifest.json'
work['latest_integration_evidence'] = str((OUT / 'README.md').relative_to(ROOT))
work['upstream_revision'] = merge['upstream']
work['qualification'] = validation + ' ' + limits
upstream_ledger = subprocess.check_output(
    ['git', 'show', merge['upstream'] + ':docs/properties-status.json'], cwd=ROOT, text=True)
ledger_path.write_text(replace_brep(upstream_ledger, work))

readme = OUT / 'README.md'
readme.write_text(readme.read_text() + '\n## Completed integration\n\n' + validation +
    '\n\n' + limits + '\n\nThe [manifest](manifest.json), [complete command record](commands.json), '
    '[source comparison](source-comparison.json) and [final audit](audit.json) '
    'bind these statements to the merged inputs. The integration adds no new '
    'production workaround outside BREP.\n')
assert hashes() == source
print(json.dumps(dict(tests=counts, wasm_groups=83, decision='kept'), indent=2))
