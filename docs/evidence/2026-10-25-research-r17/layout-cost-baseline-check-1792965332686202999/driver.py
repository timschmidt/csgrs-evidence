from pathlib import Path
from fractions import Fraction
import hashlib
import json
import os
import random
import resource
import signal
import subprocess
import sys
import time

raw = Path(__file__).resolve().parent
purpose = sys.argv[1]
assert purpose in ['baseline-check', 'functional', 'pilot', 'final']
pairs = {'baseline-check': 1, 'functional': 1, 'pilot': 5, 'final': 30}[purpose]
variants = ['baseline'] if purpose == 'baseline-check' else ['baseline', 'candidate']
record = raw / ('layout-cost-' + purpose + '-' + str(time.time_ns()))
record.mkdir()
(record / 'driver.py').write_bytes(Path(__file__).read_bytes())
builds = {v: json.loads((raw / ('latest-layout-build-' + v + '.json')).read_text()) for v in variants}
if len(variants) == 2:
    assert builds['baseline']['harness_sha256'] == builds['candidate']['harness_sha256']
    assert builds['baseline']['acceptance_sha256'] == builds['candidate']['acceptance_sha256']
for d in builds.values():
    assert hashlib.sha256(Path(d['binary']).read_bytes()).hexdigest() == d['sha256']
    d['sections'] = subprocess.check_output(['size', '-A', d['binary']], text=True)
batches = {str(k): {'cold': 512 if k >= 13 else 2048, 'warm': 131072} for k in range(16)}
if purpose in ['baseline-check', 'functional']:
    batches = {str(k): {'cold': 1, 'warm': 1} for k in range(16)}
if purpose == 'final':
    design = json.loads((raw / 'layout-final-design.json').read_text())
    assert design['pairs'] == pairs and design['batches'] == batches
cpu = min(os.sched_getaffinity(0))
rng = random.Random(20261025)
orders = {case: [0, 1] * (pairs // 2) + ([rng.randrange(2)] if pairs % 2 else []) for case in range(16)}
for seq in orders.values():
    rng.shuffle(seq)
def read(path):
    try:
        return Path(path).read_text()
    except OSError:
        return None
meta = {'purpose': purpose, 'pairs': pairs, 'batches': batches, 'builds': builds,
        'cpu': cpu, 'seed': 20261025, 'cpuinfo': read('/proc/cpuinfo'),
        'governor': read(f'/sys/devices/system/cpu/cpu{cpu}/cpufreq/scaling_governor'),
        'loadavg_start': read('/proc/loadavg'), 'complete': False,
        'protected_metrics': 64,
        'scope': '16 cache cases, median and maximum of seven cold construction/retention batches and seven warm query batches. Batch maxima are slow-tail proxies, not individual-query percentiles.',
        'mode': 'native System allocator; no dispatch-trace or allocation counters'}
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
def expected(kind):
    left = Fraction((1 << 513) + 33, (1 << 257) + 73) if kind >= 13 else Fraction(5_000_000_000)
    if kind in [0, 13]:
        values = [left + Fraction(11, 1_000_000_000)]
    elif kind in [1, 2]:
        values = [left + Fraction(13, 1_000_000_000)]
    elif kind in [3, 4, 5, 6, 14]:
        values = [1 / left]
    elif kind in [7, 8, 9, 10, 15]:
        values = [-left]
    elif kind == 11:
        values = [Fraction(50_000), Fraction(2)]
    elif kind == 12:
        values = [left * Fraction(11, 1_000_000_000)]
    else:
        raise AssertionError(kind)
    return [str(v) for v in values]
def limits():
    resource.setrlimit(resource.RLIMIT_AS, (8 * 1024**3, 8 * 1024**3))
    resource.setrlimit(resource.RLIMIT_FSIZE, (64 * 1024**2, 64 * 1024**2))
    os.sched_setaffinity(0, {cpu})
queries = 0
for pair in range(pairs):
    folder = record / f'pair-{pair:02}'
    folder.mkdir()
    cases = list(range(16))
    rng.shuffle(cases)
    for kind in cases:
        order = variants if orders[kind][pair] == 0 else list(reversed(variants))
        comparison = []
        for variant in order:
            prefix = folder / f'{variant}-{kind:02}'
            env = os.environ.copy()
            env.update(R17_KIND=str(kind), R17_COLD_BATCH=str(batches[str(kind)]['cold']),
                       R17_WARM_BATCH=str(batches[str(kind)]['warm']))
            cmd = ['/usr/bin/time', '-v', builds[variant]['binary'],
                   'rational::arithmetic::r17_layout_cost_tests::r17_layout_cost_probe',
                   '--ignored', '--exact', '--test-threads=1', '--nocapture']
            start = time.monotonic()
            with prefix.with_suffix('.stdout').open('w') as out, prefix.with_suffix('.stderr').open('w') as err:
                proc = subprocess.Popen(cmd, env=env, stdout=out, stderr=err,
                                        preexec_fn=limits, start_new_session=True)
                try:
                    status = proc.wait(timeout=120)
                except subprocess.TimeoutExpired:
                    os.killpg(proc.pid, signal.SIGKILL)
                    proc.wait()
                    status = 'timeout'
            with (record / 'commands.jsonl').open('a') as f:
                f.write(json.dumps({'pair': pair, 'kind': kind, 'variant': variant,
                                   'order': order, 'command': cmd, 'status': status,
                                   'seconds': time.monotonic() - start}) + '\n')
            assert status == 0, (record, kind, variant, status)
            stderr = prefix.with_suffix('.stderr').read_text().splitlines()
            layouts = [json.loads(s.split('R17_LAYOUT ', 1)[1]) for s in stderr if 'R17_LAYOUT ' in s]
            assert len(layouts) == 1
            assert layouts[0] == {'main_bytes': 176 if variant == 'baseline' else 120, 'exact': expected(kind)}
            rows = [json.loads(s.split('R17_SAMPLE ', 1)[1]) for s in stderr if 'R17_SAMPLE ' in s]
            assert len(rows) == 7
            for sample, row in enumerate(rows):
                assert row['kind'] == kind and row['sample'] == sample
                assert row['cold_iterations'] == batches[str(kind)]['cold']
                assert row['warm_iterations'] == batches[str(kind)]['warm']
                assert row['exact'] == expected(kind)
                queries += row['cold_iterations'] + row['warm_iterations']
            prefix.with_suffix('.jsonl').write_text(''.join(json.dumps(r) + '\n' for r in rows))
            comparison.append([{k: r[k] for k in ['kind', 'sample', 'cold_iterations', 'warm_iterations', 'exact']} for r in rows])
        if len(comparison) == 2:
            assert comparison[0] == comparison[1]
    print('R17 LAYOUT', purpose, 'PAIR', pair + 1, 'complete', flush=True)
meta.update(complete=True, total_measured_queries=queries,
            exact_outcome_rows=pairs * len(variants) * 16 * 7,
            loadavg_end=read('/proc/loadavg'))
(record / 'metadata.json').write_text(json.dumps(meta, indent=2) + '\n')
(raw / ('latest-layout-cost-' + purpose + '.json')).write_text(json.dumps({'record': str(record)}, indent=2) + '\n')
print('R17 LAYOUT COST COMPLETE', record, flush=True)
