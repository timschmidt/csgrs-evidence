"""Audit source identity, all observed failures, inputs and unchanged owners."""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from check import OUT, ROOT, hashes

sha = lambda data: hashlib.sha256(data).hexdigest()
digest = lambda p: sha(p.read_bytes())
read = lambda name: json.loads((OUT/name).read_text())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
manifest = read('manifest.json')
assert git('rev-parse', 'HEAD').decode().strip() == manifest['baseline']
assert git('branch', '--show-current').strip() == b'brep'
assert git('rev-parse', 'origin/main').decode().strip() == manifest['upstream']
source = hashes()
assert source == read('baseline.json')['source'] == read('reproduction.json')['source'] == read('frontier.json')['source']
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
for name, h in manifest['evidence_files'].items():
    assert digest(OUT/name) == h, name
for name, h in manifest['documents'].items():
    assert digest(ROOT/name) == h, name
for name, h in read('baseline.json')['fixtures'].items():
    assert digest(ROOT/name) == h, name
for name in ['AGENTS.md', 'properties.md', 'docs/admission.md', 'docs/properties-status.json']:
    assert (ROOT/name).read_bytes() == git('show', manifest['baseline']+':'+name), name
previous = OUT.parent/'2026-10-17-prism-admission-cost/final-source.json'
qualified_source = json.loads(previous.read_text())
prefix = str(OUT.relative_to(ROOT))+'/'
old_prefix = str(previous.parent.relative_to(ROOT))+'/'
for name, h in source.items():
    if not name.startswith(prefix):
        assert qualified_source[name] == h, name
assert all(name in source or name.startswith(old_prefix) for name in qualified_source)
attempts = read('attempts.json')
assert len(attempts) == 10 and all(row['exit_code'] == 0 and row['source_unchanged'] for row in attempts)
assert all(read(row['source']) == source for row in attempts)
assert all(row['exit_code'] == 0 for row in read('setup.json'))
repro = read('reproduction.json')
assert repro['completed'] and len(repro['cases']) == 7
assert all(row['exit_code'] == row['resources']['exit_code'] == 0 for row in repro['cases'])
assert read('frontier.json')['counts'] == dict(native_result=1, unsupported=6)
assert sum(row['construction'] == 'unsupported' for row in read('frontier.json')['rows']) == 6
frozen = read('baseline-binary.json')
assert digest(Path(frozen['path'])) == frozen['sha256'] and Path(frozen['path']).stat().st_size == frozen['bytes']
sampler = previous.parent/'final-review/measure.py'
assert digest(sampler) == repro['sampler_sha256']
archive = read('source-reconstruction.json')
assert archive['baseline'] == manifest['baseline'] and digest(OUT/archive['archive']) == archive['archive_sha256']
with tarfile.open(OUT/archive['archive'], 'r:gz') as packed:
    contents = {item.name: packed.extractfile(item).read() for item in packed.getmembers()}
assert {name: sha(data) for name, data in contents.items()} == archive['members']
cache = {}
for row in archive['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot = read(row['snapshot'])
    assert set(snapshot) == set(row['baseline_files']) | set(row['overlay_files'])
    for name, h in snapshot.items():
        if name in row['overlay_files']:
            data = contents[row['overlay_files'][name]]
        else:
            if name not in cache:
                cache[name] = git('show', manifest['baseline']+':'+name)
            data = cache[name]
        assert sha(data) == h, name
status = json.loads((ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json').read_text())
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
assert status['increments'][-1]['kind'] == 'diagnostic'
assert status['increments'][-1]['id'] == 'retained-region-extrusion-frontier-2026-10-17'
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(git('stash', 'list', '--format=%H').decode().splitlines())
for name in git('diff', 'HEAD', '--name-only').decode().splitlines():
    assert name.startswith(prefix) or name in manifest['documents'], name
links = []
for path in [ROOT/name for name in manifest['documents'] if name.endswith('.md')] + list(OUT.glob('*.md')):
    for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        assert (path.parent/target.split('#')[0]).exists() or target == 'audit.json', (path, target)
        links.append((str(path.relative_to(ROOT)), target))
for path in OUT.rglob('*.json'):
    json.loads(path.read_text())
for path in OUT.rglob('*.py'):
    ast.parse(path.read_text(), filename=str(path))
check = subprocess.run(['git', 'diff', '--cached', '--check'], cwd=ROOT, text=True, capture_output=True)
diagnostics = [match.groups() for line in check.stdout.splitlines()
               if (match := re.match(r'^(.+):(\d+): (.*)$', line))]
raw = sorted({row[0] for row in diagnostics})
assert all((ROOT/name).is_relative_to(OUT) and Path(name).suffix == '.log' for name in raw), check.stdout
scoped = subprocess.run(['git', 'diff', '--cached', '--check', '--', '.', *[':(exclude)'+name for name in raw]], cwd=ROOT, text=True, capture_output=True)
assert scoped.returncode == 0 and not git('diff', '--check'), scoped.stdout
assert hashes() == source
result = dict(passed=True, baseline=manifest['baseline'], upstream=manifest['upstream'],
    source_identity=manifest['source_identity'], evidence_files=len(manifest['evidence_files']),
    source_snapshots=len(archive['sources']), overlay_members=len(contents), diagnostics=7,
    native_controls=1, unsupported=6, runtime_and_dependencies_unchanged=True,
    shared_ledger_unchanged=True, protected_stashes_preserved=True, work_packages_open=28,
    local_links=len(links), raw_whitespace=dict(exit_code=check.returncode, diagnostics=check.stdout,
        retained_raw_files=raw, scoped_exit_code=scoped.returncode), scope=manifest['scope'])
(OUT/'audit.json').write_text(json.dumps(result, indent=2)+'\n')
print(json.dumps({k: v for k, v in result.items() if k != 'raw_whitespace'}, indent=2), flush=True)
