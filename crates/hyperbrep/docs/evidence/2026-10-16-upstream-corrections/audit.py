"""Check local integration documentation and imported data before committing."""
import hashlib
import json
import re
import subprocess
import tempfile
from pathlib import Path

from check import OUT, ROOT, hashes


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)


def read(path):
    return json.loads(path.read_text())


pre = read(OUT / 'premerge.json')
assert git('rev-parse', 'HEAD').decode().strip() == pre['head']
assert git('rev-parse', 'MERGE_HEAD').decode().strip() == pre['upstream']
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
assert hashes() == read(OUT / 'final-source.json')
staged = git('diff', '--cached', '--name-only').decode().splitlines()
indexed = {}
for record in git('ls-files', '--stage', '-z').decode().split('\0'):
    if record:
        metadata, path = record.split('\t', 1)
        indexed[path] = metadata.split()[1]
upstream_blobs = {}
for record in git('ls-tree', '-r', '-z', pre['upstream']).decode().split('\0'):
    if record:
        metadata, path = record.split('\t', 1)
        upstream_blobs[path] = metadata.split()[2]
local = []
imported = []
automerged = []
for path in staged:
    if path.startswith('crates/hyperbrep/docs/') or path == 'docs/properties-status.json':
        local.append(path)
    elif path == 'readme.md':
        # The branch already added BREP links before these upstream edits.
        base = git('merge-base', pre['head'], pre['upstream']).decode().strip()
        with tempfile.TemporaryDirectory(prefix='brep-readme-merge-') as directory:
            files = []
            for name, revision in [('ours', pre['head']), ('base', base), ('theirs', pre['upstream'])]:
                target = Path(directory) / name
                target.write_bytes(git('show', revision + ':' + path))
                files.append(str(target))
            expected = subprocess.check_output(['git', 'merge-file', '-p', *files], cwd=ROOT)
        assert git('show', ':' + path) == expected
        automerged.append(dict(path=path, base=base, independently_recomputed=True))
    else:
        assert indexed[path] == upstream_blobs[path], path
        imported.append(path)
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger = read(ROOT / 'docs/properties-status.json')
upstream = json.loads(git('show', pre['upstream'] + ':docs/properties-status.json'))
for value in [ledger, upstream]:
    value['current_work'].pop('hyperbrep', None)
assert ledger == upstream
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert all(value in stashes for value in pre['stashes'])
links = []
for path in [ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', OUT / 'README.md', OUT / 'contract.md']:
    for label, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent / target.split('#')[0]
        if destination != OUT / 'audit.json':
            assert destination.exists(), (path, target)
        links.append(dict(document=str(path.relative_to(ROOT)), target=target))
command = ['git', 'diff', '--cached', '--check']
result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
paths = sorted({line.rsplit(':', 2)[0] for line in result.stdout.splitlines()
                if any(term in line for term in ['trailing whitespace.', 'space before tab in indent.', 'new blank line at EOF.'])})
preserved = []
for path in paths:
    if path in imported:
        assert path.startswith('docs/evidence/'), path
        assert indexed[path] == upstream_blobs[path]
        origin = 'upstream byte-for-byte'
    else:
        assert (ROOT / path).is_relative_to(OUT) and path.endswith(('.log', '.patch')), path
        origin = 'local raw command log'
    preserved.append(dict(path=path, origin=origin,
                          sha256=hashlib.sha256((ROOT / path).read_bytes()).hexdigest()))
scoped_command = [*command, '--', '.', *[':(exclude)' + path for path in paths]]
scoped = subprocess.run(scoped_command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check')
for path in OUT.rglob('*.json'):
    read(path)
report = dict(
    parents=[pre['head'], pre['upstream']], source_matches_final=True,
    imported_paths=imported, local_paths=local, automatic_merges=automerged,
    imported_paths_equal_upstream=True, unrelated_property_ledger_preserved=True,
    preserved_stashes=pre['stashes'], work_package_gates_open=28, links=links,
    unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                 diagnostics=result.stdout, preserved_raw_data=preserved),
    code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
    limits='Local file-link existence and JSON checks, not remote URL/anchor verification or whole-repository release/pre-push admission.',
)
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(dict(imported_paths=len(imported), local_paths=len(local), automatic_merges=len(automerged), raw_data_paths=len(paths),
                      code_documentation_whitespace_exit=scoped.returncode)))
