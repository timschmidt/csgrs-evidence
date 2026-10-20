"""Audit the BREP upstream integration record after documentation and staging."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-upstream-native-integration'
sys.path.insert(0, str(OUT))
from check import ENV, hashes

read = lambda path: json.loads(path.read_text())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
m = read(OUT / 'manifest.json')
assert git('rev-parse', 'HEAD').decode().strip() == m['merge']
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
source = hashes()
assert source == read(OUT / 'final-source.json')
assert len(m['qualification']) == 36
for row in m['qualification']:
    assert row['source_unchanged'] and read(OUT / row['source']) == source, row['label']
    if row['label'].startswith('inherited-zero-factor'):
        assert row['exit_code'] == 101
        assert 'assertion failed: FACTORS > 0' in (OUT / row['log']).read_text()
    else:
        assert row['exit_code'] == 0
reconstruction = read(OUT / 'source-reconstruction.json')
assert digest(OUT / reconstruction['archive']) == reconstruction['archive_sha256']
assert all(row['completely_reconstructible'] for row in reconstruction['sources'])
changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
assert all(p.startswith(('crates/hyperbrep/', 'crates/hyperbrep-io/'))
           or p == 'docs/properties-status.json' for p in changed), changed
assert not git('diff', m['merge'], '--', 'crates/hyperreal', 'crates/hyperlimit', 'crates/hypercurve', 'crates/hypermesh', 'crates/hypertri')
assert not git('diff', m['merge'], '--', 'crates/hyperbrep/src', 'crates/hyperbrep/tests', 'crates/hyperbrep/benches', 'crates/hyperbrep-io/src', 'crates/hyperbrep-io/tests')
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger = read(ROOT / 'docs/properties-status.json')
before = json.loads(git('show', m['merge'] + ':docs/properties-status.json'))
for value in [ledger, before]:
    value['current_work'].pop('hyperbrep')
assert ledger == before
fmt_command = ['cargo', 'fmt', '--all', '--', '--check']
fmt = subprocess.run(fmt_command, cwd=ROOT, env=ENV, text=True,
                     stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=300)
assert fmt.returncode == 0, fmt.stdout
documents = [ROOT / p for p in ['crates/hyperbrep/docs/ARCHITECTURE.md',
                              'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
                              'crates/hyperbrep/docs/SUPPORT_MATRIX.md',
                              'crates/hyperbrep/README.md', 'crates/hyperbrep/PERFORMANCE.md']]
documents += [OUT / 'README.md', OUT / 'contract.md']
links = []
for path in documents:
    for label, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent / target.split('#')[0]
        assert destination.exists() or destination == OUT / 'audit.json', (path, target)
        links.append(dict(document=str(path.relative_to(ROOT)), target=target))
command = ['git', 'diff', '--cached', '--check']
result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
paths = sorted({line.rsplit(':', 2)[0] for line in result.stdout.splitlines()
                if any(term in line for term in ['trailing whitespace.', 'space before tab in indent.', 'new blank line at EOF.'])})
preserved = []
for path in paths:
    assert (ROOT / path).is_relative_to(OUT) and path.endswith(('.log', '.patch')), path
    preserved.append(dict(path=path, sha256=digest(ROOT / path)))
scoped_command = [*command, '--', '.', *[':(exclude)' + path for path in paths]]
scoped = subprocess.run(scoped_command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check')
for path in OUT.rglob('*.json'):
    read(path)
report = dict(product_test_manifest_readme_and_probe_sources_match_final=True,
              inherited_scalar_gate='original zero-factor assertion reproduced on merged source in both targeted configurations; remains failed, no pre-push waiver',
              work_package_gates_open=28, preserved_stashes=stashes,
              scope='BREP integration planning and source-bound evidence; no production/test source changes after the merge; only BREP in shared ledger',
              changed_paths=changed, unrelated_property_ledger_preserved=True,
              links=links, documentation={str(p.relative_to(ROOT)): digest(p) for p in documents},
              analysis_recipes={str(p.relative_to(OUT)): digest(p) for p in sorted((OUT / 'analysis-recipes').glob('*.py'))},
              source_overlay_archive_verified=True, source_snapshots=len(reconstruction['sources']),
              unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                           diagnostics=result.stdout, preserved_raw_data=preserved),
              code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
              final_formatting=dict(command=fmt_command, exit_code=fmt.returncode, output=fmt.stdout),
              limits='Local link existence, JSON and scope/hash checks only; not remote URL/anchor, full-workspace, package or pre-push admission.')
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert hashes() == source
print(json.dumps(dict(changed_paths=len(changed), raw_whitespace_files=len(paths), open_gates=28)))
