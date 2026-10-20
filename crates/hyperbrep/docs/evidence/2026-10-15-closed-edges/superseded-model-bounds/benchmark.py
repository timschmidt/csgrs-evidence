"""Three alternating default-feature kernel/arc pairs and new absolute costs.

Freeze both existing harnesses at d60bd1cf4 before candidate compilation.
Do not run qualification/controls concurrently with these cost measurements.
"""
import hashlib, json, os, re, statistics, subprocess, time
from pathlib import Path
from receipts import expected, read, compare
root = Path('/mnt/development/csgrs')
out = Path(__file__).resolve().parent
env = os.environ.copy()
env.update(PATH='/home/tim/.cargo/bin:' + env['PATH'], CARGO_HOME='/tmp/hyperbrep-review-cargo', CARGO_TARGET_DIR='/tmp/hyperbrep-review-target')
# Preserve the complete default arc corpus, including the large 256-arc cases.
for key in ('HYPERCURVE_BENCH_ARC_ONLY', 'HYPERCURVE_BENCH_ARC_COUNT', 'HYPERCURVE_BENCH_ARC_ITERATIONS'):
    env.pop(key, None)
(out / 'benchmark-environment.json').write_text(json.dumps(dict(
    cpu_affinity=sorted(os.sched_getaffinity(0)), measured_cpu=0,
    features='default for all frozen/candidate/new executables',
    arc_count=256, arc_large_iterations=10, arc_only=False,
    optional_build_environment={key:env.get(key) for key in ('RUSTFLAGS','CARGO_ENCODED_RUSTFLAGS','CARGO_BUILD_TARGET','CARGO_BUILD_JOBS','RUSTC_WRAPPER')},
    cargo_home=env['CARGO_HOME'], cargo_target_dir=env['CARGO_TARGET_DIR'],
), indent=2) + '\n')
executables, metadata = {}, {}
for kind in ('kernel', 'arc'):
    old = json.loads((out / ('baseline-' + kind + '.json')).read_text())
    exe = Path(old['path'])
    assert hashlib.sha256(exe.read_bytes()).hexdigest() == old['sha256'], 'rebuild frozen baseline first'
    executables[kind + '-baseline'] = exe
    metadata[kind + '-baseline'] = old
    source = 'crates/' + ('hypercurve' if kind == 'arc' else 'hyperbrep') + '/benches/' + kind + '.rs'
    subprocess.run(['git', 'diff', '--exit-code', 'd60bd1cf4', '--', source], cwd=root, check=True)
for kind in ('kernel', 'arc', 'closed_edges'):
    cmd = ['cargo', 'build', '--offline', '--locked', '-p', 'hypercurve' if kind == 'arc' else 'hyperbrep', '--release', '--bench', kind, '--message-format=json']
    p = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '1800s', *cmd], cwd=root, env=env, capture_output=True, text=True)
    (out / (kind + '-build.log')).write_text(p.stderr)
    (out / (kind + '-artifacts.jsonl')).write_text(p.stdout)
    assert p.returncode == 0, p.stderr
    items = [json.loads(line) for line in p.stdout.splitlines()]
    exe = Path(next(x['executable'] for x in items if x.get('reason') == 'compiler-artifact' and x['target']['name'] == kind and x['target']['kind'] == ['bench'] and x.get('executable')))
    executables[kind] = exe
    metadata[kind] = dict(path=str(exe), bytes=exe.stat().st_size, sha256=hashlib.sha256(exe.read_bytes()).hexdigest(), command=cmd)
(out / 'executables.json').write_text(json.dumps(metadata, indent=2) + '\n')
launcher = '/tmp/hyperbrep-closed-edges-measure'
subprocess.run(['cc', '-O2', '-Wall', '-Wextra', '-Werror', str(out.parent / '2026-10-15-step-faceted/measure.c'), '-o', launcher], check=True)
records = []
def run(kind, label, exe):
    cmd = [launcher, str(out / (label + '-resources.json')), 'taskset', '-c', '0', str(exe)]
    print('running', label, flush=True)
    started = time.time()
    p = subprocess.run(['timeout', '--signal=TERM', '--kill-after=30s', '1800s', *cmd], cwd=root, env=env, capture_output=True, text=True)
    log = p.stdout + p.stderr
    (out / (label + '.log')).write_text(log)
    records.append(dict(label=label, command=cmd, external_timeout_seconds=1800, exit_code=p.returncode, elapsed_seconds=time.time() - started, arc_environment='all three HYPERCURVE_BENCH_ARC_* variables removed'))
    (out / 'benchmark-commands.json').write_text(json.dumps(records, indent=2) + '\n')
    assert p.returncode == 0, log
    return read(kind, log)

for kind in ('kernel', 'arc'):
    assert len(expected(kind)) == (64 if kind == 'kernel' else 12)
    sides = {'baseline': [], 'candidate': []}
    for trial in range(1, 4):
        for side in (['baseline', 'candidate'] if trial % 2 else ['candidate', 'baseline']):
            exe = executables[kind + '-baseline'] if side == 'baseline' else executables[kind]
            sides[side].append(run(kind, f'{kind}-{side}-{trial}', exe))
    for trials in sides.values():
        for row in trials:
            compare(sides['baseline'][0], row)
    ratios = []
    for i, case in enumerate(expected(kind)):
        med = lambda side: statistics.median(x[i]['elapsed_ns'] / x[i]['iterations'] for x in sides[side])
        b, c = med('baseline'), med('candidate')
        ratios.append(dict(case=case, baseline_median_ns=b, candidate_median_ns=c, ratio=c/b))
    (out / (kind + '-costs.json')).write_text(json.dumps(ratios, indent=2) + '\n')
    print(kind, 'median ratio', statistics.median(r['ratio'] for r in ratios), 'max ratio', max(r['ratio'] for r in ratios), flush=True)

assert len(expected('closed_edges')) == 5
rows = [run('closed_edges', f'closed-{trial}', executables['closed_edges']) for trial in range(1,4)]
facts, allocations = [], []
for trial, row in enumerate(rows, 1):
    compare(rows[0], row)
    log = (out / f'closed-{trial}.log').read_text()
    facts.append([line for line in log.splitlines() if line.startswith('fixture ')])
    allocations.append({name:dict(calls=int(calls), requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)', log)})
assert all(x == facts[0] for x in facts)
assert all(x == allocations[0] for x in allocations)
costs = []
for i, case in enumerate(expected('closed_edges')):
    n = rows[0][i]['iterations']
    costs.append(dict(case=case, iterations=n, checksum=rows[0][i]['checksum'], median_ns=statistics.median(x[i]['elapsed_ns']/n for x in rows), allocation_calls_per_iteration=allocations[0][case]['calls']/n, requested_bytes_per_iteration=allocations[0][case]['requested_bytes']/n))
(out / 'closed-costs.json').write_text(json.dumps(costs, indent=2) + '\n')
print(json.dumps(costs, indent=2), flush=True)
