from pathlib import Path
import hashlib, json, shutil, subprocess, sys
s = Path(__file__).parent
root = Path('/mnt/development/interval-coordinated-stack/alumina-interface')
rel = 'crates/alumina-interface-core/src/partition.rs'
source = root / rel
original = subprocess.check_output(['git', 'show', 'HEAD:' + rel], cwd=root)
candidate = source.read_bytes()
assert subprocess.check_output(['git', 'diff', '--binary'], cwd=root) == (s / 'interface-chunks-candidate.patch').read_bytes()
base = json.loads((s / 'interface-baseline-cost-lane.json').read_text())[0]
tests = [
    'partition::tests::representative_program_packages_deterministically_into_real_schemas',
    'machine_profile::tests::stop_to_stop_line_lowers_to_certified_direct_finite_differences',
    'servo_motion::tests::exact_two_span_program_splits_horizons_and_returns_to_rest',
]
state = {'tests': tests, 'variants': {}}

def record(name, command):
    row = base | {'id': 'alumina-interface.partition.' + name, 'run': command,
                  'scope': 'Existing motion, finite-difference and servo qualification witnesses; preserve all assertions.'}
    manifest = s / (row['id'] + '.manifest.json')
    assert not manifest.exists()
    manifest.write_text(json.dumps([row], indent=2) + '\n')
    subprocess.run([sys.executable, str(s / 'run-one.py'), str(manifest), row['id']], check=True)
    directory = s / 'runs' / row['id']
    result = json.loads((directory / 'result.json').read_text())
    assert result['exit_code'] == 0 and result['source_boundaries_unchanged']
    return directory

def instrument(data):
    text = data.decode()
    positions = []
    start = 0
    while True:
        a = text.find('    for encoded in bytes.', start)
        if a < 0:
            break
        b = text.index('\n    }', a) + len('\n    }')
        positions.append((a, b))
        start = b
    assert len(positions) == 3
    for tag, (a, b) in reversed(list(enumerate(positions))):
        before = '''    #[cfg(test)]
    let chunk_recording = hyperreal::dispatch_trace::recording_scope();
    #[cfg(test)]
    let chunk_dispatch_before = hyperreal::dispatch_trace::snapshot();
'''
        after = '''
    #[cfg(test)]
    {
        assert_eq!(hyperreal::dispatch_trace::snapshot(), chunk_dispatch_before,
                   "execution block validation must not dispatch scalar predicates");
        drop(chunk_recording);
        eprintln!("PARTITION_TRACE kind=%d blocks={} scalar_events=0", bytes.len() / EXECUTION_BLOCK_BYTES);
    }''' % tag
        text = text[:a] + before + text[a:b] + after + text[b:]
    return text.encode()

try:
    for label, raw, traced in [('baseline', original, False), ('candidate', candidate, False),
                                ('baseline-trace', original, True), ('candidate-trace', candidate, True)]:
        expected = source.read_bytes()
        data = instrument(raw) if traced else raw
        # No other worker owns this checkout; retain every temporary diagnostic variant.
        source.write_bytes(data)
        out = s / ('interface-partition-' + label)
        out.mkdir()
        (out / 'partition.rs').write_bytes(data)
        features = ' --features hyperreal/dispatch-trace,hyperlimit/dispatch-trace' if traced else ''
        directory = record(label + '-build', 'cargo test --locked --release -p alumina-interface-core --lib --no-run --message-format=json' + features)
        artifacts = []
        for line in (directory / 'output.log').read_text().splitlines():
            if not line.startswith('{'):
                continue
            try:
                row = json.loads(line)
            except json.JSONDecodeError:
                continue
            if row.get('reason') == 'compiler-artifact' and row.get('executable') and row['target']['name'] == 'alumina_interface_core':
                artifacts.append(Path(row['executable']))
        assert len(artifacts) == 1, artifacts
        binary = out / 'test-binary'
        shutil.copy2(artifacts[0], binary)
        item = {'source_sha256': hashlib.sha256(data).hexdigest(), 'binary_bytes': binary.stat().st_size,
                'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(), 'traced': traced}
        directory = record(label + '-tests', '\n'.join(str(binary) + ' --exact ' + test + ' --test-threads=1 --nocapture' for test in tests))
        markers = [line for line in (directory / 'output.log').read_text().splitlines() if 'PARTITION_TRACE ' in line]
        item['trace_markers'] = [line[line.index('PARTITION_TRACE '):] for line in markers]
        if traced:
            assert {int(line.split('kind=')[1].split()[0]) for line in item['trace_markers']} == {0, 1, 2}
        state['variants'][label] = item
        (s / 'interface-partition-result.json').write_text(json.dumps(state, indent=2) + '\n')
    assert state['variants']['baseline-trace']['trace_markers'] == state['variants']['candidate-trace']['trace_markers']
    state['trace_comparison_passed'] = True
finally:
    # Restore only this task-owned source after retaining its derived variants.
    source.write_bytes(candidate)
    assert subprocess.check_output(['git', 'diff', '--binary'], cwd=root) == (s / 'interface-chunks-candidate.patch').read_bytes()
    state['candidate_restored'] = True
    (s / 'interface-partition-result.json').write_text(json.dumps(state, indent=2) + '\n')
record('restored-lints', 'cargo fmt --all -- --check\ncargo clippy --locked -p alumina-interface-core --all-targets --no-deps -- -D warnings')
print('Partition witnesses and zero-dispatch assertions passed for both variants', flush=True)
