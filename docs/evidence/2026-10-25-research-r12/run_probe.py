from pathlib import Path
import hashlib, json, os, signal, subprocess, sys, time

out = Path(__file__).resolve().parent / sys.argv[1]
out.mkdir(exist_ok=False)
base = Path('/tmp/csgrs-research-baseline-3cca6a8')
env = os.environ.copy()
env['CARGO_TARGET_DIR'] = '/tmp/csgrs-research-2026-10-25/r08/connection-prototype/target'
require_single = len(sys.argv) > 2 and sys.argv[2] == 'single'
if require_single:
    env['R12_REQUIRE_SINGLE_JOINT'] = '1'
else:
    env.pop('R12_REQUIRE_SINGLE_JOINT', None)
cmd = ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hypercurve', '--features', 'dispatch-trace', '--test', 'r12_tangent_probe', '--', '--nocapture', '--test-threads=1']
patch = subprocess.check_output(['git', 'diff', '--binary'], cwd=base)
(out / 'source.patch').write_bytes(patch)
probe = (base / 'crates/hypercurve/tests/r12_tangent_probe.rs').read_bytes()
(out / 'probe.rs').write_bytes(probe)
record = {'command': cmd, 'cwd': str(base), 'target': env['CARGO_TARGET_DIR'], 'require_single_joint': require_single,
          'source_patch_sha256': hashlib.sha256(patch).hexdigest(), 'probe_sha256': hashlib.sha256(probe).hexdigest(),
          'compiler': subprocess.check_output(['rustc', '-Vv'], text=True), 'timeout_seconds': 600}
start = time.time()
with (out / 'run.log').open('w') as log:
    process = subprocess.Popen(cmd, cwd=base, env=env, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
    try:
        code = process.wait(timeout=record['timeout_seconds'])
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.wait()
        code = 'timeout'
record.update(exit_code=code, seconds=time.time() - start)
(out / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record, indent=2), flush=True)
