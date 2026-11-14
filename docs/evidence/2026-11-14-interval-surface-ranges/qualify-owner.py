from pathlib import Path
import hashlib, json, os, subprocess, time

s = Path(__file__).parent
r = Path('/mnt/development/csgrs-surface-interval-ranges')
def git(*args):
    return subprocess.check_output(['git', *args], cwd=r)
assert not git('status', '--porcelain')
head = git('rev-parse', 'HEAD').decode().strip()
files = git('ls-files', '-z').decode().split('\0')
source = {p: hashlib.sha256((r / p).read_bytes()).hexdigest()
          for p in files if p and (r / p).is_file()}
(s / 'qualification-source.json').write_text(json.dumps(
    dict(commit=head, tracked_files=source), indent=2) + '\n')
env = os.environ | {
    'CARGO_TARGET_DIR': '/mnt/development/.interval-refactor-build/surface-interval-ranges',
    'CARGO_BUILD_JOBS': '4', 'CARGO_NET_OFFLINE': 'true',
    'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1',
}
owner = ['-p', 'hypersolve', '-p', 'hyperbrep']
cargo = ['cargo', '+1.95.0']
commands = [
    ('format', cargo + ['fmt', '--all', '--', '--check'], {}),
    ('clippy', cargo + ['clippy', '--locked', *owner, '--all-features', '--all-targets', '--', '-D', 'warnings'], {}),
    ('docs', cargo + ['doc', '--locked', *owner, '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}),
    ('example', cargo + ['run', '--locked', '-p', 'hyperbrep', '--features', 'interval-ranges', '--example', 'surface_ranges'], {}),
    ('disabled-brep', cargo + ['check', '--locked', '-p', 'hyperbrep', '--no-default-features', '--all-targets'], {}),
    ('disabled-solver', cargo + ['check', '--locked', '-p', 'hypersolve', '--no-default-features', '--lib'], {}),
    ('wasm', cargo + ['check', '--locked', *owner, '--all-features', '--lib', '--target', 'wasm32-unknown-unknown'], {}),
    ('stable', ['cargo', '+stable', 'check', '--locked', *owner, '--all-features', '--all-targets'], {}),
    ('owner-tests', cargo + ['test', '--release', '--locked', *owner, '--all-features', '--no-fail-fast', '--', '--test-threads=2'], {'CARGO_BUILD_JOBS': '2'}),
    ('downstream-tests', cargo + ['test', '--release', '--locked', '-p', 'hyperbrep-io', '--features', 'hyperbrep/interval-ranges,hyperbrep/dispatch-trace', '--no-fail-fast', '--', '--test-threads=2'], {'CARGO_BUILD_JOBS': '2'}),
]
rows = []
for name, command, extra in commands:
    assert git('rev-parse', 'HEAD').decode().strip() == head
    assert not git('status', '--porcelain')
    log = s / ('qualification-' + name + '.log')
    print('START', name, flush=True)
    start = time.monotonic()
    with log.open('xb') as output:
        result = subprocess.run(command, cwd=r, env=env | extra,
                                stdout=output, stderr=subprocess.STDOUT)
    row = dict(name=name, command=command, environment=extra,
               returncode=result.returncode, seconds=time.monotonic()-start,
               log=log.name, sha256=hashlib.sha256(log.read_bytes()).hexdigest(),
               source_commit=head)
    rows.append(row)
    (s / 'qualification-commands.json').write_text(json.dumps(rows, indent=2)+'\n')
    print(json.dumps(row), flush=True)
    if result.returncode:
        print(log.read_text()[-6000:], flush=True)
        raise SystemExit(result.returncode)
assert not git('status', '--porcelain')
assert all(hashlib.sha256((r / p).read_bytes()).hexdigest() == digest
           for p, digest in source.items())
print('All owner qualification commands passed on unchanged source', flush=True)
