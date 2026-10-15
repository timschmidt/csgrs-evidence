"""Check retained hashes, command exits, runtime faults and complete receipts."""
import hashlib, json, re, statistics
from pathlib import Path
from receipts import expected, read, compare
from qualify import COMMANDS, hashes
root = Path('/mnt/development/csgrs')
out = Path(__file__).resolve().parent
manifest = json.loads((out / 'manifest.json').read_text())
for base, key in ((root, 'sources'), (out, 'artifacts')):
    for row in manifest[key]:
        data = (base / row['path']).read_bytes()
        assert len(data) == row['bytes'] and hashlib.sha256(data).hexdigest() == row['sha256'], row['path']
commands = json.loads((out / 'commands.json').read_text())
assert json.loads((out/'benchmark-source.json').read_text()) == hashes()
assert [x['label'] for x in commands] == [x[0] for x in COMMANDS]
assert all(x['exit_code'] == (101 if x['label'] == 'root-acceptance' else 0) for x in commands)
for command in commands:
    assert json.loads((out/command['source_snapshot']).read_text()) == hashes()
    assert (out/command['log']).read_bytes() == (out/(command['label']+'.log')).read_bytes()
counts = {}
for label in ('native-debug', 'native-release', 'native-minimal', 'curve-focused-debug', 'curve-release'):
    log = (out / (label + '.log')).read_text()
    assert 'test result: FAILED' not in log
    counts[label] = sum(int(n) for n in re.findall(r'test result: ok\. (\d+) passed', log))
assert counts == {'native-debug':391, 'native-release':391, 'native-minimal':383, 'curve-focused-debug':40, 'curve-release':2441}, counts
curve_log = (out/'curve-release.log').read_text()
assert sum(int(n) for n in re.findall(r'test result: ok\. \d+ passed; \d+ failed; (\d+) ignored', curve_log)) == 28
root_log = (out/'root-acceptance.log').read_text()
root_failed = re.findall(r'^test (\S+) \.\.\. FAILED$', root_log, re.M)
assert sorted(root_failed) == ['strict_drill_16_composes_through_empty_and_complete_subtraction', 'strict_drill_32_composes_through_empty_and_complete_subtraction'], root_failed
root_passed = sum(int(n) for n in re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed', root_log))
assert root_passed == 141 and 'PredicateUndecided' in root_log
wasm = json.loads((out / 'wasm-runtime.json').read_text())
assert wasm['probe_groups'] == 8 and wasm['imports'] == 0
faults = json.loads((out / 'controls/results.json').read_text())
assert len(faults) == 6
for row in faults:
    assert row['rejected_at_runtime'] and row['source_restored'] and row['exit_code'] != 0
    assert hashlib.sha256((root / row['source']).read_bytes()).hexdigest() == row['source_sha256']
    log = (out / 'controls' / (row['name'] + '.log')).read_text()
    assert 'test result: FAILED' in log and 'could not compile' not in log
preserved = json.loads((out/'pre-integration-preservation.json').read_text())
for path, digest in preserved['files'].items():
    assert hashlib.sha256((out/'pre-integration'/path).read_bytes()).hexdigest() == digest
sup = out/'superseded-model-bounds'
for path, digest in json.loads((sup/'preservation.json').read_text()).items():
    assert hashlib.sha256((sup/path).read_bytes()).hexdigest() == digest
probe = json.loads((out/'seam-frame-probe.json').read_text())
assert probe['exit_code'] == 0 and hashlib.sha256((out/'seam_frame_probe.rs').read_bytes()).hexdigest() == probe['source_sha256']
probe_rows = (out/'seam-frame-probe.log').read_text().splitlines()
assert len(probe_rows) == 26 and all(': Ok(' in row for row in probe_rows[:24])
assert 'EdgeEndpointMismatch' in probe_rows[24] and 'InvalidSurfaceFrame' in probe_rows[25]
reproductions = json.loads((out/'current-reproductions.json').read_text())
assert len(reproductions) == 2 and all(r['exit_code'] == 101 and r['revision'] == manifest['baseline_revision'] for r in reproductions)
for label, expected_error in [('current_reproduction','DegenerateEdge'), ('current_curve_reproduction','ZeroLengthLine')]:
    assert expected_error in (out/(label+'.log')).read_text()
assert '7 passed; 1 failed' in (out/'focused-hyperbrep-before-bound-fallback.log').read_text()
for command in json.loads((out/'baseline-preedit-commands.json').read_text()):
    assert command['exit_code'] == 0 and command['source_revision'] == manifest['baseline_revision']
bench = json.loads((out / 'benchmark-commands.json').read_text())
assert len(bench) == 15 and all(x['exit_code'] == 0 for x in bench)
for kind in ('kernel', 'arc'):
    for prefix in ('baseline-', ''):
        messages = [json.loads(line) for line in (out / (prefix + kind + '-artifacts.jsonl')).read_text().splitlines()]
        artifacts = [x for x in messages if x.get('reason') == 'compiler-artifact' and x['target']['name'] == kind and x.get('executable')]
        assert len(artifacts) == 1 and artifacts[0]['features'] == ['default']
reader_controls = []
for kind in ('kernel', 'arc'):
    baseline_log = (out / f'{kind}-baseline-1.log').read_text()
    baseline = read(kind, baseline_log)
    compare(baseline, read(kind, (out/f'baseline-preedit-{kind}.log').read_text()))
    parsed = {'baseline': [], 'candidate': []}
    for trial in range(1,4):
        for side in parsed:
            row = read(kind, (out / f'{kind}-{side}-{trial}.log').read_text())
            compare(baseline, row)
            parsed[side].append(row)
    costs = json.loads((out / (kind + '-costs.json')).read_text())
    assert len(costs) == len(expected(kind))
    for i, cost in enumerate(costs):
        for side in parsed:
            median = statistics.median(x[i]['elapsed_ns']/x[i]['iterations'] for x in parsed[side])
            assert cost[side + '_median_ns'] == median
        assert cost['ratio'] == cost['candidate_median_ns']/cost['baseline_median_ns']
    first = next(line for line in baseline_log.splitlines(True) if line.startswith(expected(kind)[0] + ':'))
    mutated = re.sub(r'checksum=(\d+)', lambda m:'checksum=' + str(int(m[1])+1), first)
    for label, bad in (
        ('missing', baseline_log.replace(first, '', 1)),
        ('duplicate', baseline_log.replace(first, first + first, 1)),
        ('changed-result', baseline_log.replace(first, mutated, 1)),
    ):
        try:
            compare(baseline, read(kind, bad))
        except ValueError:
            reader_controls.append(kind + '/' + label)
        else:
            raise AssertionError('reader accepted ' + kind + '/' + label)
rows, facts, allocations = [], [], []
for trial in range(1,4):
    log = (out / f'closed-{trial}.log').read_text()
    rows.append(read('closed_edges', log))
    compare(rows[0], rows[-1])
    facts.append([line for line in log.splitlines() if line.startswith('fixture ')])
    allocations.append({name:dict(calls=int(calls), requested_bytes=int(size)) for name,calls,size in re.findall(r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)', log)})
assert all(x == facts[0] for x in facts) and all(x == allocations[0] for x in allocations)
costs = json.loads((out / 'closed-costs.json').read_text())
assert len(costs) == 5
for i, cost in enumerate(costs):
    n = rows[0][i]['iterations']
    assert cost['checksum'] == rows[0][i]['checksum'] and cost['iterations'] == n
    assert cost['median_ns'] == statistics.median(x[i]['elapsed_ns']/n for x in rows)
    assert cost['allocation_calls_per_iteration'] == allocations[0][cost['case']]['calls']/n
    assert cost['requested_bytes_per_iteration'] == allocations[0][cost['case']]['requested_bytes']/n
status = json.loads((root / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(x['status'] in ('open', 'in-progress') for x in status['work_packages'])
increment = next(x for x in status['increments'] if x['id'] == 'closed-analytic-edges')
assert 'Pending' not in increment['validation'] + increment['cost_evidence']
result = dict(hashes_checked=len(manifest['sources'])+len(manifest['artifacts']), test_results=counts, root_acceptance=dict(passed=root_passed, inherited_failures=root_failed), wasm_groups=8, implementation_faults_rejected=6, receipt_faults_rejected=reader_controls, matched_kernel_rows=64, matched_arc_rows=12, arc_timing_only_rows=1, closed_edge_cost_rows=5, all_28_work_package_gates_open=True, historical_archive_timing_gate='open')
(out / 'verification.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
