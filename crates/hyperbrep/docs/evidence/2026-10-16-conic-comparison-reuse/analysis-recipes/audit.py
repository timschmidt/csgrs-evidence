"""Audit the conic reuse admission record, source scope and final documentation."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path('/mnt/development/csgrs')
OUT = ROOT / 'crates/hyperbrep/docs/evidence/2026-10-16-conic-comparison-reuse'
sys.path.insert(0, str(OUT))
from check import ENV, hashes

read = lambda path: json.loads(path.read_text())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
m = read(OUT / 'manifest.json')
assert m['decision'] == 'kept' and m['retention_rationale']
assert set(m['ideas']) == {'kept', 'rejected', 'already_satisfied', 'architecture_inapplicable'}
assert git('rev-parse', 'HEAD').decode().strip() == m['baseline']
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
source = hashes()
assert source == read(OUT / 'final-source.json')
assert len(m['qualification']) == 32 and len(m['preliminary']) == 4
for row in m['qualification'] + m['preliminary']:
    assert row['source_unchanged'] and read(OUT / row['source']) == source, row['label']
    if row['label'].startswith('inherited-zero-factor'):
        assert row['exit_code'] == 101
        assert 'assertion failed: FACTORS > 0' in (OUT / row['log']).read_text()
    else:
        assert row['exit_code'] == 0
reconstruction = read(OUT / 'source-reconstruction.json')
assert digest(OUT / reconstruction['archive']) == reconstruction['archive_sha256']
assert all(row['completely_reconstructible'] for row in reconstruction['sources'])
assert m['analysis_recipes'] == {str(path.relative_to(OUT)): digest(path)
                                 for path in sorted((OUT / 'analysis-recipes').glob('*.py'))}
changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
allowed = {'crates/hyperbrep/src/geometry.rs', 'crates/hyperbrep/docs/ARCHITECTURE.md',
           'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md', 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json',
           'crates/hyperbrep/PERFORMANCE.md', 'docs/properties-status.json'}
prefix = str(OUT.relative_to(ROOT)) + '/'
assert all(path in allowed or path.startswith(prefix) for path in changed), changed
geometry = 'crates/hyperbrep/src/geometry.rs'
before_geometry = git('show', m['baseline'] + ':' + geometry).decode()
after_geometry = (ROOT / geometry).read_text()

def outside_helper(text):
    marker = 'pub(crate) fn angular_parameter_lifts('
    assert text.count(marker) == 1
    before, rest = text.split(marker)
    helper, after = rest.split('\nfn angle_domain()', 1)
    return before, after

assert before_geometry != after_geometry
assert outside_helper(before_geometry) == outside_helper(after_geometry)
assert not git('diff', m['baseline'], '--', 'crates/hyperreal', 'crates/hyperlimit',
               'crates/hypercurve', 'crates/hypermesh', 'crates/hypertri', 'crates/hypersolve',
               'crates/hyperlattice', 'crates/hyperbrep/tests', 'crates/hyperbrep/benches',
               'crates/hyperbrep-io', 'Cargo.toml', 'Cargo.lock', 'properties.md', 'docs/admission.md', 'AGENTS.md')
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger = read(ROOT / 'docs/properties-status.json')
before = json.loads(git('show', m['baseline'] + ':docs/properties-status.json'))
for value in [ledger, before]:
    value['current_work'].pop('hyperbrep')
assert ledger == before
fmt_command = ['cargo', 'fmt', '--all', '--', '--check']
fmt = subprocess.run(fmt_command, cwd=ROOT, env=ENV, text=True,
                     stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=300)
assert fmt.returncode == 0, fmt.stdout
documents = [ROOT / path for path in ['crates/hyperbrep/docs/ARCHITECTURE.md',
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
              production_scope='Only geometry::angular_parameter_lifts differs from the qualified baseline; all dependencies, tests, benchmarks and format contracts are unchanged.',
              inherited_scalar_gate='original zero-factor assertion reproduced in both targeted configurations; remains failed, no pre-push waiver',
              work_package_gates_open=28, preserved_stashes=stashes, changed_paths=changed,
              unrelated_property_ledger_preserved=True, links=links,
              documentation={str(path.relative_to(ROOT)): digest(path) for path in documents},
              analysis_recipes=m['analysis_recipes'], source_overlay_archive_verified=True,
              source_snapshots=len(reconstruction['sources']),
              unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                           diagnostics=result.stdout, preserved_raw_data=preserved),
              code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
              final_formatting=dict(command=fmt_command, exit_code=fmt.returncode, output=fmt.stdout),
              limits='Local link existence, JSON, scope/hash and recorded qualification checks; not remote URL/anchor, full-workspace, package or pre-push admission.')
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert hashes() == source
print(json.dumps(dict(changed_paths=len(changed), raw_whitespace_files=len(paths), open_gates=28)))
