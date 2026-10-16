"""Audit owned changes, final source identity and preserved raw evidence."""
import hashlib
import json
import re
import subprocess

from check import OUT, ROOT, hashes


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)


def read(path):
    return json.loads(path.read_text())


assert git('rev-parse', 'HEAD').decode().strip() == '3e8b078251a12b1fb4e029ec70a9de7aedb4dc08'
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
assert hashes() == read(OUT / 'final-source.json')
changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
assert all(path.startswith('crates/hyperbrep/') or path == 'docs/properties-status.json' for path in changed)
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger = read(ROOT / 'docs/properties-status.json')
before = json.loads(git('show', 'HEAD:docs/properties-status.json'))
for value in [ledger, before]:
    value['current_work'].pop('hyperbrep')
assert ledger == before, 'unrelated property ledger changed'
links = []
targets = []
for path in [ROOT / 'crates/hyperbrep/README.md', ROOT / 'crates/hyperbrep/docs/ARCHITECTURE.md',
             ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', OUT / 'README.md', OUT / 'contract.md']:
    for label, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent / target.split('#')[0]
        if destination != OUT / 'audit.json':
            assert destination.exists(), (path, target)
        targets.append(destination)
        links.append(dict(document=str(path.relative_to(ROOT)), target=target))
command = ['git', 'diff', '--cached', '--check']
result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
paths = sorted({line.rsplit(':', 2)[0] for line in result.stdout.splitlines()
                if any(term in line for term in ['trailing whitespace.', 'space before tab in indent.', 'new blank line at EOF.'])})
preserved = []
for path in paths:
    assert (ROOT / path).is_relative_to(OUT) and path.endswith(('.log', '.patch')), path
    preserved.append(dict(path=path, sha256=hashlib.sha256((ROOT / path).read_bytes()).hexdigest()))
scoped_command = [*command, '--', '.', *[':(exclude)' + path for path in paths]]
scoped = subprocess.run(scoped_command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check')
for path in OUT.rglob('*.json'):
    read(path)
report = dict(
    source_matches_final=True,
    scope='BREP source/tests/benchmarks/documentation and its property-ledger entry only',
    changed_paths=changed,
    unrelated_property_ledger_preserved=True,
    work_package_gates_open=28,
    links=links,
    unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                 diagnostics=result.stdout, preserved_raw_data=preserved),
    code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
    limits='Local file-link existence and JSON checks, not remote URL/anchor verification or whole-repository release/pre-push admission.',
)
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert all(path.exists() for path in targets)
print(json.dumps(dict(changed_paths=len(changed), raw_data_paths=len(paths), code_documentation_whitespace_exit=scoped.returncode)))
