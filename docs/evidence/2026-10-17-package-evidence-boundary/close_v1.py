"""Close the admitted package-membership change without broadening its claims."""
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
R = Path('/run/user/1000/csgrs-package-evidence-boundary-v1')
E = ROOT / 'docs/evidence/2026-10-17-package-evidence-boundary'
P = ROOT / 'docs/evidence/2026-10-17-release-consumer-audit'
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


def reserve():
    assert shutil.disk_usage(ROOT).free >= 512 * 1024**2
    assert shutil.disk_usage(R).free >= 256 * 1024**2


assert not E.exists()
reserve()
previous = read(P / 'checkpoint-v1.json')
assert all(sha(ROOT / path) == digest for path, digest in previous['evidence_files_sha256'].items())
prior, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1232655 and len(missing) == 27093
old_run = Path('/run/user/1000/csgrs-release-consumer-audit-v1')
for name in ['metadata/result.json', 'metadata/stdout.gz']:
    assert sha(old_run / name) == prior[str(old_run / name)]
pins = read(R / 'source-pins.json')
base = pins['base_revision']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == base
assert subprocess.check_output(['git', 'diff', '--name-only'], cwd=ROOT, text=True).splitlines() == ['Cargo.toml']
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
for path, digest in live.items():
    assert sha(W / 'Cargo.toml.before' if path == 'Cargo.toml' else ROOT / path) == digest, path
for mapping in [previous['extra_unchanged_inputs_sha256'], previous['live_source_dependency_pins_sha256']]:
    assert all(sha(ROOT / path) == digest for path, digest in mapping.items())
assert all(sha(ROOT / path) == digest for path, digest in pins['inputs_sha256'].items() if path != 'Cargo.toml')
decision = read(R / 'proposal-result.json')
assert decision['retention_decision'] == 'kept' and not decision['failures']
assert decision['exact_evidence_only_membership_change'] and not decision['package_built']
assert (decision['before_files'], decision['after_files'], decision['removed_evidence_files']) == (448428, 7769, 440659)
assert all(command['exit_code'] == 0 and not command['resource_stops'] for command in decision['commands'])
assert read(R / 'metadata-comparison.json')['equal_except_declared_output_directory']
assert sha(ROOT / 'Cargo.toml') == decision['candidate_manifest_sha256']
source_hashes = json.loads(gzip.open(W / 'retained-source-before-sha.json.gz', 'rt').read())
assert len(source_hashes) == 7766 and all(sha(ROOT / path) == digest for path, digest in source_hashes.items())
ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
assert sha(ledger) == previous['ledger_after_sha256'] == source_hashes['docs/properties-status.json']
E.mkdir()
for name in ['contract-v1.md', 'closure-contract-v1.md', 'inventory_v1.py', 'runner_v1.py',
             'observe_process_v1.py', 'run_observation_v1.py', 'proposal_v1.py', 'metadata_compare_v1.py',
             'close_v1.py', 'package-exclusion.patch']:
    shutil.copy2(W / name, E / name)
for name in ['source-pins.json', 'tracked-inventory.json', 'baseline-result.json', 'proposal-result.json', 'metadata-comparison.json']:
    shutil.copy2(R / name, E / name)
shutil.copy2(R / 'package-before/inventory.json', E / 'package-before-inventory.json')
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
    'raw_bytes': sum(row['bytes'] for row in members.values()), 'archive_bytes': archive.stat().st_size,
    'all_members_content_verified': True})
(E / 'README.md').write_text('''# Root package evidence boundary

Kept the root manifest exclusion `/docs/evidence`. This intentionally changes
the source distribution: historical acceptance archives remain in the repository
and are omitted from the crate package. Runtime geometry and its evidence APIs
are unchanged. No historical archive is deleted by this change.

The earlier 180-second package-list stop remains preserved in the previous
audit. A fresh inventory with a declared 900-second allowance completed in
204.150 seconds: 448,428 paths, including 440,659 historical evidence paths
with 9,448,625,594 bytes of existing source files. The candidate inventory
completed in 112.929 seconds with 7,769 paths. Exactly the named evidence paths
disappeared; no other path disappeared or appeared. These are diagnostic command
times with different package-content contracts, not a performance comparison.
Source-byte counts are not compressed crate archive size.

During candidate verification, all 7,766 retained physical files other than the
manifest matched their original hashes. All five literal compile-time asset
references remained present. Closure then adds the decision to the admission
ledger: every other retained physical file is rehashed, and only the ledger's
raw current_work value may change. See the [closure contract](closure-contract-v1.md)
and [final preservation check](final-source-preservation.json).

Cargo metadata for all 19 workspace members matches the prior declarations
except the two explicitly isolated output-directory fields. Offline metadata,
repository-wide formatting and authored whitespace checks passed. No Rust
implementation changed or runtime test was rerun. No crate archive was assembled
or built. Registry dependency availability, actual package builds, the complete
external modeling pipeline, feature/MSRV checks and real binding consumers
remain release gates. The cache proposal remains unadmitted.

See the [contract](contract-v1.md), [patch](package-exclusion.patch),
[baseline](baseline-result.json), [decision](proposal-result.json),
[metadata comparison](metadata-comparison.json), [raw archive](raw-evidence-v1.tar.gz)
and [verified archive inventory](archive-members-v1.json). The raw Git and Cargo
lists, process observations and command outputs are retained. The new physical
output roots are closed after this checkpoint.

Only current_work changes in the execution ledger. The checkpoint preserves
27,093 inherited missing physical paths; it makes no whole-history preservation
claim. The full properties plan remains active.
''')
reference = subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
old_current = json.loads(json.dumps(current))
key = 'package_evidence_boundary'
implementation = {'Cargo.toml': sha(ROOT / 'Cargo.toml')}
current[key] = {'status': 'kept: historical admission archives excluded from the root crate package',
    'base_revision': base, 'contract': PREFIX + 'contract-v1.md', 'decision': PREFIX + 'proposal-result.json',
    'checkpoint': PREFIX + 'checkpoint-v1.json', 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'implementation_sha256': implementation, 'before_package_paths': 448428, 'after_package_paths': 7769,
    'excluded_evidence_paths': 440659, 'non_evidence_package_paths_preserved': True,
    'package_built': False, 'external_pipeline_complete': False, 'release_ready': False,
    'cache_index_admitted': False, 'full_plan_complete': False}
assert [key_ for key_ in old_current.keys() | current.keys() if old_current.get(key_) != current.get(key_)] == [key]
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
assert all(sha(ROOT / path) == digest for path, digest in source_hashes.items() if path != 'docs/properties-status.json')
assert sha(ROOT / 'Cargo.toml') == decision['candidate_manifest_sha256']
dump(E / 'final-source-preservation.json', {'unchanged_retained_physical_files': len(source_hashes) - 1,
    'intentional_retained_file_changes': ['Cargo.toml', 'docs/properties-status.json'],
    'manifest_sha256': sha(ROOT / 'Cargo.toml'), 'ledger_before_sha256': hashlib.sha256(raw).hexdigest(),
    'ledger_after_sha256': sha(ledger), 'only_current_work_changed': True,
    'runtime_sources_tests_examples_benchmarks_and_assets_unchanged': True,
    'source_hash_inventory_archive_member': 'work/retained-source-before-sha.json.gz'})
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    done = subprocess.run(['git', 'diff', '--check', '--', 'Cargo.toml', 'docs/properties-status.json'],
                          cwd=ROOT, stdout=out, stderr=err)
assert done.returncode == 0
for path in E.glob('*.py'):
    ast.parse(path.read_text())
for path in E.iterdir():
    if path.suffix in {'.py', '.json', '.md'}:
        assert all(line == line.rstrip() for line in path.read_text().splitlines()), path
physical = {}
for root in [W, R]:
    for path in sorted(root.rglob('*')):
        if path.is_file():
            before = path.stat()
            digest = sha(path)
            after = path.stat()
            assert (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns) == (
                after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns)
            physical[str(path)] = digest
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version': 3, 'kind': 'root package evidence-directory exclusion',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'added_physical_artifacts_sha256': physical, 'new_physical_artifacts_verified': len(physical),
    'physical_roots': [str(W), str(R)], 'directory_inventory': [str(W), str(R)], 'local_tool_symlink_targets': {},
    'expected_artifact_paths': len(prior) + len(physical), 'inherited_artifacts_reverified': False,
    'complete_artifact_audit_passed': False, 'historical_preservation_complete': False,
    'scope': 'Every new final physical path hashed separately; inherited expectation chain retained without a whole-history re-audit.'}
with gzip.open(E / 'artifact-expectations-v1.json.gz', 'wt') as stream:
    json.dump(expectations, stream, sort_keys=True)
files = {str(path.relative_to(ROOT)): sha(path) for path in E.rglob('*') if path.is_file()}
record = dict(previous)
record.update({'status': current[key]['status'], 'checkpoint_kind': 'kept source-distribution membership change; runtime unchanged',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(ROOT)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'implementation_sha256': implementation,
    'inherited_implementation_sha256': inherited, 'ledger_before_sha256': hashlib.sha256(raw).hexdigest(),
    'ledger_after_sha256': sha(ledger), 'only_current_work_changed': True, 'source_changes_applied': True,
    'production_rust_sources_unchanged': True, 'package_retention_decision': 'kept',
    'runtime_tests_rerun': False, 'readme_tests_rerun': False, 'readme_tests_passed': None,
    'root_package_inventory_complete': True, 'package_archive_build_complete': False,
    'full_library_qualification_complete': False, 'release_qualification_complete': False,
    'format_exit_code': 0, 'whitespace_exit_code': 0})
dump(E / 'checkpoint-v1.json', record)
assert sum(path.stat().st_size for root in [W, E] for path in root.rglob('*') if path.is_file()) < 16 * 1024**2
reserve()
print(json.dumps({'package_change_kept': True, 'new_physical_paths': len(physical),
    'expected_physical_paths': len(prior) + len(physical), 'archive_members': len(members),
    'archive_bytes': archive.stat().st_size, 'evidence_files': len(files),
    'only_current_work_changed': True, 'ledger_sha256': sha(ledger), 'release_qualified': False}))
