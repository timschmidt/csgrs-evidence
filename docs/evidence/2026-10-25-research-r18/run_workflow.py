from pathlib import Path
import hashlib
import json
import math
import os
import random
import resource
import signal
import statistics
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
purpose = sys.argv[1]
assert purpose in ['artifact-check', 'functional', 'final']
pairs = 8 if purpose == 'final' else 1
record = raw / ('workflow-' + purpose + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
builds = {v: json.loads((raw / f'latest-workflow-build-{v}-native.json').read_text())
          for v in (['baseline'] if purpose == 'artifact-check' else ['baseline', 'candidate'])}
for build in builds.values():
    assert hashlib.sha256(Path(build['binary']).read_bytes()).hexdigest() == build['sha256']
if purpose != 'artifact-check':
    assert builds['baseline']['harness_sha256'] == builds['candidate']['harness_sha256']
    assert builds['baseline']['lock_sha256'] == builds['candidate']['lock_sha256']
    sources = {v: json.loads(Path(b['sources']).read_text()) for v, b in builds.items()}
    assert sources['baseline'].keys() == sources['candidate'].keys()
    assert sorted(k for k in sources['baseline'] if sources['baseline'][k] != sources['candidate'][k]) == sorted(
        'crates/hyperreal/src/computable/node/' + n for n in
        ['ring_product_sum.rs', 'ring_quotient_reduction.rs', 'ring_relations.rs'])
cpu = min(os.sched_getaffinity(0))
rng = random.Random(20261025)
orders = {case: [0, 1] * (pairs // 2) + ([0] if pairs % 2 else []) for case in ['decimal', 'icosahedron']}
for order in orders.values(): rng.shuffle(order)
meta = {'purpose': purpose, 'pairs': pairs, 'builds': builds, 'cpu': cpu, 'seed': 20261025,
        'cpuinfo': Path('/proc/cpuinfo').read_text(), 'loadavg_start': Path('/proc/loadavg').read_text(),
        'complete': False, 'plan_sha256': hashlib.sha256((raw / 'workflow-cost-plan.json').read_bytes()).hexdigest()}
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024**2, 64 * 1024**2))
    os.sched_setaffinity(0, {cpu})
for pair in range(pairs):
    folder = record / f'pair-{pair:02}'
    folder.mkdir()
    cases = ['decimal', 'icosahedron']
    rng.shuffle(cases)
    for case in cases:
        order = ['baseline', 'candidate'] if orders[case][pair] == 0 else ['candidate', 'baseline']
        if purpose == 'artifact-check': order = ['baseline']
        comparison = []
        for variant in order:
            prefix = folder / f'{variant}-{case}'
            env = os.environ.copy()
            env['R18_WORKFLOW_CASE'] = case
            command = ['/usr/bin/time', '-v', builds[variant]['binary'], 'native_workflow_cost',
                       '--exact', '--nocapture', '--test-threads=1']
            start = time.monotonic()
            with prefix.with_suffix('.stdout').open('w') as out, prefix.with_suffix('.stderr').open('w') as err:
                process = subprocess.Popen(command, cwd='/tmp/csgrs-r18-trace', env=env,
                    stdout=out, stderr=err, start_new_session=True, preexec_fn=limits)
                try:
                    status = process.wait(timeout=600)
                except subprocess.TimeoutExpired:
                    os.killpg(process.pid, signal.SIGKILL)
                    process.wait()
                    status = 'timeout'
            with (record / 'commands.jsonl').open('a') as file:
                file.write(json.dumps({'pair': pair, 'case': case, 'variant': variant, 'order': order,
                    'command': command, 'status': status, 'seconds': time.monotonic() - start}) + '\n')
            assert status == 0, (record, pair, case, variant, status)
            rows = [json.loads(line.split('R18_WORKFLOW ', 1)[1])
                    for line in prefix.with_suffix('.stdout').read_text().splitlines() if 'R18_WORKFLOW ' in line]
            assert len(rows) == 2
            for phase, row in zip(['first', 'second'], rows):
                assert row['case'] == case and row['phase'] == phase and row['ns'] > 0
                assert row['artifact']['positions'] and row['artifact']['triangles']
            prefix.with_suffix('.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in rows))
            comparison.append([json.dumps(row['artifact'], sort_keys=True, separators=(',', ':')).encode() for row in rows])
        if purpose != 'artifact-check': assert comparison[0] == comparison[1]
        print('R18 WORKFLOW', purpose, 'PAIR', pair + 1, case, 'complete', record, flush=True)
meta.update(complete=True, checked_workflows=pairs * len(builds) * 2 * 2,
            artifact_pairs=0 if purpose == 'artifact-check' else pairs * 2 * 2, loadavg_end=Path('/proc/loadavg').read_text())
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / ('latest-workflow-' + purpose + '.json')).write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
if purpose == 'final':
    from scipy.stats import t
    results = []
    for case in ['decimal', 'icosahedron']:
        for phase in ['first', 'second']:
            samples = {v: [] for v in ['baseline', 'candidate']}
            for pair in range(pairs):
                for variant in samples:
                    rows = [json.loads(line) for line in (record / f'pair-{pair:02}' / f'{variant}-{case}.jsonl').read_text().splitlines()]
                    samples[variant].append(next(row['ns'] for row in rows if row['phase'] == phase))
            logs = [math.log(b / a) for a, b in zip(samples['baseline'], samples['candidate'])]
            mean = statistics.mean(logs)
            se = statistics.stdev(logs) / math.sqrt(pairs)
            marginal = t.ppf(1 - .05 / 2, pairs - 1) * se
            simultaneous = t.ppf(1 - .05 / 8, pairs - 1) * se
            results.append({'case': case, 'phase': phase, 'ratio': math.exp(mean),
                'marginal_95': [math.exp(mean - marginal), math.exp(mean + marginal)],
                'simultaneous_95': [math.exp(mean - simultaneous), math.exp(mean + simultaneous)],
                'baseline_median_ns': statistics.median(samples['baseline']),
                'candidate_median_ns': statistics.median(samples['candidate']), 'samples_ns': samples})
    analysis = {'metrics': results, 'method': 'Paired log-ratio Student t; marginal95% and Bonferroni simultaneous95% across four predeclared metrics',
        'upper_exceeds_one': sum(r['simultaneous_95'][1] > 1 for r in results),
        'marginal_adverse': sum(r['marginal_95'][0] > 1 for r in results),
        'simultaneous_adverse': sum(r['simultaneous_95'][0] > 1 for r in results),
        'literal_performance_gate_pass': all(r['simultaneous_95'][1] <= 1 for r in results),
        'scope': 'Eight pairs of two completed existing workflows, first and second fresh instances. No general performance claim.'}
    (record / 'analysis.json').write_text(json.dumps(analysis, indent=2) + '\n')
    print(json.dumps(analysis), flush=True)
print('R18 WORKFLOW COMPLETE', record, flush=True)
