"""Preserve raw runner bytes and repair the narrowly scoped artifact rule."""
import ast
import gzip
import hashlib
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
ROOT = W.parents[2]
P = ROOT / 'docs/evidence/2026-10-17-package-evidence-boundary'
E = ROOT / 'docs/evidence/2026-10-17-package-artifact-whitespace'
PREFIX = str(E.relative_to(ROOT)) + '/'
BASE = 'af717ed75f8ff385787eb05a562cf79610212799'
RAW = 'docs/evidence/2026-10-17-package-evidence-boundary/runner_v1.py'
ATTR = 'docs/evidence/.gitattributes'
sys.path.insert(0, str(E.parent / '2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start + len(raw[start:].decode()[:count].encode()), value


def run(name, command):
    with (W / (name + '.stdout')).open('wb') as out, (W / (name + '.stderr')).open('wb') as err:
        done = subprocess.run(command, cwd=ROOT, stdout=out, stderr=err)
    return {'command': command, 'exit_code': done.returncode,
            'stdout_sha256': sha(W / (name + '.stdout')), 'stderr_sha256': sha(W / (name + '.stderr'))}


assert not E.exists() and not (ROOT / ATTR).exists()
assert shutil.disk_usage(ROOT).free >= 512 * 1024**2
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == BASE
subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
previous = json.loads((P / 'checkpoint-v1.json').read_text())
assert all(sha(ROOT / path) == digest for path, digest in previous['evidence_files_sha256'].items())
prior, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1232703 and len(missing) == 27093
raw_sha = previous['evidence_files_sha256'][RAW]
assert sha(ROOT / RAW) == raw_sha and (ROOT / RAW).read_bytes().endswith(b'\n\n')
original = run('original-whitespace', ['git', 'diff', BASE + '^', BASE, '--check', '--', RAW])
assert original['exit_code'] == 2
assert 'new blank line at EOF.' in (W / 'original-whitespace.stdout').read_text()
attribute = '''# Keep the exact bytes of this frozen generated execution artifact.
2026-10-17-package-evidence-boundary/runner_v1.py whitespace=-blank-at-eof
'''
(W / 'attributes.after').write_text(attribute)
(ROOT / ATTR).write_text(attribute)
attribute_check = run('attributes', ['git', 'check-attr', 'whitespace', '--', RAW, 'src/lib.rs', str((P / 'proposal_v1.py').relative_to(ROOT))])
assert attribute_check['exit_code'] == 0
rows = (W / 'attributes.stdout').read_text().splitlines()
assert rows == [RAW + ': whitespace: -blank-at-eof', 'src/lib.rs: whitespace: unspecified',
                str((P / 'proposal_v1.py').relative_to(ROOT)) + ': whitespace: unspecified']
corrected = run('corrected-whitespace', ['git', 'diff', BASE + '^', BASE, '--check', '--', '.',
    ':(exclude)**/*.stdout', ':(exclude)**/*.stderr', ':(exclude)**/*.patch'])
assert corrected['exit_code'] == 0
expected = dict(previous['evidence_files_sha256'])
expected[str((P / 'checkpoint-v1.json').relative_to(ROOT))] = sha(P / 'checkpoint-v1.json')
expected.update(previous['implementation_sha256'])
expected['docs/properties-status.json'] = previous['ledger_after_sha256']
paths = sorted(expected)
actual = subprocess.check_output(['git', 'diff-tree', '--no-commit-id', '--name-only', '-r', '-z', BASE], cwd=ROOT).decode().rstrip('\0').split('\0')
assert len(paths) == 26 and set(actual) == set(paths)
data = subprocess.check_output(['git', 'cat-file', '--batch'], cwd=ROOT,
    input=''.join(BASE + ':' + path + '\n' for path in paths).encode())
offset = 0
for path in paths:
    end = data.index(b'\n', offset)
    header = data[offset:end].split()
    assert header[1] == b'blob'
    size = int(header[2]); offset = end + 1
    blob = data[offset:offset + size]; offset += size
    assert data[offset:offset + 1] == b'\n'; offset += 1
    assert hashlib.sha256(blob).hexdigest() == expected[path], path
    assert sha(ROOT / path) == expected[path], path
assert offset == len(data)
del data
assert sha(ROOT / RAW) == raw_sha
dump(W / 'recovery-v1.json', {'base_revision': BASE, 'original_staged_check_failed': True,
    'commit_started_despite_failed_check': True, 'prior_commit_blob_verification_performed_after_commit': True,
    'committed_blobs_verified': 26, 'original_diagnostic': original, 'attribute_check': attribute_check,
    'corrected_full_previous_commit_whitespace': corrected, 'raw_artifact_sha256': raw_sha,
    'raw_artifact_bytes_unchanged': True, 'ordinary_authored_files_exempted': False,
    'sole_whitespace_exception': 'blank-at-eof on one immutable generated runner',
    'runtime_tests_policies_fixtures_or_resource_gates_changed': False,
    'package_manifest_or_runtime_changed': False, 'release_qualified': False})
E.mkdir()
for path in W.iterdir():
    if path.is_file():
        shutil.copy2(path, E / path.name)
(E / 'README.md').write_text('''# Raw runner whitespace recovery

The staged check reported an extra terminal blank line in the immutable generated
runner copied into the prior evidence directory. An orchestration error started
commit af717ed75 despite that failed check. This follow-up reproduces and retains
the diagnostic, verifies all 26 committed blobs against their recorded hashes,
and rechecks the complete prior authored diff after the correction.

The runner remains byte-identical, including its original final newlines. A Git
attribute under docs/evidence disables only blank-at-EOF reporting for that one
raw artifact. Other whitespace checks remain enabled; ordinary authored files
have no new exemption. Exact SHA-256 identity remains mandatory for the artifact.
No executed helper or closed output directory was rewritten.

The attribute directory is already excluded from the root crate package. No
manifest, geometry, API, runtime test, policy, fixture or resource gate changed.
This is an evidence-handling correction, not further release qualification.
See the [contract](contract-v1.md), [recovery record](recovery-v1.json) and retained
original/corrected command output. Historical missing-artifact disclosures and
the active full properties goal remain unchanged.
''')
ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
assert sha(ledger) == previous['ledger_after_sha256']
reference = subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
old_current = json.loads(json.dumps(current))
key = 'package_artifact_whitespace_recovery'
implementation = {ATTR: sha(ROOT / ATTR)}
current[key] = {'status': 'kept: exact generated runner preserved with one scoped EOF-whitespace exception',
    'base_revision': BASE, 'contract': PREFIX + 'contract-v1.md', 'recovery': PREFIX + 'recovery-v1.json',
    'checkpoint': PREFIX + 'checkpoint-v1.json', 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'implementation_sha256': implementation, 'prior_commit_verified_blobs': 26,
    'original_failed_check_preserved': True, 'raw_artifact_unchanged': True,
    'release_ready': False, 'cache_index_admitted': False, 'full_plan_complete': False}
assert [k for k in old_current.keys() | current.keys() if old_current.get(k) != current.get(k)] == [key]
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
subprocess.run(['git', 'diff', '--check', '--', 'docs/properties-status.json'], cwd=ROOT, check=True)
for path in E.iterdir():
    if path.suffix in {'.md', '.py', '.json', '.after'}:
        text = path.read_text()
        assert all(line == line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'), path
        if path.suffix == '.py': ast.parse(text)
physical = {}
for path in sorted(W.rglob('*')):
    if path.is_file():
        before = path.stat(); digest = sha(path); after = path.stat()
        assert (before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns) == (
            after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns)
        physical[str(path)] = digest
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version': 3, 'kind': 'immutable raw-artifact whitespace classification recovery',
    'parent_expectations': previous['artifact_expectations'], 'parent_expectations_sha256': previous['artifact_expectations_sha256'],
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'added_physical_artifacts_sha256': physical, 'new_physical_artifacts_verified': len(physical),
    'physical_roots': [str(W)], 'directory_inventory': [str(W)], 'local_tool_symlink_targets': {},
    'expected_artifact_paths': len(prior) + len(physical), 'inherited_artifacts_reverified': False,
    'complete_artifact_audit_passed': False, 'historical_preservation_complete': False,
    'scope': 'New physical paths hashed independently; previous expectation chain and missing-path disclosure preserved.'}
with gzip.open(E / 'artifact-expectations-v1.json.gz', 'wt') as stream: json.dump(expectations, stream, sort_keys=True)
files = {str(path.relative_to(ROOT)): sha(path) for path in E.iterdir() if path.is_file()}
record = dict(previous)
record.update({'status': current[key]['status'], 'checkpoint_kind': 'scoped raw-artifact classification; runtime and package manifest unchanged',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(ROOT)), 'previous_closure_sha256': sha(P / 'checkpoint-v1.json'),
    'evidence_files_sha256': files, 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'new_physical_artifacts_verified': len(physical), 'implementation_sha256': implementation,
    'inherited_implementation_sha256': previous['inherited_implementation_sha256'] | previous['implementation_sha256'],
    'ledger_before_sha256': hashlib.sha256(raw).hexdigest(), 'ledger_after_sha256': sha(ledger),
    'only_current_work_changed': True, 'prior_premature_commit_preserved': BASE,
    'prior_commit_verified_blobs': 26, 'raw_artifact_sha256': raw_sha, 'raw_artifact_unchanged': True,
    'format_rerun': False, 'whitespace_exit_code': 0})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(ROOT / path) == digest for path, digest in previous['evidence_files_sha256'].items())
assert sha(ROOT / RAW) == raw_sha
assert sum(path.stat().st_size for root in [W, E] for path in root.rglob('*') if path.is_file()) < 2 * 1024**2
assert shutil.disk_usage(ROOT).free >= 512 * 1024**2
print(json.dumps({'raw_artifact_preserved': True, 'prior_commit_verified_blobs': 26,
    'new_physical_paths': len(physical), 'expected_physical_paths': len(prior) + len(physical),
    'evidence_files': len(files), 'ledger_sha256': sha(ledger), 'only_current_work_changed': True}))
