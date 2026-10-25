from pathlib import Path
import gzip
import hashlib
import json
import os
import shutil
import subprocess

raw = Path('/tmp/csgrs-research-2026-10-25/r16')
primary = raw / 'primary-validation-1792961380857273750'
assert json.loads((primary / 'completion.json').read_text()) == {
    'failed': None, 'sources_unchanged': True
}
decision = json.loads((raw / 'final-disposition.json').read_text())
assert decision['runtime_retained'] is False
assert decision['controlled_native_gate'] is False
assert json.loads((raw / 'post-document-checks/completion.json').read_text())['passed']
replay = json.loads((raw / 'graph-tree-replay-1792960066505108479/results.json').read_text())
assert len(replay) == 2 and all(r['matches'] and r['status'] == 0 for r in replay)
repo = Path('/tmp/csgrs-evidence-research-2026-10-25')
assert subprocess.check_output(['git', 'status', '--porcelain'], cwd=repo, text=True) == ''
assert subprocess.check_output(['git', 'branch', '--show-current'], cwd=repo, text=True).strip() == 'research-2026-10-25'
parent = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=repo, text=True).strip()
record = 'docs/evidence/2026-10-25-research-r16'
dest = repo / record
assert not dest.exists()
dest.mkdir(parents=True)
excluded, compressed = [], []


def digest(path):
    sha = hashlib.sha256()
    with path.open('rb') as inp:
        while data := inp.read(1 << 20):
            sha.update(data)
    return sha.hexdigest()


for directory, dirs, files in os.walk(raw):
    directory = Path(directory)
    for name in list(dirs):
        if name.startswith('target') or name in ['.git', '.ccache', '__pycache__']:
            excluded.append({'path': str((directory / name).relative_to(raw)),
                             'kind': 'directory', 'reason': 'rebuildable compiler target/cache'})
            dirs.remove(name)
    for name in files:
        path = directory / name
        relative = path.relative_to(raw)
        if path.is_symlink():
            target = dest / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.symlink_to(os.readlink(path))
            continue
        with path.open('rb') as inp:
            magic = inp.read(8)
        reason = None
        if magic.startswith((b'\x7fELF', b'\x00asm', b'!<arch>\n')) or path.suffix == '.crate':
            reason = 'rebuildable compiled binary or third-party archive; source/commands/digest retained'
        if relative.parts[0] == 'capture-full-real-1792956802844918019' and name in ['real-000000.json.gz', 'real-000001.json.gz']:
            index = int(name.split('-')[1].split('.')[0])
            reason = 'redundant unshared serialization; retained exact graph + generator reproduce original bytes, verified by graph-tree-replay-1792960066505108479/results.json'
            assert replay[index]['matches']
        if relative.parts[0] == 'graph-tree-replay-1792960066505108479' and name in ['graph-0.c', 'graph-1.c']:
            reason = 'deterministically generated emitter; exact graph, Python generator, compiler command/version and replay result retained'
        if reason:
            excluded.append({'path': str(relative), 'bytes': path.stat().st_size,
                             'sha256': digest(path), 'reason': reason})
            continue
        target = dest / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        is_graph = name.startswith('real-') and path.suffix == '.json'
        if is_graph or (path.suffix in ['.stderr', '.stdout'] and path.stat().st_size > 8 * 1024 * 1024):
            target = target.with_suffix(target.suffix + '.gz')
            with path.open('rb') as inp, target.open('wb') as out:
                with gzip.GzipFile(filename='', mode='wb', fileobj=out, mtime=0, compresslevel=6) as zipped:
                    shutil.copyfileobj(inp, zipped)
            original = digest(path)
            restored = hashlib.sha256()
            with gzip.open(target, 'rb') as inp:
                while data := inp.read(1 << 20):
                    restored.update(data)
            assert restored.hexdigest() == original
            compressed.append({'original_path': str(relative), 'archive_path': str(target.relative_to(dest)),
                               'original_bytes': path.stat().st_size, 'original_sha256': original,
                               'gzip_bytes': target.stat().st_size, 'gzip_sha256': digest(target),
                               'round_trip_verified': True})
        else:
            shutil.copy2(path, target)
(dest / 'COMPRESSED-ARTIFACTS.json').write_text(json.dumps(compressed, indent=2) + '\n')
(dest / 'ARCHIVE-EXCLUSIONS.json').write_text(json.dumps(excluded, indent=2) + '\n')
(dest / 'archive-driver.py').write_bytes(Path(__file__).read_bytes())
subprocess.run(['git', 'add', '--sparse', '--', record], cwd=repo, check=True)
subprocess.run(['git', 'commit', '-q', '-m', 'Archive R16 exact fiber captures and rejected quotient consumers'], cwd=repo, check=True)
commit = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=repo, text=True).strip()
changed = subprocess.check_output(['git', 'diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit], cwd=repo, text=True).splitlines()
assert changed and all(n.startswith(record + '/') for n in changed)
assert subprocess.check_output(['git', 'status', '--porcelain'], cwd=repo, text=True) == ''
meta = {'record': record, 'parent': parent, 'commit': commit, 'raw_source': str(raw),
        'excluded': excluded, 'compressed': compressed, 'historical_records_unchanged': True,
        'files_added': len(changed), 'published': False, 'primary_validation': str(primary)}
(raw.parent / 'r16-archive.json').write_text(json.dumps(meta, indent=2) + '\n')
print(json.dumps({k: v for k, v in meta.items() if k not in ['excluded', 'compressed']}, indent=2))
