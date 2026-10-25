from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r17-trace')
record = raw / ('layout-memory-build-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
baseline = json.loads((raw / 'latest-trace-build.json').read_text())
native = json.loads((raw / 'latest-layout-build-candidate.json').read_text())
native_sources = json.loads(Path(native['sources']).read_text())
for name, digest in native_sources.items():
    assert hashlib.sha256((root / name).read_bytes()).hexdigest() == digest
bench = 'crates/hypercircuit/benches/easyduino_full_pipeline.rs'
baseline_sources = json.loads(Path(baseline['sources']).read_text())
source = Path(baseline['record']) / 'easyduino_full_pipeline.rs'
assert hashlib.sha256(source.read_bytes()).hexdigest() == baseline_sources[bench]
(root / bench).write_bytes(source.read_bytes())
(record / 'easyduino_full_pipeline.rs').write_bytes(source.read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r17-trace-target',
           CCACHE_DIR='/tmp/csgrs-r17-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r17-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_BENCH_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes')
def inventory():
    return {n: hashlib.sha256((root / n).read_bytes()).hexdigest() for n in native_sources}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
differences = [n for n in baseline_sources if before[n] != baseline_sources[n]]
expected = ['crates/hyperreal/src/rational/arithmetic.rs'] + [
    'crates/hyperreal/src/rational/arithmetic/' + n for n in
    ['construction.rs', 'ops.rs', 'representation.rs', 'squares_powers.rs']]
assert sorted(differences) == sorted(expected), differences
(record / 'comparison.json').write_text(json.dumps({
    'baseline_build': baseline, 'candidate_native_build': native,
    'source_differences': differences,
    'test_only_differences': ['crates/hyperreal/src/rational/arithmetic.rs'] + [n for n in native_sources if n not in baseline_sources],
    'harness_identical': True, 'comparison': 'Diagnostic allocations only; no native speed claim.'
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
    row = json.loads(line)
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'easyduino_full_pipeline':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == before
meta = {'record': str(record), 'binary': str(binary), 'bytes': binary.stat().st_size,
        'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'sources_unchanged': True,
        'sources': str(record / 'sources.json'), 'harness_identical_to_baseline': True}
(record / 'completion.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / 'latest-layout-memory-build.json').write_text(json.dumps(meta, indent=2) + '\n')
print('R17 LAYOUT MEMORY BUILD COMPLETE', record, flush=True)
