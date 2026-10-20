"""Audit the preserved fixture change and retain the final format/spelling runs."""
from collections import Counter
from pathlib import Path
import gzip
import hashlib
import json
import re
import shutil
import subprocess
import tempfile

ROOT = Path('/mnt/development/csgrs')
OUT = Path('/tmp/hyperbrep-prepush-20261018')
DEST = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-18-prepush-fixtures'


def digest(path):
    return hashlib.file_digest(path.open('rb'), 'sha256').hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def pack(source, destination):
    with source.open('rb') as inp, destination.open('wb') as out:
        with gzip.GzipFile(fileobj=out, mode='wb', filename='', mtime=0, compresslevel=6) as zipped:
            shutil.copyfileobj(inp, zipped)
    return dict(path=str(destination.relative_to(DEST)), sha256=digest(destination),
                uncompressed_sha256=digest(source), uncompressed_bytes=source.stat().st_size)


def check_packed(record):
    path = DEST / record['path']
    assert digest(path) == record['sha256'], path
    with gzip.open(path, 'rb') as inp:
        raw = inp.read()
    assert hashlib.sha256(raw).hexdigest() == record['uncompressed_sha256'], path
    assert len(raw) == record['uncompressed_bytes'], path


manifest = json.loads((DEST / 'manifest.json').read_text())
for path, entry in manifest['evidence'].items():
    file = DEST / path
    assert digest(file) == entry['sha256'], file
    assert file.stat().st_size == entry['bytes'], file
for group in ['source_files', 'documentation']:
    for path, expected in manifest[group].items():
        assert digest(ROOT / path) == expected, path
raw_patch_path = DEST / 'source.patch'
if raw_patch_path.exists():
    source_patch = raw_patch_path.read_bytes()
else:
    check_packed(manifest['source_patch'])
    source_patch = gzip.decompress((DEST / manifest['source_patch']['path']).read_bytes())
assert hashlib.sha256(source_patch).hexdigest() == manifest['source_patch_sha256']

checks = json.loads((DEST / 'checks.json').read_text())
packed_count = 0
for check in checks:
    for key in ['retained_log', 'retained_source_patch']:
        if key in check:
            check_packed(check[key])
            packed_count += 1
for check in json.loads((DEST / 'interrupted-diagnostics.json').read_text()):
    check_packed(check['log'])
    packed_count += 1

added_files = []
with tempfile.TemporaryDirectory(prefix='fixture-source-replay-', dir=ROOT / 'target') as temp:
    replay = Path(temp)
    for path in manifest['source_files']:
        original = subprocess.run(['git', 'show', manifest['base_revision'] + ':' + path],
                                  cwd=ROOT, capture_output=True)
        if original.returncode:
            assert original.returncode == 128 and (
                b'does not exist in' in original.stderr or b'but not in' in original.stderr
            ), original.stderr
            added_files.append(path)
            continue
        target = replay / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(original.stdout)
    patched = subprocess.run(['patch', '-p1', '--batch', '--fuzz=0'],
                             cwd=replay, input=source_patch.decode(),
                             capture_output=True, text=True, check=True)
    assert 'offset' not in patched.stdout and 'fuzz' not in patched.stdout, patched.stdout
    for path, expected in manifest['source_files'].items():
        assert digest(replay / path) == expected, path

pattern = re.compile(r'^error: ([^\n]+)\n\s*╭▸ (.+?):(\d+):(\d+)', re.M)
spelling = {}
for label in ['upstream-spelling', 'fixture-final-spelling']:
    log = (OUT / (label + '.log')).read_text()
    matches = pattern.findall(log)
    assert len(matches) == len(re.findall(r'^error: ', log, re.M))
    spelling[label] = Counter(matches)
extra = spelling['fixture-final-spelling'] - spelling['upstream-spelling']
removed = spelling['upstream-spelling'] - spelling['fixture-final-spelling']
assert not extra and not removed, (extra, removed)
assert sum(spelling['upstream-spelling'].values()) == 188020
attribution = dict(upstream_label='upstream-spelling', branch_label='fixture-final-spelling',
                   match_key=['diagnostic', 'path', 'line', 'column'],
                   upstream_findings=188020, branch_findings=188020,
                   additional_findings=[], removed_findings=[], gate_passed=False)
write_json(DEST / 'final-spelling-attribution.json', attribution)

rows = {r['label']: r for r in json.loads((OUT / 'results.json').read_text())}
final_checks = []
for label, expected_exit in [('fixture-final-format', 0), ('fixture-final-spelling', 2)]:
    row = dict(rows[label])
    assert row['exit_code'] == expected_exit
    log = Path(row.pop('log'))
    assert digest(log) == row.pop('log_sha256')
    row['retained_log'] = pack(log, DEST / 'logs' / (label + '.log.gz'))
    patch = Path(row.pop('source_patch'))
    assert digest(patch) == row.pop('source_patch_sha256')
    row['retained_source_patch'] = pack(patch, DEST / 'patches' / (label + '.patch.gz'))
    row['effective_base_revision'] = manifest['base_revision']
    row['source_role'] = 'branch working tree after final Rust edits'
    check_packed(row['retained_log'])
    check_packed(row['retained_source_patch'])
    final_checks.append(row)
write_json(DEST / 'final-checks.json', final_checks)

summary = json.loads((DEST / 'summary.json').read_text())
summary['validation']['final_format_check'] = 'cargo fmt --all -- --check passes after final Rust edits.'
summary['validation']['final_spelling_attribution'] = 'The final whole-repository run has exactly the same 188020 diagnostics as the pinned upstream run, matched by message, path, line and column. The required gate remains failing.'
write_json(DEST / 'summary.json', summary)
audit = dict(source_patch_replay='Exact reconstruction from recorded base; patch --fuzz=0; no offsets.',
             source_files_verified=len(manifest['source_files']), added_files=added_files,
             documentation_files_verified=len(manifest['documentation']),
             prior_evidence_artifacts_verified=len(manifest['evidence']),
             prior_gzip_records_verified=packed_count,
             final_gzip_records_verified=4, final_spelling_attribution=attribution,
             semantic_scope='Artifact integrity and source reconstruction; this audit does not establish whole-workspace correctness or complete pre-push admission.',
             full_pre_push_complete=False, publication_qualified=False)
write_json(DEST / 'final-audit.json', audit)
if raw_patch_path.exists():
    manifest['source_patch'] = pack(raw_patch_path, DEST / 'source.patch.gz')
    check_packed(manifest['source_patch'])
    assert manifest['source_patch']['uncompressed_sha256'] == manifest['source_patch_sha256']
    # Preserve the exact patch bytes without introducing patch-context spaces
    # as trailing whitespace in a newly tracked text artifact.
    shutil.copyfile(raw_patch_path, OUT / 'fixture-final-source.patch')
    raw_patch_path.unlink()
shutil.copyfile(Path(__file__), DEST / 'finalize_fixture_evidence.py')
manifest['evidence'] = {
    str(path.relative_to(DEST)): dict(sha256=digest(path), bytes=path.stat().st_size)
    for path in sorted(DEST.rglob('*')) if path.is_file() and path.name != 'manifest.json'
}
write_json(DEST / 'manifest.json', manifest)
for path, entry in manifest['evidence'].items():
    assert digest(DEST / path) == entry['sha256'], path
print(json.dumps(audit, indent=2))
