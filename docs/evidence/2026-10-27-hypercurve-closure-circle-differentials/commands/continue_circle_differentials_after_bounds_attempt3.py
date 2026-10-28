from pathlib import Path
import importlib.util
import json
import os
import subprocess
import sys
import time

sys.dont_write_bytecode = True
root = Path(__file__).resolve().parent
checkout = Path('/tmp/hypercurve-closure-circle-differentials')
spec = importlib.util.spec_from_file_location('evidence', checkout / 'scripts/successive-operations.py')
evidence = importlib.util.module_from_spec(spec)
spec.loader.exec_module(evidence)
source = evidence.source_snapshot()[0]
assert source == json.loads((root / 'circle-differentials-bounds-prototype6-source-before.json').read_text())
started = time.time()
while time.time() - started < 3600:
    assert evidence.source_snapshot()[0] == source
    path = root / 'circle-differentials-bounds-prototype6-results.json'
    rows = json.loads(path.read_text()) if path.exists() else []
    if any(row['exit_code'] != 0 or not row['source_stable'] for row in rows):
        raise SystemExit('Focused bounds/replay acceptance failed; no subsequent stages run.')
    msrv_path = root / 'circle-differentials-msrv-probe5.json'
    if len(rows) == 6 and msrv_path.exists():
        msrv = json.loads(msrv_path.read_text())
        assert msrv['exit_code'] == 0 and msrv['source_stable'] and msrv['source'] == source
        break
    time.sleep(10)
else:
    raise SystemExit('External wait expired; no success inferred.')

env = {**os.environ, 'RUSTUP_TOOLCHAIN': '1.98.1',
       'CARGO_TARGET_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-circle-differentials-admission',
       'CARGO_BUILD_JOBS': '2', 'RUST_TEST_THREADS': '2',
       'CCACHE_DIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache',
       'CCACHE_TEMPDIR': '/home/tim/Documents/GitHub/workspace/csgrs/target/hypercurve-admission-ccache/tmp'}
stages = []

def run(name, command, cwd=checkout):
    print('START', name, flush=True)
    begin = time.time()
    with (root / ('circle-differentials-continuation3-' + name + '.log')).open('w') as log:
        result = subprocess.run(command, cwd=cwd, env=env, stdout=log, stderr=subprocess.STDOUT)
    stages.append({'name': name, 'command': command, 'cwd': str(cwd),
                   'exit_code': result.returncode, 'elapsed_seconds': time.time() - begin})
    evidence.save_json(root / 'circle-differentials-continuation3-results.json', stages)
    print('FINISH', name, result.returncode, flush=True)
    if result.returncode != 0:
        raise SystemExit('Stage failed; no subsequent stages run: ' + name)

run('prototype8', [sys.executable, str(root / 'run_circle_differentials_prototype8.py')])
assert evidence.source_snapshot()[0] == source
run('documentation', [sys.executable, str(root / 'prepare_circle_differentials_documentation.py')])
run('format', ['cargo', '+1.99.1', 'fmt', '--all'])
for name, command in [
    ('matrix-guards', ['python3', 'crates/hypercurve/scripts/test_capability_matrix.py']),
    ('typos', ['typos']),
    ('diff', ['git', 'diff', '--check']),
    ('budget', ['scripts/check-repository-budget.sh']),
]:
    run(name, command)

assert not (root / 'circle-differentials-final-results.json').exists()
assert not (root / 'circle-differentials-closeout-launch.json').exists()
with (root / 'circle-differentials-closeout-controller.log').open('w') as log:
    watcher = subprocess.Popen([sys.executable, str(root / 'close_circle_differentials_when_qualified.py')],
                               stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT,
                               start_new_session=True)
evidence.save_json(root / 'circle-differentials-closeout-launch.json',
                   {'pid': watcher.pid, 'started_epoch': time.time(), 'detached': True})
run('qualification', [sys.executable, str(root / 'run_circle_differentials_qualification.py')])
print('Final qualification finished; the separate closeout watcher enforces all18 gates and parent receipts.', flush=True)
