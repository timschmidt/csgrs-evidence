from pathlib import Path
import hashlib, json, os, resource, signal, subprocess, time

root = Path('/home/tim/Documents/GitHub/workspace/csgrs')
out = Path(__file__).resolve().parent / 'full-final'
out.mkdir(exist_ok=False)
env = os.environ.copy()
env['PROPTEST_RNG_SEED'] = '20261025'
cmd = ['cargo', 'test', '--locked', '--release', '-p', 'hypercurve', '--all-features', '--no-fail-fast', '--', '--test-threads=2']
patch = subprocess.check_output(['git', 'diff', '--binary'], cwd=root)
(out / 'source.patch').write_bytes(patch)
test = root / 'crates/hypercurve/tests/qualified_closure.rs'
(out / 'qualified_closure.rs').write_bytes(test.read_bytes())
record = {'command': cmd, 'cwd': str(root), 'timeout_seconds': 2700,
          'proptest_rng_seed': env['PROPTEST_RNG_SEED'],
          'source_revision': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(),
          'source_patch_sha256': hashlib.sha256(patch).hexdigest(),
          'qualified_closure_sha256': hashlib.sha256(test.read_bytes()).hexdigest(),
          'compiler': subprocess.check_output(['rustc', '-Vv'], text=True)}
(out / 'start.json').write_text(json.dumps(record, indent=2) + '\n')
start = time.time()
with (out / 'tests.log').open('w') as log:
    process = subprocess.Popen(cmd, cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    try:
        code = process.wait(timeout=record['timeout_seconds'])
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.wait()
        code = 'timeout'
record.update(exit_code=code, seconds=time.time() - start,
              child_max_rss_kib=resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss)
(out / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record, indent=2), flush=True)
raise SystemExit(0 if code == 0 else 1)
