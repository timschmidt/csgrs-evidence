from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
variant = sys.argv[1]
assert variant in ['baseline', 'candidate']
record = raw / ('layout-build-' + variant + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r17-trace-target',
           CCACHE_DIR='/tmp/csgrs-r17-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r17-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_BENCH_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True, exist_ok=True)
names = list(json.loads((raw / 'baseline-sources.json').read_text()))
names += ['crates/hyperreal/src/rational/arithmetic/' + n for n in
          ['r17_retention_tests.rs', 'r17_layout_cost_tests.rs']]
def inventory():
    return {n: hashlib.sha256((root / n).read_bytes()).hexdigest() for n in names}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
for name in names[-2:]:
    (record / Path(name).name).write_bytes((root / name).read_bytes())
(record / 'source.patch').write_bytes(subprocess.check_output(['git', 'diff', '--', 'crates/hyperreal'], cwd=root))
(record / 'environment.json').write_text(json.dumps({
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'env': {k: v for k, v in env.items() if k.startswith(('CARGO_', 'CCACHE_', 'RUSTFLAGS'))},
}, indent=2) + '\n')
cmd = ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperreal',
       '--no-default-features', '--lib', '--no-run', '--message-format=json']
start = time.monotonic()
with (record / 'build.stdout').open('w') as out, (record / 'build.stderr').open('w') as err:
    proc = subprocess.Popen(cmd, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
    try:
        status = proc.wait(timeout=1800)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        status = 'timeout'
(record / 'command.json').write_text(json.dumps({'command': cmd, 'status': status, 'seconds': time.monotonic() - start}, indent=2) + '\n')
assert status == 0, record
binaries = []
for line in (record / 'build.stdout').read_text().splitlines():
    try:
        row = json.loads(line)
    except json.JSONDecodeError:
        continue
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'hyperreal':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == before
meta = {'record': str(record), 'binary': str(binary), 'bytes': binary.stat().st_size,
        'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'sources_unchanged': True,
        'sources': str(record / 'sources.json'),
        'harness_sha256': before[names[-1]], 'acceptance_sha256': before[names[-2]],
        'native_allocator': 'System: no diagnostic global allocator or dispatch-trace feature'}
(record / 'completion.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / ('latest-layout-build-' + variant + '.json')).write_text(json.dumps(meta, indent=2) + '\n')
print('R17 LAYOUT BUILD COMPLETE', variant, record, flush=True)
