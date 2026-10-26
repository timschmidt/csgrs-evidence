from pathlib import Path
import hashlib
import json
import os
import resource
import signal
import subprocess
import time

raw = Path(__file__).resolve().parent
root = Path('/tmp/csgrs-r18-trace')
record = raw / ('late-residual-public-build-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
env = os.environ.copy()
env.update(CARGO_TARGET_DIR='/tmp/csgrs-r18-trace-target',
           CCACHE_DIR='/tmp/csgrs-r18-trace-ccache',
           CCACHE_TEMPDIR='/tmp/csgrs-r18-trace-ccache/tmp',
           CARGO_BUILD_JOBS='2', CARGO_PROFILE_RELEASE_DEBUG='1',
           RUSTFLAGS='-C force-frame-pointers=yes')
base = json.loads((raw / 'baseline-sources.json').read_text())
extra = ['tests/r18_compound_rotation_probe.rs',
         'crates/hyperreal/src/computable/node/ring_r18_diagnostics.rs',
         'crates/hyperreal/src/computable/node/r18_predicate.json',
         'crates/hyperreal/src/computable/node/r18_predicate_second.json']
names = [*base, *extra]
def inventory():
    return {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in names}
before = inventory()
(record / 'sources.json').write_text(json.dumps(before, indent=2) + '\n')
changed = [name for name in names if name not in base or before[name] != base[name]]
for name in changed:
    target = record / 'source' / name
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes((root / name).read_bytes())
(record / 'source.patch').write_bytes(subprocess.check_output(['git', 'diff', '--binary'], cwd=root))
(record / 'environment.json').write_text(json.dumps({
    'rustc': subprocess.check_output(['rustc', '-Vv'], text=True),
    'env': {k: env[k] for k in ['CARGO_TARGET_DIR', 'CCACHE_DIR', 'CCACHE_TEMPDIR', 'CARGO_BUILD_JOBS', 'CARGO_PROFILE_RELEASE_DEBUG', 'RUSTFLAGS']},
    'changed_inputs': changed}, indent=2) + '\n')
rows = []
def run(name, cmd, timeout, contained=False):
    def limits():
        resource.setrlimit(resource.RLIMIT_AS, (8 * 2**30, 8 * 2**30))
        resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 2**20, 64 * 2**20))
    start = time.monotonic()
    with (record / (name + '.stdout')).open('w') as out, (record / (name + '.stderr')).open('w') as err:
        proc = subprocess.Popen(cmd, cwd=root, env=env, stdout=out, stderr=err,
                                start_new_session=True, preexec_fn=limits if contained else None)
        try:
            status = proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(proc.pid, signal.SIGKILL)
            proc.wait()
            status = 'timeout'
    rows.append({'name': name, 'command': cmd, 'status': status, 'seconds': time.monotonic() - start})
    (record / 'commands.json').write_text(json.dumps(rows, indent=2) + '\n')
    print('R18 LATE RESIDUAL PUBLIC BUILD', name, status, record, flush=True)
    assert status == 0, (name, record)

run('fmt', ['cargo', 'fmt', '--all', '--', '--check'], 300)
run('build', ['cargo', 'test', '--locked', '--offline', '--release', '-p', 'csgrs',
              '--all-features', '--test', 'r18_compound_rotation_probe', '--no-run', '--message-format=json'], 1800)
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
          'sources_unchanged': True, 'commands': rows,
          'scope': 'Private late factor-count cancellation with existing unit-circle residual reduction with graph capture; original full public workflow binary. Diagnostic build, no native timing claim.'}
(record / 'completion.json').write_text(json.dumps(result, indent=2) + '\n')
(raw / 'latest-late-residual-public-build.json').write_text(json.dumps(result, indent=2) + '\n')
print('R18 LATE RESIDUAL PUBLIC BUILD COMPLETE', record, flush=True)
