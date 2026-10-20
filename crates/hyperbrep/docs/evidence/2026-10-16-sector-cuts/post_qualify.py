"""Run the full unchanged frontier, then build and measure complete corpora."""
import argparse
import json
from pathlib import Path
import shutil
from check import OUT, hashes, run
from inherited_scalar import COMPLETE_LABELS, unchanged_subject, verify_baseline, verify_complete_failure

parser = argparse.ArgumentParser()
parser.add_argument('--name', default='benchmark-v1')
parser.add_argument('--new-name', default='new-sector-costs')
args = parser.parse_args()
source = hashes()
rows = json.loads((OUT / 'attempts.json').read_text())
verify_baseline()
for label in [*COMPLETE_LABELS, 'scalar-clippy', 'predicate-consumer', 'curve-consumer', 'native-debug', 'native-release', 'native-minimal', 'native-clippy', 'native-minimal-clippy',
              'rustdoc', 'analytic-example', 'faceted-example', 'advanced-example', 'supplied-example',
              'circular-example', 'similarity-example', 'occt-reader', 'fuzz-check', 'wasm-build',
              'wasm-runtime', 'fmt', 'diff-check']:
    row = [r for r in rows if r['label'] == label][-1]
    assert row['source_unchanged'], row
    unchanged_subject(json.loads((OUT / row['source']).read_text()), source)
    if label in COMPLETE_LABELS:
        verify_complete_failure(row)
    else:
        assert row['exit_code'] == 0, row
print('Collecting scoped cost evidence; the inherited whole-scalar gate remains failed.', flush=True)
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
                         '--bench', 'seam_cuts', '--bench', 'coplanar', '--bench', 'sectors', '--message-format=json'], 900),
    ('scalar-candidate-build', ['cargo', 'build', '--offline', '--locked', '--release', '-p', 'hyperreal', '--features', 'simple', '--bench', 'numerical_micro', '--bench', 'library_perf', '--message-format=json'], 900),
    ('benchmarks', ['python3', str(OUT / 'benchmark.py'), '--name', args.name], 3600),
    ('new-sector-benchmarks', ['python3', str(OUT / 'measure_new.py'), '--name', args.new_name], 1800),
    ('scalar-benchmarks', ['python3', str(OUT / 'scalar_benchmark.py')], 1800),
]
for label, command, seconds in commands:
    result = run(label, command, seconds)
    if result:
        raise SystemExit(result)
