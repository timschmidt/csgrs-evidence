"""Check the final admission record, source reconstruction, ownership and documentation."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from check import ENV, hashes

read = lambda path: json.loads(path.read_text())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
digest = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
manifest = read(OUT / 'manifest.json')
assert manifest['decision'] == 'kept' and manifest['retention_rationale']
assert git('rev-parse', 'HEAD').decode().strip() == manifest['baseline']
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
source = hashes()
assert source == read(OUT / 'final-source.json')
for row in manifest['qualification']:
    assert row['exit_code'] == 0 and row['source_unchanged'], row['label']
    assert read(OUT / row['source']) == source, row['label']
for row in manifest['inherited_failed_gates']:
    assert row['exit_code'] == 101 and row['source_unchanged']
    assert read(OUT / row['source']) == source
    assert 'assertion failed: FACTORS > 0' in (OUT / row['log']).read_text()
for label, expected in [('native-debug', 512), ('native-release', 512), ('native-minimal', 504)]:
    assert manifest['test_counts'][label] == dict(passed=expected, failed=0, ignored=0)
assert manifest['test_counts']['scalar-consumers'] == dict(passed=2600, failed=0, ignored=6)
assert len([row for row in manifest['qualification'] if row['label'].startswith('final-prism-')]) == 25
assert len(manifest['frontier']['rows']) == 81 and len(manifest['prism_frontier']['rows']) == 24
assert len(manifest['preceding_frontier']) == 15
assert manifest['wasm']['probe_groups'] == 83 and manifest['wasm']['imports'] == 0
assert read(OUT / 'receipt-review.json')['passed']
external_inputs = []
wasm_project = Path('/tmp/hyperbrep-prism-wasm-probe')
for retained, copied in [('Cargo.toml', 'Cargo.toml'), ('Cargo.lock', 'Cargo.lock'),
                         ('lib.rs', 'src/lib.rs'), ('faceted.rs', 'src/faceted.rs'),
                         ('run.py', 'run.py')]:
    assert (OUT / 'wasm-probe' / retained).read_bytes() == (wasm_project / copied).read_bytes()
    external_inputs.append(dict(path=str(wasm_project / copied), sha256=digest(wasm_project / copied)))
probe = Path('/tmp/hyperbrep-prism-continuation-probe')
for name in ['Cargo.toml', 'Cargo.lock']:
    assert (OUT / 'diagnostic-project' / name).read_bytes() == (probe / name).read_bytes()
    external_inputs.append(dict(path=str(probe / name), sha256=digest(probe / name)))
for retained, name in [('frontier.rs.txt', 'frontier'), ('preceding-frontier.rs.txt', 'preceding_frontier'),
                       ('prism-frontier.rs.txt', 'prism')]:
    path = probe / 'src/bin' / (name + '.rs')
    assert (OUT / retained).read_bytes() == path.read_bytes()
    external_inputs.append(dict(path=str(path), sha256=digest(path)))
wasm = Path(ENV['CARGO_TARGET_DIR']) / 'wasm32-unknown-unknown/release/hyperbrep_prism_wasm_probe.wasm'
assert digest(wasm) == manifest['wasm']['wasm_sha256']
reconstruction = read(OUT / 'source-reconstruction.json')
assert digest(OUT / reconstruction['archive']) == reconstruction['archive_sha256']
assert all(row['completely_reconstructible'] for row in reconstruction['sources'])
assert manifest['analysis_recipes'] == {str(path.relative_to(OUT)): digest(path)
                                       for path in sorted((OUT / 'analysis-recipes').rglob('*'))
                                       if path.is_file() and path.suffix in ['.py', '.rs', '.toml', '.lock']}
for path, expected in read(OUT / 'receipt-probe-inputs.json')['files'].items():
    assert digest(Path(path)) == expected
for row in read(OUT / 'receipt-archive-equality.json')['archives']:
    assert row['non_scalar_changes'] == 0 and row['both_archives_strictly_validate']
    assert row['changed_exact_scalars']
binding = read(OUT / 'receipt-artifact-binding.json')
assert binding['passed'] and len(binding['artifacts']) == 8
for item in binding['artifacts']:
    path = OUT / item['path']
    assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
for item in read(OUT / 'receipt-probe-binaries.json').values():
    path = Path(item['path'])
    assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']

changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
untracked = git('ls-files', '--others', '--exclude-standard').decode().splitlines()
allowed = {'crates/hyperreal/src/real/arithmetic/elementary_functions.rs',
           'crates/hyperreal/src/real/tests.rs', 'docs/properties-status.json'}
assert all(path in allowed or path.startswith(('crates/hyperbrep/', 'crates/hyperbrep-io/'))
           for path in changed + untracked), changed + untracked
evidence_prefix = 'crates/hyperbrep/docs/evidence/'
current_prefix = str(OUT.relative_to(ROOT)) + '/'
assert all(not path.startswith(evidence_prefix) or path.startswith(current_prefix) for path in changed)
assert not git('diff', manifest['baseline'], '--', 'crates/hyperlimit', 'crates/hypercurve',
               'crates/hypermesh', 'crates/hypertri', 'crates/hypersolve', 'crates/hyperlattice',
               'Cargo.toml', 'Cargo.lock', 'properties.md', 'docs/admission.md', 'AGENTS.md', '.github')
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger = read(ROOT / 'docs/properties-status.json')
before = json.loads(git('show', manifest['baseline'] + ':docs/properties-status.json'))
for value in [ledger, before]:
    value['current_work'].pop('hyperbrep')
assert ledger == before

documents = [ROOT / name for name in [
    'crates/hyperbrep/docs/ARCHITECTURE.md', 'crates/hyperbrep/docs/DEVELOPMENT_PLAN.md',
    'crates/hyperbrep/docs/SUPPORT_MATRIX.md', 'crates/hyperbrep/README.md',
    'crates/hyperbrep/PERFORMANCE.md', 'crates/hyperbrep-io/docs/STEP_MAPPING.md',
    'crates/hyperbrep-io/README.md', 'crates/hyperbrep-io/tests/fixtures/README.md']]
documents += [OUT / 'README.md', OUT / 'contract.md', OUT / 'performance-investigation.md']
links = []
for path in documents:
    for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent / target.split('#')[0]
        assert destination.exists() or destination == OUT / 'audit.json', (path, target)
        links.append(dict(document=str(path.relative_to(ROOT)), target=target))
for path in OUT.rglob('*.json'):
    read(path)

fmt_command = ['cargo', 'fmt', '--all', '--', '--check']
fmt = subprocess.run(fmt_command, cwd=ROOT, env=ENV, text=True,
                     stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=300)
assert fmt.returncode == 0, fmt.stdout
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
report = dict(source_matches_final=True, source_identity=manifest['source_identity'],
    production_scope='BREP and STEP continuation, plus the two necessary scalar atan/half-angle identities and their regressions. Other runtime owners remain unchanged.',
    inherited_scalar_gate='Zero-factor assertion remains failed in both targeted configurations; no full-scalar or pre-push waiver.',
    consumer_tests=dict(passed=2600, failed=0, ignored=6,
                        scope='Six pre-existing ignored tests remain unexecuted; not counted as passing.'),
    work_package_gates_open=28, preserved_stashes=stashes, changed_paths=changed,
    unrelated_property_ledger_preserved=True, links=links,
    documentation={str(path.relative_to(ROOT)): digest(path) for path in documents},
    analysis_recipes=manifest['analysis_recipes'], source_overlay_archive_verified=True,
    source_snapshots=len(reconstruction['sources']), nested_child_attempts_preserved=25,
    external_probe_inputs=external_inputs, current_wasm_matches_record=True,
    unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                 diagnostics=result.stdout, preserved_raw_data=preserved),
    code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
    final_formatting=dict(command=fmt_command, exit_code=fmt.returncode, output=fmt.stdout),
    limits='Local source/evidence, scope, JSON and link-existence audit. Not a whole-history storage audit, remote-link/anchor check, full-workspace, package or pre-push admission.')
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert hashes() == source
print(json.dumps(dict(changed_paths=len(changed), raw_whitespace_files=len(paths), open_gates=28)))
