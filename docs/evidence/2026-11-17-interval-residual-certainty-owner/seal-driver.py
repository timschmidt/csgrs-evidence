from pathlib import Path
import hashlib
import json
import subprocess

r = Path('/mnt/development/csgrs')
e = Path('/mnt/development/csgrs-evidence')
prepared = json.loads(Path('/tmp/interval-refactor/residual-owner-archive-prepared.json').read_text())
record = prepared['record']
previous = prepared['previous_revision']


def git(*args):
    return subprocess.check_output(['git', '-C', str(e), *args])


assert git('rev-parse', 'HEAD').decode().strip() == previous
subprocess.run(['git', '-C', str(e), 'add', '--sparse', '--', record], check=True)
changed = git('diff', '--cached', '--name-only').decode().splitlines()
assert changed and all(name.startswith(record + '/') for name in changed)
assert not git('diff', '--name-only')
subprocess.run(['git', '-C', str(e), 'diff', '--cached', '--check'], check=True)
expected = {r['path']: r for r in prepared['files_verified']}
entries = []
tree = git('ls-files', '-s', '-z', '--', record)
for item in tree.split(b'\0'):
    if not item:
        continue
    info, path = item.split(b'\t', 1)
    mode, oid, stage = info.decode().split()
    assert stage == '0' and mode in ['100644', '100755']
    relative = path.decode()[len(record) + 1:]
    assert not relative.endswith('.crate')
    data = git('cat-file', 'blob', oid)
    digest = hashlib.sha256(data).hexdigest()
    assert len(data) == expected[relative]['bytes'] and digest == expected[relative]['sha256']
    entries.append((relative, digest, '-' if mode == '100644' else 'x', len(data)))
assert len(entries) == len(expected)
listing = hashlib.sha256()
for path, digest, mode, length in sorted(entries, key=lambda x: x[0].encode()):
    listing.update(f'{digest}  {mode}  {path}\n'.encode())
size = sum(row[3] for row in entries)
row = f'{record}\t{len(entries)}\t{size}\t{listing.hexdigest()}'
subprocess.run(['git', '-C', str(e), 'commit', '-m', 'Archive residual-certainty owner artifacts and trace allocation attribution'], check=True)
revision = git('rev-parse', 'HEAD').decode().strip()
assert not git('status', '--porcelain=v1')
assert git('diff', '--name-only', previous, revision).decode().splitlines() == changed
index = (r / 'docs/evidence-archive.tsv').read_bytes()
assert index == subprocess.check_output(['git', '-C', str(r), 'show', '0593e07d7b0ddba351b814866effb1fd5757a822:docs/evidence-archive.tsv'])
result = dict(revision=revision, previous_revision=previous, record=record, row=row, files=len(entries), bytes=size, sha256=listing.hexdigest(), previous_archive_paths_unchanged=True, previous_index_rows_preserved=True, all_scoped_git_blobs_verified=True, source_stages_frozen=True)
Path('/tmp/interval-refactor/residual-owner-archive.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
