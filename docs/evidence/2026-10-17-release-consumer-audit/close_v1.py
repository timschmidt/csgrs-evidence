"""Close the release audit, preserve raw failures, and update only current_work."""
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
R = Path('/run/user/1000/csgrs-release-consumer-audit-v1')
E = ROOT / 'docs/evidence/2026-10-17-release-consumer-audit'
P = ROOT / 'docs/evidence/2026-10-17-readme-text-status'
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
pins = read(R / 'source-pins.json')
base = pins['base_revision']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == base
assert all(sha(ROOT / p) == value for p, value in previous['evidence_files_sha256'].items())
prior, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1232536 and len(missing) == 27093
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
validation = read(R / 'readme-validation.json')
changed = validation['implementation_sha256']
assert set(changed) == {'readme.md', 'tests/readme.rs'} and validation['complete']
assert set(subprocess.check_output(['git', 'diff', '--name-only'], cwd=ROOT, text=True).splitlines()) == set(changed)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
for p, digest in live.items():
    path = W / (p.replace('/', '-') + '.before') if p in changed else ROOT / p
    assert sha(path) == digest, p
for mapping in [previous['extra_unchanged_inputs_sha256'], previous['live_source_dependency_pins_sha256']]:
    assert all(sha(ROOT / p) == digest for p, digest in mapping.items())
assert all(sha(ROOT / p) == digest for p, digest in pins['inputs_sha256'].items() if p not in changed)
assert all(sha(ROOT / p) == digest for p, digest in changed.items())
audit = read(R / 'audit-result.json')
registry = read(R / 'registry-inventory.json')
root_listing = read(R / 'csgrs-package-before/result.json')
curve_listing = read(R / 'hypercurve-package-before/result.json')
resolution = read(R / 'consumer-registry-resolution/result.json')
assert audit['complete_diagnostic_run'] and not audit['external_pipeline_run']
assert root_listing['exit_code'] == -15 and root_listing['resource_stops'] == ['wall_seconds']
assert curve_listing['exit_code'] == 0 and not curve_listing['resource_stops']
assert resolution['exit_code'] == 101 and not resolution['resource_stops']
assert len(registry['packages']) == 20
assert sum(row['status'] == 'version_not_listed' for row in registry['packages']) == 12
assert sum(row['status'] == 'lookup_failed' for row in registry['packages']) == 8
for row in registry['packages']:
    if row['status'] == 'lookup_failed':
        assert 'returned error: 404' in gzip.open(R / ('registry-' + row['package']) / 'stderr.gz', 'rt').read()
for command in validation['commands']:
    assert command['exit_code'] == 0 and not command['resource_stops']
test_output = gzip.open(R / 'readme-tests/stdout.gz', 'rt').read()
assert 'test result: ok. 2 passed; 0 failed; 0 ignored;' in test_output
E.mkdir()
for name in ['contract-v1.md', 'audit_v1.py', 'registry_inventory_v1.py', 'apply_readme_v1.py',
             'validate_readme_v1.py', 'close_v1.py', 'readme-installation.patch']:
    shutil.copy2(W / name, E / name)
for name in ['source-pins.json', 'audit-result.json', 'registry-inventory.json', 'readme-validation.json']:
    shutil.copy2(R / name, E / name)
shutil.copy2(R / 'hypercurve-package-before/inventory.json', E / 'hypercurve-package-inventory.json')
excluded = {R / 'readme-compile/readme-contracts': 'Compiled test binary retained in its original physical path and hashed independently; not duplicated in Git.'}
members = {}
archive = E / 'raw-evidence-v1.tar.gz'
with tarfile.open(archive, 'w:gz') as output:
    for prefix, root in [('work', W), ('run', R)]:
        for path in sorted(root.rglob('*')):
            if path.is_file() and path not in excluded:
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
    'excluded_duplicate_bytes': {str(path): reason for path, reason in excluded.items()},
    'all_members_content_verified': True})
observations = {'base_revision': base, 'owner': 'package/distribution metadata and public installation documentation',
    'properties': ['P37', 'T12'], 'retention_decision': 'kept documentation correction; release remains incomplete',
    'csgrs_registry_version': '0.23.0', 'csgrs_version_available': False,
    'clean_consumer_resolution_exit_code': 101, 'latest_csgrs_candidate_in_diagnostic': '0.20.1',
    'consumer_uses_workspace_patches': False, 'consumer_uses_local_dependencies': False,
    'consumer_uses_previous_cargo_cache': False, 'registry_version_not_listed_count': 12,
    'registry_http_404_count': 8, 'registry_http_404_scope': 'Observed lookup failures kept separate from successful index responses.',
    'root_package_listing_complete': False, 'root_package_listing_seconds': root_listing['elapsed_seconds'],
    'root_package_listing_termination': root_listing['resource_stops'],
    'root_package_contents_or_size_established': False, 'package_exclusion_change_applied': False,
    'hypercurve_package_listing_complete': True, 'hypercurve_listed_files': 422,
    'hypercurve_existing_source_bytes': 26245600,
    'package_list_scope': 'Inventory only; neither archive assembly nor package build verification.',
    'readme_tests_passed': 2, 'readme_clippy_exit_code': 0, 'format_exit_code': 0,
    'rust_quickstart_and_example_unchanged': True, 'readme_version_assertion_uses_cargo_manifest_version': True,
    'geometry_runtime_tests_rerun': False, 'geometry_implementation_changed': False,
    'external_build_run': False, 'external_pipeline_run': False,
    'release_readiness_claimed': False, 'msrv_verified': False, 'bindings_requalified': False,
    'cache_index_admitted': False, 'full_plan_complete': False,
    'remaining_checks': ['Root package inventory and actual package builds',
        'Available coherent registry releases for all required versions',
        'Clean external construct/transform/compose/certainty/topology/export/reimport pipeline',
        'Declared feature configurations, minimum compiler and affected binding consumers',
        'Previously interrupted full cache-candidate library/downstream qualification'],
    'validation_storage_blocker': 'A fresh full build still needs roughly 6 GB; existing quotas/reserves leave insufficient capacity. The requested /mnt/Disk A validation directory remains absent.'}
dump(E / 'observations-v1.json', observations)
(E / 'README.md').write_text('''# Release consumer audit and quickstart correction

The README advertised the in-development 0.23.0 API through crates.io. A clean
external consumer, with a fresh Cargo home and no workspace patches or local
dependencies, failed resolution after updating the official index: no version
matched ^0.23.0; the newest candidate reported was 0.20.1. The independent
official sparse-index response also contained no 0.23.0 entry. The README now
labels the API unreleased and runs the existing example from the source checkout.
Its Rust example is unchanged. The existing version test derives its expected
version from Cargo instead of repeating a hard-coded dependency declaration.

The [registry inventory](registry-inventory.json) covers the exact versions in
20 publishable manifests. Twelve successful index responses omitted the target
version; eight requests returned HTTP 404 and remain separately classified as
lookup failures. Presence alone would not establish source/API compatibility.

Cargo's root package listing reached its declared 180-second wall limit and
was terminated with no file list. Root package contents, including the suspected
evidence inclusion, therefore remain unestablished. No exclusion was changed.
Hypercurve's listing completed: 422 paths and 26,245,600 bytes of existing source
files. Those bytes exclude Cargo-generated files and are not compressed archive
size. No package archive was assembled or verified.

Both existing README tests passed after the final edit, compiled directly with
rustc because they have no geometry dependencies. Strict direct Clippy and
repository-wide cargo fmt passed. This does not rerun the geometry library or
the external modeling pipeline. Fresh build storage, dependency availability,
feature/MSRV checks, package builds and real binding consumers remain release
gates. The deferred cache proposal remains unadmitted.

See the [contract](contract-v1.md), [patch](readme-installation.patch),
[observations](observations-v1.json), [validation](readme-validation.json),
[raw evidence archive](raw-evidence-v1.tar.gz) and its independently verified
[member inventory](archive-members-v1.json). All interrupted and unsuccessful
commands remain in that archive. Original output roots are closed and retained.

Only current_work changes in the execution ledger. The checkpoint preserves
27,093 inherited missing artifact paths; this is not a whole-history preservation
claim. The full properties plan and its open release boundary continue.
''')
ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
assert sha(ledger) == previous['ledger_after_sha256']
reference = subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
old_current = json.loads(json.dumps(current))
key = 'release_consumer_audit'
current[key] = {'status': observations['retention_decision'], 'base_revision': base,
    'contract': PREFIX + 'contract-v1.md', 'observations': PREFIX + 'observations-v1.json',
    'checkpoint': PREFIX + 'checkpoint-v1.json', 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'implementation_sha256': changed, 'readme_tests_passed': 2,
    'registry_version_not_listed_count': 12, 'registry_http_404_count': 8,
    'root_package_inventory_complete': False, 'external_pipeline_complete': False,
    'release_ready': False, 'cache_index_admitted': False, 'full_plan_complete': False}
assert [k for k in old_current.keys() | current.keys() if old_current.get(k) != current.get(k)] == [key]
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    done = subprocess.run(['git', 'diff', '--check', '--', *changed, 'docs/properties-status.json'],
                          cwd=ROOT, stdout=out, stderr=err)
assert done.returncode == 0
for path in E.glob('*.py'):
    ast.parse(path.read_text())
for path in E.iterdir():
    if path.suffix in {'.md', '.py', '.json'}:
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
expectations = {'schema_version': 3, 'kind': 'release consumer audit and documentation correction',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'added_physical_artifacts_sha256': physical, 'new_physical_artifacts_verified': len(physical),
    'physical_roots': [str(W), str(R)], 'directory_inventory': [str(W), str(R)], 'local_tool_symlink_targets': {},
    'expected_artifact_paths': len(prior) + len(physical), 'inherited_artifacts_reverified': False,
    'complete_artifact_audit_passed': False, 'historical_preservation_complete': False,
    'scope': 'Every new final physical file hashed independently; previous expectation chain retained without a whole-history re-audit.'}
with gzip.open(E / 'artifact-expectations-v1.json.gz', 'wt') as stream:
    json.dump(expectations, stream, sort_keys=True)
files = {str(path.relative_to(ROOT)): sha(path) for path in E.rglob('*') if path.is_file()}
record = dict(previous)
record.update({'status': current[key]['status'], 'checkpoint_kind': 'release audit; documentation correction kept; runtime implementation unchanged',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(ROOT)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'implementation_sha256': changed,
    'inherited_implementation_sha256': inherited, 'ledger_before_sha256': hashlib.sha256(raw).hexdigest(),
    'ledger_after_sha256': sha(ledger), 'only_current_work_changed': True, 'source_changes_applied': True,
    'production_rust_sources_unchanged': True, 'documentation_retention_decision': 'kept',
    'runtime_tests_rerun': False, 'readme_tests_rerun': True, 'readme_tests_passed': 2,
    'full_library_qualification_complete': False, 'external_consumer_resolution_passed': False,
    'release_qualification_complete': False, 'root_package_inventory_complete': False,
    'format_exit_code': 0, 'whitespace_exit_code': 0})
dump(E / 'checkpoint-v1.json', record)
assert sum(path.stat().st_size for root in [W, E] for path in root.rglob('*') if path.is_file()) < 8 * 1024**2
assert all(sha(ROOT / p) == digest for p, digest in changed.items())
reserve()
print(json.dumps({'documentation_kept': True, 'new_physical_paths': len(physical),
    'expected_physical_paths': len(prior) + len(physical), 'inherited_missing_paths': len(missing),
    'archive_members': len(members), 'archive_bytes': archive.stat().st_size,
    'evidence_files': len(files), 'release_qualified': False, 'cache_index_admitted': False,
    'only_current_work_changed': True, 'ledger_sha256': sha(ledger)}))
