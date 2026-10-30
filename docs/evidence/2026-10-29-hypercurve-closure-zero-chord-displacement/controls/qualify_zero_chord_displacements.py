from pathlib import Path
import argparse, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
c = root / 'controls'
w = root / 'polynomial-chamfer-dispatch'
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', required=True)
args = parser.parse_args()
record = c / ('zero-chord-displacement-qualification-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
for name in ['zero-chord-displacement-contract.json', 'zero-chord-displacement-integration.json']:
    (record / name).write_bytes((c / name).read_bytes())
integrated = json.loads((record / 'zero-chord-displacement-integration.json').read_text())
assert integrated['parent'] == source['revision'] and integrated['source'] == source
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_NET_OFFLINE': 'true',
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CARGO_TARGET_DIR': str(root.parent / 'hypercurve-polynomial-circle-center-relations-admission'),
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'),
       'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp'),
       'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1'}
base = ['cargo', 'test', '--locked', '--release', '--all-features']
model = base + ['-p', 'csgrs']
for target in ['svg_point_replay', 'svg_selected_replay', 'svg_chord_replay',
               'svg_parallel_replay', 'svg_circle_replay', 'svg_region_replay',
               'svg_polynomial_replay', 'export_projection_contracts']:
    model += ['--test', target]
matrix = ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', str(record / 'capabilities')]
catalog = json.loads((w / 'crates/hypercurve/qualification/capabilities.json').read_text())
selected = []
for fixture in catalog['fixtures']:
    if fixture['id'].startswith(('zero_chord_displacement_', 'selected_chord_displacement_')):
        selected.append(fixture['id'])
        matrix += ['--fixture', fixture['id']]
assert len(selected) >= 6
e.save_json(record / 'capability-selection.json', selected)
commands = [
    ('acceptance', base + ['-p', 'hypercurve', '--test', 'zero_chord_displacements', '--test', 'selected_chord_displacements']),
    ('repeat-chamfer', base + ['-p', 'hypercurve', '--test', 'polynomial_chamfer_corners',
                             'polynomial_chamfer_consumes_its_generated_chord_in_a_second_edit', '--', '--exact']),
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
    ('typos', ['typos']), ('diff', ['git', 'diff', '--check']),
    ('repository-budget', ['scripts/check-repository-budget.sh']),
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py']),
    ('msrv-clippy', ['cargo', '+1.95.0', 'clippy', '--locked', '--release', '-p', 'hypercurve',
                    '-p', 'csgrs', '-p', 'hyperbrep', '--all-targets', '--all-features', '--', '-D', 'warnings']),
    ('curve-full', base + ['-p', 'hypercurve', '--no-fail-fast']),
    ('model-consumers', model),
]
commands += [('dependent-' + package, base + ['-p', package, '--no-fail-fast'])
             for package in ['hyperbrep', 'hyperbrep-io', 'hypergraphics', 'hypercircuit', 'hyperdrc', 'hyperpack']]
commands += [
    ('minimal-bounds', ['cargo', 'test', '--locked', '--release', '--no-default-features',
                        '-p', 'hypercurve', '--test', 'zero_chord_displacements']),
    ('minimal-check', ['cargo', 'check', '--locked', '--release', '--no-default-features',
                       '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs']),
    ('docs', ['cargo', 'doc', '--locked', '--release', '--no-deps', '--all-features',
              '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs']),
    ('curve-fuzz', ['cargo', '+1.95.0', 'clippy', '--locked', '--manifest-path',
                    'crates/hypercurve/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings']),
    ('matrix', matrix),
]
rows = []
for name, command in commands:
    assert e.source_snapshot()[0] == source
    current = dict(env)
    if name == 'msrv-clippy':
        current['CARGO_TARGET_DIR'] += '-msrv'
    if name == 'curve-fuzz':
        current['CARGO_TARGET_DIR'] += '-curve-fuzz'
    if name == 'docs':
        current['RUSTDOCFLAGS'] = '-D warnings'
    started = time.time()
    limit = 180 if name == 'repeat-chamfer' else 21600
    with (record / (name + '.log')).open('w') as log:
        child = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=current,
                                 stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'pid': child.pid, 'name': name, 'command': command, 'epoch': started})
        try:
            code = child.wait(timeout=limit)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL)
            child.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - started,
           'external_timeout_seconds': limit, 'source_stable': after == source,
           'settings': {key: current[key] for key in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS']}}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', after_files)
    print(row, flush=True)
    if code != 0 or after != source:
        e.save_json(record / 'complete.json', {'all_passed': False, 'source': source, 'groups': len(rows), 'epoch': time.time()})
        raise SystemExit(1)
e.save_json(record / 'complete.json', {'all_passed': True, 'source': source, 'groups': len(rows),
    'scope': 'Zero-distance point bounds and native replay on the committed selected-chord composition increment; original repeated chamfer, full Hypercurve, modeling exports, six downstream consumers, strict MSRV lint, minimal builds, docs/fuzz checks and selected capability witnesses. Not full pre-push qualification.', 'epoch': time.time()})
