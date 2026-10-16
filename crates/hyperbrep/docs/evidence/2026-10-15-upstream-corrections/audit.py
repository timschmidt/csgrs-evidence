"""Check integration ownership, documentation, conflicts and data whitespace."""
import hashlib
import json
import re
import subprocess
from pathlib import Path

from check import ROOT, OUT, hashes


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)


def load(path):
    return json.loads(path.read_text())


assert hashes() == load(OUT / 'final-source.json')
assert not git('diff', '--name-only', '--diff-filter=U')
assert git('branch', '--show-current').strip() == b'brep'
integration = load(OUT / 'integration.json')
assert git('rev-parse', 'HEAD').decode().strip() == integration['before']
assert git('rev-parse', 'MERGE_HEAD').decode().strip() == integration['upstream']
for item in integration['conflicts']:
    assert (ROOT / item['path']).read_bytes() == git('show', 'origin/main:' + item['path'])
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert integration['parked_scalar_stash'] in stashes
assert integration['prior_closed_edge_stash'] in stashes

status_path = ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json'
status = load(status_path)
assert not status['complete']
assert len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger = load(ROOT / 'docs/properties-status.json')
upstream = json.loads(git('show', 'origin/main:docs/properties-status.json'))
for document in [ledger, upstream]:
    document.get('current_work', {}).pop('hyperbrep', None)
assert ledger == upstream, 'non-BREP upstream ledger changed'

documents = [ROOT / 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', OUT / 'README.md']
links = []
targets = []
for document in documents:
    for label, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', document.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        path = document.parent / target.split('#')[0]
        targets.append(path)
        if path != OUT / 'audit.json':
            assert path.exists(), (document, target)
        links.append({'document': str(document.relative_to(ROOT)), 'target': target})

command = ['git', 'diff', '--cached', '--check']
result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT)
diagnostics = result.stdout
paths = sorted({line.rsplit(':', 2)[0] for line in diagnostics.splitlines()
                if any(term in line for term in ['trailing whitespace.',
                                                 'space before tab in indent.',
                                                 'new blank line at EOF.'])})
preserved = []
for path in paths:
    content = (ROOT / path).read_bytes()
    if path.startswith('docs/evidence/'):
        assert content == git('show', 'origin/main:' + path), path
        reason = 'Inherited upstream evidence, byte-identical to origin/main.'
    else:
        assert (ROOT / path).is_relative_to(OUT) and path.endswith('.log'), path
        reason = 'Raw command output retained without whitespace rewriting.'
    preserved.append({'path': path, 'reason': reason,
                      'sha256': hashlib.sha256(content).hexdigest()})
scoped_command = [*command, '--', '.', *[':(exclude)' + path for path in paths]]
scoped = subprocess.run(scoped_command, cwd=ROOT, text=True, stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check')
for path in OUT.rglob('*.json'):
    load(path)

report = {
    'source_matches_final': True,
    'unresolved_conflicts': 0,
    'conflict_files_match_upstream': True,
    'upstream_property_ledger_preserved_except_hyperbrep': True,
    'stashes_preserved': stashes,
    'work_package_gates_open': 28,
    'local_markdown_links': links,
    'unrestricted_staged_whitespace': {
        'command': command, 'exit_code': result.returncode,
        'diagnostics': diagnostics, 'preserved_data': preserved,
    },
    'code_documentation_whitespace': {
        'command': scoped_command, 'exit_code': scoped.returncode,
    },
    'limits': 'Checks local file link existence, JSON, source identity and scoped formatting. Does not validate remote URLs, Markdown anchors, release packaging or the whole pre-push matrix.',
}
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert all(path.exists() for path in targets)
print(json.dumps({'open_gates': 28, 'preserved_raw_data_paths': len(paths),
                  'code_documentation_whitespace_exit': scoped.returncode}))
