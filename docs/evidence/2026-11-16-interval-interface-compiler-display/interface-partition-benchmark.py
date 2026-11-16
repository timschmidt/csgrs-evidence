from pathlib import Path
import hashlib, json, math, os, random, signal, statistics, subprocess, tempfile, time
s = Path(__file__).parent
qualification = json.loads((s / 'interface-partition-result.json').read_text())
assert qualification.get('trace_comparison_passed') and qualification.get('candidate_restored')
for label in ['baseline', 'candidate']:
    binary = s / ('interface-partition-' + label) / 'test-binary'
    assert hashlib.sha256(binary.read_bytes()).hexdigest() == qualification['variants'][label]['binary_sha256']
output = s / 'interface-partition-benchmark'
output.mkdir()
plan = {
    'scope': 'Existing completed partition qualification tests, including process startup and all original assertions; fresh geometry caches and warm executable pages. This is not a microbenchmark of the iterator alone.',
    'cases': list(zip(qualification['tests'], [128, 32, 128])),
    'order': 'Alternating ABBA/BAAB blocks, two samples per variant per block, one unrecorded warmup per variant/case',
    'case_timeout_seconds': 60,
    'bootstrap_seed': 20261116,
    'bootstrap_resamples': 10000,
    'result_semantics': 'Successful command means all complete workloads executed and evidence was recorded; it does not automatically accept a performance or memory regression.',
}
(output / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
rows = []

def execute(label, case):
    binary = s / ('interface-partition-' + label) / 'test-binary'
    with tempfile.TemporaryFile() as log:
        start = time.perf_counter()
        child = subprocess.Popen([str(binary), '--exact', case, '--test-threads=1'], stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
        timed_out = False
        while True:
            pid, status, usage = os.wait4(child.pid, os.WNOHANG)
            if pid:
                break
            if time.perf_counter() - start > plan['case_timeout_seconds']:
                os.killpg(child.pid, signal.SIGKILL)
                pid, status, usage = os.wait4(child.pid, 0)
                timed_out = True
                break
            time.sleep(0.002)
        elapsed = time.perf_counter() - start
        child.returncode = os.waitstatus_to_exitcode(status)
        log.seek(0)
        text = log.read()
    row = {'variant': label, 'case': case, 'wall_seconds': elapsed,
           'user_cpu_seconds': usage.ru_utime, 'system_cpu_seconds': usage.ru_stime,
           'cpu_seconds': usage.ru_utime + usage.ru_stime, 'maximum_rss_kib': usage.ru_maxrss,
           'exit_code': child.returncode, 'external_timeout': timed_out,
           'stdout_sha256': hashlib.sha256(text).hexdigest()}
    if child.returncode or timed_out or b'test result: ok. 1 passed; 0 failed; 0 ignored;' not in text:
        (output / 'failure.log').write_bytes(text)
        (output / 'failure.json').write_text(json.dumps(row, indent=2) + '\n')
        raise RuntimeError('Partition benchmark did not complete its original qualification test')
    assert row['cpu_seconds'] > 0
    return row

with (output / 'samples.jsonl').open('w') as samples:
    for case, blocks in plan['cases']:
        for label in ['baseline', 'candidate']:
            execute(label, case)
        for block in range(blocks):
            order = ['baseline', 'candidate', 'candidate', 'baseline'] if block % 2 == 0 else ['candidate', 'baseline', 'baseline', 'candidate']
            for position, label in enumerate(order):
                row = execute(label, case) | {'block': block, 'position': position}
                rows.append(row)
                samples.write(json.dumps(row) + '\n')
                samples.flush()
        print('Completed paired partition workload:', case, flush=True)

summary = {}
rng = random.Random(plan['bootstrap_seed'])
for case, blocks in plan['cases']:
    selected = [r for r in rows if r['case'] == case]
    ratios = []
    for block in range(blocks):
        times = {label: statistics.mean(r['cpu_seconds'] for r in selected if r['block'] == block and r['variant'] == label) for label in ['baseline', 'candidate']}
        ratios.append(math.log(times['candidate'] / times['baseline']))
    bootstrap = sorted(math.exp(statistics.mean(rng.choices(ratios, k=len(ratios)))) for _ in range(plan['bootstrap_resamples']))
    summary[case] = {
        'paired_geometric_mean_cpu_ratio': math.exp(statistics.mean(ratios)),
        'bootstrap_95_percent_interval': [bootstrap[249], bootstrap[9749]],
        'variants': {label: {
            'samples': sum(r['variant'] == label for r in selected),
            'median_cpu_seconds': statistics.median(r['cpu_seconds'] for r in selected if r['variant'] == label),
            'median_wall_seconds': statistics.median(r['wall_seconds'] for r in selected if r['variant'] == label),
            'maximum_rss_kib': max(r['maximum_rss_kib'] for r in selected if r['variant'] == label),
        } for label in ['baseline', 'candidate']},
    }
(output / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps(summary, indent=2))
