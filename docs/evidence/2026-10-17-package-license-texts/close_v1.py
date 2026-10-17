"""Close the package-text evidence while preserving the prior acceptance record."""
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
R = Path('/run/user/1000/csgrs-package-license-texts-v1')
P = ROOT / 'docs/evidence/2026-10-17-circle-support-reuse-full-library'
E = ROOT / 'docs/evidence/2026-10-17-package-license-texts'
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
assert all(sha(ROOT / p) == h for p, h in previous['evidence_files_sha256'].items())
prior, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1233194 and len(missing) == 27093
protocol = read(R / 'protocol-v2.json')
result = read(R / 'result.json')
assert protocol['baseline_complete'] and result['complete'] and result['output_closed']
assert result['package_file_lists_passed'] and result['license_texts_exactly_match_official_bytes']
base = protocol['base_revision']
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == base
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
implementation = result['implementation_sha256']
assert len(implementation) == 17
assert all(sha(ROOT / p) == h for p, h in implementation.items())
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited | implementation
for mapping in [live, previous['extra_unchanged_inputs_sha256'],
                previous['live_source_dependency_pins_sha256'], protocol['unchanged_inputs_sha256']]:
    assert all(sha(ROOT / p) == h for p, h in mapping.items())
assert sha(W / 'prepare_v1.py') == protocol['prepare_sha256']
assert sha(W / 'prepare_v2.py') == protocol['prepare_v2_sha256']
assert sha(W / 'apply_v1.py') == read(R / 'applied.json')['apply_sha256']
assert sha(W / 'contract-v1.md') == protocol['contract_sha256']
assert sha(R / 'LICENSE-2.0.txt') == protocol['canonical_sha256']
before = read(R / 'baseline-v2.json')
after = read(R / 'after.json')
for crate in protocol['crates']:
    for phase, rows in [('before-v2', before), ('after', after)]:
        command = rows[crate]['command']
        assert command == read(R / (phase + '-' + crate) / 'result.json')
        assert command['exit_code'] == 0 and not command['resource_stops']
        for path, digest in command['outputs_sha256'].items():
            assert sha(R / (phase + '-' + crate) / path) == digest
    assert set(after[crate]['paths']) - set(before[crate]['paths']) == {'LICENSE-APACHE'}
    assert not set(before[crate]['paths']) - set(after[crate]['paths'])
    assert all(sha(ROOT / 'crates' / crate / p) == h for p, h in after[crate]['physical_sha256'].items())
for name in ['fmt', 'whitespace']:
    command = result[name]
    assert command == read(R / name / 'result.json')
    assert command['exit_code'] == 0 and not command['resource_stops']
    for path, digest in command['outputs_sha256'].items():
        assert sha(R / name / path) == digest

E.mkdir()
for name in ['contract-v1.md', 'prepare_v1.py', 'prepare_v2.py', 'apply_v1.py', 'close_v1.py']:
    shutil.copy2(W / name, E / name)
for name in ['protocol-v2.json', 'result.json', 'prepare-v1-failure.json']:
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
    'all_members_content_verified': True})
status = 'declared Apache license texts included in twelve package file lists; broader release remains open'
summary = {'status': status, 'base_revision': base, 'packages': result['packages'],
    'official_license_url': protocol['canonical_url'], 'official_license_sha256': protocol['canonical_sha256'],
    'readmes_corrected': protocol['readme_edits'], 'existing_physical_package_files_checked': 1082,
    'existing_manifests_lockfiles_license_notices_and_other_source_files_preserved': True,
    'original_helper_failure_preserved': True, 'format_exit_code': 0, 'whitespace_exit_code': 0,
    'retention_decision': 'kept', 'scope': 'License asset membership and exact bytes, plus five README links.',
    'package_archive_build_complete': False, 'runtime_tests_rerun': False,
    'dependency_or_fixture_provenance_audited': False, 'legal_compliance_claimed': False,
    'license_grants_changed': False, 'release_qualification_complete': False,
    'cache_index_admitted': False, 'full_plan_complete': False}
assert sum(row['existing_physical_files_verified'] for row in result['packages'].values()) == 1082
dump(E / 'qualification-v1.json', summary)
(E / 'README.md').write_text('''# Package the declared Apache license texts

Twelve crates lacked the Apache text declared by their manifests: hyperbrep,
hypercircuit, hypercurve, hyperevolution, hyperlimit, hyperpack, hyperparts,
hyperpath, hyperphysics, hypersdf, hypersolve and hypertri. Each now includes
LICENSE-APACHE. The new files match the [official Apache text](https://www.apache.org/licenses/LICENSE-2.0.txt)
byte for byte and also match the existing Hyperreal copy. The SHA-256 is
cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30.

Hypercurve, Hyperphysics and Hypersolve now link their Apache label to Apache
terms. Hyperlimit and Hypertri link both already-declared choices. Manifest
license expressions and every existing license/copyright file are unchanged.
This is an asset and link repair; it does not settle ownership, license history,
the scope of inherited grants, or dependency and fixture provenance.

On the recorded revision, all twelve baseline Cargo package file lists lacked
LICENSE-APACHE. All twelve final lists add exactly that member and remove none.
The 1,082 existing physical package files were compared: only the five declared
README edits changed bytes. No Rust code, fixture, manifest, lockfile or existing
license was changed. Cargo formatting and authored whitespace checks passed.
The package file lists are not built crate archives or external-consumer builds.

The first inventory helper stopped on Cargo's generated Cargo.lock member before
making edits. Its executed bytes, original Cargo output and failure description
are retained. The revised helper recognizes the generated member described by
the [Cargo package documentation](https://doc.rust-lang.org/cargo/commands/cargo-package.html).
No package source, input fixture or acceptance requirement was weakened.

The reused frozen runner retained its 900-second wall limit, 8 GiB child address
space, 2 GiB host available memory, 512 MiB repository reserve and 256 MiB runtime
reserve. Fresh outputs were additionally monitored against 4 MiB. Controls,
authored changes, evidence and Git writes had a 3 MiB planning allowance. These
checks provide external containment, not internal execution bounds or performance
evidence. No closed artifact root or target was written or removed.

See the [contract](contract-v1.md), [protocol](protocol-v2.json),
[qualification](qualification-v1.json), [result](result.json),
[original diagnostic failure](prepare-v1-failure.json),
[raw archive](raw-evidence-v1.tar.gz) and [archive members](archive-members-v1.json).
All new physical paths are hashed individually. Only current_work changes in the
ledger; the 27,093 missing historical paths remain unqualified. No whole-history
preservation, complete release, production-cache admission or full-plan
completion is claimed. Large fresh-build storage remains unavailable.
''')

ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
assert sha(ledger) == previous['ledger_after_sha256']
reference = subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
old_current = json.loads(json.dumps(current))
key = 'package_license_texts'
current[key] = {'status': status, 'base_revision': base, 'contract': PREFIX + 'contract-v1.md',
    'qualification': PREFIX + 'qualification-v1.json', 'checkpoint': PREFIX + 'checkpoint-v1.json',
    'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'crates': protocol['crates'], 'readmes_corrected': protocol['readme_edits'],
    'license_assets_and_links_retained': True, 'manifest_license_expressions_changed': False,
    'package_file_list_checks_passed': True, 'package_archives_built': False,
    'dependency_provenance_or_legal_compliance_claimed': False,
    'runtime_tests_rerun': False, 'release_qualification_complete': False,
    'cache_index_admitted': False, 'full_plan_complete': False}
assert [k for k in old_current.keys() | current.keys() if old_current.get(k) != current.get(k)] == [key]
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
with (E / 'whitespace.stdout').open('wb') as out, (E / 'whitespace.stderr').open('wb') as err:
    done = subprocess.run(['git', 'diff', '--check', '--', 'docs/properties-status.json', *sorted(implementation)],
                          cwd=ROOT, stdout=out, stderr=err)
assert done.returncode == 0
for path in E.iterdir():
    if path.suffix in {'.py', '.md', '.json'}:
        text = path.read_text()
        assert all(line == line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'), path
        if path.suffix == '.py':
            ast.parse(text)
physical = {}
for root in [W, R]:
    for path in sorted(root.rglob('*')):
        if path.is_file():
            before_stat = path.stat(); digest = sha(path); after_stat = path.stat()
            assert (before_stat.st_dev, before_stat.st_ino, before_stat.st_size, before_stat.st_mtime_ns, before_stat.st_ctime_ns) == (
                after_stat.st_dev, after_stat.st_ino, after_stat.st_size, after_stat.st_mtime_ns, after_stat.st_ctime_ns)
            physical[str(path)] = digest
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version': 3, 'kind': 'declared package license texts and links',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'added_physical_artifacts_sha256': physical, 'new_physical_artifacts_verified': len(physical),
    'physical_roots': [str(W), str(R)], 'directory_inventory': [str(W), str(R)],
    'local_tool_symlink_targets': {}, 'expected_artifact_paths': len(prior) + len(physical),
    'inherited_artifacts_reverified': False, 'complete_artifact_audit_passed': False,
    'historical_preservation_complete': False,
    'scope': 'Each new physical artifact path independently hashed; changed source paths separately pinned.'}
with gzip.open(E / 'artifact-expectations-v1.json.gz', 'wt') as stream:
    json.dump(expectations, stream, sort_keys=True)
files = {str(path.relative_to(ROOT)): sha(path) for path in E.rglob('*') if path.is_file()}
record = dict(previous)
record.update({'status': status, 'checkpoint_kind': 'declared license asset and documentation repair',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(ROOT)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'implementation_sha256': implementation,
    'inherited_implementation_sha256': inherited,
    'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger),
    'only_current_work_changed': True, 'source_changes_applied': True,
    'production_prefixes_unchanged': False, 'production_rust_sources_unchanged': True,
    'package_license_texts_retention_decision': 'kept', 'package_file_list_checks_passed': True,
    'runtime_tests_rerun': False, 'readme_tests_rerun': False,
    'prior_library_qualification': str((P / 'checkpoint-v1.json').relative_to(ROOT)),
    'both_library_suites_passed': None, 'full_library_qualification_complete': False,
    'library_qualification_scope': 'No library suite execution in this package-text checkpoint; E51 is preserved separately.',
    'full_cargo_matrix_qualified': False, 'downstream_native_qualification_complete': False,
    'release_qualification_complete': False, 'package_archive_build_complete': False,
    'cache_index_admitted': False, 'cache_retention_decision': 'unadmitted',
    'format_rerun': True, 'format_exit_code': 0, 'whitespace_exit_code': 0})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(ROOT / p) == h for p, h in live.items())
assert sum(path.stat().st_size for root in [W, E] for path in root.rglob('*') if path.is_file()) < 1024**2
assert shutil.disk_usage(ROOT).free >= 512 * 1024**2
print(json.dumps({'packages_verified': 12, 'source_files': len(implementation),
    'new_physical_paths': len(physical), 'expected_physical_paths': len(prior) + len(physical),
    'archive_bytes': archive.stat().st_size, 'evidence_files': len(files),
    'ledger_sha256': sha(ledger), 'root_free': shutil.disk_usage(ROOT).free}))
