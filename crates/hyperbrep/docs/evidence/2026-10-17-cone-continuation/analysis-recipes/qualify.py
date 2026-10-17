"""Sequential final-source qualification; every attempt remains source-bound."""
import argparse
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes, run

C = ['--offline', '--locked']
CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
DEPS = ['-p', 'hyperreal', '-p', 'hyperlimit', '-p', 'hypersolve', '-p', 'hypercurve']
WASM = Path('/tmp/hyperbrep-cone-continuation-wasm-probe')
COMMANDS = [
    ('native-debug', ['cargo', 'test', *C, *CORE, '--all-features', '--no-fail-fast'], {}, 1800),
    ('native-release', ['cargo', 'test', *C, *CORE, '--all-features', '--release', '--no-fail-fast'], {}, 1800),
    ('native-minimal', ['cargo', 'test', *C, *CORE, '--no-default-features', '--release', '--no-fail-fast'], {}, 1800),
    ('scalar-all-features', ['cargo', 'test', *C, '-p', 'hyperreal', '--all-features', '--test', 'periodic_rounding', '--test', 'periodic_endpoint_congruence', '--test', 'public_numeric_semantics', '--test', 'cone_chart_relations'], {}, 900),
    ('scalar-minimal', ['cargo', 'test', *C, '-p', 'hyperreal', '--no-default-features', '--features', 'serde', '--test', 'periodic_rounding', '--test', 'periodic_endpoint_congruence', '--test', 'public_numeric_semantics', '--test', 'cone_chart_relations'], {}, 900),
    ('dependency-libraries', ['cargo', 'test', *C, *DEPS, '--all-features', '--release', '--lib', '--no-fail-fast'], {}, 1800),
    ('scalar-minimal-library', ['cargo', 'test', *C, '-p', 'hyperreal', '--no-default-features', '--features', 'serde', '--release', '--lib'], {}, 900),
    ('relation-debug', ['cargo', 'test', *C, '-p', 'hyperreal', '--all-features', '--lib', 'ring_', '--', '--nocapture'], {}, 900),
    ('inherited-zero-factor-default', ['cargo', 'test', *C, '-p', 'hyperreal', '--test', 'determinant_product_cancellation', 'other_arities_keep_their_mathematical_values', '--', '--exact'], {}, 900),
    ('inherited-zero-factor-all-features', ['cargo', 'test', *C, '-p', 'hyperreal', '--all-features', '--test', 'determinant_product_cancellation', 'other_arities_keep_their_mathematical_values', '--', '--exact'], {}, 900),
    ('native-clippy', ['cargo', 'clippy', *C, *CORE, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('native-minimal-clippy', ['cargo', 'clippy', *C, *CORE, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('dependency-clippy', ['cargo', 'clippy', *C, *DEPS, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('dependency-minimal-clippy', ['cargo', 'clippy', *C, *DEPS, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('rustdoc', ['cargo', 'doc', *C, *CORE, *DEPS, '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}, 900),
]
# Explicit synthetic-uncertainty migration: all changed public callers and
# both feature configurations retain the original positive identities and
# separate exact-but-unresolved controls. The full curve integration run also
# retains all unchanged composition and generated-case inputs.
for features, name in [(['--all-features'], 'all-features'), (['--no-default-features'], 'minimal')]:
    scalar_features = features if name == 'all-features' else [*features, '--features', 'serde']
    COMMANDS += [
        ('fixture-scalar-' + name, ['cargo', 'test', *C, '-p', 'hyperreal', '--release', *scalar_features, '--test', 'affine_polynomial_cancellation', '--test', 'quotient_polynomial_cancellation', '--no-fail-fast'], {}, 900),
        ('fixture-predicate-' + name, ['cargo', 'test', *C, '-p', 'hyperlimit', '--release', *features, '--test', 'point_equality', '--test', 'composite_policy', '--test', 'real_representations', '--no-fail-fast'], {}, 900),
    ]
    curve_targets = ['*'] if name == 'all-features' else [
        'hypercurve_arc_bezier', 'hypercurve_bezier_fit_offset', 'hypercurve_curve',
        'hypercurve_curve_intersection', 'hypercurve_curve_point',
        'hypercurve_curve_region_boolean', 'hypercurve_curve_region_promotion',
        'hypercurve_curve_region_stroke', 'hypercurve_nurbs_interpolation', 'marching_squares',
    ]
    COMMANDS.append(('fixture-curve-' + name,
        ['cargo', 'test', *C, '-p', 'hypercurve', '--release', *features,
         *[argument for target in curve_targets for argument in ['--test', target]], '--no-fail-fast'], {}, 3600))
COMMANDS += [
    ('fixture-solver-smoke', ['cargo', 'test', *C, '-p', 'hypersolve', '--release', '--all-features', '--test', 'smoke', 'residual_ball_certification_preserves_approximate_policy_certainty', '--', '--exact'], {}, 900),
    ('solver-representations', ['cargo', 'test', *C, '-p', 'hypersolve', '--release', '--all-features', '--test', 'real_representations'], {}, 900),
    ('dependency-minimal-libraries', ['cargo', 'test', *C, *DEPS, '--no-default-features', '--release', '--lib', '--no-fail-fast'], {}, 1800),
    ('relation-minimal-debug', ['cargo', 'test', *C, '-p', 'hyperreal', '--no-default-features', '--features', 'serde', '--lib', 'ring_'], {}, 900),
]
for label, example, folder in [
    ('analytic', 'analytic_step', 'exports'), ('faceted', 'faceted_step', 'faceted-exports'),
    ('advanced', 'advanced_step', 'advanced-exports'), ('supplied', 'supplied_step', None),
    ('circular', 'circular_step', None), ('similarity', 'analytic_similarity', 'scaled-exports'),
    ('torus', 'torus_step', 'torus-exports'),
]:
    command = ['cargo', 'run', *C, '-p', 'hyperbrep-io', '--example', example, '--release']
    if folder:
        command += ['--', str(OUT / folder)]
    COMMANDS.append((label + '-example', command, {}, 900))
COMMANDS += [
    ('torus-occt', ['python3', str(OUT / 'torus_occt.py')], {}, 300),
    ('occt-reader', ['python3', str(OUT / 'occt_read.py')], {}, 300),
    ('fuzz-check', ['cargo', 'check', *C, '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--bins'], {}, 900),
    ('wasm-build', ['cargo', 'build', *C, '--manifest-path', str(WASM / 'Cargo.toml'), '--target', 'wasm32-unknown-unknown', '--release'], {}, 900),
    ('wasm-runtime', ['python3', str(WASM / 'run.py')], {}, 1800),
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], {}, 300),
    ('diff-check', ['git', 'diff', '--check'], {}, 300),
]
parser = argparse.ArgumentParser()
parser.add_argument('--only', nargs='+', choices=[row[0] for row in COMMANDS])
args = parser.parse_args()
recipe = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
source = hashes()
wasm_paths = [(OUT/'wasm-probe'/name, WASM/name) for name in ['Cargo.toml','Cargo.lock','run.py']]
wasm_paths += [(OUT/'wasm-probe'/name, WASM/'src'/name) for name in ['lib.rs','faceted.rs']]
for retained, actual in wasm_paths:
    assert retained.read_bytes()==actual.read_bytes(), actual
wasm_inputs = {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for pair in wasm_paths for p in pair}
(OUT/'wasm-source-binding.json').write_text(json.dumps(wasm_inputs,indent=2)+'\n')
failures = []
executed = []
for label, command, env, seconds in COMMANDS:
    if args.only and label not in args.only:
        continue
    executed.append(label)
    if run(label, command, seconds, env):
        failures.append(label)
    assert source == hashes()
    assert all(hashlib.sha256(Path(p).read_bytes()).hexdigest()==digest for p,digest in wasm_inputs.items())
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
path = OUT / 'qualification-drivers.json'
rows = json.loads(path.read_text()) if path.exists() else []
rows.append(dict(recipe=str(Path(__file__).relative_to(ROOT)), sha256=recipe,
                 executed=executed, failures=failures, source_unchanged=True))
path.write_text(json.dumps(rows, indent=2) + '\n')
print('failed checks:', failures, flush=True)
raise SystemExit(bool(failures))
