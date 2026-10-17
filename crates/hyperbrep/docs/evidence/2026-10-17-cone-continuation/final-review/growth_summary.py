"""Record serialized growth without presenting occurrences as retained heap."""
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes
from source_binding import admit

sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
read = lambda p: json.loads(p.read_text())
attempts = read(OUT / 'attempts.json')
source = hashes()
commands = {}
for label in ['torus-growth', 'reconstruction-continuation', 'cone-continuation-restore', 'cone-continuation-swapped', 'cone-continuation-band']:
    row = next(r for r in reversed(attempts) if r['label'] == label)
    assert row['exit_code'] == 0 and row['source_unchanged']
    admit(row, source)
    commands[label] = row

def statistics(path):
    node = read(path)
    stack = [(node, 0, 0)]
    depth = count = rational_count = numerator_bits = denominator_bits = json_depth = 0
    while stack:
        value, d, j = stack.pop()
        json_depth = max(json_depth, j)
        if isinstance(value, dict):
            if 'internal' in value:
                d += 1
                count += 1
                depth = max(depth, d)
            if {'sign', 'numerator', 'denominator'} <= value.keys():
                rational_count += 1
                def bits(words):
                    assert all(type(w) is int and 0 <= w < 2**32 for w in words)
                    return max((i*32+w.bit_length() for i, w in enumerate(words) if w), default=0)
                numerator_bits = max(numerator_bits, bits(value['numerator']))
                denominator_bits = max(denominator_bits, bits(value['denominator']))
            stack.extend((child, d, j+1) for child in value.values())
        elif isinstance(value, list):
            stack.extend((child, d, j+1) for child in value)
    return dict(path=str(path.relative_to(OUT)), bytes=path.stat().st_size, sha256=sha(path),
        serialized_computable_nodes=count, maximum_serialized_computable_depth=depth,
        rational_wire_records=rational_count, maximum_numerator_bits=numerator_bits,
        maximum_denominator_bits=denominator_bits, maximum_json_depth=json_depth)

rows = [dict(cycle=int(p.stem.split('-')[1]), **statistics(p)) for p in sorted((OUT / 'growth-artifacts').glob('cycle-*.json'))]
assert [r['cycle'] for r in rows] == list(range(5))
reconstruction = [statistics(p) for p in sorted((OUT / 'reconstruction-candidate-artifacts').glob('*.json'))]
assert reconstruction and any(r['path'].endswith('cycle-1-remainder.json') for r in reconstruction)
failed = OUT.parent / '2026-10-17-curved-continuation/reconstruction-diagnostic-artifacts/cycle-1-remainder.json'
replayed = OUT / 'reconstruction-candidate-artifacts/cycle-1-remainder.json'
# Keep any representation migration visible alongside the independent live/replay assertions.
byte_identical = failed.read_bytes() == replayed.read_bytes()
cone = {mode: [statistics(p) for p in sorted((OUT/'cone-candidate-artifacts'/mode).glob('*.json'))] for mode in ['restore','swapped','band']}
assert all(cone.values())
inputs = [Path(__file__), OUT / 'growth.rs.txt', OUT / 'reconstruction_diagnostic.rs.txt',
    ROOT / 'crates/hyperreal/src/rational/arithmetic/representation.rs', OUT/'final-review/cone_workflow.rs.txt', failed,
    Path('/tmp/hyperbrep-review-cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.6/src/biguint/serde.rs')]
result = dict(source=source, commands=commands, input_digests={str(p): sha(p) for p in inputs},
    rows=rows, reconstruction_rows=reconstruction, cone_rows=cone,
    formerly_failed_archive=dict(before=str(failed.relative_to(ROOT)), after=str(replayed.relative_to(OUT)),
        byte_identical=byte_identical, before_sha256=sha(failed), sha256=sha(replayed), final_cold_validation='passed inside reconstruction-continuation'),
    scope='Serialized Computable occurrences/depth and RationalWire little-endian u32 coefficient bits. Not live DAG counts, retained heap, total work, cancellation or arbitrary-depth bounds. The preceding five-state band probe retains exact volume, independent initial area and componentwise area preservation; its unresolved aggregate comparisons remain in the log. The swapped reconstruction probe has two split/reload/recut/remainder/union/empty-recovery cycles and direct independent measures on every checked live/replayed output. Each of the three cone workflows also retains both full split/reload/recut/reunion cycles and exact analytic measure/classification assertions. Full artifacts include intermediate states; they are not all the same geometry.')
(OUT / 'growth-summary.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(dict(preserved_band_states=len(rows), reconstruction_states=len(reconstruction),
    largest_reconstruction_bytes=max(r['bytes'] for r in reconstruction), cone_states={mode:len(rows) for mode,rows in cone.items()}, largest_cone_bytes=max(r['bytes'] for rows in cone.values() for r in rows))))
