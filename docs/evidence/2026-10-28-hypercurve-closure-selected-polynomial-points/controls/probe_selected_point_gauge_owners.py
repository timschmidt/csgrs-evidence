from pathlib import Path
import argparse, importlib.util, json, os, signal, subprocess, sys, time

sys.dont_write_bytecode = True
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
parser = argparse.ArgumentParser()
parser.add_argument('--checkout', required=True)
parser.add_argument('--attempt', required=True)
parser.add_argument('--target', required=True)
parser.add_argument('--debug-order', action='store_true')
args = parser.parse_args()
w = r / args.checkout
record = c / ('selected-point-regressions-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_BUILD_JOBS': '2',
       'RUST_TEST_THREADS': '1', 'CARGO_TARGET_DIR': str(r.parent / args.target)}
if args.debug_order:
    env['HYPERCURVE_DEBUG_SELECTED_POINT_ORDER'] = '1'
rows = []

def run(name, command, timeout):
    assert e.source_snapshot()[0] == source
    started = time.time()
    with (record / (name + '.log')).open('w') as log:
        proc = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=env,
                                stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'name': name, 'pid': proc.pid,
                    'command': command, 'started_epoch': started})
        try:
            code = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            code = 'external_timeout'
    after, after_files, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code,
           'elapsed_seconds': time.time() - started, 'external_timeout_seconds': timeout,
           'source_stable': source == after}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', after_files)
    print(row, flush=True)
    assert source == after
    return code

command = ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features',
           '--lib',
           '--no-run', '--message-format=json']
if run('compile', command, 3600) != 0:
    sys.exit(1)
artifacts = {}
for line in (record / 'compile.log').read_text().splitlines():
    try:
        row = json.loads(line)
    except json.JSONDecodeError:
        continue
    if row.get('reason') == 'compiler-artifact' and row.get('executable'):
        artifacts[row['target']['name']] = row['executable']
e.save_json(record / 'binaries.json', {name: {'path': path, 'sha256': e.digest_file(Path(path))}
    for name, path in artifacts.items()})
cases = [
    ('hypercurve', 'bezier_offset::projective_gauge_tests::reversed_support_intersections_keep_positive_recursive_weights'),
    ('hypercurve', 'bezier_offset::projective_gauge_tests::cardinal_displacements_retain_the_imported_weight_sign'),
]
for target, case in cases:
    run(case.rsplit('::', 1)[-1], [artifacts[target], case, '--exact', '--nocapture'], 180)
e.save_json(record / 'complete.json', {'source': source, 'groups': len(rows),
    'all_passed': all(row['exit_code'] == 0 for row in rows), 'epoch': time.time(),
    'scope': 'Independent projective-weight owner fixtures covering retained support reversal, signed algebraic endpoint gauges, cardinal displacement, exact incidence, subsequent orientation and policy transitions. External containment is not a typed geometry resource outcome; failed attempts remain retained.'})
