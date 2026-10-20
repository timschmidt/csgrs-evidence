"""Qualify the integrated BREP consumer, with selected dependency observations.

This is not a complete repository pre-push, release, or binding campaign.
Every attempt is retained; failures do not erase subsequent independent checks.
"""
import argparse
from pathlib import Path
import shutil
from check import run, OUT

C = ['--offline', '--locked']
CORE = ['-p', 'hyperbrep', '-p', 'hyperbrep-io']
WASM = Path('/tmp/hyperbrep-upstream-corrections-wasm-probe')
COMMANDS = [
    ('native-debug', ['cargo', 'test', *C, *CORE, '--all-features'], {}, 1200),
    ('native-release', ['cargo', 'test', *C, *CORE, '--all-features', '--release'], {}, 1200),
    ('native-minimal', ['cargo', 'test', *C, *CORE, '--no-default-features', '--release'], {}, 1200),
    ('scalar-all', ['cargo', 'test', *C, '-p', 'hyperreal', '--all-features', '--release'], {}, 900),
    ('solver-residuals', ['cargo', 'test', *C, '-p', 'hypersolve', '--all-features', '--release', 'residual_replay::tests'], {}, 900),
    ('solver-representations', ['cargo', 'test', *C, '-p', 'hypersolve', '--all-features', '--release', '--test', 'real_representations'], {}, 1800),
    ('upstream-workflows', ['cargo', 'test', *C, '-p', 'csgrs', '--release', '--no-default-features', '--features', 'curve', '--no-fail-fast', '--test', 'strict_drilled_workflows', '--test', 'adapter_boolean_failures', '--test', 'exact_path_failures'], {}, 1200),
    ('native-clippy', ['cargo', 'clippy', *C, *CORE, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('native-minimal-clippy', ['cargo', 'clippy', *C, *CORE, '--no-default-features', '--all-targets', '--', '-D', 'warnings'], {}, 900),
    ('native-docs', ['cargo', 'doc', *C, *CORE, '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}, 900),
    ('circular-example', ['cargo', 'run', *C, '-p', 'hyperbrep-io', '--example', 'circular_step', '--release'], {}, 900),
    ('fuzz-check', ['cargo', 'check', *C, '--manifest-path', 'crates/hyperbrep/fuzz/Cargo.toml', '--bins'], {}, 900),
    ('wasm-lock', ['cargo', 'generate-lockfile', '--offline', '--manifest-path', str(WASM/'Cargo.toml')], {}, 300),
    ('wasm-build', ['cargo', 'build', *C, '--manifest-path', str(WASM/'Cargo.toml'), '--target', 'wasm32-unknown-unknown', '--release'], {}, 1200),
    ('wasm-runtime', ['python3', str(WASM/'run.py')], {}, 300),
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], {}, 300),
]
parser = argparse.ArgumentParser()
parser.add_argument('--only', nargs='+', choices=[x[0] for x in COMMANDS])
args = parser.parse_args()
(WASM/'src').mkdir(parents=True, exist_ok=True)
for source, dest in [('Cargo.toml', 'Cargo.toml'), ('lib.rs', 'src/lib.rs'), ('run.py', 'run.py')]:
    shutil.copyfile(OUT/'wasm-probe'/source, WASM/dest)
failures = []
for label, command, env, seconds in COMMANDS:
    if args.only and label not in args.only:
        continue
    if run(label, command, seconds, env):
        failures.append(label)
    if label == 'wasm-lock' and (WASM/'Cargo.lock').exists():
        shutil.copyfile(WASM/'Cargo.lock', OUT/'wasm-probe/Cargo.lock')
print('failed checks:', failures, flush=True)
raise SystemExit(bool(failures))
