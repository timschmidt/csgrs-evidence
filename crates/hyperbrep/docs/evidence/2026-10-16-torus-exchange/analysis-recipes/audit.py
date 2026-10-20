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
from dependency_binding import admit_final_source
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
ideas = read(OUT / manifest['idea_ledger'])['ideas']
assert len(ideas) == 17
assert all(row['status'] in {'kept', 'rejected', 'already-satisfied', 'architecture-inapplicable'}
           for row in ideas)
for row in ideas:
    assert row['reason'] and row['evidence']
    assert all((OUT / name).is_file() for name in row['evidence']), row['idea']
source = hashes()
assert source == read(OUT / manifest['source']) == read(OUT / 'final-source.json')
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
format_review = read(OUT / 'scalar-format-review.json')
assert format_review['applied'] and format_review['unchanged_canonical_rustfmt']
owner = ROOT / format_review['owner']
assert digest(owner) == format_review['preview_sha256']
assert digest(ROOT / format_review['configuration']) == format_review['configuration_sha256']
formatted = Path('/tmp/hyperbrep-torus-audit-algebra.rs')
formatted.write_bytes(owner.read_bytes())
subprocess.run(['rustfmt', '--edition', '2024', '--config-path', str(ROOT / 'crates/.rustfmt.toml'),
                str(formatted)], env=ENV, check=True)
assert digest(formatted) == format_review['current_sha256']
q = read(OUT / manifest['qualification'])
assert q['source'] == source
for row in q['commands']:
    assert row['exit_code'] == 0 and row['source_unchanged'], row['label']
    if read(OUT / row['source']) != source:
        assert admit_final_source(row, source) == q['source_admissions'][row['label']]
for label in ['native-debug', 'native-release', 'native-minimal']:
    assert q['tests'][label]['passed'] >= 508
    assert q['tests'][label]['failed'] == q['tests'][label]['ignored'] == 0
assert q['wasm']['probe_groups'] == 90 and q['wasm']['imports'] == 0
assert q['continuation'] == dict(native_result=76, undecided=3, resource_exhaustion=2)
frontier = read(OUT/'continuation-frontier.json')
assert frontier['all_prior_successes_preserved'] and frontier['unchanged_outcomes'] == 79
assert frontier['reviewed_migrations'] == read(OUT/'frontier-migration.json')['migrations']
extension = read(OUT/'frontier-extension-summary.json')
assert extension['source'] == source
for path, expected in extension['input_digests'].items():
    assert digest(Path(path)) == expected
for item in extension['artifacts']:
    path = OUT/'frontier-extension-artifacts'/item['file']
    assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
extension_binary = Path(extension['executable']['path'])
assert extension_binary.stat().st_size == extension['executable']['bytes']
assert digest(extension_binary) == extension['executable']['sha256']
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
assert bench['matched_cases'] == 167 and bench['processes'] == 105 and bench['new_cases'] == 3
assert not bench['exact_receipts_preserved'] and bench['unchanged_receipts'] == 162
assert bench['reviewed_receipt_migrations'] == 5 and bench['all_receipts_accounted_for']
assert not read(OUT / 'benchmark-v1/receipt-admission.json')['passed']
assert q['original_failed_receipt_gate']['exit_code'] == 1
receipt_review = read(OUT / manifest['receipt_review'])
approval = read(OUT / manifest['receipt_migrations'])
binding = read(OUT / manifest['receipt_artifact_binding'])
assert receipt_review['passed'] and binding['passed']
assert receipt_review['source_identity'] == binding['source_identity'] == manifest['source_identity']
assert receipt_review['approval_sha256'] == digest(OUT / manifest['receipt_migrations'])
assert receipt_review['binding_sha256'] == digest(OUT / manifest['receipt_artifact_binding'])
assert receipt_review['original_gate_sha256'] == digest(OUT / 'benchmark-v1/receipt-admission.json')
assert approval['receipt_binding_sha256'] == digest(OUT / manifest['receipt_artifact_binding'])
assert approval['migrations'] == read(OUT / 'benchmark-v1/observed-receipt-migrations.json')
assert len(approval['migrations']) == 5
assert binding['archive_pairs'] == 173 and binding['non_scalar_changes'] == 0
assert binding['all_three_trials_bound']
assert binding['proof_sha256'] == digest(OUT / 'receipt-archive-equality.json')
assert binding['input_sha256'] == digest(OUT / 'receipt-probe-inputs.json')
for side, files in binding['artifacts'].items():
    assert len(files) == 173
    for name, item in files.items():
        path = OUT / ('receipt-' + side + '-artifacts') / name
        assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
for name, expected in read(OUT / 'receipt-probe-inputs.json')['files'].items():
    assert digest(Path(name)) == expected, name
for item in read(OUT / 'receipt-probe-binaries.json').values():
    path = Path(item['path'])
    assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
for name, expected in read(OUT / 'receipt-baseline-source.json')['files'].items():
    path = Path('/tmp/hyperbrep-torus-receipt-v2-baseline') / name
    assert digest(path) == expected
    if name not in baseline_bytes:
        baseline_bytes[name] = git('show', f'{baseline}:{name}')
    assert sha(baseline_bytes[name]) == expected
assert read(OUT / 'feature-graph-admission.json')['passed']
exes = read(OUT / 'benchmark-v1/executables.json')
for name, before in exes['baseline'].items():
    after = exes['candidate'][name]
    assert before['features'] == after['features']
    for item in [before, after]:
        path = Path(item['path'])
        assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']
arc_identical = exes['baseline']['arc']['sha256'] == exes['candidate']['arc']['sha256']
wasm = Path(ENV['CARGO_TARGET_DIR']) / 'wasm32-unknown-unknown/release/hyperbrep_prism_wasm_probe.wasm'
assert digest(wasm) == q['wasm']['wasm_sha256']
assert read(OUT / 'dependency-summary.json')['preserved_test_outcomes']
assert read(OUT / 'dependency-costs-v1/summary.json')['processes'] == 12
assert not read(OUT / 'final-qualification-driver.json')['failures']
assert read(OUT / 'cost-qualification-driver.json')['main_campaign_qualified_with_explicit_migration']
growth = read(OUT / 'growth-summary.json')
assert growth['source'] == source
assert [row['cycle'] for row in growth['rows']] == list(range(5))
for row in growth['rows']:
    path = OUT / 'growth-artifacts' / f"cycle-{row['cycle']}.json"
    assert path.stat().st_size == row['bytes'] and digest(path) == row['sha256']
for name, expected in growth['input_digests'].items():
    assert digest(Path(name)) == expected, name
growth_binary = Path(growth['executable']['path'])
assert growth_binary.stat().st_size == growth['executable']['bytes']
assert digest(growth_binary) == growth['executable']['sha256']
dependency_cost_inputs = read(OUT / 'dependency-costs-v1/inputs.json')
assert dependency_cost_inputs['source'] == source
for side in dependency_cost_inputs['executables'].values():
    for item in side['executables'].values():
        path = Path(item['path'])
        assert path.stat().st_size == item['bytes'] and digest(path) == item['sha256']

external = []
wasm_project = Path('/tmp/hyperbrep-torus-exchange-wasm-probe')
for retained, copied in [('Cargo.toml', 'Cargo.toml'), ('Cargo.lock', 'Cargo.lock'),
                         ('lib.rs', 'src/lib.rs'), ('faceted.rs', 'src/faceted.rs'), ('run.py', 'run.py')]:
    assert (OUT / 'wasm-probe' / retained).read_bytes() == (wasm_project / copied).read_bytes()
    external.append(dict(path=str(wasm_project / copied), sha256=digest(wasm_project / copied)))
probe = Path('/tmp/hyperbrep-torus-continuation-probe')
assert (probe / 'src/bin/torus_growth.rs').read_bytes() == (OUT / 'analysis-recipes/growth.rs').read_bytes()
assert (probe / 'src/bin/frontier_extension.rs').read_bytes() == (OUT / 'analysis-recipes/frontier_extension.rs').read_bytes()
for name in ['Cargo.toml', 'Cargo.lock']:
    assert (old / 'diagnostic-project' / name).read_bytes() == (probe / name).read_bytes()
for retained, binary in [('frontier.rs.txt', 'frontier'), ('preceding-frontier.rs.txt', 'preceding_frontier'),
                          ('prism-frontier.rs.txt', 'prism')]:
    path = probe / 'src/bin' / (binary + '.rs')
    assert path.read_bytes() == (old / retained).read_bytes()
    external.append(dict(path=str(path), sha256=digest(path)))

changed = git('diff', 'HEAD', '--name-only').decode().splitlines()
untracked = git('ls-files', '--others', '--exclude-standard').decode().splitlines()
allowed = {'docs/properties-status.json', 'crates/hyperreal/src/computable/node/algebra.rs',
           'crates/hyperreal/tests/torus_angles.rs',
           'crates/hyperreal/tests/fixtures/torus-subdivision-angles.json'}
assert all(path in allowed or path.startswith(('crates/hyperbrep/', 'crates/hyperbrep-io/'))
           for path in changed + untracked), changed + untracked
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

report_restoration = read(OUT / 'dependency-report-restoration.json')
report_origin = ROOT / report_restoration['path']
report_capture = OUT / report_restoration['generated_copy']
assert digest(report_capture) == report_restoration['generated_sha256']
assert digest(report_origin) == report_restoration['restored_sha256']
assert report_origin.read_bytes() == git('show', baseline + ':' + report_restoration['path'])
assert digest(OUT / report_restoration['last_command_log']) == report_restoration['last_command_log_sha256']
for _, target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)', report_capture.read_text()):
    if '://' not in target and not target.startswith('#'):
        assert (report_origin.parent / target.split('#')[0]).exists(), target

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
    overlay_members_verified=len(contents), benchmark_receipts_preserved=162,
    reviewed_benchmark_receipt_migrations=5, compared_receipt_archive_pairs=173,
    byte_identical_arc_executables=arc_identical, current_wasm_matches_record=True,
    growth_archives_verified=len(growth['rows']), dependency_cost_binaries_verified=4,
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
print(json.dumps(dict(source_snapshots=len(reconstruction['sources']), exact_artifacts=54, matched_cases=167,
                      raw_whitespace_files=len(paths), work_packages_open=28)))
