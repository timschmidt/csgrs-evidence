from pathlib import Path
import argparse, hashlib, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode = True
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', required=True)
parser.add_argument('--checkout', default='selected-field-root-discovery')
parser.add_argument('--target', default='hypersolve-selected-field-root-discovery-admission')
args = parser.parse_args()
r = Path(__file__).resolve().parents[1]
c = r / 'controls'
w = r / args.checkout
record = c / ('selected-query-fibers-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('e', w / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'contract.json').write_bytes((c / 'selected-query-fibers-contract.json').read_bytes())
(record / 'original.rs').write_bytes((c / 'polynomial_query_fibers_tests.rs').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '1', 'CARGO_TARGET_DIR': str(r.parent / args.target)}
rows = []
def run(name, command, timeout):
    assert e.source_snapshot()[0] == source
    start = time.time()
    print('START', name, flush=True)
    with (record / (name + '.log')).open('w') as log:
        child = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=w, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        e.save_json(record / 'active.json', {'name': name, 'pid': child.pid, 'command': command, 'started_epoch': start})
        try:
            code = child.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL)
            child.wait()
            code = 'external_timeout'
    after, af, _ = e.source_snapshot()
    row = {'name': name, 'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - start, 'external_timeout_seconds': timeout, 'source_stable': after == source}
    rows.append(row)
    e.save_json(record / 'results.json', rows)
    e.save_json(record / 'source-after.json', after)
    e.save_json(record / 'files-after.json', af)
    print(row, flush=True)
    assert after == source
    return code
assert run('build', ['cargo', 'build', '--locked', '--release', '--all-features', '-p', 'hypercurve', '--message-format=json'], 1800) == 0
artifacts = []
for line in (record / 'build.log').read_text().splitlines():
    try:
        artifacts.append(json.loads(line))
    except json.JSONDecodeError:
        pass
def library(name):
    return Path(next(f for a in artifacts if a.get('reason') == 'compiler-artifact' and a['target']['name'] == name for f in a['filenames'] if f.endswith('.rlib')))
libs = {name: library(name) for name in ['hypercurve', 'hypersolve']}
hashes = {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in libs.values()}
binary = record / 'original'
command = ['rustc', '+1.98.1', '--edition=2024', '--test', '-C', 'opt-level=3', str(record / 'original.rs'), '--crate-name', 'polynomial_query_fibers', '-L', 'dependency=' + str(libs['hypersolve'].parent)]
for name, path in libs.items():
    command += ['--extern', name + '=' + str(path)]
command += ['-o', str(binary)]
assert run('compile', command, 180) == 0
tests = ['selected_fiber_abscissa_has_independent_exact_relations', 'polynomial_branch_consumes_a_nested_selected_fiber_query']
for test in tests:
    run(test, [str(binary), test, '--exact', '--nocapture'], 180)
assert hashes == {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in libs.values()}
e.save_json(record / 'attribution.json', {'source': source, 'libraries_sha256': hashes, 'env': {key: env[key] for key in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS']}})
e.save_json(record / 'complete.json', {'source': source, 'groups': len(rows), 'all_passed': all(row['exit_code'] == 0 for row in rows), 'statuses': [row['exit_code'] for row in rows], 'epoch': time.time()})
