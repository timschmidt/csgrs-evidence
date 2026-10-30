from pathlib import Path
import argparse, importlib.util, json, os, signal, subprocess, sys, time
sys.dont_write_bytecode = True
root = Path(__file__).resolve().parents[1]
controls = root / 'controls'
checkout = root / 'zero-chord-displacement'
parser = argparse.ArgumentParser()
parser.add_argument('--attempt', required=True)
args = parser.parse_args()
record = controls / ('zero-chord-displacement-' + args.attempt)
record.mkdir()
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
e = importlib.util.module_from_spec(spec)
spec.loader.exec_module(e)
source, files, patch = e.source_snapshot()
e.save_json(record / 'source-before.json', source)
e.save_json(record / 'files-before.json', files)
(record / 'candidate.patch').write_bytes(patch)
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
(record / 'contract.json').write_bytes((controls / 'zero-chord-displacement-contract.json').read_bytes())
env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1', 'CARGO_NET_OFFLINE': 'true',
       'CARGO_TARGET_DIR': str(root.parent / 'hypercurve-polynomial-chamfer-admission'),
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '1',
       'CCACHE_DIR': str(root.parent / 'hypercurve-admission-ccache'),
       'CCACHE_TEMPDIR': str(root.parent / 'hypercurve-admission-ccache/tmp')}
command = ['cargo', 'test', '--locked', '--release', '--all-features', '-p', 'hypercurve',
           '--test', 'zero_chord_displacements', '--', '--nocapture', '--test-threads=1']
started = time.time()
with (record / 'acceptance.log').open('w') as log:
    p = subprocess.Popen(['/usr/bin/time', '-v', *command], cwd=checkout, env=env,
                         stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    e.save_json(record / 'active.json', {'pid': p.pid, 'command': command, 'epoch': started})
    try:
        code = p.wait(timeout=900)
    except subprocess.TimeoutExpired:
        os.killpg(p.pid, signal.SIGKILL)
        p.wait()
        code = 'external_timeout'
after, after_files, _ = e.source_snapshot()
row = {'command': command, 'exit_code': code, 'elapsed_seconds': time.time() - started,
       'external_timeout_seconds': 900, 'source_stable': source == after,
       'environment': {k: env[k] for k in ['RUSTUP_TOOLCHAIN', 'CARGO_TARGET_DIR', 'CARGO_BUILD_JOBS', 'RUST_TEST_THREADS']}}
e.save_json(record / 'results.json', [row])
e.save_json(record / 'source-after.json', after)
e.save_json(record / 'files-after.json', after_files)
e.save_json(record / 'complete.json', {'all_passed': code == 0 and source == after,
                                     'source': source, 'epoch': time.time()})
print(json.dumps(row, indent=2), flush=True)
