"""Frozen-source acceptance and affected validation; never a push authorization."""
from pathlib import Path
import argparse, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
c = root / 'controls'
w = root / 'empty-axis-topology'
parser = argparse.ArgumentParser()
parser.add_argument('--phase', choices=['focus', 'full'], required=True)
parser.add_argument('--attempt', required=True)
args = parser.parse_args()
record = c / ('empty-axis-topology-' + args.phase + '-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('evidence', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
for name in ['empty-axis-topology-contract.json', 'empty-axis-topology-base.json']:
    (record / name).write_bytes((c / name).read_bytes())
assert source['revision'] == json.loads((c / 'empty-axis-topology-base.json').read_text())['parent']
assert not source['untracked_inputs']
if args.phase == 'full':
    focused = json.loads((c / 'empty-axis-topology-latest-focus.json').read_text())
    assert focused['all_passed'] and focused['source'] == source
    e.save_json(record / 'focused-acceptance.json', focused)
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_NET_OFFLINE': 'true',
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CARGO_TARGET_DIR': str(root.parent / 'hypercurve-empty-axis-admission'),
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'),
       'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp'),
       'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1',
       'HYPERBREP_PLANE_TENSOR_ARTIFACT_DIR': str(record / 'brep-artifacts')}
base = ['cargo', 'test', '--locked', '--release', '--all-features']
if args.phase == 'focus':
    commands = [
        ('solver', base + ['-p', 'hypersolve', '--test', 'bivariate_empty_axis', '--test', 'bivariate_topology', '--test', 'bivariate_boundary_components']),
        ('curves', base + ['-p', 'hypercurve', '--test', 'polynomial_empty_axis']),
        ('brep', base + ['-p', 'hyperbrep', '--test', 'plane_tensor_sections', '--test', 'empty_plane_sections']),
        ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
        ('typos', ['typos']), ('diff', ['git', 'diff', '--check']),
        ('budget', ['scripts/check-repository-budget.sh']),
        ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py']),
    ]
else:
    commands = [
        ('msrv-clippy', ['cargo', '+1.95.0', 'clippy', '--locked', '--release', '-p', 'hypersolve', '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs', '--all-targets', '--all-features', '--', '-D', 'warnings']),
        ('solver-full', base + ['-p', 'hypersolve', '--all-targets']),
        ('solver-minimal', ['cargo', 'test', '--locked', '--release', '--no-default-features', '-p', 'hypersolve']),
        ('curve-full', base + ['-p', 'hypercurve', '--no-fail-fast']),
        ('repeat-chamfer', base + ['-p', 'hypercurve', '--test', 'polynomial_chamfer_corners', 'polynomial_chamfer_consumes_its_generated_chord_in_a_second_edit', '--', '--exact']),
        ('model-full', base + ['-p', 'csgrs', '--no-fail-fast']),
    ]
    commands += [('dependent-' + package, base + ['-p', package, '--no-fail-fast'])
                 for package in ['hyperbrep', 'hyperbrep-io', 'hypercircuit', 'hyperdrc', 'hypergraphics', 'hyperpack']]
    commands += [
        ('curve-minimal', ['cargo', 'test', '--locked', '--release', '--no-default-features', '-p', 'hypercurve', '--test', 'polynomial_empty_axis']),
        ('core-check', ['cargo', 'check', '--locked', '--release', '--no-default-features', '-p', 'hypersolve', '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs']),
        ('docs', ['cargo', 'doc', '--locked', '--release', '--no-deps', '--all-features', '-p', 'hypersolve', '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs']),
        ('solver-fuzz', ['cargo', '+1.95.0', 'clippy', '--locked', '--manifest-path', 'crates/hypersolve/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings']),
        ('curve-fuzz', ['cargo', '+1.95.0', 'clippy', '--locked', '--manifest-path', 'crates/hypercurve/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings']),
        ('allocation-profile', ['cargo', 'run', '--locked', '--release', '--all-features', '-p', 'hypersolve', '--example', 'allocation_profile', '--', '4']),
        ('matrix', ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', str(record / 'capabilities')]),
        ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
        ('typos', ['typos']), ('diff', ['git', 'diff', '--check']),
        ('budget', ['scripts/check-repository-budget.sh']),
        ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py']),
    ]
rows = []
for name, command in commands:
    assert e.source_snapshot()[0] == source
    current = dict(env)
    if name == 'msrv-clippy': current['CARGO_TARGET_DIR'] += '-msrv'
    if name.endswith('-fuzz'): current['CARGO_TARGET_DIR'] += '-' + name
    if name == 'docs': current['RUSTDOCFLAGS'] = '-D warnings'
    started = time.time()
    limit = 180 if name == 'repeat-chamfer' else 21600
    with (record / (name + '.log')).open('w') as log:
        process = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=current,
                                   stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'pid': process.pid, 'name': name, 'command': command, 'epoch': started})
        try:
            code = process.wait(timeout=limit)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code,
           'elapsed_seconds': time.time() - started, 'external_timeout_seconds': limit,
           'source_stable': after == source, 'settings': {key: current[key] for key in
               ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS', 'HYPERSOLVE_SKIP_BENCHMARK_REPORTS']}}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', after_files)
    print(row, flush=True)
    if code != 0 or after != source:
        e.save_json(record / 'complete.json', {'all_passed': False, 'source': source, 'groups': len(rows), 'epoch': time.time()})
        raise SystemExit(1)
complete = {'all_passed': True, 'source': source, 'groups': len(rows), 'record': str(record),
            'scope': 'Affected empty-axis topology qualification only; full repository pre-push and the general algebraic closure target remain separate.', 'epoch': time.time()}
e.save_json(record / 'complete.json', complete)
e.save_json(c / ('empty-axis-topology-latest-' + args.phase + '.json'), complete)
