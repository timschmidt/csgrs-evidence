from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
record = raw / ('build-census-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r17-trace-target',
           CCACHE_DIR='/tmp/csgrs-r17-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r17-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_BENCH_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True, exist_ok=True)
names = json.loads((raw / 'baseline-sources.json').read_text())
inventory = lambda: {n: hashlib.sha256((root / n).read_bytes()).hexdigest() for n in names}
before = inventory()
changes = [n for n in names if names[n] != before[n]]
assert changes == ['crates/hypercircuit/benches/easyduino_full_pipeline.rs', 'crates/hyperreal/src/computable/node/representation.rs'], changes
(record / 'sources-before.json').write_text(json.dumps(before, indent=2) + '\n')
(record / 'easyduino_full_pipeline.rs').write_bytes(
    (root / 'crates/hypercircuit/benches/easyduino_full_pipeline.rs').read_bytes())
(record / 'representation.rs').write_bytes((root / 'crates/hyperreal/src/computable/node/representation.rs').read_bytes())
(record / 'environment.json').write_text(json.dumps({
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'heaptrack': subprocess.check_output(['heaptrack', '--version'], text=True),
    'env': {k: v for k, v in env.items() if k in ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_BENCH_DEBUG', 'RUSTFLAGS']},
    'compiled_input_changes': changes,
}, indent=2) + '\n')
cmd = ['cargo', 'bench', '--locked', '--offline', '-p', 'hypercircuit',
       '--features', 'drc interchange', '--bench', 'easyduino_full_pipeline',
       '--no-run', '--message-format=json']
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
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'easyduino_full_pipeline':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == before
meta = {'record': str(record), 'binary': str(binary), 'bytes': binary.stat().st_size,
        'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'sources_unchanged': True,
        'sources': str(record / 'sources-before.json')}
(record / 'completion.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / 'latest-census-build.json').write_text(json.dumps(meta, indent=2) + '\n')
print('R17 CENSUS BUILD COMPLETE', record, flush=True)
