"""Preserve qualified patch bytes without adding patch-context whitespace to Git."""
from pathlib import Path
import gzip
import hashlib
import json
import shutil
import subprocess
import time

ROOT = Path('/mnt/development/csgrs/target/hyperbrep-development')
DEST = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-18-selected-surface-patches'
OUT = Path('/tmp/hyperbrep-selected-patches-20261018')
sha = lambda data: hashlib.sha256(data).hexdigest()

started = time.monotonic()
command = ['git', 'diff', '--cached', '--check']
result = subprocess.run(command, cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
assert result.returncode == 2, result.stdout
assert result.stdout.decode().count('trailing whitespace.') == 2, result.stdout
log = DEST / 'final-checks/staged-diff-before-packaging.log.gz'
assert not log.exists()
log.write_bytes(gzip.compress(result.stdout, mtime=0))
checks_path = DEST / 'final-checks.json'
checks = json.loads(checks_path.read_text())
checks['checks'].append(dict(label='staged-diff-before-packaging', command=command,
    elapsed_seconds=time.monotonic() - started, exit_code=result.returncode,
    log=str(log.relative_to(DEST)), log_sha256=sha(log.read_bytes()),
    log_encoding='gzip', decoded_log_sha256=sha(result.stdout),
    disposition='Corrected by storing the unchanged source patch as gzip; no check or production input changed.'))
checks_path.write_text(json.dumps(checks, indent=2) + '\n')

patch = DEST / 'qualified-source.patch'
archive = DEST / 'qualified-source.patch.gz'
raw = patch.read_bytes()
qualified_path = DEST / 'qualification-summary.json'
qualified = json.loads(qualified_path.read_text())
assert sha(raw) == qualified['qualified_source_sha256']
assert not archive.exists()
archive.write_bytes(gzip.compress(raw, mtime=0))
assert gzip.decompress(archive.read_bytes()) == raw
patch.unlink()
qualified['qualified_source_archive'] = archive.name
qualified['qualified_source_hash_scope'] = 'Exact decompressed patch bytes; unchanged from qualification.'
qualified_path.write_text(json.dumps(qualified, indent=2) + '\n')

readme_path = DEST / 'README.md'
readme = readme_path.read_text()
readme += ('\nThe [qualified source patch](qualified-source.patch.gz) preserves the executed\n'
    'source snapshot byte-for-byte in gzip form. Decompress it before applying it;\n'
    '`qualified_source_sha256` in the qualification summary hashes the decompressed\n'
    'bytes. This packaging avoids treating blank patch-context markers as source\n'
    'whitespace. The original staged-check failure remains in the final-check record.\n')
readme_path.write_text(readme)
attempt_path = DEST / 'attempt-review.md'
attempt_path.write_text(attempt_path.read_text() +
    '\n- The staged whitespace check flagged two blank context lines in the saved\n'
    '  unified source patch. Gzip storage preserves every qualified patch byte;\n'
    '  decompressed SHA-256 equality was verified. Runtime source and fixtures\n'
    '  are unchanged, and the original failing check remains recorded.\n')

writer_path = OUT / 'write_manifest.py'
old_writer = writer_path.read_text()
shutil.copy2(writer_path, OUT / 'write_manifest-before-source-compression.py')
needle = 'Recreate the base revision, apply qualified-source.patch, and verify candidate-source.json.'
assert old_writer.count(needle) == 1
writer_path.write_text(old_writer.replace(needle,
    'Recreate the base revision, decompress qualified-source.patch.gz, apply the resulting patch, and verify candidate-source.json.'))
shutil.copy2(Path(__file__), DEST / 'source-patch-packaging.py')
record = dict(original_bytes=len(raw), original_sha256=sha(raw),
    compressed_bytes=archive.stat().st_size, compressed_sha256=sha(archive.read_bytes()),
    decompressed_bytes_equal=True, code_or_fixture_changes=False,
    reason='Two unified-diff blank context markers fail the staged whitespace check when stored as added text.')
(DEST / 'source-patch-packaging.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record, indent=2))
