"""Run the full unchanged frontier, then build and measure complete corpora."""
import argparse
import json
from pathlib import Path
import shutil
from check import OUT, hashes, run

parser = argparse.ArgumentParser()
parser.add_argument('--name', default='benchmark-v1')
parser.add_argument('--new-name', default='new-coplanar-costs')
args = parser.parse_args()
source = hashes()
rows = json.loads((OUT / 'attempts.json').read_text())
for label in ['native-debug', 'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
              'rustdoc', 'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example',
              'circular-example', 'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
              'wasm-runtime', 'fmt', 'diff-check']:
    row = [r for r in rows if r['label'] == label][-1]
    assert row['exit_code'] == 0 and row['source_unchanged'], row
    assert json.loads((OUT / row['source']).read_text()) == source, label
probe = Path('/tmp/hyperbrep-analytic-similarity-wasm-probe')
shutil.copyfile(OUT / 'original-frontier.rs.txt', probe / 'examples/seam_continuation.rs')
commands = [
    ('final-frontier', ['cargo', 'run', '--offline', '--locked', '--release', '--manifest-path', str(probe / 'Cargo.toml'), '--example', 'seam_continuation'], 900),
    ('benchmark-build', ['cargo', 'build', '--offline', '--locked', '--release', '--no-default-features',
                         '--features', 'csgrs/curve,hyperreal/serde', '-p', 'csgrs', '-p', 'hypermesh',
                         '-p', 'hyperreal', '-p', 'hyperbrep', '-p', 'hyperbrep-io', '-p', 'hypercurve',
                         '--bench', 'export', '--bench', 'faceted', '--bench', 'advanced', '--bench', 'circles',
                         '--bench', 'pcurves', '--bench', 'analytic_export', '--bench', 'kernel', '--bench', 'closed_edges',
                         '--bench', 'arc', '--bench', 'edge_images', '--bench', 'analytic_similarity',
                         '--bench', 'seam_cuts', '--bench', 'coplanar', '--message-format=json'], 900),
    ('benchmarks', ['python3', str(OUT / 'benchmark.py'), '--name', args.name], 3600),
    ('new-coplanar-benchmarks', ['python3', str(OUT / 'measure_new.py'), '--name', args.new_name], 1800),
]
for label, command, seconds in commands:
    result = run(label, command, seconds)
    if result:
        raise SystemExit(result)
