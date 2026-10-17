"""Correct a stale public-documentation claim and preserve the evidence chain."""
import ast
import difflib
import gzip
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

sys.dont_write_bytecode = True
W = Path(__file__).resolve().parent
ROOT = W.parents[2]
E = ROOT / 'docs/evidence/2026-10-17-readme-text-status'
P = ROOT / 'docs/evidence/2026-10-17-circle-support-reuse-index'
PREFIX = str(E.relative_to(ROOT)) + '/'
sys.path.insert(0, str(E.parent / '2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load


def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def read(path):
    return json.loads(Path(path).read_text())


def span(raw):
    start = re.search(rb'"current_work"\s*:\s*', raw).end()
    value, count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start, start + len(raw[start:].decode()[:count].encode()), value


def reserve():
    assert shutil.disk_usage(ROOT).free >= 512 * 1024**2


base = 'cf9ec88b232f751d0a299da20fcd50bfef7d9097'
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip() == base
subprocess.run(['git', 'diff', '--quiet'], cwd=ROOT, check=True)
subprocess.run(['git', 'diff', '--cached', '--quiet'], cwd=ROOT, check=True)
assert not E.exists()
reserve()
previous = read(P / 'checkpoint-v1.json')
assert all(sha(ROOT / p) == digest for p, digest in previous['evidence_files_sha256'].items())
prior, missing = load(ROOT / previous['artifact_expectations'], allow_unqualified=True)
assert len(prior) == 1232531 and len(missing) == 27093
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
for pins in [live, previous['extra_unchanged_inputs_sha256'], previous['live_source_dependency_pins_sha256']]:
    assert all(sha(ROOT / p) == digest for p, digest in pins.items())
review = read(P / 'readme-review-v1.json')
assert all(sha(ROOT / p) == digest for p, digest in review['source_inputs_sha256'].items())
readme = ROOT / 'readme.md'
before = readme.read_text()
old = '''Text and other legacy convenience operations still need their own typed-failure
migration. End-to-end provenance remains a separate open contract from these
operation-local certainty receipts.
'''
new = '''TrueType and Hershey text constructors also return typed failures; their
context variants retain operation-local certainty. End-to-end provenance
remains a separate open contract from these receipts.
'''
assert before.count(old) == 1
assert 'Both text constructors now return `Result`;' in before
source = (ROOT / 'src/curve/native.rs').read_text()
for name, result in [('truetype_text', 'Result<CurveRegion2, ValidationError>'),
                     ('hershey_strings', 'Result<Vec<CurveString2>, ValidationError>'),
                     ('truetype_text_with_context', 'Result<GeometryOutcome<CurveRegion2>, ValidationError>'),
                     ('hershey_strings_with_context', 'Result<GeometryOutcome<Vec<CurveString2>>, ValidationError>')]:
    signature = source.split('pub fn ' + name + '(', 1)[1].split('{', 1)[0]
    assert result in signature
    # This checks the reviewed public signature, not runtime error completeness.
after = before.replace(old, new)
patch = ''.join(difflib.unified_diff(before.splitlines(True), after.splitlines(True),
                                  fromfile='a/readme.md', tofile='b/readme.md'))
assert patch == (P / 'readme-text-correction.patch').read_text()
(W / 'readme-before.md').write_text(before)
(W / 'readme-after.md').write_text(after)
(W / 'readme.patch').write_text(patch)
readme.write_text(after)
E.mkdir()
for name in ['contract-v1.md', 'apply_v1.py', 'readme.patch']:
    shutil.copy2(W / name, E / name)
ledger = ROOT / 'docs/properties-status.json'
raw = ledger.read_bytes()
assert sha(ledger) == previous['ledger_after_sha256']
reference = subprocess.check_output(['git', 'show', '9025de62:docs/properties-status.json'], cwd=ROOT)
start, end, current = span(raw)
rs, re_, _ = span(reference)
assert (raw[:start], raw[end:]) == (reference[:rs], reference[re_:])
original_current = json.loads(json.dumps(current))
key = 'readme_text_status_correction'
current[key] = {'status': 'kept: contradictory text-migration summary corrected against current public signatures',
    'base_revision': base, 'contract': PREFIX + 'contract-v1.md', 'checkpoint': PREFIX + 'checkpoint-v1.json',
    'review': PREFIX + 'review-v1.json', 'artifact_expectations': PREFIX + 'artifact-expectations-v1.json.gz',
    'implementation_sha256': {'readme.md': sha(readme)},
    'scope': 'Documentation consistency only; no runtime, certainty, provenance or release capability added.',
    'runtime_tests_rerun': False, 'cache_index_admitted': False, 'full_plan_complete': False}
assert [k for k in original_current.keys() | current.keys() if original_current.get(k) != current.get(k)] == [key]
updated = raw[:start] + json.dumps(current, indent=2).encode() + raw[end:]
us, ue, _ = span(updated)
assert (updated[:us], updated[ue:]) == (reference[:rs], reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {
    k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
commands = []
for name, command in [('format', ['cargo', 'fmt', '--all', '--', '--check']),
                      ('whitespace', ['git', 'diff', '--check', '--', 'readme.md', 'docs/properties-status.json'])]:
    with (E / (name + '.stdout')).open('wb') as out, (E / (name + '.stderr')).open('wb') as err:
        done = subprocess.run(command, cwd=ROOT, stdout=out, stderr=err)
    commands.append({'command':command,'exit_code':done.returncode,
        'stdout_sha256':sha(E / (name + '.stdout')), 'stderr_sha256':sha(E / (name + '.stderr'))})
    assert done.returncode == 0
assert sha(readme) == sha(W / 'readme-after.md')
for p, digest in review['source_inputs_sha256'].items():
    if p != 'readme.md': assert sha(ROOT / p) == digest
assert all(sha(ROOT / p) == digest for p, digest in live.items() if p != 'readme.md')
assert all(sha(ROOT / p) == digest for pins in [previous['extra_unchanged_inputs_sha256'],
    previous['live_source_dependency_pins_sha256']] for p, digest in pins.items())
ast.parse(Path(__file__).read_text())
dump(E / 'review-v1.json', {'complete':True,'retention_decision':'kept','base_revision':base,
    'owner':'CSGRS public documentation','properties':['P6','P9','P37'],
    'previous_review':str((P/'readme-review-v1.json').relative_to(ROOT)),
    'previous_review_sha256':sha(P/'readme-review-v1.json'),
    'input_sha256':review['source_inputs_sha256'], 'readme_after_sha256':sha(readme),
    'changed_paragraphs':1,'public_signatures_reviewed':4,'api_source_and_existing_tests_unchanged':True,
    'commands':commands,'runtime_tests_rerun':False,
    'scope':'Corrects documentation consistency; retains the distinction between local certainty and open end-to-end provenance.',
    'whole_library_stops_preserved':True,'cache_index_admitted':False,'release_readiness_claimed':False,
    'full_plan_complete':False})
(E/'README.md').write_text('''# README text-status correction

The summary now agrees with the current Result-returning TrueType/Hershey APIs
and the README text section. Context variants retain operation-local certainty;
end-to-end provenance remains open. See the [patch](readme.patch),
[contract](contract-v1.md) and [review](review-v1.json).

Source/signature review, repository formatting and whitespace checks passed.
No Rust code or tests changed, and no runtime test rerun is claimed. The earlier
cache proposal remains unadmitted and both resource-stopped suites remain
incomplete. The [checkpoint](checkpoint-v1.json) preserves that state and the
inherited missing-artifact disclosure.
''')
physical = {}
for p in W.rglob('*'):
    if p.is_file():
        before_stat = p.stat();digest = sha(p);after_stat = p.stat()
        assert (before_stat.st_dev,before_stat.st_ino,before_stat.st_size,before_stat.st_mtime_ns,before_stat.st_ctime_ns) == (
            after_stat.st_dev,after_stat.st_ino,after_stat.st_size,after_stat.st_mtime_ns,after_stat.st_ctime_ns)
        physical[str(p)] = digest
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version':3,'kind':'documentation-only text status correction',
    'parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'physical_roots':[str(W)],'directory_inventory':[str(W)],'local_tool_symlink_targets':{},
    'expected_artifact_paths':len(prior)+len(physical),'inherited_artifacts_reverified':False,
    'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'Every new final physical path hashed independently; previous expectation chain retained without a whole-history re-audit.'}
with gzip.open(E/'artifact-expectations-v1.json.gz','wt') as stream:json.dump(expectations,stream,sort_keys=True)
files = {str(p.relative_to(ROOT)):sha(p) for p in E.rglob('*') if p.is_file()}
record = dict(previous)
record.update({'status':current[key]['status'],'checkpoint_kind':'kept documentation correction; runtime unchanged',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(ROOT)), 'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files, 'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{'readme.md':sha(readme)},
    'inherited_implementation_sha256':inherited,'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),
    'ledger_after_sha256':sha(ledger),'only_current_work_changed':True,'source_changes_applied':True,
    'production_rust_sources_unchanged':True,'documentation_retention_decision':'kept','runtime_tests_rerun':False,
    'full_library_qualification_complete':False,'format_exit_code':0,'whitespace_exit_code':0})
dump(E/'checkpoint-v1.json',record)
assert sum(p.stat().st_size for root in [W,E] for p in root.rglob('*') if p.is_file()) < 2*1024**2
reserve()
print(json.dumps({'documentation_kept':True,'new_physical_paths':len(physical),'evidence_files':len(files),
                  'runtime_changed':False,'cache_index_admitted':False,'only_current_work_changed':True}))
