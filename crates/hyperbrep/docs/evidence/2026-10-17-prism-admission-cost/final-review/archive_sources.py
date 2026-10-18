"""Compress preserved candidate overlays and audit their reconstruction coverage.

Run after all source-bound checks. This retains every byte of every overlay;
missing early candidate files are reported instead of reconstructed by guesswork.
"""
import gzip
import hashlib
import io
import json
import shutil
import subprocess
import tarfile

from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

BASELINE = 'c170bfa22cb4a0ce4d6e8ce5dcccda942dec49e7'
archive = OUT / 'source-overlays.tar.gz'
assert not archive.exists()
source = hashes()
directories = sorted(OUT.glob('overlay-*'))
files = [path for directory in directories for path in sorted(directory.rglob('*')) if path.is_file()]
contents = {str(path.relative_to(OUT)): path.read_bytes() for path in files}
with archive.open('wb') as raw, gzip.GzipFile(filename='', fileobj=raw, mode='wb', mtime=0) as compressed:
    with tarfile.open(fileobj=compressed, mode='w') as packed:
        for name, data in contents.items():
            info = tarfile.TarInfo(name)
            info.size = len(data)
            info.mode = 0o644
            packed.addfile(info, io.BytesIO(data))
with tarfile.open(archive, 'r:gz') as packed:
    restored = {item.name: packed.extractfile(item).read() for item in packed.getmembers()}
assert restored == contents

digest = lambda data: hashlib.sha256(data).hexdigest()
available = {}
for name, data in contents.items():
    relative = name.split('/', 1)[1]
    available.setdefault((relative, digest(data)), name)
baseline_cache = {}
records = []
for snapshot in sorted(OUT.glob('source-*.json')):
    expected = json.loads(snapshot.read_text())
    unchanged = []
    overlay = {}
    missing = {}
    for relative, expected_hash in expected.items():
        key = (relative, expected_hash)
        if key in available:
            overlay[relative] = available[key]
            continue
        if relative not in baseline_cache:
            result = subprocess.run(['git', 'show', f'{BASELINE}:{relative}'], cwd=ROOT,
                                    stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
            baseline_cache[relative] = digest(result.stdout) if result.returncode == 0 else None
        if baseline_cache[relative] == expected_hash:
            unchanged.append(relative)
        else:
            missing[relative] = expected_hash
    records.append(dict(snapshot=snapshot.name, files=len(expected),
                        baseline_files=unchanged, overlay_files=overlay,
                        missing_files=missing, completely_reconstructible=not missing))
report = dict(baseline=BASELINE, archive=archive.name,
              archive_sha256=digest(archive.read_bytes()),
              archive_bytes=archive.stat().st_size,
              uncompressed_bytes=sum(len(data) for data in contents.values()),
              members={name: digest(data) for name, data in contents.items()},
              sources=records,
              reconstruction='Start from the pinned baseline. For each overlay_files entry, read the named tar member and write it to the corresponding repository-relative path. Verify every file against the named source snapshot before running its recorded command. Do not guess any missing source bytes. Coverage is reported separately for every snapshot, including failed candidates.',
              limitations='External diagnostic .rs.txt inputs and WASM manifests are retained separately; historical /tmp path locations require local setup, not a shipped package.')
(OUT / 'source-reconstruction.json').write_text(json.dumps(report, indent=2) + '\n')
assert all(row['completely_reconstructible'] for row in records), records
assert hashes() == source
for directory in directories:
    shutil.rmtree(directory)
print(json.dumps(dict(sources=len(records), members=len(contents), archive_bytes=archive.stat().st_size,
                      incomplete=[dict(snapshot=row['snapshot'], missing=row['missing_files'])
                                  for row in records if row['missing_files']]), indent=2))
