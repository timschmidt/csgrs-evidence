"""Final diagnostics, archive-migration proof and isolated complete cost campaigns."""
import json
from pathlib import Path
import shutil
from check import OUT, hashes, run

source = hashes()
rows = json.loads((OUT / 'attempts.json').read_text())
for label in ['native-debug', 'native-release', 'native-minimal', 'native-clippy',
              'native-minimal-clippy', 'rustdoc', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check']:
    row = next(row for row in reversed(rows) if row['label'] == label)
    assert row['exit_code'] == 0 and row['source_unchanged']
    assert json.loads((OUT / row['source']).read_text()) == source
base = ['cargo', 'run', '--offline', '--locked', '--release', '--manifest-path',
        '/tmp/hyperbrep-analytic-similarity-wasm-probe/Cargo.toml', '--example']
for label, example in [('final-continuation', 'seam_continuation'), ('final-cone-size', 'seam_cone_size')]:
    if run(label, base + [example]): raise SystemExit(1)
previous_proof = (OUT / 'receipt-migration.json').read_bytes()
shutil.copyfile(OUT / 'receipt-migration.json', OUT / 'receipt-migration-initial.json')
for label, directory, arguments in [
    ('receipt-baseline', Path('/tmp/hyperbrep-seam-receipt-source/crates/hyperbrep'),
     ['emit', str(OUT / 'radical-baseline.json')]),
    ('receipt-candidate', Path('/tmp/hyperbrep-analytic-similarity-wasm-probe'),
     ['emit', str(OUT / 'radical-candidate.json')]),
    ('receipt-equality', Path('/tmp/hyperbrep-analytic-similarity-wasm-probe'),
     ['compare', str(OUT / 'radical-baseline.json'), str(OUT / 'radical-candidate.json'),
      str(OUT / 'receipt-migration.json')]),
]:
    command = ['cargo', 'run', '--offline', '--locked', '--release', '--manifest-path',
               str(directory / 'Cargo.toml'), '--example', 'receipt_migration', '--', *arguments]
    if run(label, command): raise SystemExit(1)
assert (OUT / 'receipt-migration.json').read_bytes() == previous_proof
command = ['cargo', 'build', '--offline', '--locked', '--release', '--no-default-features',
           '--features', 'csgrs/curve,hyperreal/serde']
for package in ['csgrs', 'hypermesh', 'hyperreal', 'hyperbrep', 'hyperbrep-io', 'hypercurve']:
    command.extend(['-p', package])
for bench in ['export', 'faceted', 'advanced', 'circles', 'pcurves', 'analytic_export', 'kernel',
              'closed_edges', 'arc', 'edge_images', 'analytic_similarity', 'seam_cuts']:
    command.extend(['--bench', bench])
command.append('--message-format=json')
if run('benchmark-build', command): raise SystemExit(1)
if run('benchmarks', ['python3', str(OUT / 'benchmark.py'), '--name', 'benchmark-v2', '--migration'], 7200):
    raise SystemExit(1)
raise SystemExit(run('new-seam-benchmarks', ['python3', str(OUT / 'measure_new.py')], 1800))
