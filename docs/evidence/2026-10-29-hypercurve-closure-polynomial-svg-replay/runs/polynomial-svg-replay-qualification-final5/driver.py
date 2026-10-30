from pathlib import Path
import argparse, importlib.util, json, os, signal, subprocess, sys, time

sys.dont_write_bytecode = True
args = argparse.ArgumentParser()
args.add_argument('--attempt', required=True)
args.add_argument('--probe', required=True)
args = args.parse_args()
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / 'polynomial-svg-replay'
record = c / ('polynomial-svg-replay-qualification-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
probe = c / ('polynomial-svg-replay-' + args.probe)
while not (probe / 'complete.json').exists():
    time.sleep(5)
    assert e.source_snapshot()[0] == source
completed = json.loads((probe / 'complete.json').read_text())
if not completed['all_passed'] or completed['source'] != source:
    e.save_json(record / 'complete.json', {'all_passed': False, 'source': source, 'groups': 0, 'blocked_by': str(probe), 'epoch': time.time()})
    raise SystemExit(1)
e.save_json(record / 'acceptance-probe.json', completed)
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_NET_OFFLINE': 'true',
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CARGO_TARGET_DIR': str(r.parent / 'hypercurve-polynomial-chamfer-admission'),
       'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1'}
base = ['cargo', 'test', '--locked', '--release', '--all-features']
curve = base + ['-p', 'hypercurve', '--lib']
for target in ['polynomial_projection', 'polynomial_curves', 'polynomial_boundary_components',
               'polynomial_region_admission', 'polynomial_closure_composition',
               'polynomial_selected_abscissas', 'polynomial_query_fibers',
               'polynomial_algebraic_pairs', 'polynomial_selected_chords',
               'hypercurve_svg', 'svg_scalar_failures', 'svg_point_replay',
               'svg_selected_replay', 'svg_chord_replay', 'svg_parallel_replay',
               'svg_circle_replay', 'svg_region_replay']:
    curve += ['--test', target]
model = base + ['-p', 'csgrs']
for target in ['svg_point_replay', 'svg_selected_replay', 'svg_chord_replay',
               'svg_parallel_replay', 'svg_circle_replay', 'svg_region_replay',
               'export_projection_contracts']:
    model += ['--test', target]
matrix = ['python3', 'crates/hypercurve/scripts/capability_matrix.py', '--output', str(record / 'capabilities')]
catalog = json.loads((w / 'crates/hypercurve/qualification/capabilities.json').read_text())
selected = []
for fixture in catalog['fixtures']:
    if fixture['id'].startswith(('polynomial_projection_', 'polynomial_svg_', 'polynomial_chamfer_')) or fixture['id'] in [
        'authored_svg', 'polynomial_finite_projection', 'implicit_algebraic_pair_regions',
        'implicit_region_similarities', 'implicit_region_limits']:
        selected.append(fixture['id'])
        matrix += ['--fixture', fixture['id']]
e.save_json(record / 'capability-selection.json', selected)
commands = [
    ('fmt', ['cargo', '+1.99.1', 'fmt', '--all', '--', '--check']),
    ('typos', ['typos']),
    ('diff', ['git', 'diff', '--check']),
    ('repository-budget', ['scripts/check-repository-budget.sh']),
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py']),
    ('msrv-clippy', ['cargo', '+1.95.0', 'clippy', '--locked', '--release', '-p', 'hypercurve', '-p', 'csgrs', '-p', 'hyperbrep', '--all-targets', '--all-features', '--', '-D', 'warnings']),
    ('adapter-polynomial', base + ['-p', 'csgrs', '--test', 'svg_polynomial_replay']),
    ('curve-owners', curve),
    ('model-consumers', model),
    ('native-replay', base + ['-p', 'hyperbrep', '--test', 'polynomial_replay', '--test', 'polynomial_points']),
    ('brep-io-consumer', base + ['-p', 'hyperbrep-io']),
    ('graphics-consumer', base + ['-p', 'hypergraphics']),
    ('minimal-projection', ['cargo', 'test', '--locked', '--release', '--no-default-features', '-p', 'hypercurve', '--test', 'polynomial_projection']),
    ('minimal-check', ['cargo', 'check', '--locked', '--release', '--no-default-features', '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs']),
    ('docs', ['cargo', 'doc', '--locked', '--release', '--no-deps', '--all-features', '-p', 'hypercurve', '-p', 'hyperbrep', '-p', 'csgrs']),
    ('curve-fuzz', ['cargo', '+1.95.0', 'clippy', '--locked', '--manifest-path', 'crates/hypercurve/fuzz/Cargo.toml', '--bins', '--', '-D', 'warnings']),
    ('matrix', matrix),
]
rows = []
for name, command in commands:
    assert e.source_snapshot()[0] == source
    current = dict(env)
    if name == 'msrv-clippy':
        current['CARGO_TARGET_DIR'] += '-msrv'
    if name == 'curve-fuzz':
        current['CARGO_TARGET_DIR'] += '-fuzz'
    if name == 'docs':
        current['RUSTDOCFLAGS'] = '-D warnings'
    started = time.time()
    with (record / (name + '.log')).open('w') as log:
        child = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=current,
                                 stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'pid': child.pid, 'name': name, 'command': command, 'epoch': started})
        try:
            code = child.wait(timeout=7200)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL)
            child.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time()-started,
           'external_timeout_seconds': 7200, 'source_stable': after == source,
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
    'scope': 'Affected projection, exact SVG graph and downstream consumers. Original repeated polynomial chamfer remains a separately retained gap; this is not complete pre-push qualification.', 'epoch': time.time()})
