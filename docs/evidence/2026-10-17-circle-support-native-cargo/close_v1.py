"""Close native gates and report compatibility evidence; do not admit code."""
import ast
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tarfile
sys.dont_write_bytecode = True
ORIGIN = Path('/home/tim/Documents/GitHub/workspace/csgrs')
V = Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
D = V / 'paper-worktree-v1'
C = V / 'checkout-candidate-v1'
W = Path(__file__).resolve().parent
P = D / 'docs/evidence/2026-10-17-scientific-manuscript'
E = D / 'docs/evidence/2026-10-17-circle-support-cargo'
PREFIX = str(E.relative_to(D)) + '/'
BASE = 'fc23195a16f45fb396a5dd731feb6c7310d8ce7c'
GIT = ['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS'] = '0'
sys.path.insert(0,str(ORIGIN/'docs/evidence/2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load

def sha(path):
    with Path(path).open('rb') as stream:
        return hashlib.file_digest(stream,'sha256').hexdigest()

def read(path):
    return json.loads(Path(path).read_text())

def dump(path,value):
    Path(path).write_text(json.dumps(value,sort_keys=True,indent=2)+'\n')

def span(raw):
    start = re.search(rb'"current_work"\s*:\s*',raw).end()
    value,count = json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:count].encode()),value

def inherited_path(name):
    local = D/name
    return local if local.exists() else ORIGIN/name


P = D/'docs/evidence/2026-10-17-circle-support-cargo'
E = D/'docs/evidence/2026-10-17-circle-support-native-cargo'
PREFIX = str(E.relative_to(D))+'/'
BASE = '5d8df349a0bd2e419daa03955590511857926ef3'
assert not E.exists()
assert shutil.disk_usage(D).free > 512*1024**2 + 256*1024**2
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=D,text=True).strip() == BASE
subprocess.run(GIT+['diff','--quiet'],cwd=D,check=True)
subprocess.run(GIT+['diff','--cached','--quiet'],cwd=D,check=True)
previous = read(P/'checkpoint-v1.json')
assert all(sha(D/p) == h for p,h in previous['evidence_files_sha256'].items())
prior,missing = load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior) == 1235590 and len(missing) == 27093
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p)) == h for p,h in pins.items())
assert sha(D/'docs/properties-status.json') == previous['ledger_after_sha256']
original_ledger = sha(ORIGIN/'docs/properties-status.json')
assert original_ledger == 'b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip() == '7ed43501755fd64a01f54c3078d12229cbc0129d'
native = read(V/'native-downstream-result-v1.json')
report = read(V/'native-report-result-v1.json')
assert native['complete'] and native['all_six_separate_native_gates_passed']
assert native['full_suite_passed'] == 1656 and native['full_suite_failed'] == 0 and native['full_suite_ignored'] == 0
assert report['complete'] and report['full_reports_equal'] and report['repeat_determinism_verified']
assert native['source_unchanged'] and report['source_unchanged']
source_pins = read(V/'candidate-curve-protocol-v1.json')['candidate_source_sha256']
assert all(sha(C/p) == h for p,h in source_pins.items())
selected_logs = [p for p in sorted((V/'logs').iterdir()) if p.name.startswith(('native-baseline-','native-candidate-','native-report-')) or p.name == 'native-fixture-preflight-v1']
assert len(selected_logs) == 26
for folder in selected_logs:
    result = read(folder/'result.json')
    assert result['output_closed'] and not result['stops'] and result['exit_code'] == 0,folder
    assert all(sha(folder/name) == h for name,h in result['output_sha256'].items())
for variant in ['baseline','candidate']:
    for label in ['full-board','copper-neck','gerber']:
        text = (V/'logs'/('native-'+variant+'-'+label+'-v1')/'stdout').read_text()
        assert re.search(r'test result: ok\. 1 passed; 0 failed; 0 ignored;',text)
text = (V/'logs/native-candidate-full-tests-v1/stdout').read_text()
rows = re.findall(r'^test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out;',text,re.M)
assert len(rows) == 10 and sum(int(row[1]) for row in rows) == 1656
assert all(row[0] == 'ok' and row[2] == row[3] == row[5] == '0' for row in rows)
assert 'skipping complex project fixture' not in text+(V/'logs/native-candidate-full-tests-v1/stderr').read_text()
case_summaries = {}
for label,case in report['cases'].items():
    assert len(case['runs']) == 4 and all(case['comparisons'].values())
    buffers = []
    for row in case['runs']:
        path = V/'logs'/row['command']/'stdout'
        assert sha(path) == row['stdout_sha256'] and path.stat().st_size == row['stdout_bytes']
        buffers.append(path.read_bytes())
    assert all(data == buffers[0] for data in buffers)
    parsed = [json.loads(data) for data in buffers]
    assert all(value == parsed[0] for value in parsed)
    first = case['runs'][0]
    case_summaries[label] = {key:first[key] for key in ['stdout_sha256','stdout_bytes','violation_count','waived_count','diagnostic_count','inconclusive_check_count','coverage']}
assert set(case_summaries) == {'cparti','hvp109a','gerber-outline'}
assert [case_summaries[k]['violation_count'] for k in ['cparti','hvp109a']] == [12,201]
fixtures = read(V/'native-fixture-preflight-v1/result.json')
assert fixtures['complete'] and fixtures['archives_verified'] == fixtures['board_extractions_verified'] == 4
binary_root = V/'native-report-binaries-closed-v1'
input_root = V/'native-complete-inputs-closed-v1'
assert not binary_root.exists() and not input_root.exists()
binary_root.mkdir();input_root.mkdir()
binaries = read(V/'native-report-binaries-v1.json')
binary_copies = {}
for variant,row in binaries.items():
    assert sha(row['path']) == row['sha256']
    destination = binary_root/('hyperdrc-'+variant)
    shutil.copy2(row['path'],destination)
    assert sha(destination) == row['sha256']
    binary_copies[str(destination)] = {'sha256':sha(destination),'bytes':destination.stat().st_size,'executed_path':row['path']}
input_copies = {}
for name in ['CPArti FPGA dev board.zip','HVP109A.zip']:
    row = fixtures['records']['baseline/'+name]
    other = fixtures['records']['candidate/'+name]
    assert sha(row['archive']) == sha(other['archive']) == row['archive_sha256'] == other['archive_sha256']
    destination = input_root/name
    shutil.copy2(row['archive'],destination)
    assert sha(destination) == row['archive_sha256']
    input_copies[str(destination)] = {'sha256':sha(destination),'bytes':destination.stat().st_size,'source_archive':row['archive']}
dump(W/'copy-proof-v1.json',{'binary_copies':binary_copies,'complete_fixture_copies':input_copies,'independent_physical_path_hashes':True})
review = {'status':'native gates, complete HyperDRC suite and full report compatibility passed; cache admission remains open',
    'rust_baseline_revision':'7ed43501755fd64a01f54c3078d12229cbc0129d','documentation_base_revision':BASE,
    'candidate_source_sha256':source_pins,'separate_native_gates_passed':6,'full_suite_passed':1656,
    'full_suite_failed':0,'full_suite_ignored':0,'full_suite_terminal_groups':10,
    'full_board_worker_cpu_limit_seconds':120,'copper_neck_check_body_wall_limit_seconds':60,
    'full_suite_external_wall_limit_seconds':5400,'full_suite_test_workers':2,
    'full_fixtures_verified':True,'native_clippy_passed':True,'native_docs_passed':True,
    'report_processes_completed':12,'full_reports_byte_equal':True,'full_parsed_reports_equal':True,
    'repeat_determinism_verified':True,'report_case_summaries':case_summaries,
    'binary_copies':binary_copies,'complete_fixture_copies':input_copies,
    'independent_geometry_oracle':False,'legacy_kicad_exact_fidelity_established':False,
    'original_35_file_bundle_disposition':'rejected; separately retained smaller fixes unchanged',
    'source_fixtures_policies_unchanged_during_validation':True,'performance_comparison':False,
    'cache_index_admitted':False,'all_workspace_ci_qualified':False,'all_bindings_qualified':False,
    'external_distribution_complete':False,'full_plan_complete':False,
    'open_roots':['source worktrees','Cargo and compiler caches','native/scalar general targets','subsequent modeling validation'],
    'remaining_gates':['modeling and circuit configurations','real native binding consumers','Hypercurve demo','clean installed distribution']}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add','docs/evidence/2026-10-17-circle-support-native-cargo'],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json','copy-proof-v1.json']:
    shutil.copy2(W/name,E/name)
closed_roots = [W,V/'control/native-downstream-v1',V/'control/native-report-v1',
    V/'native-fixture-preflight-v1',V/'native-report-fixtures-v1',binary_root,input_root,
    *selected_logs,*[V/'scratch'/p.name for p in selected_logs]]
selected = [p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith(('native-downstream-','native-report-'))]
for root in closed_roots:
    selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected) == len(set(selected))
physical = {};members = {};excluded = {}
for path in selected:
    assert not path.is_symlink(),path
    before = path.stat();digest = sha(path);after = path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns) == (after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(path)] = digest
    row = {'physical_path':str(path),'sha256':digest,'bytes':before.st_size}
    name = str(path.relative_to(V))
    if path.parent == binary_root:
        excluded[name] = row
    else:
        members[name] = row
assert len(excluded) == 2
archive = E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():
        output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as source:
    assert set(source.getnames()) == set(members)
    for name,row in members.items():
        with source.extractfile(name) as stream:
            assert hashlib.file_digest(stream,'sha256').hexdigest() == row['sha256']
dump(E/'archive-members-v1.json',{'members':members,'archive_sha256':sha(archive),'archive_bytes':archive.stat().st_size,
    'all_members_content_verified':True,'excluded_executables_physically_preserved':excluded})
(E/'README.md').write_text("""# Native workload and report qualification

Both baseline and cache candidate passed the three original native gates:
full-board, copper-neck and Gerber smoke checks. All six separate runs kept the
original 120-second worker-CPU and 60-second check-body wall limits. The complete
candidate HyperDRC release suite passed 1,656 tests across ten terminal groups,
with zero failures and zero ignored tests. Strict native Clippy and docs passed.
Both full fixture archives were independently verified before execution; missing
or failed extraction could not be credited as a passing workload.

Complete CLI JSON reports were generated in baseline/candidate/candidate/baseline
order at identical paths for both complete boards and the original Gerber outline
smoke input. All twelve processes completed. Full byte and parsed-report equality
held across variants and repetitions, preserving all findings, diagnostics,
coverage and provenance. The boards retained 12 and 201 findings. No report
content was normalized away. The Gerber check remains its original limited smoke
workload; it does not cover every layer in the package.

These are resource-gate and compatibility results, not an end-to-end performance
benchmark or an independent oracle for exact legacy KiCad geometry. The original
35-file bundle and exact KiCad ingress proposal remain rejected. Source, fixtures,
policies and assertions were unchanged throughout qualification. The cache
candidate remains unadmitted pending the remaining consumer and distribution
checks listed in review-v1.json.

The exact executed CLI binaries were copied and independently hashed before
broader builds reuse their open targets. Both complete ZIP fixtures are retained.
The verified raw archive includes logs, controls, reports and fixtures; binary
snapshots are physically pinned outside Git. All completed scratch roots are
included in the closure inventory. General source, registry/cache and native
build roots remain open. Historical missing paths remain 27,093 and are not
requalified by this checkpoint. Only current_work changes in the ledger; the
original repository remains unchanged and integration remains pending.
""")
ledger = D/'docs/properties-status.json';raw = ledger.read_bytes()
reference = subprocess.check_output(GIT+['show','9025de62:docs/properties-status.json'],cwd=D)
start,end,current = span(raw);rs,re_,_ = span(reference)
assert (raw[:start],raw[end:]) == (reference[:rs],reference[re_:])
key = 'circle_support_native_qualification';assert key not in current
current[key] = {'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'separate_native_gates_passed':6,'full_suite_passed':1656,'full_suite_failed':0,'full_suite_ignored':0,
    'report_processes_completed':12,'full_reports_equal':True,'repeat_determinism_verified':True,
    'legacy_kicad_exact_fidelity_established':False,'cache_index_admitted':False,'full_plan_complete':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated = raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_ = span(updated);assert (updated[:us],updated[ue:]) == (reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version':3,'kind':'native workload and complete report compatibility qualification',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'All newly closed native paths independently hashed; general source/cache/build roots remain open.'}
(E/'artifact-expectations-v1.json.gz').write_bytes(gzip.compress((json.dumps(expectations,sort_keys=True)+'\n').encode(),mtime=0))
for path in E.iterdir():
    if path.suffix in ['.py','.md','.json']:
        content = path.read_text()
        assert all(line == line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),path
        if path.suffix == '.py':
            ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked = subprocess.run(GIT+['diff','--check','--','docs/properties-status.json'],cwd=D,stdout=out,stderr=err)
assert checked.returncode == 0
files = {str(p.relative_to(D)):sha(p) for p in E.rglob('*') if p.is_file()}
record = dict(previous)
record.update({'status':review['status'],'checkpoint_kind':'native workload and report compatibility qualification',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,
    'original_repository_updated':False,'isolated_worktree':str(D),'original_worktree_integration_pending':True,
    'evidence_parent_repository':str(D),'runtime_tests_rerun':True,'format_rerun':False,'format_exit_code':None,
    'whitespace_exit_code':0,'downstream_native_qualification_complete':True,'native_report_compatibility_complete':True,
    'cache_index_admitted':False,'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p) == h for p,h in physical.items())
assert all(sha(C/p) == h for p,h in source_pins.items())
assert all(sha(inherited_path(p)) == h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json') == original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_executables':len(excluded),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
