"""Bind the complete archive proof to each measured receipt migration."""
import hashlib
import json
from pathlib import Path
import re

OUT = Path(__file__).resolve().parents[1]
read = lambda path: json.loads(path.read_text())
write = lambda path, value: path.write_text(json.dumps(value, indent=2) + '\n')
proof = read(OUT / 'receipt-archive-equality.json')
archives = {row['case']: row for row in proof['archives']}
assert len(archives) == 4

def fnv(data):
    value = 0xcbf29ce484222325
    for byte in data:
        value = ((value ^ byte) * 0x100000001b3) & ((1 << 64) - 1)
    return value

bound = []
for name, row in archives.items():
    assert row['non_scalar_changes'] == 0 and row['both_archives_strictly_validate']
    assert row['changed_exact_scalars']
    for side in ['baseline', 'candidate']:
        path = OUT / ('receipt-' + side + '-artifacts') / (name + '.json')
        data = path.read_bytes()
        assert len(data) == row[side + '_bytes']
        assert fnv(data) == row[side + '_receipt']
        bound.append(dict(case=name, side=side, path=str(path.relative_to(OUT)),
                          bytes=len(data), fnv1a64=fnv(data), sha256=hashlib.sha256(data).hexdigest()))
    before = OUT / 'receipt-baseline-artifacts' / (name + '.step')
    after = OUT / 'receipt-candidate-artifacts' / (name + '.step')
    assert before.read_bytes() == after.read_bytes()

campaign = OUT / 'benchmark-v1'
commands = read(campaign / 'commands.json')
assert len(commands) == 96 and all(row['exit_code'] == 0 for row in commands)
observed = read(campaign / 'observed-receipt-migrations.json')
expected = {('circles', 'circles/' + kind + '_' + mode + '_document')
            for kind in ['closed', 'partial'] for mode in ['fresh', 'reused']}
expected |= {('pcurves', 'pcurves/' + kind + '_' + mode)
             for kind in ['full', 'partial'] for mode in ['fresh', 'reused']}
expected.add(('circles', 'fixture facts'))
assert len(observed) == 9 and {(row['corpus'], row['case']) for row in observed} == expected
reviews = []
for row in observed:
    corpus, case = row['corpus'], row['case']
    if case == 'fixture facts':
        covered = ['circles-closed', 'circles-partial']
        for side in ['baseline', 'candidate']:
            assert len(row[side]) == 2
            for text in row[side]:
                match = re.fullmatch(r'fixture name=(closed|partial) input_bytes=(\d+) output_bytes=(\d+) output_fnv1a64=([0-9a-f]+)', text)
                assert match, text
                name = 'circles-' + match[1]
                assert int(match[2]) == (OUT / ('receipt-' + side + '-artifacts') / (name + '.step')).stat().st_size
                assert int(match[3]) == archives[name][side + '_bytes']
                assert int(match[4], 16) == archives[name][side + '_receipt']
    else:
        kind = case.split('/')[1].split('_')[0]
        name = corpus + '-' + kind
        covered = [name]
        for side in ['baseline', 'candidate']:
            expected_checksum = (archives[name][side + '_bytes'] * row[side]['iterations']
                                 if corpus == 'circles' else archives[name][side + '_receipt'])
            assert row[side]['checksum'] == expected_checksum
    reviews.append(dict(corpus=corpus, case=case,
        reason='Principal rational atan now retains its signed reciprocal representation. The exact angle values are unchanged; their serialized expression trees and byte sizes intentionally differ. This is a separately identified representation migration accompanying the prism capability extension.',
        independent_semantic_checks='receipt-archive-equality.json recursively compares the complete old/new archives. Every changed scalar has an exact proof; all non-scalar fields agree, both archives validate, and the existing cylinder checks retain independent volume, point, image and composition expectations. The unchanged benchmark also checks explicit edge/source-parameter mappings and deterministic fresh/reused results on all three trials.',
        source_evidence_scope='All non-scalar archive topology, carrier and selection structures agree. Original supplied pcurve/master mappings and entity accounting remain checked by the unchanged benchmark helpers. This does not establish whole-document or general Boolean-history persistence.',
        archives=covered,
        changed_scalar_fields=sum(len(archives[name]['changed_exact_scalars']) for name in covered)))

def features(label):
    attempts = read(OUT / 'attempts.json')
    attempt = [r for r in attempts if r['label'] == label][-1]
    assert attempt['exit_code'] == 0
    selected = {'hyperreal', 'hyperlattice', 'hyperlimit', 'hypercurve', 'hypersolve', 'hypertri', 'hyperbrep', 'hyperbrep_io'}
    values = {}
    for line in (OUT / attempt['log']).read_text().splitlines():
        if not line.startswith('{'):
            continue
        item = json.loads(line)
        if item.get('reason') == 'compiler-artifact' and item['target']['name'] in selected:
            values[item['target']['name']] = item['features']
    assert set(values) == selected
    return values

assert features('receipt-baseline-emit') == features('receipt-candidate-emit') == features('benchmark-build')
write(OUT / 'receipt-artifact-binding.json', dict(passed=True, artifacts=bound,
      feature_configuration=features('benchmark-build'),
      old_case_records=8, fixture_fact_records=1,
      source_tree='receipt-baseline-source.json', inputs='receipt-probe-inputs.json',
      binaries='receipt-probe-binaries.json',
      proof='receipt-archive-equality.json',
      scope='All four reproduced archive hashes/sizes match the actual frozen-binary benchmark receipts, with matching geometry feature configurations. Inputs are byte-identical; every observed old receipt change is individually covered.'))
write(OUT / 'approved-receipt-migrations.json', dict(changes=observed, reviews=reviews,
      evidence='receipt-artifact-binding.json',
      scope='Eight case receipts and one fixture-fact record, individually bound to complete exact archive comparisons. No other original receipt is waived. The original failed unreviewed-receipt assertion remains retained.'))
print(json.dumps(dict(approved_records=len(reviews), archives=len(archives),
                      exact_scalar_fields=sum(len(row['changed_exact_scalars']) for row in archives.values()))))
