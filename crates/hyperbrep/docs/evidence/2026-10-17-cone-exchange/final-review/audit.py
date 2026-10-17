"""Check the completed source, retained evidence, ownership and local links."""
import ast
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tarfile

OUT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(OUT))
from check import ENV, ROOT, hashes
from source_binding import admit

read = lambda p:json.loads(p.read_text())
sha = lambda data:hashlib.sha256(data).hexdigest()
digest = lambda p:sha(p.read_bytes())
git = lambda *args:subprocess.check_output(['git',*args],cwd=ROOT)
manifest = read(OUT/'manifest.json')
baseline = manifest['baseline']
assert git('rev-parse','HEAD').decode().strip() == baseline
assert git('branch','--show-current').strip() == b'brep'
assert not git('diff','--name-only','--diff-filter=U')
source = hashes()
assert source == read(OUT/'final-source.json')
assert sha(json.dumps(source,sort_keys=True).encode()) == manifest['source_identity']
q = read(OUT/'qualification-summary.json')
assert q['source'] == source
blocked = {'inherited-zero-factor-default','inherited-zero-factor-all-features'}
assert {r['label'] for r in q['inherited_failures']} == blocked
for row in q['commands']:
    assert row['exit_code'] == (101 if row['label'] in blocked else 0)
    assert admit(row,source) == q['source_admissions'][row['label']]
    if row['label'] in blocked:
        assert 'assertion failed: FACTORS > 0' in (OUT/row['log']).read_text()
assert q['tests']['native-debug']['passed'] == q['tests']['native-release']['passed'] == 552
assert q['tests']['native-minimal']['passed'] == 544
assert q['tests']['dependency-libraries'] == dict(passed=3525,failed=0,ignored=6)
assert q['tests']['dependency-minimal-libraries'] == dict(passed=3419,failed=0,ignored=1)
assert q['wasm']['probe_groups'] == 111 and q['wasm']['imports'] == 0
assert read(OUT/'continuation-frontier.json')['counts'] == dict(native_result=81)
assert not read(OUT/'continuation-frontier.json')['changes']
for name in ['continuation-admission.json','feature-graph-admission.json','benchmark-v1/receipt-admission.json','finish-checks-driver.json']:
    assert read(OUT/name)['passed']
assert not read(OUT/'benchmark-v1/observed-receipt-migrations.json')
b = read(OUT/'benchmark-summary.json')
assert b['matched_cases'] == b['unchanged_receipts'] == 175
assert b['new_cases'] == 1 and b['cases'] == 176 and b['processes'] == 111
d = read(OUT/'dependency-costs-v1/summary.json')
assert d['cases'] == 196 and d['processes'] == 18
for relative,expected in manifest['evidence_files'].items():
    assert digest(OUT/relative) == expected, relative
for relative,expected in manifest['documents'].items():
    assert digest(ROOT/relative) == expected, relative
for relative,expected in manifest['benchmark_helpers']['files'].items():
    assert digest(ROOT/relative) == expected
    assert sha(git('show',f'{baseline}:{relative}')) == expected
for name in ['continuation-inputs.json','rational-split-inputs.json','wasm-final-source-binding.json']:
    for relative,expected in read(OUT/name).items():
        assert digest(Path(relative)) == expected, relative
for row in read(OUT/'preserved-artifacts.json'):
    p = OUT/row['path']
    assert row['unchanged'] and p.stat().st_size == row['bytes']
    assert digest(p) == row['baseline_sha256'] == row['candidate_sha256']
    assert p.read_bytes() == (OUT.parent/'2026-10-17-cone-continuation'/row['path']).read_bytes()
assert len(read(OUT/'preserved-artifacts.json')) == 61
for report,folder,count in [('cone-exports-occt.json','cone-exports',10),('rational-split-occt.json','rational-split-exports',6)]:
    rows = read(OUT/report)['rows']
    assert len(rows) == count
    for row in rows:
        assert row['valid'] and row['solids'] == 1
        assert digest(OUT/folder/(row['name']+'.step')) == row['sha256']
        for field in ['volume_m3','area_m2']:
            assert abs(row[field]-row['expected_'+field]) <= abs(row['expected_'+field])*1e-12
for row in read(OUT/'fixture-origin.json')['fixtures']:
    assert (ROOT/row['source']).read_bytes() == (ROOT/row['fixture']).read_bytes()
    assert digest(ROOT/row['fixture']) == row['sha256']
assert read(OUT/'fixture-migrations.json')['admitted']
for name in ['band','lower']:
    assert (ROOT/f'crates/hyperbrep/tests/fixtures/cone-imported-{name}.json').read_bytes() == (OUT/f'closure-v2-artifacts/{name}.json').read_bytes()

groups = [read(OUT/'benchmark-v1/executables.json')[side] for side in ['baseline','candidate']]
groups += list(read(OUT/'dependency-costs-v1/inputs.json')['executables'].values())
groups += [read(OUT/'continuation-binaries.json'),read(OUT/'baseline-diagnostic-binaries.json')['executables']]
items = [item for group in groups for item in group.values()]
items += [read(OUT/'baseline-probe-binary.json'),read(OUT/'wasm-consumer-correction.json')['frozen_v1']]
for item in items:
    p = Path(item['path'])
    assert p.stat().st_size == item['bytes'] and digest(p) == item['sha256']
wasm = Path(ENV['CARGO_TARGET_DIR'])/'wasm32-unknown-unknown/release/hyperbrep_cone_exchange_wasm_probe.wasm'
assert digest(wasm) == q['wasm']['wasm_sha256']
project = Path('/tmp/hyperbrep-cone-exchange-wasm-probe')
for retained,copied in [('Cargo.toml','Cargo.toml'),('Cargo.lock','Cargo.lock'),('lib.rs','src/lib.rs'),('faceted.rs','src/faceted.rs'),('run.py','run.py')]:
    assert (OUT/'wasm-probe'/retained).read_bytes() == (project/copied).read_bytes()

reconstruction = read(OUT/'source-reconstruction.json')
archive = OUT/reconstruction['archive']
assert digest(archive) == reconstruction['archive_sha256']
with tarfile.open(archive,'r:gz') as packed:
    contents = {m.name:packed.extractfile(m).read() for m in packed.getmembers()}
assert {k:sha(v) for k,v in contents.items()} == reconstruction['members']
baseline_bytes = {}
for row in reconstruction['sources']:
    assert row['completely_reconstructible'] and not row['missing_files']
    snapshot = read(OUT/row['snapshot'])
    assert set(snapshot) == set(row['baseline_files'])|set(row['overlay_files'])
    for relative,expected in snapshot.items():
        if relative in row['overlay_files']:
            data = contents[row['overlay_files'][relative]]
        else:
            if relative not in baseline_bytes:
                baseline_bytes[relative] = git('show',f'{baseline}:{relative}')
            data = baseline_bytes[relative]
        assert sha(data) == expected,(row['snapshot'],relative)

status = read(ROOT/'crates/hyperbrep/docs/IMPLEMENTATION_STATUS.json')
assert not status['complete'] and len(status['work_packages']) == 28
assert all(row['status'] in ['open','in-progress'] for row in status['work_packages'])
changes = git('diff','HEAD','--name-only').decode().splitlines()
changes += git('ls-files','--others','--exclude-standard').decode().splitlines()
assert all(p.startswith(('crates/hyperbrep/','crates/hyperbrep-io/')) for p in changes)
stashes = git('stash','list','--format=%H').decode().splitlines()
assert {'96c308f87af6f3491828ada3e9b8e92cec858cf1','b00958cb640fedbe041c46581327df3e64deacf5'} <= set(stashes)
links = []
documents = [ROOT/p for p in manifest['documents'] if p.endswith('.md')]+sorted(OUT.glob('*.md'))
for path in documents:
    for _,target in re.findall(r'\[([^\]]+)\]\(([^)]+)\)',path.read_text()):
        if '://' in target or target.startswith('#'):
            continue
        destination = path.parent/target.split('#')[0]
        assert destination.exists() or destination == OUT/'audit.json',(path,target)
        links.append(dict(document=str(path.relative_to(ROOT)),target=target))
for path in OUT.rglob('*.json'):
    read(path)
for path in [*(OUT/'analysis-recipes').glob('*.py'),*(OUT/'final-review').glob('*.py')]:
    ast.parse(path.read_text(),filename=str(path))
command = ['git','diff','--cached','--check']
check = subprocess.run(command,cwd=ROOT,text=True,capture_output=True)
raw = sorted({line.rsplit(':',2)[0] for line in check.stdout.splitlines()
              if any(term in line for term in ['trailing whitespace.','space before tab in indent.','new blank line at EOF.'])})
assert all((ROOT/p).is_relative_to(OUT) and Path(p).suffix == '.log' for p in raw)
scoped = subprocess.run([*command,'--','.',*[':(exclude)'+p for p in raw]],cwd=ROOT,text=True,capture_output=True)
assert scoped.returncode == 0,scoped.stdout
assert not git('diff','--check')
assert hashes() == source
result = dict(baseline=baseline,source_identity=manifest['source_identity'],source_matches_final=True,
    source_snapshots_reconstructed=len(reconstruction['sources']),overlay_members_verified=len(contents),
    frozen_binaries_verified=len(items)+1,exact_artifacts_verified=61,benchmark_receipts_preserved=175,
    raw_data_whitespace=dict(command=command,exit_code=check.returncode,diagnostics=check.stdout,
                             preserved_files={p:digest(ROOT/p) for p in raw}),
    code_documentation_whitespace_exit=scoped.returncode,evidence_hashes_verified=len(manifest['evidence_files']),
    local_links=links,preserved_stashes=stashes,work_packages_open=28,
    inherited_failure_labels=sorted(blocked),wasm_correction='Explicit three-file consumer-only correction; identical native consumed inputs and requalified WASM with warnings denied.',
    limitation='Precommit local source/evidence, ownership, JSON, Python syntax and link-existence audit. Not remote-link/anchor, package, full-workspace or pre-push admission.')
(OUT/'audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['source_snapshots_reconstructed','frozen_binaries_verified','exact_artifacts_verified','work_packages_open']}))
