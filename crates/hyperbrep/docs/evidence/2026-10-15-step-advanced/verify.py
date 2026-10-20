"""Verify frozen source, checks, independent outputs, costs and open gates."""
import hashlib, importlib.util, json, re, statistics, subprocess, sys
from pathlib import Path

root = Path('/mnt/development/csgrs')
out = Path(__file__).resolve().parent
manifest = json.loads((out / 'manifest.json').read_text())
for key, base in [('sources', root), ('artifacts', out)]:
    for entry in manifest[key]:
        path = base / entry['path']
        assert path.stat().st_size == entry['bytes'], path
        assert hashlib.sha256(path.read_bytes()).hexdigest() == entry['sha256'], path
audit = json.loads((out / 'dependency-audit.json').read_text())
subprocess.run(['git', 'diff', '--exit-code', audit['baseline'], '--', *audit['core_paths_unchanged']],
               cwd=root, check=True, stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard', '--',
                                    *audit['core_paths_unchanged']], cwd=root, text=True)
commands = json.loads((out / 'commands.json').read_text())
assert {x['label'] for x in commands} == {
    'native-debug', 'io-release', 'example', 'occt-read', 'clippy',
    'rustdoc', 'wasm-build', 'wasm-runtime', 'fmt', 'diff-check'}
assert len(commands) == 10 and all(x['exit_code'] == 0 for x in commands)
for label, total in [('native-debug', 373), ('io-release', 49)]:
    log = (out / (label + '.log')).read_text()
    assert sum(map(int, re.findall(r'test result: ok\. (\d+) passed', log))) == total
wasm = json.loads((out / 'wasm-runtime.json').read_text())
assert wasm['probe_groups'] == 6 and wasm['imports'] == 0
oracle = json.loads((out / 'occt-read.json').read_text())
assert len(oracle['fixtures']) == 7
for row in oracle['fixtures']:
    assert row['valid'] and row['roots'] == row['transferred'] == 1
    path = root / row['path']
    assert path.stat().st_size == row['bytes']
    assert hashlib.sha256(path.read_bytes()).hexdigest() == row['sha256']
    assert abs(row['volume_default_mm3'] - row['expected_mm3']) < 1e-8
controls = json.loads((out / 'controls/results.json').read_text())
assert len(controls) == 6
for row in controls:
    assert row['rejected_at_runtime'] and row['source_restored'] and row['exit_code'] != 0
    patch = (out / 'controls' / (row['name'] + '.patch')).read_text()
    source = root / patch.splitlines()[0].removeprefix('--- ')
    assert hashlib.sha256(source.read_bytes()).hexdigest() == row['source_sha256']
    log = (out / 'controls' / (row['name'] + '.log')).read_text()
    assert 'test result: FAILED' in log and 'could not compile' not in log

spec = importlib.util.spec_from_file_location('receipt', root / 'crates/hyperbrep/tools/benchmark_receipt.py')
m = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = m
spec.loader.exec_module(m)
bench_commands = json.loads((out / 'benchmark-commands.json').read_text())
assert len(bench_commands) == 9 and all(x['exit_code'] == 0 for x in bench_commands)
old_source = subprocess.check_output(['git', 'show', audit['baseline'] + ':crates/hyperbrep-io/benches/faceted.rs'], cwd=root, text=True)
assert old_source.count('import_faceted_representation') == 1
assert old_source.replace('import_faceted_representation', 'import_representation') == (root / 'crates/hyperbrep-io/benches/faceted.rs').read_text()

def receipts(prefix, source):
    expected = m.expected_cases((root / 'crates/hyperbrep-io/benches' / source).read_text())
    rows, allocations, facts = [], [], None
    for trial in range(1, 4):
        log = (out / f'{prefix}-{trial}.log').read_text()
        parsed = m.read_receipt(log, expected)
        rows.append(parsed)
        m.compare(rows[0], parsed)
        current = [line for line in log.splitlines() if line.startswith('fixture ')]
        if facts is None:
            facts = current
        assert current == facts
        allocations.append({name: (int(calls), int(size)) for name, calls, size in re.findall(
            r'allocation_metadata name=(\S+): calls=(\d+) requested_bytes=(\d+)', log)})
        assert set(allocations[-1]) == {x.name for x in parsed}
    return rows, facts, allocations

advanced, facts, allocs = receipts('advanced', 'advanced.rs')
assert len(advanced[0]) == 6 and len(facts) == 5
costs = json.loads((out / 'advanced-costs.json').read_text())
assert len(costs) == 6
for i, cost in enumerate(costs):
    assert cost['case'] == advanced[0][i].name and cost['checksum'] == advanced[0][i].checksum
    assert cost['iterations'] == advanced[0][i].iterations
    assert cost['median_ns'] == statistics.median(x[i].elapsed_ns / x[i].iterations for x in advanced)
    assert cost['allocation_calls_per_iteration'] == statistics.median(a[cost['case']][0] / advanced[n][i].iterations for n, a in enumerate(allocs))
    assert cost['requested_bytes_per_iteration'] == statistics.median(a[cost['case']][1] / advanced[n][i].iterations for n, a in enumerate(allocs))
b, bf, ba = receipts('import-baseline', 'faceted.rs')
c, cf, ca = receipts('import-faceted', 'faceted.rs')
assert len(b[0]) == 7 and bf == cf
for row in c:
    m.compare(b[0], row)
costs = json.loads((out / 'import-costs.json').read_text())
assert len(costs) == 7
for i, cost in enumerate(costs):
    assert cost['case'] == b[0][i].name
    bv = statistics.median(x[i].elapsed_ns / x[i].iterations for x in b)
    cv = statistics.median(x[i].elapsed_ns / x[i].iterations for x in c)
    assert cost['baseline_median_ns'] == bv and cost['candidate_median_ns'] == cv and cost['ratio'] == cv / bv
    for label, rows, allocations in [('baseline', b, ba), ('candidate', c, ca)]:
        expected = dict(
            calls=statistics.median(a[cost['case']][0] / rows[n][i].iterations for n, a in enumerate(allocations)),
            requested_bytes=statistics.median(a[cost['case']][1] / rows[n][i].iterations for n, a in enumerate(allocations)))
        assert cost[label + '_allocation_per_iteration'] == expected
log = (out / 'advanced-1.log').read_text()
first = next(line for line in log.splitlines(True) if line.startswith('advanced/box_3d:'))
expected = m.expected_cases((root / 'crates/hyperbrep-io/benches/advanced.rs').read_text())
bad_sum = re.sub(r'checksum=(\d+)', lambda match: 'checksum=' + str(int(match[1]) + 1), first)
for bad in [log.replace(first, ''), log + first, log.replace(first, bad_sum)]:
    try:
        m.compare(advanced[0], m.read_receipt(bad, expected))
    except ValueError:
        pass
    else:
        raise AssertionError('receipt mutation accepted')
ledger = json.loads((root / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not ledger['complete'] and len(ledger['work_packages']) == 28
assert all(x['status'] != 'complete' for x in ledger['work_packages'])
assert any(x['id'] == 'step-advanced' for x in ledger['increments'])
result = dict(sources=len(manifest['sources']), artifacts=len(manifest['artifacts']),
              native_results=373, release_io_results=49, wasm_groups=6,
              independent_inputs=3, independent_exports=4, implementation_faults=6,
              receipt_checker_controls=3, advanced_receipts=18, faceted_receipts=42,
              all_work_package_gates_open=True)
(out / 'verification.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
