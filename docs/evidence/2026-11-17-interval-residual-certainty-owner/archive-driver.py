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
owner = base / 'residual-certainty-owner'
attribution = base / 'residual-trace-allocation-attribution'
proposal = base / 'residual-certainty-owner-size-proposal'
evidence = Path('/mnt/development/csgrs-evidence')
record = 'docs/evidence/2026-11-17-interval-residual-certainty-owner'
destination = evidence / record
previous = 'db4865f495af7e3c0ee640cea890e6edca344d5a'
watcher, parent = 3416600, 1621335


def read(path):
    return json.loads(path.read_text())


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def state(pid, start):
    raw = Path(f'/proc/{pid}/stat').read_text()
    fields = raw[raw.rfind(')') + 2:].split()
    assert fields[19] == start
    return fields[0]


assert read(owner / 'owner-completion.json')['exit_code'] == 0
assert read(review / 'verification.json')['artifacts'] == 35
assert read(attribution / 'attribution-completion.json')['exit_code'] == 0
assert read(attribution / 'verification.json')['processes'] == 108
assert read(proposal / 'proposal.json')['adopted'] is False
assert state(parent, '38218939') == 'T' and state(watcher, '45823480') == 'S'
assert not Path('/proc/3790860').exists()
assert subprocess.check_output(['git', '-C', str(evidence), 'rev-parse', 'HEAD'], text=True).strip() == previous
assert not subprocess.check_output(['git', '-C', str(evidence), 'status', '--porcelain=v1'])
assert not destination.exists()
os.kill(watcher, signal.SIGSTOP)
origins = []
try:
    assert state(watcher, '45823480') == state(parent, '38218939') == 'T'
    save(review / 'archive-hold.json', dict(time=time.time(), watcher=watcher, parent=parent, original_horizon_reset=False, scope='Finite compression, archive Git verification and local commit; restore original watcher in finally.'))
    for label, stage in [('owner-campaign', owner), ('trace-attribution', attribution), ('separate-file-proposal', proposal)]:
        for source in sorted(stage.rglob('*')):
            if not source.is_file() or '__pycache__' in source.parts:
                continue
            relative = Path(label) / source.relative_to(stage)
            output = review / relative
            assert not output.exists()
            output.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, output)
            assert sha(source) == sha(output)
            origins.append(dict(source=str(source), source_bytes=source.stat().st_size, source_sha256=sha(source), destination=relative.as_posix(), encoding='identity', stored_sha256=sha(output)))
    for row in read(owner / 'owner-builds.json'):
        source = Path(row['size']['path'])
        assert sha(source) == row['size']['sha256']
        output = review / 'final-images' / (source.name + '.gz')
        assert not output.exists()
        output.parent.mkdir(exist_ok=True)
        data = source.read_bytes()
        output.write_bytes(gzip.compress(data, compresslevel=1, mtime=0))
        assert gzip.decompress(output.read_bytes()) == data
        origins.append(dict(source=str(source), source_bytes=len(data), source_sha256=sha(source), source_mode=oct(source.stat().st_mode & 0o777), destination=output.relative_to(review).as_posix(), encoding='gzip', stored_sha256=sha(output)))
    save(review / 'origins.json', origins)
    shutil.copy2(Path(__file__), review / 'archive-driver.py')
    shutil.copy2(base / 'seal-residual-owner.py', review / 'seal-driver.py')
    (review / 'README.md').write_text('''# Residual-certainty owner artifacts and allocation attribution

Primary documentation baseline 0593e07d7b0ddba351b814866effb1fd5757a822;
isolated unaccepted repair aad7409a5928e309812d9a5cc361d46313685266;
fixed c9f1f9ac55216b762e9eb97672de1e66f3b8a3fb, measured current
4192d8c726d3333a31cb7eddc30cc0d464d61411.

owner-campaign retains 35 final images' original measurements, full release
functional logs, Cargo profiles/artifact records, source snapshots, symbol and
section listings, Clippy and formatting. All 5,264 functional controls pass.
Six retained-fuzz images have metadata-only startup, not corpus execution.
The no-default unit file's original 15,456-byte incremental-cap failure is
preserved. No failing account is relabeled as an original pass.

final-images stores every final executable losslessly gzip encoded. Decode the
named member and apply its recorded source_mode before executing it. origins.json
records original/stored hashes and bytes. Raw textual campaign records remain
unchanged. No third-party registry cache or source archive is redistributed.

separate-file-proposal preserves a distinct, unadopted proposal for that one
file metric's incremental cap; the cumulative budget and other caps do not
change. It is not an amendment to the original campaign or accepted ledger.

trace-attribution contains a glibc-host diagnostic interposer, original-image
hashes, 108 complete process records, allocation stacks and symbol resolutions.
Forty-eight interposed active processes tie the observed 632-byte difference
to trace-collection B-tree nodes in one exact-zero warm rebuilt-input case.
Plain processes reproduce both allocation states on each original binary;
passive controls are constant. This is not universal attribution, unchanged
resource measurement, a timing result or permission to remove prior charges.
The original images remain independently archived in resource evidence commit
d62cded53e3df97f5c77ada6a040df93cda848c0. The provenance collector's initial
metadata-field error is retained separately from its corrected verification.

All source stages represented by this snapshot are now frozen. The quiet queue
and finite watcher retain their original identities, horizon and commands;
archive-hold release and local commit receipts live in the parent resume record.
Source adoption, memory allowances, runtime, complete consumer capacity,
cancellation/retry and combined composition remain open. No push.
''')
    manifest = [dict(path=file.relative_to(review).as_posix(), bytes=file.stat().st_size, sha256=sha(file)) for file in sorted(review.rglob('*')) if file.is_file()]
    total = sum(row['bytes'] for row in manifest)
    assert shutil.disk_usage(evidence).free - 2 * total - (20 << 20) >= 20 * 1024**3, 'Insufficient reserved room for working archive and Git objects'
    shutil.copytree(review, destination)
    for row in manifest:
        file = destination / row['path']
        assert file.stat().st_size == row['bytes'] and sha(file) == row['sha256']
    save(base / 'residual-owner-archive-prepared.json', dict(record=record, previous_revision=previous, files=len(manifest), bytes=total, files_verified=manifest, source_stages_frozen=True, created=time.time()))
    print(json.dumps(dict(record=record, files=len(manifest), bytes=total), indent=2), flush=True)
    with (base / 'residual-owner-seal.log').open('w') as log:
        subprocess.run(['python3', str(base / 'seal-residual-owner.py')], stdout=log, stderr=subprocess.STDOUT, check=True)
    print('Archive Git objects verified and committed.', flush=True)
finally:
    assert state(watcher, '45823480') == state(parent, '38218939') == 'T'
    os.kill(watcher, signal.SIGCONT)
    save(base / 'residual-owner-archive-hold-released.json', dict(time=time.time(), watcher=watcher, original_horizon_reset=False))
