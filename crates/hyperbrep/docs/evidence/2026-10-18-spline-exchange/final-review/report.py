"""Check unchanged complete consumers before admitting any cost comparison."""
from collections import Counter
import hashlib
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

OLD = OUT.parent/'2026-10-18-native-boundary-images'
read = lambda n: json.loads((OUT/n).read_text())
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
source = hashes()
q = read('qualification-driver.json')
assert q['source'] == source and not q['failures']
assert read('finish-checks.json')['passed'] and read('finish-checks.json')['source'] == source
attempts = read('attempts.json')
latest = {row['label']: row for row in attempts}
assert all(row['source_unchanged'] for row in attempts)
counts = {}
for label, expected in [('native-release', 618), ('native-minimal', 610), ('axial-debug', 26),
                        ('axial-proof-debug', 5), ('axial-chart-debug', 2), ('plane-relation-debug', 2),
                        ('native-image-debug', 8), ('retained-profile-debug', 6), ('curve-tests', 93), ('spline-native-debug', 4), ('spline-io-debug', 5)]:
    row = latest[label]
    text = (OUT/row['log']).read_text()
    groups = [tuple(map(int, g)) for g in re.findall(
        r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out', text)]
    counts[label] = dict(passed=sum(g[0] for g in groups), failed=sum(g[1] for g in groups),
                         ignored=sum(g[2] for g in groups), exit_code=row['exit_code'], log=row['log'])
    if label in q['upstream_debug_blocked']:
        assert row['exit_code'] and 'FACTORS > 0' in text
    else:
        assert row['exit_code'] == 0 and counts[label]['passed'] == expected and counts[label]['failed'] == 0, (label, counts[label])

wasm = json.loads((OUT/latest['wasm-runtime']['log']).read_text())
assert wasm['probe_groups'] == 138 and wasm['imports'] == 0
assert sha(Path(read('wasm-binary.json')['path'])) == wasm['wasm_sha256']
for name, total in [('consumer-admission.json', 8), ('previous-axial-admission.json', 4), ('components-admission.json', 2)]:
    item = read(name)
    assert item['source'] == source and item['complete_workflows'] == total
assert read('old-path-control.json')['preserved']
frontier = read('continuation-frontier.json')
assert frontier['counts'] == dict(native_result=81) and not frontier['changes']

artifacts = []
old_manifest = json.loads((OLD/'manifest.json').read_text())
folders = ['exports', 'faceted-exports', 'advanced-exports', 'scaled-exports', 'torus-exports',
           'cone-exports', 'final-prism-artifacts', 'region-exports', 'component-exports',
           'final-artifacts', 'previous-axial-exports', 'old-path-artifacts', 'growth-artifacts',
           'frontier-extension-artifacts', 'reconstruction-candidate-artifacts', 'cone-candidate-artifacts']
for folder in folders:
    prior = sorted(p for p in (OLD/folder).rglob('*') if p.is_file())
    candidate = sorted(p for p in (OUT/folder).rglob('*') if p.is_file())
    assert prior and {p.relative_to(OLD/folder) for p in prior} == {p.relative_to(OUT/folder) for p in candidate}, folder
    for a in prior:
        assert sha(a) == old_manifest['evidence_files'][str(a.relative_to(OLD))]
        b = OUT/folder/a.relative_to(OLD/folder)
        artifacts.append(dict(path=str(b.relative_to(OUT)), baseline=str(a.relative_to(ROOT)),
                              baseline_sha256=sha(a), candidate_sha256=sha(b),
                              baseline_bytes=a.stat().st_size, candidate_bytes=b.stat().st_size,
                              unchanged=a.read_bytes() == b.read_bytes()))
(OUT/'artifact-comparison.json').write_text(json.dumps(dict(rows=artifacts,
    counts=dict(Counter('unchanged' if r['unchanged'] else 'changed' for r in artifacts)),
    scope='Every preceding final native/STEP consumer artifact. Byte equality is separate from the preserved independently derived semantic assertions.'), indent=2)+'\n')
assert len(artifacts) == 211 and all(row['unchanged'] for row in artifacts)

def prism(row):
    text = (OUT/row['log']).read_text()
    error = re.search(r'^error=(.*)$', text, re.M)
    item = dict(fixture=re.search(r'^fixture=(.*)$', text, re.M).group(1), log=row['log'],
                outcome='unsupported' if error else 'native_result')
    if error:
        item['error'] = error.group(1)
    else:
        assert 'replay=Ok(' in text
        item['bodies'] = int(re.search(r'^bodies=(\d+)$', text, re.M).group(1))
        size = re.search(r'^step_bytes=(\d+)$', text, re.M)
        if size:
            item.update(step='exported', step_bytes=int(size.group(1)))
        elif item['bodies'] == 0:
            item['step'] = 'canonical_empty'
        else:
            rejected = re.search(r'^step_error=(.*)$', text, re.M)
            assert rejected
            item.update(step='unsupported', step_error=rejected.group(1))
    return item

before = {r['fixture']: r for r in json.loads((OLD/'prism-frontier.json').read_text())['rows']}
prisms = [prism(r) for label, r in latest.items() if label.startswith('final-prism-')]
assert len(prisms) == 24 and set(before) == {r['fixture'] for r in prisms}
for row in prisms:
    assert {k: v for k, v in row.items() if k != 'log'} == {k: v for k, v in before[row['fixture']].items() if k != 'log'}, row
(OUT/'prism-frontier.json').write_text(json.dumps(dict(rows=prisms, counts=dict(native_result=24), changes=[],
    scope='All 24 original full-size prism outcomes, replay, output sizes and typed export failures unchanged.'), indent=2)+'\n')
invalid = [r['file'] for r in read('prism-occt.json')['fixtures'] if not r['valid']]
previous_invalid = [r['file'] for r in json.loads((OLD/'prism-occt.json').read_text())['fixtures'] if not r['valid']]
assert [Path(p).name for p in invalid] == [Path(p).name for p in previous_invalid]
axial_reader = read('axial-shell-occt.json')['rows']
assert len(axial_reader) == 8 and all(r['valid'] and r['solids'] == 1 for r in axial_reader)

summary = dict(source=source, tests=counts, qualification=q['executed'],
    upstream_debug_blocked=q['upstream_debug_blocked'], complete_axial_workflows=8,
    preserved_native_diagnostics=81, original_prism_cases=24,
    preceding_artifact_counts=dict(unchanged=211),
    wasm=dict(groups=138, imports=0, binary=read('wasm-binary.json')),
    failures=[r for r in attempts if r['exit_code']],
    inherited_upstream_failures=json.loads((OLD/'qualification-summary.json').read_text())['inherited_upstream_failures'],
    independent_reader_invalid_shapes=invalid,
    independent_reader_diagnostics='../2026-10-17-axial-shells/occt-thin-comparison.json',
    independent_reader_logs=[latest[n]['log'] for n in ['axial-shell-occt', 'previous-axial-occt', 'components-occt', 'occt-cones', 'torus-occt', 'occt-read', 'prism-occt']],
    scope='Exact spline STEP exchange and BREP chart/image admission. All preceding source-path completion, exact assertions, deterministic artifacts and typed failures preserved, except the deliberately extended Bezier writer fixture now requires success. New complete workflows and STEP limitations are recorded separately. General resource, coverage, source qualification, release/MSRV/binding and complete pre-push gates remain open.')
(OUT/'qualification-summary.json').write_text(json.dumps(summary, indent=2)+'\n')
(OUT/'final-source.json').write_text(json.dumps(source, indent=2)+'\n')
if '--consumers-only' not in sys.argv:
    cost = read('cost-summary.json')
    assert cost['source'] == source and (cost['preserved_cases'], cost['new_cases'], cost['commands']) == (192, 0, 132)
    assert cost['receipt_preserved'] and not cost['migrations'] and not cost['representation_migration']
print(json.dumps({k: v for k, v in summary.items() if k in ['tests', 'upstream_debug_blocked', 'preceding_artifact_counts', 'original_prism_cases']}, indent=2), flush=True)
