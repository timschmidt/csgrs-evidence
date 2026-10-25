from pathlib import Path
import hashlib, json, os, shutil, subprocess

root = Path('/home/tim/Documents/GitHub/workspace/csgrs')
raw = Path(__file__).resolve().parent
result = json.loads((raw / 'full-final/result.json').read_text())
assert result['exit_code'] == 0, result
destination = Path('/tmp/csgrs-evidence-research-2026-10-25/docs/evidence/2026-10-25-research-r08')
assert not destination.exists(), destination

# Store the cumulative unpublished source changes needed on the pinned HEAD.
# Archive/ledger commit references are intentionally outside this source patch.
source = raw / 'accepted-source'
source.mkdir(exist_ok=True)
patch = subprocess.check_output(['git', 'diff', '--binary', '--', 'src', 'crates', 'tests', 'benchmarks', 'scripts', 'Cargo.toml', 'Cargo.lock', 'docs/MIGRATIONS.md'], cwd=root)
(source / 'source.patch').write_bytes(patch)
new = subprocess.check_output(['git', 'ls-files', '--others', '--exclude-standard', '--', 'src', 'crates', 'tests', 'benchmarks', 'scripts'], cwd=root, text=True).splitlines()
for name in new:
    target = source / 'new' / name
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(root / name, target)
(source / 'source.json').write_text(json.dumps({
    'revision': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=root, text=True).strip(),
    'patch_sha256': hashlib.sha256(patch).hexdigest(),
    'new_files': {name: hashlib.sha256((root / name).read_bytes()).hexdigest() for name in new},
    'lock_sha256': hashlib.sha256((root / 'Cargo.lock').read_bytes()).hexdigest(),
    'compiler': subprocess.check_output(['rustc', '-Vv'], text=True),
}, indent=2) + '\n')

excluded = []
files = []
for parent, directories, names in os.walk(raw):
    directories[:] = sorted(d for d in directories if d not in {'target', 'hypercircuit-target', '__pycache__'})
    for name in sorted(names):
        path = Path(parent) / name
        relative = path.relative_to(raw)
        data = path.read_bytes()
        reason = None
        if data[:4] == b'\x7fELF':
            reason = 'build artifact; commands, compiler, source and binary digest retained'
        elif name.endswith('.rs.before'):
            reason = 'unchanged source recoverable from pinned revision and prior-source.patch'
        if reason:
            excluded.append({'path': str(relative), 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(), 'reason': reason})
        else:
            files.append((path, relative))
destination.mkdir(parents=True)
for path, relative in files:
    target = destination / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(path, target)
(destination / 'excluded-files.json').write_text(json.dumps({'build_directories_omitted': ['**/target', 'hypercircuit-target', '**/__pycache__'], 'files': excluded}, indent=2) + '\n')
print(json.dumps({'destination': str(destination), 'copied_files': len(files), 'excluded_files': len(excluded), 'copied_bytes': sum(path.stat().st_size for path, _ in files)}, indent=2))
