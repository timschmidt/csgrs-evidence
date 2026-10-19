"""Seal current package and consumer observations without claiming a release."""
import sys
sys.dont_write_bytecode = True
import ast, gzip, hashlib, json, os, re, shutil, stat, subprocess, tarfile
from pathlib import Path
O = Path('/home/tim/Documents/GitHub/workspace/csgrs')
N = O.parent / 'csgrs-properties-validation-2026-10-17-v2'
B = Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/release-path-validation-20261019-v1')
PREV_F = B.parent / 'construction-evidence-admission-final-20261019-v1'
P = O / 'docs/evidence/2026-10-19-construction-evidence-admission'
E = O / 'docs/evidence/2026-10-19-release-path-validation'
X = B / 'external-evidence'
BASE = '7d4f1a8f8ed0805b04d42bd4b6a15a1c64662f02'
sys.path[:0] = [str(B / 'control'), str(O / 'docs/evidence/2026-10-17-resume-integration')]
from release_path_runner_v1 import sha, resources, reasons
from load_expectations_v2 import load
GIT = ['git', '-c', 'core.splitIndex=true', '-c', 'index.version=4', '-c', 'maintenance.auto=false', '-c', 'gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
def git(*args): return subprocess.check_output(GIT + list(args), cwd=O)
def read(path): return json.loads(Path(path).read_text())
def gzread(path): return json.loads(gzip.decompress(Path(path).read_bytes()))
def dump(path, value):
    assert not path.exists(), path
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')
def gzwrite(path, value):
    assert not path.exists(), path
    path.write_bytes(gzip.compress((json.dumps(value, sort_keys=True) + '\n').encode(), mtime=0))
def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, length = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start + len(raw[start:].decode()[:length].encode()), value
assert git('rev-parse', 'HEAD').decode().strip() == BASE
assert not git('diff', 'HEAD', '--name-only') and not git('diff', '--cached', '--name-only')
assert not E.exists() and not X.exists() and not reasons(resources())
protected = 'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert set(git('ls-files', '--others', '--exclude-standard').decode().splitlines()) == {protected}
assert sha(O / protected) == '08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous = read(P / 'checkpoint-v1.json')
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
pins = gzread(B / 'source-pins-v1.json.gz'); assert len(pins) == 10156
receipt = read(PREV_F / 'commit-verification-v1.json')
assert receipt['commit'] == BASE and receipt['verified_blob_count'] == 62
assert all(hashlib.sha256(git('show', 'HEAD:' + p)).hexdigest() == h for p, h in receipt['verified_committed_blobs_sha256'].items())
expected = {}
def expect(path, digest):
    path = str(path)
    assert path not in expected or expected[path] == digest, path
    expected[path] = digest
for table in [pins, inherited, previous['evidence_files_sha256']]:
    for p, h in table.items(): expect(O / p, h)
for p, h in previous['external_evidence_files_sha256'].items(): expect(p, h)
registry = gzread(N / 'lazy-proof-control-v1/registry-inputs-v1.json.gz')
private = gzread(B / 'private-registry-inputs-v2.json.gz')
failed_target = gzread(B / 'failed-package-target-v1.json.gz')
assert len(registry) == len(private) == 48478 and len(failed_target) == 743
for p, h in registry.items(): expect(p, h)
for p, row in private.items():
    assert registry[row['source']] == row['sha256']
    assert (Path(p).stat().st_dev, Path(p).stat().st_ino) != (Path(row['source']).stat().st_dev, Path(row['source']).stat().st_ino)
    expect(p, row['sha256'])
for p, h in failed_target.items(): expect(p, h)
for label, count in [('v1', 28), ('v2', 42), ('floor-v1', 42)]:
    archives = read(B / ('physical-package-archives-' + label + '.json'))
    assert len(archives) == count
    for p, row in archives.items():
        assert Path(p).stat().st_size == row['bytes']; expect(p, row['sha256'])
for label in ['v2', 'floor-v1']:
    result = read(B / ('package-result-' + label + '.json'))
    assert result['completed'] and not result['warnings'] and not result['hypervoxel_built']
    members = gzread(B / ('package-members-' + label + '.json.gz'))
    assert len(members) == 14
    for row in members.values():
        expect(row['archive'], row['sha256'])
        assert row['all_nongenerated_source_bytes_match'] and row['native_build_verification_passed']
        assert row['vcs']['git']['sha1'] == BASE and not row['vcs']['git'].get('dirty', False)
review = read(B / 'review-v1.json')
assert review['baseline_revision'] == BASE and not review['full_plan_complete']
assert not review['external_registry_consumer_resolved'] and review['sibling_readme_installation_findings'] == 14
example = read(B / 'source-example-v1/result-v1.json')
assert example['passed'] and example['exact_cells_checked'] == 375 and example['outputs_checked'] == 3
for p, h in example['library_sha256'].items(): expect(p, h)
expect(B / 'source-example-v1/frozen/basic', example['example_binary_sha256'])
expect(B / 'source-example-v1/frozen/inspect', example['inspector_binary_sha256'])
expect(B / 'source-example-v1/output/drilled_cube.stl', example['stl_sha256'])
for name in ['fixtures.rs', 'oracle.rs']:
    assert sha(B / 'source-example-v1/probe' / name) == sha(O / 'tests/support/strict_boolean_workflows' / name)
registry_rows = read(B / 'registry-observations-v1.json')['packages']; assert len(registry_rows) == 20
for row in registry_rows:
    for p, h in row['files_sha256'].items(): expect(p, h)
commands = {}
for folder in sorted((B / 'logs').iterdir()):
    row = read(folder / 'result.json'); assert row['output_closed'] and not row['stops']
    for p, h in row['output_sha256'].items(): expect(folder / p, h)
    commands[folder.name] = row
assert len(commands) == 10
assert {name: row['exit_code'] for name, row in commands.items() if row['exit_code']} == {'release-path-external-resolution-v1': 101, 'release-path-packages-v1': 101}
assert not read(B / 'package-result-v1.json')['completed']
prior, missing = load(previous['artifact_expectations'], allow_unqualified=True)
assert (len(prior), len(missing)) == (1979444, 921794)
roots = [B, PREV_F]
for pattern in ['*release-path*.py', 'release_path*.py', '*release-source-example*.py']:
    roots += sorted(Path('/tmp').glob(pattern))
selected = []
for root in sorted(set(roots)):
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if not p.is_dir() or p.is_symlink()])
assert len(selected) == len(set(selected))
physical = {}; states = {}; members = {}; excluded = {}
for path in selected:
    before = path.lstat(); assert stat.S_ISREG(before.st_mode) and not path.is_symlink(), path
    digest = sha(path); after = path.stat(); state = (after.st_size, after.st_mtime_ns, after.st_ctime_ns)
    assert state == (before.st_size, before.st_mtime_ns, before.st_ctime_ns)
    key = str(path)
    if key in expected: assert expected.pop(key) == digest, path
    if key in prior:
        assert prior[key] == digest, path
        continue
    physical[key] = digest; states[key] = state
    if len(physical) % 5000 == 0:
        assert not reasons(resources()); print(json.dumps({'new_paths_rehashed': len(physical)}), flush=True)
    with path.open('rb') as stream: magic = stream.read(8)
    generated = path.is_relative_to(B) and any(part.startswith(('target', 'cargo-home', 'registry-home', 'registry-target', 'gmp-cache', 'xdg-cache')) for part in path.relative_to(B).parts)
    compiled = magic.startswith(b'\x7fELF') or magic == b'!<arch>\n'
    name = str(path.relative_to(B)) if path.is_relative_to(B) else 'prior-final/' + str(path.relative_to(PREV_F)) if path.is_relative_to(PREV_F) else 'temporary/' + path.name
    assert name not in members and name not in excluded, name
    row = {'physical_path': key, 'sha256': digest, 'bytes': after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason'] = 'Registry/cache/build artifact or compiled binary/library; physically preserved and individually hashed'
        excluded[name] = row
    else: members[name] = row
for i, (p, h) in enumerate(expected.items()):
    assert sha(p) == h, p
    if i % 10000 == 0:
        assert not reasons(resources()); print(json.dumps({'prior_and_source_paths_checked': i}), flush=True)
X.mkdir(); archive = X / 'raw-evidence-v1.tar.gz'
with tarfile.open(archive, 'w:gz', dereference=True) as bundle:
    for name, row in members.items(): bundle.add(row['physical_path'], arcname=name, recursive=False)
with tarfile.open(archive, 'r:gz') as bundle:
    assert set(bundle.getnames()) == set(members)
    for name, row in members.items():
        with bundle.extractfile(name) as stream: assert hashlib.file_digest(stream, 'sha256').hexdigest() == row['sha256']
gzwrite(X / 'archive-members-v1.json.gz', {'members': members, 'excluded_generated_and_compiled_artifacts_physically_preserved': excluded, 'every_path_hashed_independently': True, 'all_archive_members_verified': True, 'archive_sha256': sha(archive)})
expectations = X / 'artifact-expectations-v1.json.gz'
gzwrite(expectations, {'schema_version': 3, 'kind': 'current release package and source consumer validation', 'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'], 'added_physical_artifacts_sha256': physical, 'expected_artifact_paths': len(prior) + len(physical), 'inherited_expected_artifact_paths': len(prior), 'last_observed_missing_artifact_paths': len(missing), 'new_physical_artifacts_verified': len(physical), 'complete_artifact_audit_passed': False, 'historical_preservation_complete': False, 'old_history_reaudited': False, 'temporary_artifacts_volatile': True, 'required_loader': 'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded, unavailable = load(expectations, allow_unqualified=True); assert loaded == prior | physical and unavailable == missing
dump(X / 'command-results-v1.json', commands)
E.mkdir(); external = {str(path): sha(path) for path in X.iterdir() if path.is_file()}
dump(E / 'external-evidence-v1.json', {'files_sha256': external, 'archive_bytes': archive.stat().st_size, 'archive_members': len(members), 'physical_paths': len(physical), 'content_verified': True, 'original_storage_baselines_unchanged': True, 'portable_distribution_evidence': False})
authorization = read(B / 'control/storage-allowance-v1.json')
assert authorization['new_volume_net_allowance_bytes'] is None and authorization['old_disk_b_net_allowance_bytes'] is None
review['source_example_byte_roundtrip_equal'] = False
assert 'byte_roundtrip_equal=false' in example['inspector_stdout']
review['serialization_observation_scope'] = 'The three source-example meshes pass set/topology checks; the observed reserialized STL bytes differ. Byte identity across import/composition/export was not required by the predeclared source-example contract. No serialization change is admitted here.'
review['all_adverse_results_retained'] = True
dump(E / 'review-v1.json', review)
dump(E / 'command-summary-v1.json', {name: {key: row[key] for key in ['exit_code', 'elapsed_seconds', 'wall_limit_seconds', 'stops']} for name, row in commands.items()})
for source, target in [(B / 'control/contract-v1.md', 'contract-v1.md'), (B / 'control/compiler-floor-contract-v1.md', 'compiler-floor-contract-v1.md'), (B / 'source-example-v1/contract-v1.md', 'source-example-contract-v1.md'), (B / 'control/storage-allowance-v1.json', 'storage-allowance-v1.json'), (B / 'source-pins-v1.json.gz', 'source-pins-v1.json.gz'), (B / 'package-comparison-v1.json', 'package-comparison-v1.json'), (B / 'readme-installation-findings-v1.json', 'readme-installation-findings-v1.json'), (Path(__file__), 'close_v1.py')]: shutil.copy2(source, E / target)
(E / 'README.md').write_text('''# E100: release packages and the source consumer path

On revision 7d4f1a8f8, all fourteen packages independent of deferred Hypervoxel
pass native Cargo package verification with all features on Rust 1.98.1 and
1.95.0. Every nongenerated package member matches the checkout; normalized
manifests contain no workspace paths or patches. The two compiler runs have
different compressed archives. Their source members and normalized manifests
agree; lock graphs agree after accounting for candidate archive checksums.
The [comparison](package-comparison-v1.json) retains those differences.

The unchanged documented source example also runs successfully. An independent
exact-set oracle checks its raw-STL import, union-with-empty result and bound
artifact reimport over 375 rational cells, with separate certified closed-PWN
and manifold checks. Source-history and projection qualifications survive.
Reserialized STL bytes differ; semantic equality and deterministic serialization
are recorded separately under the [source-example contract](source-example-contract-v1.md).

The clean registry consumer cannot resolve csgrs =0.23.0. Twelve successful
index responses omit their requested versions; eight HTTP 404s remain lookup
failures. The root README already labels its API as unreleased. Fourteen sibling
installation sections need qualification, as recorded in the
[findings](readme-installation-findings-v1.json). Those instructions are not fixed
by this evidence checkpoint. Five distributions whose dependency closure
includes Hypervoxel retain their packaging blocker; that crate was neither
built nor packaged.

The initial package run failed with Cargo's no-hash diagnostic. Its staged
archive checksums matched, and the same workload passed with private writable
Cargo state. The exact cause was not isolated. All failures, archives, commands,
HTTP observations and physical copies remain retained. See the
[review](review-v1.json), [command summary](command-summary-v1.json),
[contract](contract-v1.md) and [checkpoint](checkpoint-v1.json).

Native package staging and a source checkout do not establish public installation.
Full release, provenance, runtime corpus, pre-push CI and the broader properties
plan remain open. This checkpoint changes no implementation, test or policy.
Historical missing artifacts were not reaudited or recovered.
''')
(E / 'next-change-contract-v1.md').write_text('''# Next change: truthful source-version installation guidance

Apply properties P25/P28-P30/P35-P37/P39 and the normative protocol in
../../admission.md. The owning layer is distribution documentation and its
example/metadata checks. E100 reproduces the missing registry consumer path on
7d4f1a8f8 and identifies fourteen sibling README installation introductions.

Audit the complete affected introductions and secondary feature declarations,
including Hyperreal Simple, Hypergraphics renderer-only, Hypermesh checkout
paths, Hyperbrep, csgrs-ffi and README metadata tests. Present the current source
API honestly and use concrete monorepo commands or a fully documented source
consumer route. Do not describe unversioned registry commands as equivalent to
an unavailable current version. A failed lookup remains an availability unknown.

Preserve Rust examples, features, policies, semantic assertions and dependency
versions. Execute the documented paths and affected example/metadata checks on
the final edit; retain original runtime outputs and any current blockers.
Do not build or package Hypervoxel. If a documented configuration depends on it,
record the unexecuted configuration without narrowing its feature contract.

This repair must not imply that local paths or workspace patches establish the
clean public distribution required by P37. No publication or push is part of
this change. Keep existing validation storage/log/time/memory limits, source
pins, immutable closed evidence, only-current_work ledger scope and the protected
untracked checkpoint. A documentation update does not discharge implementation,
full release, provenance or historical-artifact obligations.
''')
prefix = str(E.relative_to(O)) + '/'
ledger = O / 'docs/properties-status.json'; raw = ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest() == previous['ledger_after_sha256']
reference = git('show', '9025de62:docs/properties-status.json'); start, end, current = span(raw); rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
assert 'release_path_validation' not in current
current['updated_on'] = '2026-10-19'
current['release_path_validation'] = review | {'parent_revision': BASE, 'review': prefix + 'review-v1.json', 'checkpoint': prefix + 'checkpoint-v1.json', 'next_change_contract': prefix + 'next-change-contract-v1.md', 'artifact_expectations': str(expectations)}
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]; us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:]); ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md', '.py', '.json'}:
        value = path.read_text(); assert all(line == line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'), path
        if path.suffix == '.py': ast.parse(value)
    if path.suffix == '.md':
        for link in re.findall(r'\]\(([^)]+)\)', path.read_text()):
            if '://' not in link and not link.startswith('#') and link != 'checkpoint-v1.json': assert (path.parent / link.split('#')[0]).exists(), link
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT + ['diff', '--check'], cwd=O, stdout=out, stderr=err)
assert checked.returncode == 0
record = {'status': review['classification'], 'checkpoint_kind': 'current release package and source consumer validation', 'previous_closure': str((P / 'checkpoint-v1.json').relative_to(O)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'), 'evidence_files_sha256': {str(path.relative_to(O)): sha(path) for path in E.rglob('*') if path.is_file()}, 'external_evidence_files_sha256': external, 'artifact_expectations': str(expectations), 'artifact_expectations_sha256': sha(expectations), 'inherited_expected_artifact_paths': len(prior), 'new_physical_artifacts_verified': len(physical), 'previously_closed_registry_paths_verified': len(registry), 'private_registry_paths_verified': len(private), 'failed_package_target_paths_verified': len(failed_target), 'last_missing_path_observation': {'checkpoint': 'E63', 'count': len(missing), 'reaudited_here': False}, 'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger), 'inherited_implementation_sha256': inherited, 'implementation_sha256': {}, 'new_implementation_paths': [], 'restored_native_sha256': previous['restored_native_sha256'], 'main_source_pins_sha256': sha(E / 'source-pins-v1.json.gz'), 'main_source_pins': prefix + 'source-pins-v1.json.gz', 'source_changes_applied': False, 'new_implementation_admission': False, 'production_implementation_changed': False, 'qualification_this_checkpoint': review, 'main_runtime_tests_rerun': False, 'current_revision_pipeline_observations_executed': True, 'open_experiment_artifacts_closed_here': True, 'closed_experiment_roots': [str(root) for root in sorted(set(roots))], 'external_evidence_sealed_separately': str(X), 'prior_commit_verified_blobs': 62, 'full_plan_complete': False, 'public_distribution_complete': False, 'hypervoxel_deferred_by_user': True, 'final_source_parent_revision': BASE, 'temporary_artifacts_volatile': True, 'storage_baselines_reset': False, 'all_adverse_results_retained': True, 'tmp_allowance_gib': 58, 'disk_b_allowance_gib': None, 'disk_b_physical_free_guard_bytes': 1 << 30, 'logs_allowance_mib': 200, 'general_speedup_claimed': False}
dump(E / 'checkpoint-v1.json', record)
for path, state in states.items():
    info = Path(path).stat(); assert (info.st_size, info.st_mtime_ns, info.st_ctime_ns) == state, path
assert all(sha(O / path) == digest for path, digest in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths': len(physical), 'expected_paths': len(loaded), 'archive_bytes': archive.stat().st_size, 'public_distribution_complete': False, 'full_plan_complete': False}), flush=True)
