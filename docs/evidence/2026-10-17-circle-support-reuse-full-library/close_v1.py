"""Close fresh full-library evidence without admitting the cache proposal."""
import ast
import gzip
import hashlib
import json
import re
import shutil
import subprocess
import sys
import tarfile
from pathlib import Path

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
ROOT = W.parents[2]
R = Path('/run/user/1000/csgrs-circle-support-reuse-corpus-v1')
M = ROOT / 'target/properties/circle-support-reuse-corpus-source-v1'
P = ROOT / 'docs/evidence/2026-10-17-package-artifact-whitespace'
E = ROOT / 'docs/evidence/2026-10-17-circle-support-reuse-full-library'
PREFIX = str(E.relative_to(ROOT)) + '/'
sys.path.insert(0, str(E.parent / '2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start + len(raw[start:].decode()[:count].encode()), value


assert not E.exists()
assert shutil.disk_usage(ROOT).free >= 512 * 1024**2
previous = read(P / 'checkpoint-v1.json')
assert all(sha(ROOT / path) == digest for path, digest in previous['evidence_files_sha256'].items())
prior, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1232716 and len(missing) == 27093
protocol = read(R / 'protocol.json')
result = read(R / 'result.json')
assert result['complete'] and result['output_closed'] and result['all_read_only_inputs_unchanged']
base = protocol['base_revision']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == base
subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
for mapping in [live, previous['extra_unchanged_inputs_sha256'], previous['live_source_dependency_pins_sha256'],
                protocol['input_sha256'], protocol['read_only_source_sha256'], protocol['read_only_dependencies_sha256'],
                protocol['live_dependency_source_sha256']]:
    assert all(sha(ROOT / path) == digest for path, digest in mapping.items())
qualified = result['both_library_suites_passed']
rows = []
for mode in ['no-feature', 'all-feature']:
    outcome = result['modes'][mode]
    if outcome.get('not_run'):
        rows.append({'mode': mode, 'status': 'not run', 'reason': outcome['reason']})
        continue
    assert outcome == read(R / mode / 'result.json')
    command = outcome['command']
    for suffix in ['stdout', 'stderr', 'resources']:
        if suffix + '_sha256' in command:
            assert sha(R / mode / ('tests.' + suffix)) == command[suffix + '_sha256']
    rows.append({'mode': mode, 'status': 'passed' if outcome['suite_passed'] else 'incomplete or failed',
        'exit_code': command['exit_code'], 'external_stop_reason': command['external_stop_reason'],
        'elapsed_seconds': command.get('elapsed_seconds'), 'summaries': outcome['test_summaries'],
        'source_mirror_unchanged': outcome['source_mirror_unchanged'],
        'generated_mirror_files': outcome['generated_mirror_files'],
        'property_persistence_warnings': outcome['property_persistence_warnings']})
if qualified:
    assert result['source_mirror_unchanged']
    for row in rows:
        assert row['status'] == 'passed' and row['exit_code'] == 0 and not row['external_stop_reason']
        assert len(row['summaries']) == 1 and row['summaries'][0][0] == 'ok'
        assert row['summaries'][0][2] == row['summaries'][0][5] == '0'
        assert not row['property_persistence_warnings'] and not row['generated_mirror_files']
    assert all(sha(M / path) == digest for path, digest in protocol['source_mirror_sha256'].items())
E.mkdir()
for name in ['contract-v1.md', 'qualify_v1.py', 'close_v1.py']:
    shutil.copy2(W / name, E / name)
for name in ['protocol.json', 'result.json']:
    shutil.copy2(R / name, E / name)
members = {}
archive = E / 'raw-evidence-v1.tar.gz'
with tarfile.open(archive, 'w:gz') as output:
    for prefix, root in [('work', W), ('run', R)]:
        for path in sorted(root.rglob('*')):
            if path.is_file():
                name = prefix + '/' + str(path.relative_to(root))
                members[name] = {'sha256': sha(path), 'bytes': path.stat().st_size, 'physical_path': str(path)}
                output.add(path, arcname=name, recursive=False)
with tarfile.open(archive, 'r:gz') as source:
    assert set(source.getnames()) == set(members)
    for name, row in members.items():
        with source.extractfile(name) as stream:
            assert hashlib.file_digest(stream, 'sha256').hexdigest() == row['sha256']
dump(E / 'archive-members-v1.json', {'members': members, 'archive_sha256': sha(archive),
    'archive_bytes': archive.stat().st_size, 'raw_bytes': sum(row['bytes'] for row in members.values()),
    'all_members_content_verified': True, 'source_mirror_not_duplicated_in_git': str(M),
    'source_mirror_physically_retained_and_hashed_separately': True})
status = 'both preserved Hypercurve library binaries qualified; cache remains unadmitted' if qualified else 'fresh library attempt retained; cache remains unadmitted'
summary = {'status': status, 'base_revision': base, 'scope': 'Full optimized Hypercurve test executables in no-feature and all-feature configurations.',
    'modes': rows, 'both_library_suites_passed': qualified, 'frozen_dependencies_verified': len(protocol['read_only_dependencies_sha256']),
    'fresh_source_files': len(protocol['source_mirror_sha256']), 'fresh_source_bytes': 26709356,
    'source_mirror_shared_sequentially': True, 'original_stopped_attempts_preserved': True,
    'binaries_reused_read_only': True, 'binary_or_dependency_recompiled': False,
    'all_read_only_inputs_unchanged': True, 'manifest_change_is_package_evidence_exclusion_only': True,
    'semantic_tests_policies_fixtures_or_ignored_cases_weakened': False,
    'performance_claimed': False, 'production_sources_changed': False, 'cache_index_admitted': False,
    'full_cargo_target_feature_matrix_qualified': False, 'downstream_or_original_native_gates_qualified': False,
    'bindings_qualified': False, 'external_distribution_qualified': False, 'release_qualified': False,
    'full_plan_complete': False}
dump(E / 'qualification-v1.json', summary)
table = ['| Configuration | Outcome | Terminal summary |', '| --- | --- | --- |']
for row in rows:
    summaries = row.get('summaries', [])
    detail = '; '.join(f'{item[1]} passed, {item[2]} failed, {item[3]} ignored, {item[5]} filtered' for item in summaries)
    table.append(f"| {row['mode']} | {row['status']} | {detail or 'No successful terminal summary'} |")
(E / 'README.md').write_text('''# Fresh qualification of the preserved cache candidate

''' + status + '.\n\n' + '\n'.join(table) + '''

The exact original executables, successful build commands, compiler/features,
599 frozen dependency artifacts and 461 source files were verified before use.
A fresh independent 26,709,356-byte source mirror served both sequential runs;
each used a fresh scratch/output directory. No hard links, symlinks, source
stubs, reduced fixture, altered policy, additional filter or disabled property
persistence was used. The current root manifest's sole TOML difference from the
recorded build is the separately admitted package evidence exclusion.

The earlier resource-stopped suites remain incomplete in their original closed
roots. These are new functional executions, not resumed runs or performance
measurements. The original guards remain: 1,800 seconds per command, 8 GiB child
address space, 2 GiB host memory, 512 MiB repository space, and 256 MiB filesystem
and applicable quota reserves. An additional 8 MiB fresh-output monitor bounds
these logs externally. The source mirror has a separate 32 MiB planning allowance.
No internal total-work or heap-byte bound is established.

This evidence covers the two optimized library test executables. It does not
qualify Cargo's complete target/feature matrix, integration/doc/example/bench
consumers, original native/report gates, bindings or a clean external package.
The candidate remains unadmitted and production source is unchanged. The full
properties plan and the larger fresh-build storage requirement remain open.

See the [contract](contract-v1.md), [input/build proof](protocol.json),
[qualification](qualification-v1.json), [complete result](result.json),
[raw archive](raw-evidence-v1.tar.gz) and [verified members](archive-members-v1.json).
The fresh source mirror remains physically retained; its bytes are not duplicated
in Git. Every new physical file is hashed independently at closure.

Only current_work changes in the ledger. The checkpoint preserves 27,093 missing
historical artifact paths and makes no whole-history preservation claim.
''')
ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
assert sha(ledger) == previous['ledger_after_sha256']
reference = subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
old_current = json.loads(json.dumps(current))
key = 'circle_support_reuse_full_library'
current[key] = {'status': status, 'base_revision': base, 'contract': PREFIX + 'contract-v1.md',
    'qualification': PREFIX + 'qualification-v1.json', 'checkpoint': PREFIX + 'checkpoint-v1.json',
    'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz', 'modes': rows,
    'both_library_suites_passed': qualified, 'fresh_build_performed': False,
    'full_cargo_matrix_qualified': False, 'downstream_native_binding_release_qualified': False,
    'cache_index_admitted': False, 'full_plan_complete': False}
assert [k for k in old_current.keys() | current.keys() if old_current.get(k) != current.get(k)] == [key]
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    done = subprocess.run(['git', 'diff', '--check', '--', 'docs/properties-status.json'], cwd=ROOT, stdout=out, stderr=err)
assert done.returncode == 0
for path in E.iterdir():
    if path.suffix in {'.py', '.md', '.json'}:
        text = path.read_text()
        assert all(line == line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'), path
        if path.suffix == '.py': ast.parse(text)
physical = {}
for root in [W, R, M]:
    for path in sorted(root.rglob('*')):
        if path.is_file():
            before = path.stat(); digest = sha(path); after = path.stat()
            assert (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns) == (
                after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns)
            physical[str(path)] = digest
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version': 3, 'kind': 'fresh full-library execution of preserved deferred-index binaries',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'added_physical_artifacts_sha256': physical, 'new_physical_artifacts_verified': len(physical),
    'physical_roots': [str(W), str(R), str(M)], 'directory_inventory': [str(W), str(R), str(M)],
    'local_tool_symlink_targets': {}, 'expected_artifact_paths': len(prior) + len(physical),
    'inherited_artifacts_reverified': False, 'complete_artifact_audit_passed': False, 'historical_preservation_complete': False,
    'scope': 'New physical paths hashed separately; specific reused inputs reverified, without a whole-history audit.'}
with gzip.open(E / 'artifact-expectations-v1.json.gz', 'wt') as stream: json.dump(expectations, stream, sort_keys=True)
files = {str(path.relative_to(ROOT)): sha(path) for path in E.rglob('*') if path.is_file()}
record = dict(previous)
record.update({'status': status, 'checkpoint_kind': 'preserved binary library qualification; production cache unadmitted',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(ROOT)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'implementation_sha256': {}, 'inherited_implementation_sha256': inherited,
    'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger), 'only_current_work_changed': True,
    'source_changes_applied': False, 'production_rust_sources_unchanged': True, 'runtime_tests_rerun': True,
    'both_library_suites_passed': qualified, 'full_library_qualification_complete': qualified,
    'library_qualification_scope': 'Preserved optimized Hypercurve unit-test binaries, no-feature and all-feature only.',
    'full_cargo_matrix_qualified': False, 'downstream_native_qualification_complete': False,
    'release_qualification_complete': False, 'cache_index_admitted': False, 'cache_retention_decision': 'unadmitted',
    'format_rerun': False, 'whitespace_exit_code': 0})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(ROOT / path) == digest for path, digest in live.items())
assert sum(path.stat().st_size for root in [W, E] for path in root.rglob('*') if path.is_file()) < 2 * 1024**2
assert shutil.disk_usage(ROOT).free >= 512 * 1024**2
print(json.dumps({'both_library_suites_passed': qualified, 'new_physical_paths': len(physical),
    'expected_physical_paths': len(prior) + len(physical), 'archive_members': len(members),
    'archive_bytes': archive.stat().st_size, 'evidence_files': len(files),
    'ledger_sha256': sha(ledger), 'cache_index_admitted': False}))
