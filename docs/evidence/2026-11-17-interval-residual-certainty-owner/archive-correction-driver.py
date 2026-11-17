from pathlib import Path
import gzip
import hashlib
import json
import os
import shutil
import signal
import subprocess
import time

base = Path('/tmp/interval-refactor')
review = base / 'residual-owner-review'
previous_stage = base / 'residual-owner-review-attempt-01'
prepared_path = base / 'residual-owner-archive-prepared.json'
previous = json.loads(prepared_path.read_text())
destination = Path('/mnt/development/csgrs-evidence') / previous['record']
watcher, parent = 3416600, 1621335


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def save(path, data):
    path.write_text(json.dumps(data, indent=2) + '\n')


def state(pid, start):
    raw = Path(f'/proc/{pid}/stat').read_text()
    fields = raw[raw.rfind(')') + 2:].split()
    assert fields[19] == start
    return fields[0]


assert not previous_stage.exists()
assert state(parent, '38218939') == 'T' and state(watcher, '45823480') == 'S'
assert subprocess.check_output(['git', '-C', '/mnt/development/csgrs-evidence', 'rev-parse', 'HEAD'], text=True).strip() == previous['previous_revision']
os.kill(watcher, signal.SIGSTOP)
try:
    assert state(watcher, '45823480') == state(parent, '38218939') == 'T'
    shutil.copytree(review, previous_stage)
    for row in previous['files_verified']:
        assert sha(previous_stage / row['path']) == row['sha256']
        assert sha(destination / row['path']) == row['sha256']
    attempt = review / 'archive-attempts/01-raw-log-whitespace'
    attempt.mkdir(parents=True)
    shutil.copy2(prepared_path, attempt / 'prepared-manifest.json')
    shutil.copy2(base / 'residual-owner-seal.log', attempt / 'seal-failure.log')
    shutil.copy2(previous_stage / 'README.md', attempt / 'README-before-correction.md')
    save(attempt / 'disposition.json', dict(archive_seal_exit_code=1,whitespace_check_exit_code=2,cause='Raw Rust/criterion/version stdout includes trailing blank lines. Source tests and the image-size failure are unchanged.',correction='Losslessly gzip command stdout/stderr and version output; preserve decoded source bytes and all old digests.',original_stage=str(previous_stage),source_data_changed=False))
    origins = json.loads((review / 'origins.json').read_text())
    changed = []
    for row in origins:
        file = review / row['destination']
        if file.suffix not in ['.stdout', '.stderr'] and not file.name.endswith('-version.txt'):
            continue
        assert row['encoding'] == 'identity' and sha(file) == row['source_sha256']
        data = file.read_bytes()
        output = file.with_name(file.name + '.gz')
        assert not output.exists()
        output.write_bytes(gzip.compress(data, compresslevel=1, mtime=0))
        assert gzip.decompress(output.read_bytes()) == data
        old_relative = row['destination']
        row.update(destination=output.relative_to(review).as_posix(), encoding='gzip', stored_sha256=sha(output))
        old_dest = destination / old_relative
        assert sha(old_dest) == hashlib.sha256(data).hexdigest()
        old_dest.unlink()
        file.unlink()
        changed.append(dict(old=old_relative, new=row['destination'], decoded_sha256=row['source_sha256']))
    assert changed
    save(review / 'origins.json', origins)
    save(attempt / 'lossless-reencoding.json', changed)
    shutil.copy2(Path(__file__), review / 'archive-correction-driver.py')
    with (review / 'README.md').open('a') as file:
        file.write('''
## Archive-format correction

The initial seal failed the unchanged whitespace check on raw command-output
blank lines. archive-attempts/01-raw-log-whitespace retains that failure and the
original prepared manifest. The original full staging snapshot is also retained
locally as residual-owner-review-attempt-01. Command stdout/stderr and version
outputs are now losslessly gzip encoded; origins.json maps the stored paths to
their original bytes and hashes. Source data, outcomes, cap failures and final
executables are unchanged. Restore these encoded outputs before replaying an
analysis driver that expects its original local paths. The whitespace validator
is unchanged, and the failed first seal is not credited as a pass.
''')
    manifest = []
    for file in sorted(review.rglob('*')):
        if not file.is_file():
            continue
        relative = file.relative_to(review).as_posix()
        digest = sha(file)
        manifest.append(dict(path=relative, bytes=file.stat().st_size, sha256=digest))
        target = destination / relative
        if target.exists() and sha(target) == digest:
            continue
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(file, target)
        assert sha(target) == digest
    assert {file.relative_to(destination).as_posix() for file in destination.rglob('*') if file.is_file()} == {row['path'] for row in manifest}
    save(prepared_path, dict(record=previous['record'], previous_revision=previous['previous_revision'], files=len(manifest), bytes=sum(row['bytes'] for row in manifest), files_verified=manifest, source_stages_frozen=True, original_failure_preserved=True, created=time.time()))
    with (base / 'residual-owner-seal-corrected.log').open('w') as log:
        subprocess.run(['python3', str(base / 'seal-residual-owner.py')], stdout=log, stderr=subprocess.STDOUT, check=True)
    print('Lossless output encoding verified; corrected archive sealed with original failure retained.')
finally:
    assert state(watcher, '45823480') == state(parent, '38218939') == 'T'
    os.kill(watcher, signal.SIGCONT)
    save(base / 'residual-owner-archive-correction-hold-released.json', dict(time=time.time(), watcher=watcher, original_horizon_reset=False))
