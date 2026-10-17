"""Audit retained source bytes, artifacts, ownership and final local checks."""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

OUT = Path(__file__).resolve().parents[1]
ROOT = OUT.parents[4]
sys.path.insert(0, str(OUT))
from check import ENV, hashes
sys.path.insert(0, str(OUT.parent / '2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep

read = lambda path: json.loads(path.read_text())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
sha = lambda data: hashlib.sha256(data).hexdigest()
digest = lambda path: sha(path.read_bytes())
manifest = read(OUT / 'manifest.json')
baseline = manifest['baseline']
assert git('rev-parse', 'HEAD').decode().strip() == baseline
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
assert manifest['decision'] == 'kept' and manifest['retention_rationale']
source = hashes()
assert source == read(OUT / manifest['source']) == read(OUT / 'final-source.json')
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
q = read(OUT / manifest['qualification'])
assert q['source'] == source
for row in q['commands']:
    assert row['exit_code'] == 0 and row['source_unchanged'], row['label']
    assert read(OUT / row['source']) == source, row['label']
for label, count in [('native-debug', 516), ('native-release', 516), ('native-minimal', 508)]:
    assert q['tests'][label] == dict(passed=count, failed=0, ignored=0)
assert q['wasm']['probe_groups'] == 83 and q['wasm']['imports'] == 0
assert q['continuation'] == dict(native_result=74, undecided=5, resource_exhaustion=2)
assert q['prisms'] == dict(native_result=18, unsupported=6)
assert len(read(OUT / 'preceding-frontier.json')) == 15
for name in ['continuation-inputs.json', 'frontier-analysis-inputs.json']:
    for relative, expected in read(OUT / name).items():
        assert digest(ROOT / relative) == expected, relative
for relative, expected in manifest['benchmark_helpers']['files'].items():
    assert digest(ROOT / relative) == expected
    assert sha(git('show', f'{baseline}:{relative}')) == expected
for relative, expected in manifest['evidence_files'].items():
    assert digest(OUT / relative) == expected, relative
for relative, expected in manifest['documents'].items():
    assert digest(ROOT / relative) == expected, relative
assert manifest['analysis_recipes'] == {
    str(p.relative_to(OUT)): digest(p) for p in sorted((OUT / 'analysis-recipes').glob('*.py'))}

reconstruction = read(OUT / manifest['reconstruction'])
archive = OUT / reconstruction['archive']
assert digest(archive) == reconstruction['archive_sha256']
with tarfile.open(archive, 'r:gz') as packed:
    contents = {member.name: packed.extractfile(member).read() for member in packed.getmembers()}
assert {name: sha(data) for name, data in contents.items()} == reconstruction['members']
baseline_bytes = {}
for row in reconstruction['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot = read(OUT / row['snapshot'])
    assert set(snapshot) == set(row['baseline_files']) | set(row['overlay_files'])
    for relative, expected in snapshot.items():
        if relative in row['overlay_files']:
            data = contents[row['overlay_files'][relative]]
        else:
            if relative not in baseline_bytes:
                baseline_bytes[relative] = git('show', f'{baseline}:{relative}')
            data = baseline_bytes[relative]
        assert sha(data) == expected, (row['snapshot'], relative)

old = OUT.parent / '2026-10-16-prism-continuation'
artifact_count = 0
for name in manifest['artifacts']:
    for item in read(OUT / name):
        relative = item.get('path') or 'final-prism-artifacts/' + item['file']
        path = OUT / relative
        assert item['unchanged'] and path.stat().st_size == item['bytes']
        assert digest(path) == item['sha256']
        assert path.read_bytes() == (old / relative).read_bytes()
        artifact_count += 1
assert artifact_count == 54
bench = read(OUT / 'benchmark-summary.json')
assert bench['matched_cases'] == 167 and bench['processes'] == 102
assert bench['exact_receipts_preserved']
assert read(OUT / 'benchmark-v1/observed-receipt-migrations.json') == []
assert read(OUT / 'benchmark-v1/receipt-admission.json')['passed']
assert read(OUT / 'feature-graph-admission.json')['passed']
exes = read(OUT / 'benchmark-v1/executables.json')
for name, before in exes['baseline'].items():
    after = exes['candidate'][name]
    assert before['features'] == after['features']
    for item in [before, after]:
        path = Path(item['path'])
        assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
assert exes['baseline']['arc']['sha256'] == exes['candidate']['arc']['sha256']
wasm = Path(ENV['CARGO_TARGET_DIR']) / 'wasm32-unknown-unknown/release/hyperbrep_prism_wasm_probe.wasm'
assert digest(wasm) == q['wasm']['wasm_sha256']
assert digest(ROOT / '.cargo/config.toml') == read(OUT / 'build-configuration-review.json')['cargo_configuration_sha256']

external = []
wasm_project = Path('/tmp/hyperbrep-builder-certificates-wasm-probe')
for retained, copied in [('Cargo.toml', 'Cargo.toml'), ('Cargo.lock', 'Cargo.lock'),
                         ('lib.rs', 'src/lib.rs'), ('faceted.rs', 'src/faceted.rs'), ('run.py', 'run.py')]:
    assert (OUT / 'wasm-probe' / retained).read_bytes() == (wasm_project / copied).read_bytes()
    external.append(dict(path=str(wasm_project / copied), sha256=digest(wasm_project / copied)))
probe = Path('/tmp/hyperbrep-builder-certificates-probe')
for name in ['Cargo.toml', 'Cargo.lock']:
    assert (old / 'diagnostic-project' / name).read_bytes() == (probe / name).read_bytes()
for retained, binary in [('frontier.rs.txt', 'frontier'), ('preceding-frontier.rs.txt', 'preceding_frontier'),
                          ('prism-frontier.rs.txt', 'prism')]:
    path = probe / 'src/bin' / (binary + '.rs')
    assert path.read_bytes() == (old / retained).read_bytes()
    external.append(dict(path=str(path), sha256=digest(path)))

changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
untracked = git('ls-files', '--others', '--exclude-standard').decode().splitlines()
allowed = {'crates/hyperbrep/src/topology/mod.rs', 'crates/hyperbrep/src/topology/builder.rs',
           'crates/hyperbrep/src/topology/builder_tests.rs', *manifest['documents']}
prefix = str(OUT.relative_to(ROOT)) + '/'
assert all(path in allowed or path.startswith(prefix) for path in changed + untracked), changed + untracked
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1',
        'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
ledger_text = (ROOT / 'docs/properties-status.json').read_text()
old_ledger = git('show', baseline + ':docs/properties-status.json').decode()
brep = json.loads(ledger_text)['current_work']['hyperbrep']
assert replace_brep(old_ledger, brep) == ledger_text

documents = [ROOT / relative for relative in manifest['documents'] if relative.endswith('.md')]
documents += sorted(OUT.glob('*.md'))
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
for path in (OUT / 'analysis-recipes').glob('*.py'):
    ast.parse(path.read_text(), filename=str(path))

fmt_command = ['cargo', 'fmt', '--all', '--', '--check']
fmt = subprocess.run(fmt_command, cwd=ROOT, env=ENV, text=True, stdout=subprocess.PIPE,
                     stderr=subprocess.STDOUT, timeout=300)
assert fmt.returncode == 0, fmt.stdout
command = ['git', 'diff', '--cached', '--check']
result = subprocess.run(command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
paths = sorted({line.rsplit(':', 2)[0] for line in result.stdout.splitlines()
                if any(term in line for term in ['trailing whitespace.', 'space before tab in indent.', 'new blank line at EOF.'])})
preserved = []
for relative in paths:
    path = ROOT / relative
    assert path.is_relative_to(OUT) and path.suffix == '.log', relative
    preserved.append(dict(path=relative, sha256=digest(path)))
scoped_command = [*command, '--', '.', *[':(exclude)' + path for path in paths]]
scoped = subprocess.run(scoped_command, cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check')
report = dict(baseline=baseline, source_identity=manifest['source_identity'], source_matches_final=True,
    exact_artifacts_verified=artifact_count, source_snapshots_reconstructed=len(reconstruction['sources']),
    overlay_members_verified=len(contents), benchmark_receipts_preserved=167,
    byte_identical_arc_executables=True, current_wasm_matches_record=True,
    unrelated_ledger_bytes_preserved=True, work_packages_open=28, preserved_stashes=stashes,
    changed_paths=changed, external_probe_inputs=external, local_links=links,
    analysis_recipes=manifest['analysis_recipes'], evidence_hashes_verified=len(manifest['evidence_files']),
    unrestricted_whitespace=dict(command=command, exit_code=result.returncode,
                                 diagnostics=result.stdout, preserved_raw_data=preserved),
    code_documentation_whitespace=dict(command=scoped_command, exit_code=scoped.returncode),
    final_formatting=dict(command=fmt_command, exit_code=fmt.returncode, output=fmt.stdout),
    limits='Precommit local source/evidence, scope, JSON, syntax and link-existence audit. Not a remote-link/anchor, whole-history storage, whole-workspace, release-package or pre-push admission.')
(OUT / 'audit.json').write_text(json.dumps(report, indent=2) + '\n')
assert hashes() == source
print(json.dumps(dict(source_snapshots=3, exact_artifacts=54, matched_cases=167,
                      raw_whitespace_files=len(paths), work_packages_open=28)))
