"""Close the resumed integration evidence without rewriting historical artifacts."""
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
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
N = Path('/home/tim/Documents/GitHub/workspace/csgrs-properties-validation-2026-10-17-v2')
E = Path(__file__).resolve().parent
P = O / 'docs/evidence/2026-10-17-native-cache-combination'
BASE = '9abc309af48acad10369bfe9fb9a82d39cc9fceb'
GIT = ['git', '-c', 'core.splitIndex=true', '-c', 'index.version=4',
       '-c', 'maintenance.auto=false', '-c', 'gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
sys.path.insert(0, str(E))
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
parent = O / previous['artifact_expectations']
assert sha(parent) == previous['artifact_expectations_sha256']
prior, missing = load(parent, allow_unqualified=True)
assert (len(prior), len(missing)) == (1298910, 27093)
availability = read(V / 'resume-availability-v1/result-v1.json')
current_missing = gzread(V / 'resume-availability-v1/currently-unavailable-v1.json.gz')
delta_missing = gzread(V / 'resume-availability-v1/newly-unavailable-v1.json.gz')
assert missing.keys().isdisjoint(delta_missing)
assert missing | delta_missing == current_missing
assert all(prior[p] == h for p, h in current_missing.items())
assert (len(current_missing), len(delta_missing)) == (921794, 894701)
assert availability['latest_e62_paths_content_checked'] == 22235
assert not availability['latest_e62_mismatches'] and not availability['latest_e62_missing']
assert not availability['other_path_errors']
assert sha(V / 'resume-availability-v1/currently-unavailable-v1.json.gz') == availability['current_missing_manifest_sha256']
assert sha(V / 'resume-availability-v1/newly-unavailable-v1.json.gz') == availability['new_missing_manifest_sha256']
integration = read(V / 'resume-integration-execution-v1/result-v1.json')
assert integration['complete'] and integration['new_head'] == BASE
changed = git('diff', '--name-only', integration['old_head'], BASE).decode().splitlines()
assert len(changed) == integration['changed_files_verified'] == 115
assert prior.keys().isdisjoint(str(O / p) for p in changed)
assert all((O / p).read_bytes() == git('show', BASE + ':' + p) for p in changed)
result = read(N / 'integration-result-v2.json')
assert result['complete_for_declared_scope'] and result['readme_passes'] == 4
assert result['format_passed'] and result['quickstart_passed'] and result['source_unchanged']
source = gzread(N / 'integration-source-v1.json.gz')
assert all(sha(O / p) == h for p, h in source.items())
commands = {}
for label, row in result['commands'].items():
    name = 'integration-' + label + ('-v1' if label in ('fmt', 'readme-default') else '-v2')
    folder = N / 'logs' / name
    assert read(folder / 'result.json') == row
    assert row['exit_code'] == 0 and not row['stops'] and row['output_closed']
    assert all(sha(folder / name) == h for name, h in row['output_sha256'].items())
    commands[name] = row
roots = [V / 'control/resume-integration-v1', V / 'resume-availability-v1',
         V / 'resume-integration-execution-v1', N / 'control', N / 'targets/integration-v1']
for name in commands:
    roots.extend([N / 'logs' / name, N / 'scratch' / name])
selected = [p for root in roots for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()]
selected.extend(p for p in sorted(N.glob('integration-*')) if p.is_file())
selected.extend(V / name for name in (
    'native-combination-stage-verification-v1.json', 'native-combination-stage-whitespace-v1.stdout',
    'native-combination-stage-whitespace-v1.stderr', 'native-combination-commit-verification-v1.json',
    'continuation-after-native-combination-v1.json'))
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
    base = V if path.is_relative_to(V) else N
    name = ('disk-b/' if base == V else 'root-volume/') + str(path.relative_to(base))
    large = path.is_relative_to(N / 'targets') or path.name in ('currently-unavailable-v1.json.gz', 'newly-unavailable-v1.json.gz')
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
expectations = {'schema_version': 4, 'kind': 'resume availability and verified integration',
    'parent_expectations': str(parent.relative_to(O)), 'parent_expectations_sha256': sha(parent),
    'added_physical_artifacts_sha256': physical, 'inherited_expected_artifact_paths': len(prior),
    'expected_artifact_paths': len(prior) + len(physical),
    'additional_missing_artifact_paths': sorted(delta_missing),
    'currently_unavailable_artifact_paths': len(current_missing),
    'availability_audit_sha256': sha(V / 'resume-availability-v1/result-v1.json'),
    'physical_roots': [str(root) for root in roots], 'complete_artifact_audit_passed': False,
    'historical_preservation_complete': False, 'old_history_content_reverified': False}
gzwrite(E / 'artifact-expectations-v1.json.gz', expectations)
loaded, observed_missing = load(E / 'artifact-expectations-v1.json.gz', allow_unqualified=True)
assert loaded == prior | physical and observed_missing == current_missing
try:
    load(E / 'artifact-expectations-v1.json.gz')
except ValueError:
    pass
else:
    raise AssertionError('Incomplete history must require acknowledgement')
shutil.copyfile(V / 'control/resume-integration-v1/contract-v1.md', E / 'contract-v1.md')
review = {'integrated_revision': BASE, 'integration': integration, 'availability': availability,
    'user_report': 'Possibly, a reboot was performed.', 'missing_repository_paths_cause_established': False,
    'qualification': result, 'helper_correction': read(N / 'integration-helper-correction-v1.json'),
    'expected_maps_equal_independent_audit': True, 'new_physical_artifacts_verified': len(physical),
    'historical_preservation_complete': False, 'new_implementation_admission': False,
    'hypervoxel_deferred_by_user': True, 'full_plan_complete': False, 'pushed': False}
dump(E / 'review-v1.json', review)
ledger = O / 'docs/properties-status.json'
raw = ledger.read_bytes()
reference = git('show', '9025de62:docs/properties-status.json')
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
assert 'resume_integration' not in current
prefix = str(E.relative_to(O)) + '/'
current['resume_integration'] = {'status': 'committed history integrated; current availability gap recorded',
    'checkpoint': prefix + 'checkpoint-v1.json', 'review': prefix + 'review-v1.json',
    'artifact_expectations': prefix + 'artifact-expectations-v1.json.gz',
    'expectation_loader': prefix + 'load_expectations_v2.py', 'active_repository': str(O),
    'integrated_revision': BASE, 'original_worktree_integration_pending': False,
    'currently_unavailable_artifact_paths': len(current_missing), 'newly_unavailable_paths': len(delta_missing),
    'history_content_audit_complete': False, 'format_passed': True, 'readme_test_passes': 4,
    'quickstart_passed': True, 'cache_index_admitted': False, 'exact_ingress_admitted': False,
    'hypervoxel_deferred_by_user': True, 'full_plan_complete': False}
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
record.update({'status': 'integration verified; history incomplete', 'checkpoint_kind': 'resume integration',
    'previous_closure': str((P / 'checkpoint-v1.json').relative_to(O)),
    'previous_closure_sha256': sha(P / 'checkpoint-v1.json'), 'evidence_files_sha256': files,
    'artifact_expectations': prefix + 'artifact-expectations-v1.json.gz', 'artifact_expectations_schema': 4,
    'artifact_expectations_sha256': sha(E / 'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths': len(prior), 'inherited_missing_artifact_paths': len(missing),
    'currently_unavailable_artifact_paths': len(current_missing), 'newly_unavailable_artifact_paths': len(delta_missing),
    'new_physical_artifacts_verified': len(physical), 'ledger_before_sha256': hashlib.sha256(raw).hexdigest(),
    'ledger_after_sha256': sha(ledger), 'original_repository_updated': True,
    'original_worktree_integration_pending': False, 'active_repository': str(O),
    'historical_qualification_flags_inherited_from': str((P / 'checkpoint-v1.json').relative_to(O)),
    'qualification_this_checkpoint': ['workspace fmt', 'README default 2 tests', 'README all-feature 2 tests', 'README quickstart'],
    'readme_tests_rerun': True, 'readme_tests_passed': 4, 'new_implementation_admission': False,
    'historical_preservation_complete': False, 'complete_artifact_audit_passed': False,
    'hypervoxel_deferred_by_user': True, 'full_plan_complete': False})
dump(E / 'checkpoint-v1.json', record)
assert all(sha(p) == h for p, h in physical.items())
assert all(sha(O / p) == h for p, h in source.items() if p != 'docs/properties-status.json')
print(json.dumps({'new_physical_paths': len(physical), 'expected_paths': len(loaded),
    'currently_unavailable_paths': len(observed_missing), 'archive_members': len(members),
    'archive_bytes': archive.stat().st_size, 'evidence_files': len(files) + 1,
    'ledger_sha256': sha(ledger)}), flush=True)
