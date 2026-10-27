from pathlib import Path
import importlib.util
import json
import os
import signal
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-point-replay')
target = '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-point-replay-admission'
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source, files, patch = evidence.source_snapshot()
assert source['revision'] == json.loads((root / 'chord-replay-final-commit.json').read_text())['commit']
assert json.loads((root / 'point-replay-parent-transition.json').read_text())['all_non_receipt_bytes_unchanged']
assert source == json.loads((root / 'point-replay-post-fuzz-fix-source.json').read_text())
evidence.save_json(root / 'point-replay-final-source-before.json', source)
evidence.save_json(root / 'point-replay-final-files-before.json', files)
(root / 'point-replay-final-candidate.patch').write_bytes(patch)
for name in source['untracked_inputs']:
    destination = root / 'point-replay-final-inputs' / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes((checkout / name).read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_TARGET_DIR': target,
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CCACHE_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache',
       'CCACHE_TEMPDIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
commands = [
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check'], {}),
    ('msrv-clippy', ['cargo', 'clippy', '--locked', '-p', 'hypercurve', '-p', 'csgrs', '-p', 'hyperbrep', '--all-targets', '--all-features', '--', '-D', 'warnings'], {'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': target + '-msrv'}),
    ('core-check', ['cargo', 'check', '--locked', '--release', '-p', 'hypercurve', '-p', 'hyperbrep', '--no-default-features'], {}),
    ('docs', ['cargo', 'doc', '--locked', '--no-deps', '--all-features', '-p', 'hypercurve', '-p', 'csgrs', '-p', 'hyperbrep'], {'RUSTDOCFLAGS': '-D warnings'}),
    ('fuzz-check', ['cargo', 'clippy', '--locked', '--manifest-path', 'crates/hypercurve/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings'], {'RUSTUP_TOOLCHAIN': '1.95.0', 'CARGO_TARGET_DIR': target + '-fuzz'}),
    ('full-suite', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--no-fail-fast'], {}),
    ('downstream', ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'csgrs', '--test', 'adapter_curve_failures', '--test', 'downstream_profiles', '--test', 'exact_profile_sweeps', '--test', 'mixed_modeling_profiles', '--test', 'svg_selected_replay', '--test', 'svg_parallel_replay', '--test', 'svg_chord_replay', '--test', 'svg_point_replay', '--test', 'export_projection_contracts', '--test', 'scalar_certificate_failures', '--no-fail-fast'], {}),
]
for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']:
    commands.append(('dependent-' + package, ['cargo', 'test', '--locked', '--release', '--all-features', '-p', package, '--no-fail-fast'], {}))
commands.extend([
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py'], {}),
    ('matrix', ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', '/tmp/hypercurve-point-replay-capabilities'], {}),
    ('typos', ['typos'], {}),
    ('budget', ['scripts/check-repository-budget.sh'], {}),
    ('diff', ['git', 'diff', '--check'], {}),
])
assert len(commands) == 18
records = []
for name, command, extra in commands:
    assert evidence.source_snapshot()[0] == source, 'Source changed before ' + name
    print('START', name, flush=True)
    started = time.time()
    with (root / ('point-replay-final-' + name + '.log')).open('w') as log:
        process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=checkout, env={**env, **extra}, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        try:
            code = process.wait(timeout=21600)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    after, after_files, _ = evidence.source_snapshot()
    row = {'name': name, 'command': command, 'cwd': str(checkout), 'started_epoch': started,
           'elapsed_seconds': time.time() - started, 'exit_code': code,
           'source_stable': source == after, 'external_timeout_seconds': 21600,
           'settings': {key: value for key, value in {**env, **extra}.items() if key in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'RUSTDOCFLAGS', 'CCACHE_DIR', 'CCACHE_TEMPDIR']}}
    records.append(row)
    evidence.save_json(root / 'point-replay-final-results.json', records)
    evidence.save_json(root / 'point-replay-final-source-after.json', after)
    evidence.save_json(root / 'point-replay-final-files-after.json', after_files)
    print('FINISH', name, code, round(row['elapsed_seconds'], 2), 'stable', row['source_stable'], flush=True)
    if code != 0 or not row['source_stable']:
        sys.exit(1)
logs = [root / ('point-replay-final-dependent-' + name + '.log') for name in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
(root / 'point-replay-final-dependent-packages.log').write_text('\n'.join(p.read_text() for p in logs))
print('QUALIFICATION COMPLETE', flush=True)
