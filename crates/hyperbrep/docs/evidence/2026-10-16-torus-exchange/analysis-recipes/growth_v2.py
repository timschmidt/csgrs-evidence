"""Measure serialized expression growth after exact repeated native admission."""
import hashlib
import json
from pathlib import Path
import shutil
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import ENV, OUT, ROOT, hashes, run

PROJECT = Path('/tmp/hyperbrep-torus-continuation-probe')
source = hashes()
probe = Path(__file__).with_suffix('.rs')
inputs = [Path(__file__), probe, PROJECT / 'Cargo.toml', PROJECT / 'Cargo.lock',
    ROOT / 'crates/hyperreal/src/rational/arithmetic/representation.rs']
biguint = Path('/tmp/hyperbrep-review-cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.6/src/biguint/serde.rs')
inputs.append(biguint)
digests = lambda: {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in inputs}
before = digests()
(OUT / 'growth-inputs.json').write_text(json.dumps(before, indent=2) + '\n')
shutil.copyfile(probe, PROJECT / 'src/bin/torus_growth.rs')
assert run('torus-growth-build', ['cargo', 'build', '--offline', '--locked', '--release',
    '--manifest-path', str(PROJECT / 'Cargo.toml'), '--bin', 'torus_growth'], 900) == 0
target = Path(ENV['CARGO_TARGET_DIR']) / 'release/torus_growth'
assert run('torus-growth', [str(target), str(OUT / 'growth-artifacts')], 300) == 0
assert digests() == before and hashes() == source
assert (PROJECT / 'src/bin/torus_growth.rs').read_bytes() == probe.read_bytes()

rows = []
for path in sorted((OUT / 'growth-artifacts').glob('cycle-*.json')):
    node = json.loads(path.read_text())
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
                    # num-bigint 0.4.6 serializes little-endian base-u32 digits
                    # on both native word widths; the owning source is bound.
                    return max((i*32+w.bit_length() for i, w in enumerate(words) if w), default=0)
                numerator_bits = max(numerator_bits, bits(value['numerator']))
                denominator_bits = max(denominator_bits, bits(value['denominator']))
            stack.extend((child, d, j+1) for child in value.values())
        elif isinstance(value, list):
            stack.extend((child, d, j+1) for child in value)
    rows.append(dict(cycle=int(path.stem.split('-')[1]), bytes=path.stat().st_size,
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        serialized_computable_nodes=count, maximum_serialized_computable_depth=depth,
        rational_wire_records=rational_count, maximum_numerator_bits=numerator_bits,
        maximum_denominator_bits=denominator_bits, maximum_json_depth=json_depth))
assert [r['cycle'] for r in rows] == list(range(5))
result = dict(rows=rows, source=source, input_digests=before,
    executable=dict(path=str(target), bytes=target.stat().st_size,
        sha256=hashlib.sha256(target.read_bytes()).hexdigest()),
    scope='Five complete native archive states, original rational band then four midpoint subdivision/reload cycles. Every replay checks exact volume and area, interior/boundary classification and byte equality. If direct measure equality is undecided, the independent oracle proves pi positive and checks the same equality after dividing both exact sides by pi; the unscaled predicate is not claimed repaired. Computable counts/depth describe serialized node occurrences, not live DAG sharing; rational coefficient bits follow the bound serializer. These are observed growth measurements, not total-work, retained-heap, cancellation or arbitrary-depth bounds. Allocation and process RSS are measured separately in the completed-workflow benchmarks.')
(OUT / 'growth-summary.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(rows, indent=2))
