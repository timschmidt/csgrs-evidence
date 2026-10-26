from pathlib import Path
import hashlib
import json
import os
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r18-trace')
record = raw / ('capture-build-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r18-trace-target',
           CCACHE_DIR='/tmp/csgrs-r18-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r18-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_RELEASE_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes')
Path(env['CCACHE_TEMPDIR']).mkdir(parents=True, exist_ok=True)
base = json.loads((raw / 'baseline-sources.json').read_text())
names = [*base, 'tests/r18_compound_rotation_probe.rs']
def inventory():
    return {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in names}
before = inventory()
changed = sorted(n for n in base if base[n] != before[n])
expected = sorted(['crates/hyperreal/src/computable/node/representation.rs',
                   'crates/hyperreal/src/computable/node/representation_size.rs',
                   'crates/hyperreal/src/real/arithmetic/representation_size.rs',
                   'crates/hypermesh/src/predicate.rs'])
assert changed == expected, changed
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
(record / 'source.patch').write_bytes(subprocess.check_output(['git', 'diff', '--binary'], cwd=root))
(record / 'probe.rs').write_bytes((root / names[-1]).read_bytes())
(record / 'environment.json').write_text(json.dumps({'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'env': {k: env[k] for k in ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']},
    'changed_library_inputs': changed}, indent=2) + '\n')
commands = [
    ('fmt', ['cargo', 'fmt', '--all', '--', '--check'], 300),
    ('graph-controls', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'hyperreal',
                        '--all-features', '--lib', 'r16_graph_tests', '--', '--nocapture'], 1200),
    ('build', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs', '--all-features',
               '--test', 'r18_compound_rotation_probe', '--no-run', '--message-format=json'], 1800),
]
rows = []
for name, cmd, timeout in commands:
    start = time.monotonic()
    with (record / (name + '.stdout')).open('w') as out, (record / (name + '.stderr')).open('w') as err:
        proc = subprocess.Popen(cmd, cwd=root, env=env, stdout=out, stderr=err, start_new_session=True)
        try:
            status = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            status = 'timeout'
    rows.append({'name': name, 'command': cmd, 'status': status, 'seconds': time.monotonic() - start})
    (record / 'commands.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('R18 CAPTURE BUILD', name, status, record, flush=True)
    assert status == 0, (name, record)
binaries = []
for line in (record / 'build.stdout').read_text().splitlines():
    row = json.loads(line)
    if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'r18_compound_rotation_probe':
        binaries.append(Path(row['executable']))
assert len(binaries) == 1
binary = record / 'probe-binary'
binary.write_bytes(binaries[0].read_bytes())
binary.chmod(0o755)
assert inventory() == before
result = {'record': str(record), 'binary': str(binary), 'bytes': binary.stat().st_size,
          'sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'sources': str(record / 'sources.json'),
          'sources_unchanged': True, 'graph_controls_passed': True}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-capture-build.json').write_text(json.dumps(result, indent=2) + '\n')
print('R18 CAPTURE BUILD COMPLETE', record, flush=True)
