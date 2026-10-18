"""Retain a qualified semantic probe and its disqualifying memory-growth evidence."""
import ast
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tarfile

sys.dont_write_bytecode = True
O = Path('/home/tim/Documents/GitHub/workspace/csgrs')
N = O.parent / 'csgrs-properties-validation-2026-10-17-v2'
E = Path(__file__).resolve().parent
W = N / 'native-aggregation-control-v1'
P = O / 'docs/evidence/2026-10-17-resume-integration'
BASE = 'e515480e3f0f19a371c745b60d453ab322094db6'
GIT = ['git', '-c', 'core.splitIndex=true', '-c', 'index.version=4',
       '-c', 'maintenance.auto=false', '-c', 'gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
sys.path.insert(0, str(P))
from load_expectations_v2 import load, sha


def read(path):
    return json.loads(Path(path).read_text())


def dump(path, value):
    assert not Path(path).exists(), path
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def gzread(path):
    return json.loads(gzip.decompress(Path(path).read_bytes()))


def gzwrite(path, value):
    assert not Path(path).exists(), path
    Path(path).write_bytes(gzip.compress((json.dumps(value, sort_keys=True) + '\n').encode(), mtime=0))


def git(*args):
    return subprocess.check_output(GIT + list(args), cwd=O)


def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start + len(raw[start:].decode()[:count].encode()), value


assert git('rev-parse', 'HEAD').decode().strip() == BASE
assert not git('diff', '--name-only') and not git('diff', '--cached', '--name-only')
assert sha(O / 'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py') == '08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous = read(P / 'checkpoint-v1.json')
assert all(sha(O / p) == h for p, h in previous['evidence_files_sha256'].items())
prior, missing = load(O / previous['artifact_expectations'], allow_unqualified=True)
assert (len(prior), len(missing)) == (1299969, 921794)
live = previous['restored_native_sha256'] | previous['inherited_implementation_sha256'] | previous['implementation_sha256']
assert all(sha(O / p) == h for p, h in live.items())
roots = []
inventories = {}
focused = {}
gates = {}
binaries = set()
for mode in ('baseline', 'candidate'):
    source = N / ('native-aggregation-' + mode + '-v1')
    inventories[mode] = gzread(N / ('native-aggregation-' + mode + '-source-v1.json.gz'))
    assert all(sha(source / p) == h for p, h in inventories[mode].items())
    roots.extend([source, N / 'targets' / ('native-aggregation-' + mode + '-v1')])
    artifacts = N / ('native-aggregation-' + mode + '-artifacts-v1')
    roots.append(artifacts)
    for row in read(artifacts / 'executables-v1.json').values():
        assert sha(row['executed_copy']) == row['sha256']
        binaries.add(Path(row['executed_copy']))
    assert all(not row['fresh'] for row in read(artifacts / 'fresh-local-build-v1.json'))
    focused[mode] = read(N / ('native-aggregation-' + mode + '-focused-v1.json'))
    gates[mode] = read(N / ('native-aggregation-' + mode + '-gates-v1.json'))
    assert len(gates[mode]) == 3 and all(row['exit_code'] == 0 and not row['external_stops'] for row in gates[mode].values())
assert focused['baseline']['kicad_track_failures']['observations'] == focused['candidate']['kicad_track_failures']['observations']
assert focused['candidate']['kicad_track_failures']['passed'] == 39
assert (focused['baseline']['native_aggregation']['passed'], focused['baseline']['native_aggregation']['failed']) == (8, 5)
assert (focused['candidate']['native_aggregation']['passed'], focused['candidate']['native_aggregation']['failed']) == (13, 0)
assert (focused['candidate']['kicad_native_aggregation']['passed'], focused['candidate']['kicad_native_aggregation']['failed']) == (9, 3)
for path in ('crates/hyperdrc/tests/native_aggregation.rs', 'crates/hyperdrc/tests/kicad_native_aggregation.rs'):
    assert inventories['baseline'][path] == inventories['candidate'][path]
for path, digest in inventories['baseline'].items():
    if path not in ('crates/hyperdrc/tests/native_aggregation.rs', 'crates/hyperdrc/tests/kicad_native_aggregation.rs'):
        assert sha(O / path) == digest
prep = read(W / 'candidate-preparation-v2.json')
changes = {p: h for p, h in inventories['candidate'].items() if h != inventories['baseline'][p]}
assert changes == prep['candidate_implementation_sha256'] and len(changes) == 13
assert sum(row['changed_check_version_fields'] for row in prep['fixture_version_migrations'].values()) == 960
quality = read(N / 'native-aggregation-candidate-quality-result-v1.json')
assert all(row['exit_code'] == 0 and not row['stops'] for row in quality['commands'].values())
remaining = read(N / 'native-aggregation-remaining-result-v2.json')
assert remaining['complete_for_declared_scope'] and remaining['total_production_suite_passes'] == 1669
assert remaining['all_integration_targets_accounted_for'] and remaining['test_counts']['doctests'] == 3
lib = N / 'logs/aggregation-candidate-suite-library-v2'
assert read(lib / 'result.json')['exit_code'] == 0
assert 'test result: ok. 1559 passed; 0 failed; 0 ignored;' in (lib / 'stdout').read_text()
extra = N / 'native-aggregation-candidate-integration-artifacts-v1'
roots.append(extra)
for row in read(extra / 'executables-v1.json').values():
    assert sha(row['executed_copy']) == row['sha256']
    binaries.add(Path(row['executed_copy']))
assert len(binaries) == 19
diagnosis = read(N / 'native-aggregation-cwd-diagnosis-v1.json')
assert diagnosis['readonly_failures_reproduced'] == diagnosis['writable_passes'] == 4
assert all(sha(row['trace_file']) == row['trace_sha256'] for row in diagnosis['records'].values())
retention = read(N / 'native-aggregation-retention-v1/result-v2.json')
assert retention['original_baseline_256_timeout_preserved'] and not retention['all_workloads_completed_and_validated']
assert retention['rows']['baseline'][2]['outcome'] == 'external_resource_exhaustion'
assert [row['after_report_live_bytes'] for row in retention['rows']['candidate']] == [100996, 772804, 9358276]
for row in retention['rows']['baseline'][:2] + retention['rows']['candidate']:
    assert row['exact_area'] == '1' and row['center_inside'] and row['report_polygons'] == row['n']
    assert row['after_drop_live_bytes'] == 7756
for mode in ('baseline', 'candidate'):
    binaries.add(N / 'native-aggregation-retention-v1' / ('retention-' + mode))
commands = {}
expected_failures = {'aggregation-baseline-focused-native_aggregation-v1': 101,
    'aggregation-baseline-focused-kicad_native_aggregation-v1': 101,
    'aggregation-candidate-focused-kicad_native_aggregation-v1': 101,
    'aggregation-candidate-suite-library-v1': 101,
    'aggregation-candidate-suite-integration-v2': 101,
    'aggregation-retention-baseline-256-v1': -15}
expected_failures.update({'aggregation-cwd-' + mode + '-' + case + '-readonly-v1': 101
    for mode in ('baseline', 'candidate') for case in ('command-failure', 'missing-binary')})
for folder in sorted((N / 'logs').glob('aggregation-*')):
    row = read(folder / 'result.json')
    assert row['output_closed']
    assert row['stops'] == (['wall_seconds'] if folder.name == 'aggregation-retention-baseline-256-v1' else [])
    assert all(sha(folder / p) == h for p, h in row['output_sha256'].items())
    assert not re.search(r'(?:Compiling|Checking|Packaging|Verifying) hypervoxel\b', (folder / 'stderr').read_text())
    commands[folder.name] = row
    roots.extend([folder, N / 'scratch' / folder.name])
assert {name: row['exit_code'] for name, row in commands.items() if row['exit_code']} == expected_failures
assert not (N / 'native-aggregation-candidate-circuit-result-v1.json').exists()
assert not (N / 'native-aggregation-report-result-v3.json').exists()
fixtures = read(N / 'native-aggregation-fixtures-v1/verification-v1.json')
assert fixtures['complete']
for row in fixtures['fixtures'].values():
    assert sha(row['path']) == row['sha256']
roots.extend([W, N / 'native-aggregation-fixtures-v1', N / 'native-aggregation-retention-v1'])
review = {'decision': 'not admitted: superlinear retained report storage', 'baseline_revision': BASE,
    'owning_layer': 'HyperDRC native PCB aggregation and retained source owners', 'focused': focused,
    'original_project_gates': gates, 'production_suite_passed': 1669, 'production_suite_failed': 0,
    'production_suite_ignored': 0, 'remaining_native_checks': remaining, 'quality': quality,
    'candidate_preparation': prep, 'retention': retention, 'cwd_failure_diagnosis': diagnosis,
    'preserved_failures': expected_failures, 'commands': commands,
    'first_library_run': {'passed': 1557, 'failed': 2, 'qualified_complete_success': False},
    'corrected_library_run': {'passed': 1559, 'failed': 0},
    'cli_bind_build_failure': 'EBUSY before integration tests; separated compilation and frozen execution',
    'doctest_summary_correction': 'Two successful summary groups total three tests; no rerun or source change',
    'new_native_tests': 13, 'native_cases_repaired': 5, 'source_tests_unchanged': 39,
    'readiness_migration_proposed': {'from': 21, 'to': 22, 'fixture_fields': 960},
    'hypercircuit_checks_executed': False, 'complete_cli_report_comparison_executed': False,
    'public_distribution_complete': False, 'source_changes_applied': False,
    'original_35_file_bundle_restored': False, 'cache_index_admitted': False,
    'exact_kicad_ingress_admitted': False, 'same_contract_speedup_claimed': False,
    'internal_memory_work_cancellation_bound_claimed': False, 'hypervoxel_deferred_by_user': True,
    'latest_missing_path_observation': {'checkpoint': 'E63', 'count': 921794, 'reaudited_here': False},
    'full_plan_complete': False, 'pushed': False,
    'next': 'flatten retained report sources; add a semantic allocation-growth regression; requalify the new source'}
dump(E / 'review-v1.json', review)
for name in ('contract-v1.md', 'migration-contract-v1.md', 'retention-contract-v1.md'):
    shutil.copyfile(W / name, E / name)
selected = [p for root in roots for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()]
selected.extend(p for p in sorted(N.glob('native-aggregation-*')) if p.is_file())
selected.extend(N / name for name in ('resume-stage-verification-v1.json', 'resume-commit-verification-v1.json'))
assert len(selected) == len(set(selected))
physical = {}
members = {}
excluded = {}
for path in selected:
    assert path.is_file() and not path.is_symlink(), path
    before = path.stat()
    digest = sha(path)
    after = path.stat()
    assert (before.st_size, before.st_mtime_ns, before.st_ctime_ns) == (after.st_size, after.st_mtime_ns, after.st_ctime_ns)
    physical[str(path)] = digest
    row = {'physical_path': str(path), 'sha256': digest, 'bytes': before.st_size}
    name = str(path.relative_to(N))
    large = path in binaries or path.is_relative_to(N / 'targets') or any(path.is_relative_to(N / ('native-aggregation-' + mode + '-v1')) for mode in ('baseline', 'candidate'))
    (excluded if large else members)[name] = row
assert prior.keys().isdisjoint(physical)
archive = E / 'raw-evidence-v1.tar.gz'
assert not archive.exists()
with tarfile.open(archive, 'w:gz') as output:
    for name, row in members.items():
        output.add(row['physical_path'], arcname=name, recursive=False)
with tarfile.open(archive, 'r:gz') as saved:
    assert set(saved.getnames()) == set(members)
    for name, row in members.items():
        with saved.extractfile(name) as stream:
            assert hashlib.file_digest(stream, 'sha256').hexdigest() == row['sha256']
gzwrite(E / 'archive-members-v1.json.gz', {'members': members,
    'excluded_artifacts_physically_preserved': excluded, 'archive_sha256': sha(archive),
    'archive_bytes': archive.stat().st_size, 'all_members_content_verified': True})
prefix = str(E.relative_to(O)) + '/'
expectations = {'schema_version': 3, 'kind': 'native aggregation semantics and report retention rejection',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'added_physical_artifacts_sha256': physical, 'expected_artifact_paths': len(prior) + len(physical),
    'inherited_expected_artifact_paths': len(prior), 'last_observed_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'physical_roots': [str(root) for root in roots],
    'complete_artifact_audit_passed': False, 'historical_preservation_complete': False,
    'old_history_reaudited': False, 'required_loader': str((P / 'load_expectations_v2.py').relative_to(O))}
gzwrite(E / 'artifact-expectations-v1.json.gz', expectations)
loaded, unavailable = load(E / 'artifact-expectations-v1.json.gz', allow_unqualified=True)
assert loaded == prior | physical and unavailable == missing
ledger = O / 'docs/properties-status.json'
raw = ledger.read_bytes()
reference = git('show', '9025de62:docs/properties-status.json')
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
assert 'native_aggregation_retention' not in current
current['native_aggregation_retention'] = {'status': review['decision'], 'checkpoint': prefix + 'checkpoint-v1.json',
    'review': prefix + 'review-v1.json', 'artifact_expectations': prefix + 'artifact-expectations-v1.json.gz',
    'baseline_revision': BASE, 'production_suite_passed': 1669, 'native_cases_repaired_in_prototype': 5,
    'original_project_gates_passed_both_variants': True, 'candidate_report_live_bytes_at_256_steps': 9358276,
    'baseline_256_steps': 'external 60-second exhaustion; no completed result',
    'source_changes_applied': False, 'complete_report_comparison_executed': False,
    'hypercircuit_checks_executed': False, 'hypervoxel_deferred_by_user': True,
    'full_plan_complete': False, 'next': review['next']}
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in ('.py', '.md', '.json'):
        text = path.read_text()
        assert all(line == line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'), path
        if path.suffix == '.py':
            ast.parse(text)
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT + ['diff', '--check'], cwd=O, stdout=out, stderr=err)
assert checked.returncode == 0
files = {str(p.relative_to(O)): sha(p) for p in E.rglob('*') if p.is_file()}
record = dict(previous)
record.update({'status': review['decision'], 'checkpoint_kind': 'native aggregation retained-memory rejection',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(O)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': prefix + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_schema': 3, 'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'new_physical_artifacts_verified': len(physical),
    'last_missing_path_observation': {'checkpoint': 'E63', 'count': len(missing), 'reaudited_here': False},
    'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger),
    'implementation_sha256': {}, 'source_changes_applied': False, 'production_prefixes_unchanged': True,
    'qualification_this_checkpoint': ['native baseline and candidate focused tests', 'six original project gates',
        'candidate fmt, Clippy and docs', '1669 candidate production tests', 'converter cwd diagnosis',
        'three retained-memory inputs per variant, including one baseline exhaustion'],
    'historical_qualification_flags_inherited_from': str((P / 'checkpoint-v1.json').relative_to(O)),
    'native_candidate_admitted': False, 'readme_tests_rerun': False, 'readme_tests_passed': None,
    'full_plan_complete': False, 'hypervoxel_deferred_by_user': True})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(p) == h for p, h in physical.items())
assert all(sha(O / p) == h for p, h in live.items())
print(json.dumps({'new_physical_paths': len(physical), 'expected_paths': len(loaded),
    'archive_members': len(members), 'archive_bytes': archive.stat().st_size,
    'production_suite_passed': 1669, 'admitted': False, 'ledger_sha256': sha(ledger)}), flush=True)
