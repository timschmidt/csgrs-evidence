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
assert purpose in ['baseline-check', 'functional', 'pilot', 'final', 'allocations']
pairs = {'baseline-check': 1, 'functional': 1, 'pilot': 5, 'final': 30, 'allocations': 5}[purpose]
variants = ['baseline'] if purpose == 'baseline-check' else ['baseline', 'candidate']
mode = 'allocations' if purpose == 'allocations' else 'native'
record = raw / ('cost-' + purpose + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
builds = {v: json.loads((raw / f'latest-cost-build-{v}-{mode}.json').read_text()) for v in variants}
for item in builds.values():
    assert hashlib.sha256(Path(item['binary']).read_bytes()).hexdigest() == item['sha256']
if len(variants) == 2:
    assert builds['baseline']['harness_sha256'] == builds['candidate']['harness_sha256']
    assert builds['baseline']['lock_sha256'] == builds['candidate']['lock_sha256']
    a = json.loads(Path(builds['baseline']['sources']).read_text())
    b = json.loads(Path(builds['candidate']['sources']).read_text())
    assert a.keys() == b.keys()
    changed = sorted(k for k in a if a[k] != b[k])
    assert changed == sorted('crates/hyperreal/src/computable/node/' + n for n in
                             ['ring_product_sum.rs', 'ring_quotient_reduction.rs', 'ring_relations.rs']), changed
cells = [(kind, policy) for kind in range(8) for policy in ['strict', 'approximate']]
if purpose in ['baseline-check', 'functional']:
    batches = {f'{k}-{p}': {'cold': 1, 'warm': 1} for k, p in cells}
elif purpose == 'allocations':
    batches = {f'{k}-{p}': {'cold': 8, 'warm': 8} for k, p in cells}
else:
    batches = json.loads((raw / 'cost-batches.json').read_text())['batches']
if purpose == 'final':
    design = json.loads((raw / 'cost-final-design.json').read_text())
    assert design['pairs'] == pairs and design['batches'] == batches
cpu = min(os.sched_getaffinity(0))
rng = random.Random(20261025)
orders = {f'{k}-{p}': [0, 1] * (pairs // 2) + ([rng.randrange(2)] if pairs % 2 else []) for k, p in cells}
for order in orders.values(): rng.shuffle(order)
def read(path):
    try: return Path(path).read_text()
    except OSError: return None
meta = {'purpose': purpose, 'pairs': pairs, 'builds': builds, 'batches': batches,
        'cpu': cpu, 'seed': 20261025, 'cpuinfo': read('/proc/cpuinfo'),
        'governor': read(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/scaling_governor'),
        'loadavg_start': read('/proc/loadavg'), 'complete': False,
        'protected_cases': list(range(8)), 'completion_target_cases': [],
        'protected_metrics': 64, 'all_reported_metrics': 64,
        'mode': mode, 'scope': 'Every timed outcome checked outside timing; first queries of new roots versus repeated queries of one warmed root. No dispatch tracing.'}
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
def expected(kind, policy, variant):
    if kind in [0, 1, 5]: return 'ExactPositive'
    if kind == 2: return 'ExactZero'
    return 'Unknown' if policy == 'strict' else 'ApproximateZero'
def checksum(outcome, count):
    code = {'ExactPositive': 1, 'ExactZero': 2, 'Unknown': 3, 'ApproximateZero': 4}[outcome]
    result = 14695981039346656037
    for _ in range(count): result = (result * 1099511628211) % (1 << 64) ^ code
    return str(result)
def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024**2, 64 * 1024**2))
    os.sched_setaffinity(0, {cpu})
queries = 0
for pair in range(pairs):
    folder = record / f'pair-{pair:02}'
    folder.mkdir()
    shuffled = cells.copy()
    rng.shuffle(shuffled)
    for kind, policy in shuffled:
        cell = f'{kind}-{policy}'
        order = variants if orders[cell][pair] == 0 else list(reversed(variants))
        comparison = []
        for variant in order:
            prefix = folder / f'{variant}-{cell}'
            batch = batches[cell]
            command = ['/usr/bin/time', '-v', builds[variant]['binary'], str(kind), policy,
                       str(batch['cold']), str(batch['warm'])]
            start = time.monotonic()
            with prefix.with_suffix('.stdout').open('w') as out, prefix.with_suffix('.stderr').open('w') as err:
                process = subprocess.Popen(command, cwd=raw / 'cost', stdout=out, stderr=err,
                                           preexec_fn=limits, start_new_session=True)
                try:
                    status = process.wait(timeout=120)
                except subprocess.TimeoutExpired:
                    os.killpg(process.pid, signal.SIGKILL)
                    process.wait()
                    status = 'timeout'
            with (record / 'commands.jsonl').open('a') as file:
                file.write(json.dumps({'pair': pair, 'kind': kind, 'policy': policy, 'variant': variant,
                    'order': order, 'command': command, 'status': status, 'seconds': time.monotonic() - start}) + '\n')
            assert status == 0, (record, cell, variant, status)
            rows = [json.loads(line) for line in prefix.with_suffix('.stdout').read_text().splitlines()]
            assert len(rows) == 14
            for index, row in enumerate(rows):
                phase = 'cold' if index < 7 else 'warm'
                assert row['kind'] == kind and row['policy'] == policy
                assert row['phase'] == phase and row['sample'] == index % 7
                assert row['iterations'] == batch[phase]
                assert row['allocation_instrumented'] == (mode == 'allocations')
                assert row['outcome'] == expected(kind, policy, variant), (cell, variant, row)
                assert row['checksum'] == checksum(row['outcome'], row['iterations'])
                assert row['ns'] > 0
                queries += row['iterations']
            prefix.with_suffix('.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in rows))
            comparison.append([{k: row[k] for k in ['kind', 'policy', 'phase', 'sample', 'iterations', 'outcome', 'checksum']} for row in rows])
        if len(comparison) == 2:
            assert comparison[0] == comparison[1]
    print('R18 COST', purpose, 'PAIR', pair + 1, 'complete', record, flush=True)
meta.update(complete=True, total_measured_and_checked_queries=queries,
            outcome_rows=pairs * len(variants) * len(cells) * 14,
            loadavg_end=read('/proc/loadavg'))
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / ('latest-cost-' + purpose + '.json')).write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print('R18 COST COMPLETE', record, flush=True)
