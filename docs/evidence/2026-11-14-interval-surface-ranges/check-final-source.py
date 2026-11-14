from pathlib import Path
import hashlib, json, os, re, subprocess, time

s = Path(__file__).parent
r = Path('/mnt/development/csgrs-surface-interval-ranges')
record = json.loads((s / 'FINAL-SOURCE.json').read_text())
head = record['final_documentation_source']
def git(*args):
    return subprocess.check_output(['git', *args], cwd=r)
assert git('rev-parse', 'HEAD').decode().strip() == head
assert not git('status', '--porcelain')
changed = git('diff', '--name-only', record['delivery_source'], head).decode().splitlines()
assert changed == record['changed_paths'] and all(p.endswith(('.md', '.json')) for p in changed)
env = os.environ | {'CARGO_TARGET_DIR': '/mnt/development/.interval-refactor-build/surface-interval-ranges',
                    'CARGO_BUILD_JOBS': '4', 'CARGO_NET_OFFLINE': 'true',
                    'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1'}
commands = [
    ('final-format', ['cargo', '+1.95.0', 'fmt', '--all', '--', '--check'], {}),
    ('final-budget', ['bash', 'scripts/check-repository-budget.sh'], {}),
    ('final-clippy', ['cargo', '+1.95.0', 'clippy', '--locked', '-p', 'hypersolve', '-p', 'hyperbrep', '--all-features', '--all-targets', '--', '-D', 'warnings'], {}),
    ('final-docs', ['cargo', '+1.95.0', 'doc', '--locked', '-p', 'hypersolve', '-p', 'hyperbrep', '--all-features', '--no-deps'], {'RUSTDOCFLAGS': '-D warnings'}),
]
rows = []
for name, command, extra in commands:
    print('START', name, flush=True)
    start = time.monotonic()
    with (s / (name + '.log')).open('xb') as out:
        p = subprocess.run(command, cwd=r, env=env | extra, stdout=out, stderr=subprocess.STDOUT)
    rows.append(dict(name=name, command=command, environment=extra,
                     returncode=p.returncode, seconds=time.monotonic()-start, source_commit=head,
                     log_sha256=hashlib.sha256((s / (name+'.log')).read_bytes()).hexdigest()))
    (s / 'final-source-checks.json').write_text(json.dumps(rows, indent=2)+'\n')
    print(json.dumps(rows[-1]), flush=True)
    if p.returncode:
        print((s / (name+'.log')).read_text()[-5000:])
        raise SystemExit(p.returncode)
for relative in ['crates/hyperbrep/docs/SURFACE_INTERVAL_RANGES.md']:
    path = r / relative
    for target in re.findall(r'\]\(([^)]+)\)', path.read_text()):
        if '://' not in target and not target.startswith('#'):
            assert (path.parent / target.split('#')[0]).exists(), target
assert not git('status', '--porcelain')
assert git('rev-parse', 'HEAD').decode().strip() == head
record['final_checks_pending'] = False
record['final_checks'] = rows
(s / 'FINAL-SOURCE.json').write_text(json.dumps(record, indent=2)+'\n')
print('Final documentation source passed affected checks; integration still pending', flush=True)
