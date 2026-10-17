"""Audit final evidence, source reconstruction, changed ownership and documents."""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(OUT))
from check import ENV, ROOT, hashes
from source_binding import admit

read = lambda p: json.loads(p.read_text())
sha = lambda data: hashlib.sha256(data).hexdigest()
digest = lambda p: sha(p.read_bytes())
git = lambda *args: subprocess.check_output(['git', *args], cwd=ROOT)
manifest = read(OUT / 'manifest.json')
baseline = manifest['baseline']
assert git('rev-parse', 'HEAD').decode().strip() == baseline
assert git('branch', '--show-current').strip() == b'brep'
assert not git('diff', '--name-only', '--diff-filter=U')
source = hashes()
assert source == read(OUT / 'final-source.json')
assert sha(json.dumps(source, sort_keys=True).encode()) == manifest['source_identity']
q = read(OUT / 'qualification-summary.json')
assert q['source'] == source
for row in q['commands']:
    assert row['exit_code'] == 0 and row['source_unchanged']
    assert admit(row, source) == q['source_admissions'][row['label']]
assert q['tests']['native-debug']['passed'] == q['tests']['native-release']['passed'] == 528
assert q['tests']['native-minimal']['passed'] == 520
assert q['wasm']['probe_groups'] == 94 and q['wasm']['imports'] == 0
assert q['continuation'] == dict(native_result=78, undecided=3)
assert q['prisms'] == dict(native_result=18, unsupported=6)
assert len(read(OUT / 'preceding-frontier.json')) == 15
assert read(OUT / 'dependency-summary.json')['preserved_test_outcomes']
assert len(read(OUT / 'dependency-summary.json')['added']) == 4
assert len(read(OUT / 'dependency-summary.json')['inherited_debug_failures']) == 2
assert read(OUT / 'continuation-admission.json')['passed']
assert read(OUT / 'feature-graph-admission.json')['passed']
assert read(OUT / 'benchmark-v1/receipt-admission.json')['passed']
assert not read(OUT / 'benchmark-v1/observed-receipt-migrations.json')
bench = read(OUT / 'benchmark-summary.json')
assert bench['matched_cases'] == bench['unchanged_receipts'] == 170
assert bench['new_cases'] == 2 and bench['processes'] == 108
assert read(OUT / 'dependency-costs-v1/summary.json')['processes'] == 18
assert read(OUT / 'finish-checks-driver.json')['passed']

for relative, expected in manifest['evidence_files'].items():
    assert digest(OUT / relative) == expected, relative
for relative, expected in manifest['documents'].items():
    assert digest(ROOT / relative) == expected, relative
for relative, expected in manifest['benchmark_helpers']['files'].items():
    assert digest(ROOT / relative) == expected
    assert sha(git('show', f'{baseline}:{relative}')) == expected
for relative, expected in read(OUT / 'continuation-inputs.json').items():
    assert digest(Path(relative)) == expected, relative
for row in read(OUT / 'preserved-artifacts.json'):
    p = OUT / row['path']
    assert row['unchanged'] and p.stat().st_size == row['bytes']
    assert digest(p) == row['baseline_sha256'] == row['candidate_sha256']
    assert p.read_bytes() == (OUT.parent / '2026-10-16-torus-exchange' / row['path']).read_bytes()
assert len(read(OUT / 'preserved-artifacts.json')) == 61
growth = read(OUT / 'growth-summary.json')
assert growth['source'] == source
for row in growth['rows'] + growth['reconstruction_rows']:
    p = OUT / row['path']
    assert p.stat().st_size == row['bytes'] and digest(p) == row['sha256']
for name, expected in growth['input_digests'].items():
    assert digest(Path(name)) == expected
for name in ['endpoint-oracle.json', 'cone-oracle.json']:
    oracle = read(OUT / name)
    assert oracle['passed']
    for relative, expected in oracle['inputs'].items():
        p = ROOT / relative if relative.startswith('crates/') else OUT / relative
        assert digest(p) == expected
oracle = read(OUT / 'scalar-oracle.json')
assert digest(ROOT / oracle['input']) == oracle['input_sha256']
assert digest(OUT / 'analysis-recipes/scalar_oracle.py') == oracle['recipe_sha256']
assert len(oracle['rows']) == 3 and all(r['exact_value'] == '0' for r in oracle['rows'])

binary_groups = list(read(OUT / 'benchmark-v1/executables.json')[side] for side in ['baseline', 'candidate'])
binary_groups += list(read(OUT / 'dependency-costs-v1/inputs.json')['executables'].values())
binary_groups += [read(OUT / 'continuation-binaries.json')]
binary_count = 0
for group in binary_groups:
    for item in group.values():
        p = Path(item['path'])
        assert p.stat().st_size == item['bytes'] and digest(p) == item['sha256']
        binary_count += 1
wasm = Path(ENV['CARGO_TARGET_DIR']) / 'wasm32-unknown-unknown/release/hyperbrep_prism_wasm_probe.wasm'
assert digest(wasm) == q['wasm']['wasm_sha256']
project = Path('/tmp/hyperbrep-curved-continuation-wasm-probe')
for retained, copied in [('Cargo.toml', 'Cargo.toml'), ('Cargo.lock', 'Cargo.lock'),
                         ('lib.rs', 'src/lib.rs'), ('faceted.rs', 'src/faceted.rs'), ('run.py', 'run.py')]:
    assert (OUT / 'wasm-probe' / retained).read_bytes() == (project / copied).read_bytes()

reconstruction = read(OUT / 'source-reconstruction.json')
archive = OUT / reconstruction['archive']
assert digest(archive) == reconstruction['archive_sha256']
with tarfile.open(archive, 'r:gz') as packed:
    contents = {m.name: packed.extractfile(m).read() for m in packed.getmembers()}
assert {k: sha(v) for k, v in contents.items()} == reconstruction['members']
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

status = read(ROOT / 'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open', 'in-progress'] for row in status['work_packages'])
sys.path.insert(0, str(OUT.parent / '2026-10-16-upstream-format-integration'))
from ledger_spans import replace_brep
ledger = (ROOT / 'docs/properties-status.json').read_text()
assert replace_brep(git('show', baseline + ':docs/properties-status.json').decode(),
                    json.loads(ledger)['current_work']['hyperbrep']) == ledger
changes = git('diff', 'HEAD', '--name-only').decode().splitlines()
changes += git('ls-files', '--others', '--exclude-standard').decode().splitlines()
assert all(p == 'docs/properties-status.json' or p.startswith(('crates/hyperbrep/', 'crates/hyperreal/')) for p in changes)
stashes = git('stash', 'list', '--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1', 'b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
links = []
documents = [ROOT / p for p in manifest['documents'] if p.endswith('.md')] + sorted(OUT.glob('*.md'))
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
command = ['git', 'diff', '--cached', '--check']
check = subprocess.run(command, cwd=ROOT, text=True, capture_output=True)
raw = sorted({line.rsplit(':', 2)[0] for line in check.stdout.splitlines()
              if any(term in line for term in ['trailing whitespace.', 'space before tab in indent.', 'new blank line at EOF.'])})
assert all((ROOT / p).is_relative_to(OUT) and Path(p).suffix == '.log' for p in raw)
scoped = subprocess.run([*command, '--', '.', *[':(exclude)' + p for p in raw]], cwd=ROOT, text=True, capture_output=True)
assert scoped.returncode == 0, scoped.stdout
assert not git('diff', '--check')
assert hashes() == source
result = dict(baseline=baseline, source_identity=manifest['source_identity'], source_matches_final=True,
    source_snapshots_reconstructed=len(reconstruction['sources']), overlay_members_verified=len(contents),
    frozen_binaries_verified=binary_count, exact_artifacts_verified=61, benchmark_receipts_preserved=170,
    raw_data_whitespace=dict(command=command, exit_code=check.returncode, diagnostics=check.stdout,
                             preserved_files={p: digest(ROOT / p) for p in raw}),
    code_documentation_whitespace_exit=scoped.returncode, evidence_hashes_verified=len(manifest['evidence_files']),
    local_links=links, preserved_stashes=stashes, work_packages_open=28, unrelated_ledger_bytes_preserved=True,
    limitation='Precommit local source/evidence, ownership, JSON, Python syntax and link-existence audit. Not a remote-link/anchor, package, full-workspace or pre-push admission.')
(OUT / 'audit.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: result[k] for k in ['source_snapshots_reconstructed', 'frozen_binaries_verified', 'exact_artifacts_verified', 'work_packages_open']}))
