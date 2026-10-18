"""Close the scoped native aggregation admission after source integration and commit."""
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
W = N / 'native-aggregation-flat-control-v1'
E = O / 'docs/evidence/2026-10-17-native-aggregation-flat'
P = O / 'docs/evidence/2026-10-17-native-aggregation-retention'
L = O / 'docs/evidence/2026-10-17-resume-integration'
S = N / 'native-aggregation-candidate-v2'
BASE = '5a22614321cfcc2d1a4c2f4ed2920bb0fdd8e671'
GIT = ['git', '-c', 'core.splitIndex=true', '-c', 'index.version=4',
       '-c', 'maintenance.auto=false', '-c', 'gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
sys.path.insert(0, str(L))
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


assert E.is_dir() and (E / 'close_v2.py').is_file()
assert sha(E / 'close_v2.py') == sha(W / 'close_v2.py')
commit = read(N / 'native-aggregation-flat-source-commit-v1.json')
stage = read(N / 'native-aggregation-flat-source-stage-v1.json')
assert commit['parent'] == stage['parent'] == BASE
assert commit['all_committed_blobs_verified'] and commit['tracked_worktree_clean']
assert git('rev-parse', 'HEAD').decode().strip() == commit['commit']
assert git('rev-parse', 'HEAD^').decode().strip() == BASE
assert not git('diff', '--name-only') and not git('diff', '--cached', '--name-only')
assert sha(O / 'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py') == '08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous = read(P / 'checkpoint-v1.json')
assert all(sha(O / p) == h for p, h in previous['evidence_files_sha256'].items())
prior, missing = load(O / previous['artifact_expectations'], allow_unqualified=True)
assert (len(prior), len(missing)) == (1326764, 921794)
live = previous['restored_native_sha256'] | previous['inherited_implementation_sha256'] | previous['implementation_sha256']
integration = read(N / 'native-aggregation-flat-integration-result-v1.json')
assert integration['complete_for_declared_scope'] and integration['all_local_targets_fresh']
assert sum(integration['test_counts'].values()) == 53
implementation = integration['source_sha256']
assert len(implementation) == 16 and set(implementation) == set(stage['files'])
assert set(git('diff', '--name-only', BASE, 'HEAD').decode().splitlines()) == set(implementation)
for path, digest in implementation.items():
    assert sha(O / path) == digest == stage['files'][path]['sha256']
    assert hashlib.sha256(git('show', 'HEAD:' + path)).hexdigest() == digest
assert all(sha(O / p) == h for p, h in live.items() if p not in implementation)
pins = gzread(N / 'native-aggregation-flat-source-v1.json.gz')
assert len(pins) == 10266 and all(sha(S / p) == h for p, h in pins.items())
main_pins = gzread(N / 'native-aggregation-flat-integration-source-v1.json.gz')
assert len(main_pins) == 10265 and all(sha(O / p) == h for p, h in main_pins.items())
prep = read(W / 'preparation-v1.json')
assert prep['production_delta_from_e64'] == ['crates/hyperdrc/src/lib.rs']
assert prep['baseline_production_revision_unchanged']
assert read(N / 'native-aggregation-flat-continuation-v2.json')['complete']
phases = {phase: read(N / ('native-aggregation-flat-' + phase + ('-result-v2.json' if phase == 'circuit' else '-result-v1.json')))
          for phase in ('build', 'focused', 'gates', 'quality', 'suite', 'circuit', 'msrv')}
assert all(row['complete_for_declared_scope'] for row in phases.values())
assert phases['focused']['test_counts'] == {'kicad_track_failures': 39, 'native_aggregation': 13, 'native_aggregation_memory': 1}
assert phases['focused']['summaries']['archived_review']['failed'] == 3
assert sum(phases['suite']['test_counts'].values()) == 1670
assert phases['circuit']['test_counts'] == {'default': 105, 'all': 348}
assert set(phases['msrv']['commands']) == {'all', 'minimal'}
negative = read(N / 'native-aggregation-flat-negative-v1/result-v1.json')
assert negative['regression_reproduced'] and negative['frozen_prototype_unchanged']
assert negative['source_sha256'] == implementation['crates/hyperdrc/tests/native_aggregation_memory.rs']
retention = read(N / 'native-aggregation-flat-retention-v1/result-v1.json')
assert retention['all_workloads_completed_and_validated']
assert [r['n'] for r in retention['rows']] == [16, 64, 256]
assert [r['after_report_live_bytes'] for r in retention['rows']] == [21712, 53584, 181072]
assert all(r['after_drop_live_bytes'] == 7756 for r in retention['rows'])
old_retention = read(N / 'native-aggregation-retention-v1/result-v2.json')
assert old_retention['original_baseline_256_timeout_preserved']
nesting = read(N / 'native-aggregation-flat-nesting-v1/result-v1.json')
assert nesting['cold_and_warm_nested_order_and_multiplicity_preserved']
assert nesting['independent_exact_area_and_membership_checked'] and nesting['mutated_report_view_isolated']
reports = read(N / 'native-aggregation-flat-report-result-v1.json')
assert reports['complete_for_declared_scope'] and reports['only_declared_version_migration']
assert len(reports['commands']) == 12
report_costs = {}
for case, row in reports['cases'].items():
    assert row['baseline_repeat_equal'] and row['candidate_repeat_equal']
    assert row['only_declared_version_bytes_changed'] and row['only_declared_parsed_fields_changed']
    report_costs[case] = []
    for observation in row['observations']:
        path = Path(observation['process_usage_path'])
        assert sha(path) == observation['process_usage_sha256']
        usage = path.read_text()
        fields = {k: re.search(re.escape(k) + r':\s*(.+)', usage).group(1)
                  for k in ('User time (seconds)', 'System time (seconds)', 'Maximum resident set size (kbytes)')}
        report_costs[case].append({'mode': observation['mode'], 'findings': observation['violation_count'],
                                  'report_bytes': observation['bytes'], 'usage': fields})
migrations = {}
for path in implementation:
    if path.startswith('crates/hypercircuit/tests/fixtures/easyduino/fast-drc/'):
        before = git('show', BASE + ':' + path)
        after = (O / path).read_bytes()
        parsed = json.loads(before)
        checks = parsed['coverage']['checks']
        assert all(r['check_version'] == 21 for r in checks)
        for row in checks:
            row['check_version'] = 22
        assert before.replace(b'"check_version": 21', b'"check_version": 22') == after
        assert parsed == json.loads(after)
        migrations[path] = len(checks)
assert len(migrations) == 6 and sum(migrations.values()) == 960
commands = {}
roots = [W, S, N / 'targets/native-aggregation-candidate-v2',
         N / 'targets/native-aggregation-flat-msrv-v1', N / 'targets/native-aggregation-flat-integration-v1',
         N / 'native-aggregation-flat-artifacts-v1', N / 'native-aggregation-flat-negative-v1',
         N / 'native-aggregation-flat-retention-v1', N / 'native-aggregation-flat-nesting-v1',
         N / 'native-aggregation-flat-integration-artifacts-v1', N / 'native-aggregation-flat-package-diagnosis-v1']
for folder in sorted((N / 'logs').glob('aggregation-flat-*')):
    row = read(folder / 'result.json')
    assert row['output_closed'] and not row['stops']
    assert all(sha(folder / p) == h for p, h in row['output_sha256'].items())
    assert not re.search(r'(?:Compiling|Checking|Packaging|Verifying) hypervoxel\b', (folder / 'stderr').read_text())
    commands[folder.name] = row
    roots.extend([folder, N / 'scratch' / folder.name])
assert {name: row['exit_code'] for name, row in commands.items() if row['exit_code']} == {
    'aggregation-flat-negative-run-v1': 101,
    'aggregation-flat-focused-kicad_native_aggregation-v1': 101,
    'aggregation-flat-circuit-all-v1': 101,
}
binaries = set()
for name in ('native-aggregation-flat-artifacts-v1', 'native-aggregation-flat-integration-artifacts-v1'):
    for row in read(N / name / 'executables-v1.json').values():
        assert sha(row['executed_copy']) == row['sha256']
        binaries.add(Path(row['executed_copy']))
    assert all(not r['fresh'] for r in read(N / name / 'fresh-local-build-v1.json'))
binaries.update([N / 'native-aggregation-flat-negative-v1/native-aggregation-memory',
                 N / 'native-aggregation-flat-retention-v1/retention-flat',
                 N / 'native-aggregation-flat-nesting-v1/nested-baseline',
                 N / 'native-aggregation-flat-nesting-v1/nested-flat'])
binaries.add(N / 'native-aggregation-flat-package-diagnosis-v1/failed-workflow-test-image')
assert len(binaries) == 21
package_migration = read(N / 'native-aggregation-flat-package-diagnosis-v1/migration-audit-v1.json')
assert package_migration['exact_zip_reconstructed_from_declared_changes']
assert package_migration['independent_digest_checks_passed']
assert implementation['crates/hypercircuit/tests/fixtures/manufacturing-release/release-board-v1.zip'] == package_migration['new_zip_sha256']
cli_sizes = {mode: read(N / root / 'executables-v1.json')['hyperdrc-cli']['bytes']
             for mode, root in [('baseline', 'native-aggregation-baseline-artifacts-v1'),
                                ('rejected_prototype', 'native-aggregation-candidate-artifacts-v1'),
                                ('flat_candidate', 'native-aggregation-flat-artifacts-v1'),
                                ('main_integration', 'native-aggregation-flat-integration-artifacts-v1')]}
review = {'decision': 'kept: scoped native aggregation and flat authored report ownership',
          'source_commit': commit['commit'], 'candidate_source_base': BASE, 'owning_layer': 'HyperDRC PcbRegion ownership and shared native aggregation',
          'implementation_sha256': implementation, 'source_preparation': prep, 'phases': phases,
          'main_integration': integration, 'commands': commands, 'production_native_tests_passed': 1670,
          'source_tests_unchanged': 39, 'native_semantic_tests': 13, 'new_growth_regression_tests': 1,
          'native_cases_repaired_against_current_baseline': 5, 'negative_control': negative,
          'retention': retention, 'previous_retention_result_sha256': sha(N / 'native-aggregation-retention-v1/result-v2.json'),
          'previous_baseline_256_timeout_preserved': True, 'nested_sources': nesting,
          'reports': reports, 'report_process_costs': report_costs, 'cli_binary_bytes': cli_sizes,
          'version_migration_fields': migrations, 'manufacturing_zip_migration': package_migration,
          'initial_all_feature_tests': {'passed': 347, 'failed': 1, 'cause': 'versioned manufacturing ZIP fixture'},
          'audit_format_guard_correction': read(W / 'package-audit-format-correction-v1.json'),
          'unexecuted_superseded_plans': ['msrv_v1.py', 'integrate_v1.py', 'stage_source_v1.py', 'close_v1.py'], 'fixture_snapshots_recomputed_by_real_consumer_tests': True,
          'tradeoffs': ['Complete ordinary CLI report samples are slightly slower; raw unfavorable measurements retained.',
                       'Retained requested Rust payload at 64 steps is 53584 bytes versus the old baseline 26928 bytes.',
                       'The rejected recursive-owner prototype retained 9358276 bytes at 256 steps; the flat owner retains 181072.',
                       'The baseline 256-step run exhausted its external 60-second limit and has no completed result.'],
          'measurement_limits': ['Requested Rust allocation payload excludes allocator overhead and native allocation.',
                                 'Report timings are scoped samples, not a statistically qualified performance campaign.',
                                 'No internal total-work, heap-byte or cancellation bound is introduced.'],
          'archived_review_tests': {'passed': 9, 'failed': 3, 'reason': 'unchanged unadmitted exact KiCad ingress cases'},
          'cache_proposal_admitted': False, 'exact_kicad_ingress_admitted': False,
          'original_35_file_bundle_restored': False, 'hypervoxel_deferred_by_user': True,
          'public_distribution_complete': False, 'release_qualification_complete': False,
          'same_contract_general_speedup_claimed': False, 'full_plan_complete': False, 'pushed': False,
          'latest_historical_missing_observation': {'checkpoint': 'E63', 'paths': 921794, 'reaudited_here': False}}
dump(E / 'review-v1.json', review)
for name in ('contract-v1.md', 'migration-contract-v1.md', 'msrv-contract-v1.md', 'package-migration-contract-v1.md'):
    shutil.copyfile(W / name, E / name)
(E / 'README.md').write_text(f'''# Native PCB aggregation with flat report ownership

Retained in source commit `{commit['commit']}`. HyperDRC now aggregates checked
native regions without requiring finite report coordinates, preserves source
diagnostic history, and keeps authored report sources as a flat list. Empty
results, holes, overlaps, quadratic regions and coordinates outside finite
report range remain usable by supported native operations. Report projection
stays separately fallible and does not publish an incomplete prefix.

The new allocation-growth regression fails on the unchanged E64 prototype and
passes on the repair. Complete 16/64/256-step square compositions retain
21,712/53,584/181,072 requested Rust bytes after report materialization, compared
with 100,996/772,804/9,358,276 in the rejected prototype. Exact area, membership
and authored polygon counts are checked. Dropping the aggregate returns every
completed probe to the same 7,756-byte live level. These are allocation-payload
measurements, not RSS or a general internal memory bound. The old baseline
retains less at 64 steps (26,928 bytes) but exhausts the external 60-second limit
at 256 steps; that failure remains preserved.

All 1,670 native production tests pass, as do the original full-board resource
gates, formatting, warning-denied Clippy and docs. Hypercircuit passes 105
default and 348 all-feature tests, including recomputation of all six Easyduino
report snapshots, plus its all-target/all-feature Clippy check. Both affected
packages pass all-target Rust 1.95 checks with all features and without default
features. A fresh main-checkout build passes the 39 source-failure tests, 13
native semantic tests and the memory regression after exact source integration.
The separate archived review corpus remains 9 passed/3 failed: those failures
require the unadmitted exact KiCad ingress and are not replaced or weakened.

Twelve complete CLI reports are deterministic within each version. Candidate
bytes and complete parsed reports differ only by the explicit readiness version
21-to-22 migration. The six fixture files change only their 960 check-version
fields. The first all-feature run exposed one additional manufacturing ZIP
fixture mismatch (347 passed/1 failed). Its 22 members were decoded and audited:
20 are byte-identical; the embedded report changes only 160 version fields and
the manifest changes only three independently verified derived digests. Exact
ZIP metadata and CRC updates were independently reconstructed. The complete
348-test run then passes using the same binaries and assertions, including
bundle reimport, size limits, malicious paths and signing. The source snapshot
stays unchanged; the new fixture was qualified as a hashed read-only overlay
before main integration. The initial failure and corrected compact-JSON audit
guard are preserved. Raw ordinary report timings include slightly slower candidate samples;
no general speedup is claimed. Cold/warm nested-source checks independently
verify exact area, membership, authored order, duplicate reports and view
mutation isolation. Every executed command and its output is retained.

This admits the scoped source repair, not the original 35-edit bundle, exact
KiCad ingress, or the separate cache proposal. Hypervoxel remains deferred and
public distribution through its unavailable dependency remains blocked. The
complete properties plan and release qualification remain open. Historical
artifact preservation remains unqualified: E63 last observed 921,794 missing
paths; this checkpoint verifies newly closed artifacts without re-auditing
that history. Only current_work changes in the ledger. No push occurred.
''')
selected = [p for root in roots for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()]
selected.extend(p for p in sorted(N.glob('native-aggregation-flat-*')) if p.is_file())
selected.extend(N / name for name in ('aggregation-retention-stage-verification-v1.json', 'aggregation-retention-commit-verification-v1.json'))
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
    large = path in binaries or path.is_relative_to(N / 'targets') or path.is_relative_to(S)
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
gzwrite(E / 'archive-members-v1.json.gz', {'members': members, 'excluded_artifacts_physically_preserved': excluded,
    'archive_sha256': sha(archive), 'archive_bytes': archive.stat().st_size, 'all_members_content_verified': True})
prefix = str(E.relative_to(O)) + '/'
expectations = {'schema_version': 3, 'kind': 'scoped native aggregation admission with flat report ownership',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'added_physical_artifacts_sha256': physical, 'expected_artifact_paths': len(prior) + len(physical),
    'inherited_expected_artifact_paths': len(prior), 'last_observed_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'physical_roots': [str(root) for root in roots],
    'complete_artifact_audit_passed': False, 'historical_preservation_complete': False,
    'old_history_reaudited': False, 'required_loader': str((L / 'load_expectations_v2.py').relative_to(O))}
gzwrite(E / 'artifact-expectations-v1.json.gz', expectations)
loaded, unavailable = load(E / 'artifact-expectations-v1.json.gz', allow_unqualified=True)
assert loaded == prior | physical and unavailable == missing
ledger = O / 'docs/properties-status.json'
raw = ledger.read_bytes()
reference = git('show', '9025de62:docs/properties-status.json')
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
assert 'native_aggregation_flat' not in current
current['native_aggregation_flat'] = {'status': review['decision'], 'source_commit': commit['commit'],
    'checkpoint': prefix + 'checkpoint-v1.json', 'review': prefix + 'review-v1.json',
    'artifact_expectations': prefix + 'artifact-expectations-v1.json.gz',
    'native_tests_passed': 1670, 'hypercircuit_tests_passed': {'default': 105, 'all_features': 348},
    'main_integration_tests_passed': 53, 'compiler_floor': '1.95.0 affected packages all targets, all/minimal features',
    'report_runs': 12, 'only_declared_readiness_version_migration': True,
    'retained_report_requested_bytes_at_256_steps': 181072, 'negative_growth_control_failed_as_expected': True,
    'source_changes_applied': True, 'cache_proposal_admitted': False, 'exact_kicad_ingress_admitted': False,
    'archived_ingress_failures_unchanged': 3, 'hypervoxel_deferred_by_user': True,
    'public_distribution_complete': False, 'general_speedup_claimed': False, 'full_plan_complete': False}
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
record.update({'status': review['decision'], 'checkpoint_kind': 'scoped native aggregation source admission',
    'source_commit': commit['commit'], 'candidate_source_base': BASE,
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(O)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': prefix + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_schema': 3, 'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'new_physical_artifacts_verified': len(physical),
    'last_missing_path_observation': {'checkpoint': 'E63', 'count': len(missing), 'reaudited_here': False},
    'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger),
    'inherited_implementation_sha256': live, 'implementation_sha256': implementation,
    'source_changes_applied': True, 'production_prefixes_unchanged': False,
    'qualification_this_checkpoint': ['allocation regression negative control', '1670 native tests and original resource gates',
        'native fmt, warning-denied Clippy/docs', '12 complete deterministic CLI reports',
        '105 default and 348 all-feature Hypercircuit tests and Clippy', 'affected Rust 1.95 all/minimal all-target checks',
        'fresh main-checkout build and 53 focused tests', 'complete allocation and nested-source probes'],
    'historical_qualification_flags_inherited_from': str((P / 'checkpoint-v1.json').relative_to(O)),
    'native_candidate_admitted': True, 'cache_index_admitted': False, 'exact_kicad_ingress_admitted': False,
    'full_plan_complete': False, 'public_distribution_complete': False, 'hypervoxel_deferred_by_user': True})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(p) == h for p, h in physical.items())
assert all(sha(O / p) == h for p, h in (live | implementation).items())
print(json.dumps({'source_commit': commit['commit'], 'new_physical_paths': len(physical),
    'expected_paths': len(loaded), 'archive_members': len(members), 'archive_bytes': archive.stat().st_size,
    'native_tests_passed': 1670, 'admitted': True, 'ledger_sha256': sha(ledger)}), flush=True)
