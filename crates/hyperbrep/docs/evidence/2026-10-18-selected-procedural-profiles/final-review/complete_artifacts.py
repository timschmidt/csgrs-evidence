"""Complete the unchanged-source artifact stage using an exact finite-source proof.

Retain the failed narrow audit. Reuse its successfully generated and repeated
files, verify every byte binding, and generate the remaining new archives twice.
The supplemental relation is evidence only; it is not a production adapter.
"""
import copy
import hashlib
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ROOT, hashes, run
from finite_source_comparison import compare
from format_comparison import compare as narrow_compare

sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
read = lambda p: json.loads(Path(p).read_text())
write = lambda p, data: Path(p).write_text(json.dumps(data, indent=2)+'\n')
source = hashes()
baseline = OUT.parent/'2026-10-18-retained-plane-contacts'
ledgers = ['artifact-comparison.json', 'artifacts.json', 'parallel-artifacts.json',
           'planar-artifacts.json', 'selected-planar-artifacts.json', 'plane-contact-artifacts.json']
inputs = {str(p.relative_to(ROOT)): sha(p) for p in [
    Path(__file__), Path(__file__).with_name('finite_source_comparison.py'),
    OUT/'analysis-recipes/format_comparison.py', OUT/'analysis-recipes/artifacts.py',
    OUT/'before-finite-source-final-stages.json', OUT/'finite-source-findings.json',
    OUT/'consumers.json', *[OUT/name for name in ledgers], *[baseline/name for name in ledgers]]}
prior = read(OUT/'before-finite-source-final-stages.json')
assert prior['source'] == source
assert [row['exit_code'] for row in prior['rows']] == [0, 0, 0, 1]
binaries = read(OUT/'consumers.json')['binaries']
assert all(sha(row['path']) == row['sha256'] for row in binaries.values())
old_binary = read(OUT/'artifacts.json')['binary']
assert sha(old_binary['path']) == old_binary['sha256']

rows = []
for ledger in ledgers:
    current = read(OUT/ledger)
    assert current['source'] == source
    by_path = {row['path']: row for row in current['rows']}
    previous = read(baseline/ledger)['rows']
    assert set(by_path) == {row['path'] for row in previous}
    for old in previous:
        row = by_path[old['path']]
        path = OUT/row['path']
        assert sha(path) == row['sha256'] and path.stat().st_size == row['bytes']
        if 'repeat' in row:
            assert path.read_bytes() == (OUT/row['repeat']).read_bytes()
        rows.append(dict(path=row['path'], **compare(baseline/row['path'], path)))
assert len(rows) == len({row['path'] for row in rows}) == 450
finite = [row for row in rows if any(change['migration'] == 'explicit_finite_source_restriction'
                                    for change in row['verified_schema_changes'])]
assert [row['path'] for row in finite] == [
    'plane-contact-artifacts/finite-pole-subcurve-0.json',
    'plane-contact-artifacts/finite-pole-subcurve-1.json']

# Each independently varied field must still be rejected, in both chart directions.
negative_dir = OUT/'final-review/format-negatives'
negative_dir.mkdir(exist_ok=False)
negative_rows = []
for index, row in enumerate(finite):
    original = read(row['candidate'])
    for mutation in ['finite_endpoint', 'source_coefficient', 'source_index',
                     'reversed_flag', 'chart_scale', 'unconsumed_definition']:
        value = copy.deepcopy(original)
        image = value['curves'][0]['PlanarImage']
        restriction = image['source']['SourceRange']
        if mutation == 'finite_endpoint':
            restriction['range'][1]['Scalar']['rational']['denominator'] = [3]
        elif mutation == 'source_coefficient':
            value['selection']['pcurve_sources'][0]['RationalBezier']['homogeneous_controls'][1][0]['rational']['numerator'] = [2]
        elif mutation == 'source_index':
            restriction['source'] = 1
        elif mutation == 'reversed_flag':
            restriction['reversed'] = True
        elif mutation == 'chart_scale':
            image['source_chart'][0]['rational']['numerator'] = [2]
        else:
            value['selection']['pcurve_sources'].append(copy.deepcopy(value['selection']['pcurve_sources'][0]))
        path = negative_dir/f'{index}-{mutation}.json'
        write(path, value)
        try:
            compare(row['baseline'], path)
        except AssertionError:
            negative_rows.append(dict(path=str(path.relative_to(OUT)), baseline=row['baseline'],
                                      mutation=mutation, sha256=sha(path), rejected=True))
        else:
            raise AssertionError(('accepted_mutation', index, mutation))

# The rejected scalar-fact losses from the earlier implementation are not migrations.
scalar_rows = []
for path in sorted((OUT/'format-preflight/selected-planar').glob('*.json')):
    old = baseline/'selected-planar-artifacts'/path.name
    try:
        narrow_compare(old, path)
    except AssertionError:
        try:
            compare(old, path)
        except AssertionError:
            scalar_rows.append(dict(path=str(path.relative_to(OUT)), baseline=str(old), sha256=sha(path), rejected=True))
        else:
            raise AssertionError(('accepted_scalar_loss', path))
assert len(negative_rows) == 12 and len(scalar_rows) == 6
write(OUT/'finite-source-proof.json', dict(source=source, inputs=inputs, finite_rows=finite,
    mutation_controls=negative_rows, scalar_loss_controls=scalar_rows,
    scope='Both exact finite-source encodings and 448 other prior artifacts pass; all 12 field mutations and six prior scalar-fact losses are rejected. Every newly appended source is consumed by an exact checked restriction. No field is discarded or approximately compared.'))
write(OUT/'format-migration.json', dict(source=source, inputs=inputs, rows=rows,
    scope='All 450 baseline artifacts: exact bytes except the verified v9/v10 header, affine source-chart coefficients, and explicit finite-source restriction in two rational pole-exclusion archives. Source coefficients, selectors, scalar facts and topology remain identical. Independent geometry assertions run in native/WASM consumers; this field audit alone is not a set-equality oracle.'))

for suffix in ['artifacts', 'repeat']:
    destination = OUT/('selected-procedural-'+suffix)
    assert not destination.exists()
    assert run('selected-procedural-'+suffix, [binaries['new_native']['path'], 'all'], 900,
        {'HYPERBREP_SELECTED_PROCEDURAL_ARTIFACT_DIR': str(destination)}) == 0
    assert hashes() == source
files = sorted((OUT/'selected-procedural-artifacts').glob('*.json'))
assert files and [p.name for p in files] == sorted(p.name for p in (OUT/'selected-procedural-repeat').glob('*.json'))
new_rows = []
for path in files:
    repeat = OUT/'selected-procedural-repeat'/path.name
    assert path.read_bytes() == repeat.read_bytes()
    new_rows.append(dict(path=str(path.relative_to(OUT)), repeat=str(repeat.relative_to(OUT)),
                        sha256=sha(path), bytes=path.stat().st_size))
assert hashes() == source
assert all(sha(ROOT/name) == digest for name, digest in inputs.items())
assert all(sha(row['path']) == row['sha256'] for row in binaries.values())
write(OUT/'selected-procedural-artifacts.json', dict(source=source, inputs=inputs,
    rows=new_rows, fresh_processes=2, binary=binaries['new_native']))
print(json.dumps(dict(preserved=450, finite_source_proofs=len(finite), negative_controls=18,
                      new_artifacts=len(new_rows))))
