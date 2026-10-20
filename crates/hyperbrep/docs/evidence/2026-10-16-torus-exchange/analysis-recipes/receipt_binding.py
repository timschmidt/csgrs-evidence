"""Bind every captured archive and composed receipt to the completed timings."""
import collections
import hashlib
import json
from pathlib import Path
import sys

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import hashes

read = lambda p: json.loads(p.read_text())
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
source = hashes()
identity = hashlib.sha256(json.dumps(source, sort_keys=True).encode()).hexdigest()
campaign = OUT/'benchmark-v1'
inputs = read(OUT/'receipt-probe-inputs.json')
assert inputs['product_source_identity'] == identity
assert read(campaign/'source.json') == source
for name, expected in inputs['files'].items(): assert digest(Path(name)) == expected, name
proof_path = OUT/'receipt-archive-equality.json'
proof = read(proof_path)
by_file = {r['file']: r for r in proof['archives']}
assert len(by_file) == len(proof['archives']) == 173
attempts = read(OUT/'attempts.json')
proof_command = [r for r in attempts if r['label']=='receipt-archive-equality'][-1]
assert proof_command['exit_code'] == 0 and proof_command['source_unchanged']
assert read(OUT/proof_command['source']) == source
MASK = (1 << 64) - 1
MULTIPLIER = 0x100000001b3
SEED = 0xcbf29ce484222325
def fnv(data):
    h = SEED
    for byte in data: h = ((h ^ byte)*MULTIPLIER) & MASK
    return h
def combine(values):
    h = values[0]
    for value in values[1:]: h = ((h*MULTIPLIER) & MASK) ^ value
    return h

migrations = read(campaign/'observed-receipt-migrations.json')
assert len(migrations) == 5
expected_names = {r['case'] for r in migrations}
observed = {}
artifacts = {}
for side in ['baseline', 'candidate']:
    directory = OUT/('receipt-'+side+'-artifacts')
    rows = read(directory/'receipts.json')
    assert len(rows) == 5 and {r['case'] for r in rows} == expected_names
    observed[side] = {}
    artifacts[side] = {}
    for row in rows:
        values = []
        for file in row['artifacts']:
            path = directory/file['file']
            data = path.read_bytes()
            value = fnv(data)
            assert file['bytes'] == len(data) and file['receipt'] == value
            assert file['file'] not in artifacts[side]
            result = by_file[file['file']]
            assert result[side+'_bytes'] == len(data) and result[side+'_receipt'] == value
            artifacts[side][file['file']] = dict(bytes=len(data), sha256=digest(path), receipt=value)
            values.append(value)
        if row['case'] == 'sectors/similarity_matrix':
            assert len(values) == 150
            result = SEED
            for i in range(0, 150, 5): result = ((result*MULTIPLIER) & MASK) ^ combine(values[i:i+5])
        else:
            assert len(values) == (5 if row['case'].startswith('sectors/') else 6)
            result = combine(values)
        assert result == row['receipt'], row['case']
        for trial in range(1, 4):
            corpus = row['case'].split('/')[0]
            raw = [json.loads(line) for line in (campaign/f'{corpus}-{side}-{trial}.log').read_text().splitlines()]
            timed = [r for r in raw if r['case'] == row['case']]
            assert len(timed) == 1 and timed[0]['receipt'] == result and timed[0]['outcome'] == 'certified'
        observed[side][row['case']] = result
    assert len(artifacts[side]) == 173
assert set(artifacts['baseline']) == set(artifacts['candidate']) == set(by_file)
for migration in migrations:
    for side in ['baseline', 'candidate']:
        assert migration[side]['checksum'] == observed[side][migration['case']]

counts = collections.Counter()
changed = []
for name, row in by_file.items():
    assert row['non_scalar_changes'] == 0 and row['changed_archives_revalidate_on_candidate']
    a = (OUT/'receipt-baseline-artifacts'/name).read_bytes()
    b = (OUT/'receipt-candidate-artifacts'/name).read_bytes()
    assert row['same_bytes'] == (a == b)
    if a != b:
        assert row['changed_exact_scalars'], name
        changed.append(name)
    else: assert not row['changed_exact_scalars']
    for scalar in row['changed_exact_scalars']:
        kind = scalar['proof']['kind']
        assert kind in ['strict exact scalar equality', 'exact sin/cos injectivity']
        counts[kind] += 1

binaries = read(OUT/'receipt-probe-binaries.json')
for item in binaries.values():
    path = Path(item['path'])
    assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
    assert item['build']['exit_code'] == 0 and item['build']['source_unchanged']
gate = read(campaign/'receipt-admission.json')
assert not gate['passed'] and gate['observed'] == migrations and gate['review'] is None
record = dict(passed=True, source_identity=identity, archive_pairs=173,
    byte_identical_pairs=173-len(changed), changed_archives=changed,
    changed_scalar_proofs=dict(counts), non_scalar_changes=0,
    benchmark_rows=observed, all_three_trials_bound=True,
    artifacts=artifacts, proof_command=proof_command,
    proof_sha256=digest(proof_path), input_sha256=digest(OUT/'receipt-probe-inputs.json'),
    migrations_sha256=digest(campaign/'observed-receipt-migrations.json'),
    original_failed_gate_sha256=digest(campaign/'receipt-admission.json'),
    recipe_sha256=digest(Path(__file__)),
    scope='Complete post-campaign artifact comparison and binding. The original no-migration gate remains failed. Explicit review of these five exact representation migrations is a separate required decision; no production or timed workload is changed by this analysis.')
(OUT/'receipt-artifact-binding.json').write_text(json.dumps(record, indent=2)+'\n')
print(json.dumps({k:record[k] for k in ['passed', 'archive_pairs', 'byte_identical_pairs', 'changed_scalar_proofs', 'non_scalar_changes']},indent=2))
