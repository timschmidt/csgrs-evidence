"""Record the terminal integrated qualification and update only current_work."""
import gzip
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys

sys.dont_write_bytecode = True
E = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location('extended_v4', E / 'validate_extended_v4.py')
x = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(x)
p, q = x.p, x.q


def main():
    terminal = int(sys.argv[1])
    assert terminal in (0, 101)
    assert not (E / 'checkpoint-v4.json').exists() and not (E / 'main-source-after-v4.json.gz').exists()
    assert not subprocess.check_output(['git', 'diff', '--cached', '--name-only'], cwd=p.ROOT)
    sources = p.read_map(E / 'freeze-v4/source-hashes.json.gz')
    assert x.source_inventory() == sources
    prior_main = p.read_map(p.MAIN_RECORD)
    assert all(p.sha(p.ROOT / name) == digest for name, digest in prior_main.items())
    for version, record in [(1, 'preparation-v1'), (2, 'preparation-v2'), (3, 'freeze-v3')]:
        root = p.ROOT / f'target/scalar-main-integration-v{version}/source'
        assert p.inventory(root) == p.read_map(E / record / 'source-hashes.json.gz')
    native = json.loads((p.ROOT / 'docs/evidence/2026-10-12-existing-worktree/geometry-validation-closure/result.json').read_text())['pending_native_sha256']
    assert len(native) == 35 and all(p.sha(p.ROOT / name) == digest == sources[name] for name, digest in native.items())
    for path in [E / 'native-closure-v4.json', E / 'extended-closure-v4.json']:
        assert json.loads(path.read_text())['complete']
    consumers = E / 'consumers-v4'
    result = json.loads((consumers / 'result.json').read_text())
    commands = json.loads((consumers / 'commands.json').read_text())
    assert result['last_exit_code'] == terminal == commands[-1]['exit_code']
    assert result['complete'] == (terminal == 0 and len(commands) == 3)
    tests, failures = {}, []
    for row in commands:
        for stream in ['stdout', 'stderr']:
            assert p.sha(consumers / (row['name'] + '.' + stream)) == row[stream + '_sha256']
        tests[row['name']] = {field: sum(batch[field] for batch in row['test_batches'])
                             for field in ['passed', 'failed', 'ignored']}
        output = (consumers / (row['name'] + '.stdout')).read_text()
        failures.extend(re.findall(r'^test ([^\n]+?) \.\.\. FAILED$', output, re.M))
    binaries = json.loads((consumers / 'binaries.json').read_text())
    assert all(p.sha(Path(name)) == digest for name, digest in binaries.items())
    remaining = [
        'Resolve any retained consumer failures without changing original fixtures, budgets or caps; native runtime admission is not established by scalar tests.',
        'Qualify extreme coarse-precision Real interval construction under subprocess caps: interval_from_approximation still materializes shifted integer endpoints after a successful coarse zero approximation. The new negative-extreme cache regression does not establish a positive-extreme allocation bound.',
        'Replay the complete numerical/public schedules and qualify matched cost, allocations, retained/peak memory and binary size for the current integration.',
        'Resolve the separately retained algebraic cost-process SIGXCPU failures and expression/coefficient growth obligations.',
        'Discharge constructor normalization, count bounds, production callers, full approximation semantics and concurrent publication; all 13 whole-crate proof groups remain open.',
        'Qualify dependency binding for additional standalone manifests and published packages, and the complete fixed pre-Verus baseline.',
        'Complete all 39 properties, 14 targets and crate-specific future work; complete the repository workflow matrix before any push.',
    ]
    prefix = str(E.relative_to(p.ROOT)) + '/'
    entry = {
        'status': 'isolated-current-main-integration-qualified-for-scalar-checks',
        'source_directory': str(q.SOURCE), 'source_record': prefix + 'freeze-v4/source-hashes.json.gz',
        'source_record_sha256': p.sha(E / 'freeze-v4/source-hashes.json.gz'), 'source_files': len(sources),
        'source_delta_archive': prefix + 'freeze-v4/overlay.tar.gz', 'files_changed_from_main': 210,
        'native_scalar_closure': prefix + 'native-closure-v4.json',
        'sanitizer_proof_cap_closure': prefix + 'extended-closure-v4.json',
        'consumer_results': prefix + 'consumers-v4/result.json',
        'checkpoint': prefix + 'checkpoint-v4.json',
        'native_scalar_tests': {'default_top_level': 1052, 'all_features_top_level': 1203,
                                'child_tests_each': 1, 'doctests': 28, 'acceptance_controls': 51},
        'asan_scalar_tests': {'default_top_level': 1052, 'all_features_top_level': 1203,
                              'child_tests_each': 1, 'reported_sanitizer_errors': 0},
        'conditional_proof': {'units': 737, 'production_contracts': 99, 'model_theorems': 178,
                              'dependency_units_separate_including_shared_models': 453, 'open_obligation_groups': 13},
        'historical_unit_caps': {'schedules': 39, 'top_level_tests': 156, 'child_tests': 1,
                                 'address_space_bytes': 201326592, 'cpu_seconds_soft_hard': [2, 3], 'wall_seconds': 4},
        'consumer_tests': tests, 'consumer_commands_complete': result['complete'],
        'consumer_failures': failures, 'pending_native_files_preserved': 35,
        'accepted_P4': 'Warming may strengthen Unknown to Certified and reuse finer proofs; definite facts must agree and retained certificates must not weaken.',
        'main_runtime_admitted': False, 'plan_complete': False,
        'remaining_requirements': remaining,
    }
    ledger_path = p.ROOT / 'docs/properties-status.json'
    ledger = json.loads(ledger_path.read_text())
    fixed = json.loads(subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=p.ROOT))
    without_current = lambda data: {key: value for key, value in data.items() if key != 'current_work'}
    assert without_current(ledger) == without_current(fixed)
    assert 'scalar_main_integration' not in ledger['current_work']
    ledger['current_work']['scalar_main_integration'] = entry
    ledger['current_work']['isolated_scalar_prototype']['fresh_current_main_integration'] = entry['checkpoint']
    ledger['current_work']['pending_native_geometry']['combined_scalar_integration_validation'] = entry['consumer_results']
    ledger['current_work']['plan_complete'] = False
    p.dump(ledger_path, ledger)
    after = prior_main | {'docs/properties-status.json': p.sha(ledger_path)}
    record = E / 'main-source-after-v4.json.gz'
    record.write_bytes(gzip.compress((json.dumps(after, sort_keys=True) + '\n').encode(), mtime=0))
    assert all(p.sha(p.ROOT / name) == digest for name, digest in after.items())
    assert without_current(json.loads(ledger_path.read_text())) == without_current(fixed)
    p.dump(E / 'checkpoint-v4.json', {
        'classification_of_work': 'progress', 'entry': entry, 'consumer_driver_terminal_exit_code_observed': terminal,
        'consumer_artifacts_sha256': p.inventory(consumers), 'runner_sha256': p.sha(Path(__file__)),
        'native_scalar_closure_sha256': p.sha(E / 'native-closure-v4.json'),
        'extended_closure_sha256': p.sha(E / 'extended-closure-v4.json'),
        'previous_main_source_record': str(p.MAIN_RECORD.relative_to(p.ROOT)),
        'previous_main_source_record_sha256': p.sha(p.MAIN_RECORD),
        'main_source_record_after': str(record.relative_to(p.ROOT)), 'main_source_record_after_sha256': p.sha(record),
        'only_change_in_mapped_main_inputs': 'docs/properties-status.json current_work',
        'pending_native_sha256': native, 'prior_sources_unchanged': True,
        'all_39_properties_14_targets_and_crate_future_work_remain_in_scope': True,
        'main_runtime_admitted': False, 'plan_complete': False,
    })
    print(json.dumps({'checkpoint': str(E / 'checkpoint-v4.json'), 'consumer_tests': tests,
                      'consumer_failures': failures, 'main_runtime_admitted': False}))


if __name__ == '__main__':
    main()
