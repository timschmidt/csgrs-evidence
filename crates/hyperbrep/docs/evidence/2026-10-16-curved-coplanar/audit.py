"""Audit the BREP-only curved-composition increment before the next upstream checkpoint."""
import hashlib
import json
import re
import subprocess

from check import OUT, ROOT, hashes


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)


def read(path):
    return json.loads(path.read_text())


assert git('rev-parse', 'HEAD').decode().strip() == '2c52ee7d5b68da4630e55b0a2e2c2e8e4e98cdbd'
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
assert hashes() == read(OUT / 'final-source.json')
reconstruction = read(OUT / 'source-reconstruction.json')
assert hashlib.sha256((OUT / reconstruction['archive']).read_bytes()).hexdigest() == reconstruction['archive_sha256']
manifest = read(OUT / 'manifest.json')
assert len(manifest['qualification']) == 22
assert all(row['exit_code'] == 0 and row['source_unchanged'] and not row['source_differences_from_final'] for row in manifest['qualification'])
changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
assert all(path.startswith(('crates/hyperbrep/', 'crates/hyperbrep-io/'))
           or path == 'docs/properties-status.json' for path in changed)
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
for path in [ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
             ROOT / 'crates/hyperbrep/docs/ARCHITECTURE.md',
             ROOT / 'crates/hyperbrep/PERFORMANCE.md',
             ROOT / 'crates/hyperbrep-io/README.md',
             ROOT / 'crates/hyperbrep-io/docs/STEP_MAPPING.md',
             ROOT / 'crates/hyperbrep/README.md', ROOT / 'crates/hyperbrep/docs/SUPPORT_MATRIX.md', ROOT / 'crates/hyperbrep-io/PERFORMANCE.md',
             OUT / 'README.md', OUT / 'contract.md']:
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
    preserved_stashes=stashes,
    scope='BREP/IO implementation, planning and evidence; only their entry in the shared property ledger',
    changed_paths=changed,
    unrelated_property_ledger_preserved=True,
    work_package_gates_open=28,
    links=links,
    documentation={str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(targets)) if p.is_file() and p.suffix == '.md'},
    evidence_scripts={str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(OUT.glob('*.py'))},
    source_overlay_archive_verified=True,
    preliminary_missing_source_snapshots=[row['snapshot'] for row in reconstruction['sources'] if not row['completely_reconstructible']],
    preserved_receipts='All 138 cases require unchanged receipts; no byte/hash waiver.',
    unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                 diagnostics=result.stdout, preserved_raw_data=preserved),
    code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
    limits='Local file-link existence and JSON checks, not remote URL/anchor verification or whole-repository release/pre-push admission.',
)
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert all(path.exists() for path in targets)
print(json.dumps(dict(changed_paths=len(changed), raw_data_paths=len(paths), code_documentation_whitespace_exit=scoped.returncode)))
