from pathlib import Path
import json, os, subprocess, time

s = Path(__file__).parent
r = Path('/mnt/development/csgrs-surface-interval-ranges')
assert json.loads((s / 'format-initial.json').read_text())['returncode'] == 0
env = os.environ | {
    'CARGO_TARGET_DIR': '/mnt/development/.interval-refactor-build/surface-interval-ranges',
    'CARGO_BUILD_JOBS': '4',
    'CARGO_NET_OFFLINE': 'true',
    'HYPERSOLVE_SKIP_BENCHMARK_REPORTS': '1',
}
commands = [
    ('initial-solver-regressions', ['cargo', '+1.95.0', 'test', '--locked', '-p', 'hypersolve', '--features', 'interval-lattice,serde,dispatch-trace', '--test', 'bivariate_expression', '--test', 'expression_program', '--test', 'expression_interval', '--test', 'program_affine', '--test', 'program_jacobian_trace']),
    ('initial-surface-consumer', ['cargo', '+1.95.0', 'test', '--locked', '-p', 'hyperbrep', '--features', 'interval-ranges', '--test', 'interval_ranges']),
]
rows = []
for name, cmd in commands:
    assert not (s / f'{name}.log').exists()
    print(name, flush=True)
    start = time.monotonic()
    with (s / f'{name}.log').open('wb') as out:
        p = subprocess.run(cmd, cwd=r, env=env, stdout=out, stderr=subprocess.STDOUT)
    rows.append(dict(name=name, command=cmd, returncode=p.returncode, seconds=time.monotonic()-start))
    (s / 'initial-validation.json').write_text(json.dumps(rows, indent=2) + '\n')
    if p.returncode:
        raise SystemExit(p.returncode)
print('complete', flush=True)
