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
WASM = Path('/tmp/hyperbrep-curved-continuation-wasm-probe')
COMMANDS = [
    ('native-debug', ['cargo', 'test', *C, *CORE, '--all-features', '--no-fail-fast'], {}, 1800),
    ('native-release', ['cargo', 'test', *C, *CORE, '--all-features', '--release', '--no-fail-fast'], {}, 1800),
    ('native-minimal', ['cargo', 'test', *C, *CORE, '--no-default-features', '--release', '--no-fail-fast'], {}, 1800),
    ('scalar-all-features', ['cargo', 'test', *C, '-p', 'hyperreal', '--all-features', '--test', 'periodic_rounding', '--test', 'periodic_endpoint_congruence', '--test', 'public_numeric_semantics'], {}, 900),
    ('scalar-minimal', ['cargo', 'test', *C, '-p', 'hyperreal', '--no-default-features', '--features', 'serde', '--test', 'periodic_rounding', '--test', 'periodic_endpoint_congruence', '--test', 'public_numeric_semantics'], {}, 900),
    ('dependency-libraries', ['cargo', 'test', *C, *DEPS, '--all-features', '--release', '--lib', '--no-fail-fast'], {}, 1800),
    ('scalar-minimal-library', ['cargo', 'test', *C, '-p', 'hyperreal', '--no-default-features', '--features', 'serde', '--release', '--lib'], {}, 900),
    ('native-clippy', ['cargo', 'clippy', *C, *CORE, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('native-minimal-clippy', ['cargo', 'clippy', *C, *CORE, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('dependency-clippy', ['cargo', 'clippy', *C, *DEPS, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('dependency-minimal-clippy', ['cargo', 'clippy', *C, *DEPS, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('rustdoc', ['cargo', 'doc', *C, *CORE, *DEPS, '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}, 900),
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
failures = []
executed = []
for label, command, env, seconds in COMMANDS:
    if args.only and label not in args.only:
        continue
    executed.append(label)
    if run(label, command, seconds, env):
        failures.append(label)
    assert source == hashes()
assert hashlib.sha256(Path(__file__).read_bytes()).hexdigest() == recipe
path = OUT / 'qualification-drivers.json'
rows = json.loads(path.read_text()) if path.exists() else []
rows.append(dict(recipe=str(Path(__file__).relative_to(ROOT)), sha256=recipe,
                 executed=executed, failures=failures, source_unchanged=True))
path.write_text(json.dumps(rows, indent=2) + '\n')
print('failed checks:', failures, flush=True)
raise SystemExit(bool(failures))
