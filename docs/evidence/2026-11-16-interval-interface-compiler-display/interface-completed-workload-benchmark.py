from pathlib import Path
import hashlib, json, math, os, random, signal, statistics, subprocess, tempfile, time
s = Path(__file__).parent
qualification = json.loads((s / 'interface-partition-result.json').read_text())
assert qualification.get('trace_comparison_passed') and qualification.get('candidate_restored')
for label in ['baseline', 'candidate']:
    binary = s / ('interface-partition-' + label) / 'test-binary'
    assert hashlib.sha256(binary.read_bytes()).hexdigest() == qualification['variants'][label]['binary_sha256']
core_budget = json.loads((s / 'interface-core-budget/result.json').read_text())
assert core_budget['candidate_restored'] and set(core_budget['variants']) == {'fixed', 'previous', 'candidate'}
for label in ['previous', 'candidate']:
    binary = s / 'interface-core-budget' / label / 'test-binary'
    assert hashlib.sha256(binary.read_bytes()).hexdigest() == core_budget['variants'][label]['sha256']
output = s / 'interface-completed-workload-benchmark'
output.mkdir()
plan = {
    'scope': 'Existing completed partition tests under stable and Rust1.95 plus ordinary stable UI rendering qualification tests, including process startup and all original assertions; fresh geometry caches and warm executable pages. This is not a microbenchmark of the iterator alone.',
    'cases': [(case, blocks, family) for family in ['partition', 'core-budget'] for case, blocks in zip(qualification['tests'], [128, 32, 128])] + [(case, 16, 'ui-tests') for case in ['control_graph_ui::tests::headless_exact_control_workspace_produces_a_complete_egui_frame', 'control_graph_ui::tests::representative_layout_is_bounded_acyclic_and_keeps_feedback_visible', 'machine_cam_ui::tests::headless_machine_cam_workspace_produces_a_complete_egui_frame']],
    'order': 'Alternating ABBA/BAAB blocks, two samples per variant per block, one unrecorded warmup per variant/case',
    'case_timeout_seconds': 60,
    'bootstrap_seed': 20261116,
    'bootstrap_resamples': 10000,
    'result_semantics': 'Successful command means all complete workloads executed and evidence was recorded; it does not automatically accept a performance or memory regression.',
}
(output / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
rows = []

def execute(label, case, family):
    artifact_label = 'final' if family == 'ui-tests' and label == 'candidate' else label
    if family == 'core-budget':
        artifact_label = 'previous' if label == 'baseline' else 'candidate'
        binary = s / 'interface-core-budget' / artifact_label / 'test-binary'
    else:
        binary = s / ('interface-' + family + '-' + artifact_label) / 'test-binary'
    if family == 'ui-tests':
        report = json.loads((binary.parent / 'report.json').read_text())
        assert hashlib.sha256(binary.read_bytes()).hexdigest() == report['sha256']
    with tempfile.TemporaryFile() as log:
        start = time.perf_counter()
        child = subprocess.Popen([str(binary), '--exact', case, '--test-threads=1'], stdout=log, stderr=subprocess.STDOUT, start_new_session=False)
        timed_out = False
        while True:
            pid, status, usage = os.wait4(child.pid, os.WNOHANG)
            if pid:
                break
            if time.perf_counter() - start > plan['case_timeout_seconds']:
                child.kill()
                pid, status, usage = os.wait4(child.pid, 0)
                timed_out = True
                break
            time.sleep(0.002)
        elapsed = time.perf_counter() - start
        child.returncode = os.waitstatus_to_exitcode(status)
        log.seek(0)
        text = log.read()
    row = {'variant': label, 'case': case, 'family': family, 'wall_seconds': elapsed,
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
    for case, blocks, family in plan['cases']:
        for label in ['baseline', 'candidate']:
            execute(label, case, family)
        for block in range(blocks):
            order = ['baseline', 'candidate', 'candidate', 'baseline'] if block % 2 == 0 else ['candidate', 'baseline', 'baseline', 'candidate']
            for position, label in enumerate(order):
                row = execute(label, case, family) | {'block': block, 'position': position}
                rows.append(row)
                samples.write(json.dumps(row) + '\n')
                samples.flush()
        print('Completed paired workload:', family, case, flush=True)

summary = {}
rng = random.Random(plan['bootstrap_seed'])
for case, blocks, family in plan['cases']:
    selected = [r for r in rows if r['case'] == case and r['family'] == family]
    ratios = []
    for block in range(blocks):
        times = {label: statistics.mean(r['cpu_seconds'] for r in selected if r['block'] == block and r['variant'] == label) for label in ['baseline', 'candidate']}
        ratios.append(math.log(times['candidate'] / times['baseline']))
    bootstrap = sorted(math.exp(statistics.mean(rng.choices(ratios, k=len(ratios)))) for _ in range(plan['bootstrap_resamples']))
    summary[family + '::' + case] = {
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
