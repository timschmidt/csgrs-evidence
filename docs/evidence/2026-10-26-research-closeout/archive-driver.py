from pathlib import Path
import gzip, hashlib, json, os, shutil, subprocess

raw=Path('/tmp/csgrs-research-2026-10-25/closeout')
decision=json.loads((raw/'validation-admission.json').read_text())
assert decision['all_required_checks_passed'] is True
assert decision['workflow_steps_covered']==129
assert decision['sources_unchanged'] is True
repo=Path('/tmp/csgrs-evidence-research-2026-10-25')
assert subprocess.check_output(['git','status','--porcelain'],cwd=repo,text=True)==''
assert subprocess.check_output(['git','branch','--show-current'],cwd=repo,text=True).strip()=='research-2026-10-25'
parent=subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip()
assert parent=='55d28790bdcf32b6454d34a2bfd5ed826f187d72'
record='docs/evidence/2026-10-26-research-closeout'
dest=repo/record
assert not dest.exists()
dest.mkdir(parents=True)
excluded, compressed, split = [], [], []

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
                             'kind': 'directory', 'reason': 'rebuildable compiler/cache data'})
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
        # Committed package source is identified by revision and digest, not
        # duplicated as another source tree. Keep Cargo's normalized metadata
        # and the generated external consumer and run outputs.
        package_source = 'temporary-consumers' in relative.parts and 'packages' in relative.parts
        package_metadata = path.name in ['Cargo.toml', 'Cargo.toml.orig', 'Cargo.lock', '.cargo_vcs_info.json']
        if package_source and not package_metadata:
            reason = 'first-party packaged source already committed; exact file digest retained; normalized package metadata and consumer artifacts preserved'
        if magic.startswith((b'\x7fELF', b'\x00asm', b'!<arch>\n')) or path.suffix == '.crate':
            reason = 'rebuildable compiled binary or third-party archive; source/commands/digest retained'
        if reason:
            excluded.append({'path': str(relative), 'bytes': path.stat().st_size,
                             'sha256': digest(path), 'reason': reason})
            continue
        target = dest / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        if path.stat().st_size > 32 * 1024**2:
            folder = target.with_name(target.name + '.parts')
            folder.mkdir()
            parts = []
            original = hashlib.sha256()
            with path.open('rb') as inp:
                while data := inp.read(32 * 1024**2):
                    original.update(data)
                    part = folder / f'part-{len(parts):04}'
                    part.write_bytes(data)
                    parts.append({'path': str(part.relative_to(dest)), 'bytes': len(data),
                                  'sha256': hashlib.sha256(data).hexdigest()})
            restored = hashlib.sha256()
            for part in parts:
                payload = dest / part['path']
                assert digest(payload) == part['sha256']
                with payload.open('rb') as inp:
                    while data := inp.read(1 << 20):
                        restored.update(data)
            assert restored.hexdigest() == original.hexdigest()
            split.append({'original_path': str(relative), 'original_bytes': path.stat().st_size,
                          'original_sha256': original.hexdigest(), 'parts': parts,
                          'round_trip_verified': True,
                          'restore': 'Concatenate listed parts in order to original_path. The original compressed trace stream is unchanged.'})
        elif path.suffix in ['.json', '.tsv', '.stdout', '.stderr', '.log', '.patch', '.profraw', '.profdata', '.html'] and path.stat().st_size > 1024**2:
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
(dest / 'SPLIT-ARTIFACTS.json').write_text(json.dumps(split, indent=2) + '\n')
(dest / 'ARCHIVE-EXCLUSIONS.json').write_text(json.dumps(excluded, indent=2) + '\n')
(dest / 'archive-driver.py').write_bytes(Path(__file__).read_bytes())
subprocess.run(['git','add','--sparse','--',record],cwd=repo,check=True)
subprocess.run(['git','commit','-q','-m','Archive completed research closeout validation'],cwd=repo,check=True)
commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo,text=True).strip()
changed=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',parent,commit],cwd=repo,text=True).splitlines()
assert changed and all(n.startswith(record+'/') for n in changed)
assert subprocess.check_output(['git','status','--porcelain'],cwd=repo,text=True)==''
meta={'record':record,'parent':parent,'commit':commit,'raw_source':str(raw),'excluded':excluded,'compressed':compressed,'split':split,'historical_records_unchanged':True,'files_added':len(changed),'published':False,'validation_admission':decision}
(raw.parent/'closeout-archive.json').write_text(json.dumps(meta,indent=2)+'\n')
print(json.dumps({k:v for k,v in meta.items() if k not in ['excluded','compressed','split','validation_admission']},indent=2))
