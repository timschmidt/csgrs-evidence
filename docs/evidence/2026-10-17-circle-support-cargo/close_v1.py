"""Close completed Cargo and configured WASM evidence; do not admit code."""
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

assert not E.exists()
assert shutil.disk_usage(D).free > 512*1024**2 + 32*1024**2
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=D,text=True).strip() == BASE
subprocess.run(GIT+['diff','--quiet'],cwd=D,check=True)
subprocess.run(GIT+['diff','--cached','--quiet'],cwd=D,check=True)
previous = read(P/'checkpoint-v1.json')
assert all(sha(D/p) == h for p,h in previous['evidence_files_sha256'].items())
prior,missing = load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior) == 1233448 and len(missing) == 27093
inherited = previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live = previous['restored_native_sha256'] | inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p)) == h for p,h in pins.items())
assert sha(D/'docs/properties-status.json') == previous['ledger_after_sha256']
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip() == '7ed43501755fd64a01f54c3078d12229cbc0129d'
original_ledger = sha(ORIGIN/'docs/properties-status.json')
assert original_ledger == 'b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
base = read(V/'baseline-curve-result-v1.json')
curve = read(V/'candidate-curve-result-v1.json')
scalar = read(V/'candidate-scalar-hash-result-v1.json')
wasm = read(V/'candidate-wasm-result-v2.json')
assert all(result['complete'] for result in [base,curve,scalar,wasm])
assert curve['cargo_curve_matrix_complete'] and scalar['existing_scalar_tests_passed'] == 2
assert wasm['NODE_OPTIONS'] == '--disable-wasm-trap-handler' and wasm['real_consumers_passed'] and wasm['wasm_clippy_passed']
source_pins = read(V/'candidate-curve-protocol-v1.json')['candidate_source_sha256']
assert all(sha(C/p) == h for p,h in source_pins.items())
assert source_pins['crates/hypercurve/src/curve_intersection.rs'] == '356af6f3c04694c03dfb7b901296e1b7862772050c3e75480f4cfdce05733416'
assert source_pins['crates/hypercurve/src/circle_support_cache_tests.rs'] == '4d7b2fdcee72fc064361de4bc91fb5ce8eac342188ca02f830a543a283c3184c'
rows = {}
for label,name in [('baseline','baseline-curve-tests-v1'),('all','candidate-curve-tests-all-v1'),('minimal','candidate-curve-tests-minimal-v1')]:
    text = (V/'logs'/name/'stdout').read_text()
    values = re.findall(r'^test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out;',text,re.M)
    assert len(values) == 53 and all(row[0] == 'ok' and row[2] == '0' and row[5] == '0' for row in values)
    rows[label] = {'groups':values,'passed':sum(int(row[1]) for row in values),'ignored':sum(int(row[3]) for row in values),'failed':0}
assert [rows[k]['passed'] for k in ['baseline','all','minimal']] == [2478,2487,2450]
assert [rows[k]['ignored'] for k in ['baseline','all','minimal']] == [33,33,28]
assert rows['baseline']['groups'][1:] == rows['all']['groups'][1:]
assert int(rows['all']['groups'][0][1])-int(rows['baseline']['groups'][0][1]) == 9
for label in ['unreduced','lazy']:
    text = (V/'logs'/('candidate-scalar-hash-'+label+'-v1')/'stdout').read_text()
    assert re.search(r'test result: ok\. 1 passed; 0 failed; 0 ignored;',text)
tap = (V/'logs/candidate-wasm-real-consumers-v2/stdout').read_text()
assert re.findall(r'^# tests (\d+)$',tap,re.M) == ['12','13','10']
assert re.findall(r'^# fail (\d+)$',tap,re.M) == ['0','0','0']
assert re.findall(r'^# skipped (\d+)$',tap,re.M) == ['0','0','0']
assert read(V/'node-wasm-memory-probe-v2/result.json')['complete']
assert read(V/'candidate-wasm-attempt-v1-result.json')['complete'] is False
selected_logs = [p for p in sorted((V/'logs').iterdir()) if not p.name.startswith('native-')]
assert all((p/'result.json').exists() for p in selected_logs)
for folder in selected_logs:
    result = read(folder/'result.json')
    assert result['output_closed'] and not result['stops']
    expected = 1 if folder.name in ['candidate-wasm-real-consumers-v1','node-wasm-memory-default-v1','node-wasm-memory-default-v2'] else 0
    assert result['exit_code'] == expected,(folder.name,result['exit_code'])
    assert all(sha(folder/name) == h for name,h in result['output_sha256'].items())
closed_targets = [V/'target-candidate-wasm-v1',V/'target-candidate-wasm-v2']
target_paths = {}
for root in closed_targets:
    for path in sorted(root.rglob('*')):
        assert not path.is_symlink(),path
        if path.is_file():
            target_paths[str(path)] = sha(path)
with gzip.open(V/'candidate-wasm-attempt-v1-closed-target-inventory.json.gz','rt') as stream:
    old_index = json.load(stream)
assert all(target_paths[p] == row['sha256'] for p,row in old_index.items())
target_index = V/'candidate-wasm-closed-targets-v1.json.gz'
assert not target_index.exists()
target_index.write_bytes(gzip.compress((json.dumps(target_paths,sort_keys=True)+'\n').encode(),mtime=0))
review = {
    'status':'fresh Hypercurve Cargo, scalar hash and configured WASM consumer checks passed; production cache admission remains open',
    'rust_baseline_revision':'7ed43501755fd64a01f54c3078d12229cbc0129d','documentation_base_revision':BASE,
    'candidate_source_sha256':source_pins,'test_summaries':rows,'new_cache_tests_passed_in_both_configurations':9,
    'scalar_hash_regressions_passed':2,'full_scalar_suite_qualified':False,
    'wasm_javascript_programs':5,'wasm_tap_tests_passed':35,'wasm_typescript_typecheck_passed':True,
    'wasm_typescript_programs_executed':2,'wasm_clippy_passed':True,
    'NODE_OPTIONS':'--disable-wasm-trap-handler','address_space_limit_bytes':8*1024**3,
    'default_node_runtime_qualified':False,'source_fixtures_policies_unchanged':True,
    'candidate_readme_license_fix_preserved':True,'native_bundle_disposition':'rejected; independently admitted smaller fixes remain retained',
    'preserved_failures':['initial expanded-LFS verification mismatch','default Node initial WASM memory allocation failure','first allocation probe diagnostic-text assertion failure','checkpoint helper preparation syntax error before execution'],
    'closed_wasm_targets':[str(p) for p in closed_targets],
    'open_roots':['baseline and candidate source worktrees','Cargo registry and compiler caches','native/scalar target directories','active native qualification logs'],
    'native_qualification_in_progress':True,'cache_index_admitted':False,'performance_comparison':False,
    'full_workspace_ci_qualified':False,'all_bindings_qualified':False,'release_qualification_complete':False,
    'full_plan_complete':False,'original_repository_updated':False,'original_worktree_integration_pending':True,
    'remaining_gates':['unchanged native workload limits and full suite','native report compatibility','modeling and circuit configurations','actual native binding consumers','Hypercurve demo','clean installed distribution']}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add','docs/evidence/2026-10-17-circle-support-cargo'],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:
    shutil.copy2(W/name,E/name)
selected = []
for path in sorted(V.iterdir()):
    if path.is_file() and path.name.startswith(('baseline-','candidate-','cargo-','setup-','paper-')):
        selected.append(path)
selected.extend(path for path in sorted((V/'control').iterdir()) if path.is_file())
for root in [V/'control/candidate-curve-v1',V/'control/spaceless-mount-v1',V/'node-wasm-memory-probe-v1',V/'node-wasm-memory-probe-v2',W,*selected_logs]:
    selected.extend(p for p in sorted(root.rglob('*')) if p.is_file())
assert len(selected) == len(set(selected))
physical = dict(target_paths)
members = {}
for path in selected:
    assert not path.is_symlink()
    before = path.stat(); digest = sha(path); after = path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns) == (after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert str(path) not in physical
    physical[str(path)] = digest
    members[str(path.relative_to(V))] = {'physical_path':str(path),'sha256':digest,'bytes':before.st_size}
archive = E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():
        output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as source:
    assert set(source.getnames()) == set(members)
    for name,row in members.items():
        with source.extractfile(name) as stream:
            assert hashlib.file_digest(stream,'sha256').hexdigest() == row['sha256']
dump(E/'archive-members-v1.json',{'members':members,'archive_sha256':sha(archive),
    'archive_bytes':archive.stat().st_size,'all_members_content_verified':True,
    'excluded_build_artifacts_physically_preserved':{'inventory':str(target_index),'inventory_sha256':sha(target_index),'physical_path_count':len(target_paths)}})
(E/'README.md').write_text('''# Fresh curve and WASM qualification

The unchanged baseline completed the full all-feature Hypercurve Cargo suite:
2,478 passed, zero failed, 33 ignored. The isolated cache candidate completed
both configurations: 2,487 passed/33 ignored with all features, and 2,450
passed/28 ignored without defaults. All nine new cache tests passed in both.
The all-feature delta is exactly nine unit-test passes; all other group counts
match the fresh baseline. Each run had 53 terminal test groups. Root formatting,
both strict curve Clippy configurations and warning-free curve docs passed.

Two existing scalar regressions exercised unreduced rational hashing and
canonical observable boundaries. GMP was built through a private whitespace-free
mount alias on Disk B, preserving dependency and test sources. This is two
named scalar tests, not full scalar-suite qualification.

The unchanged real WASM script completed five JavaScript programs, three TAP
groups totaling 35 tests, the TypeScript declaration check and two compiled
TypeScript programs. WASM Clippy passed. The first attempt built successfully
but failed at initial Node WASM allocation under an 8 GiB virtual-address cap.
A one-page allocation reproduced that environment failure. The successful run
used NODE_OPTIONS=--disable-wasm-trap-handler for explicit bounds checking under
the same cap. Default Node runtime qualification remains open. The failed run,
first probe diagnostic-text assertion and helper preparation error are retained.

Source, fixtures, policies and existing timing gates remain unchanged. The
candidate README preserves the Apache license link. These results qualify the
stated local checks; they do not admit the cache candidate, reverse rejection
of the original 35-file native bundle, establish an end-to-end speedup, qualify
every binding or complete the properties plan. Native workload and report checks
are in progress in separate open roots. Remaining gates are in review-v1.json;
historical E46 cost evidence retains its own scope.

Every newly closed path is independently hashed. The verified compact archive
retains completed logs, controls, source inventories and failed attempts. Both
WASM targets remain physically preserved and pinned, without copying binaries
into Git. General source, registry/cache and native/scalar build roots remain
open. Inherited missing paths remain 27,093; this is not a full historical audit.
Only current_work changes in the execution ledger.

This evidence is committed in the isolated Disk B documentation worktree. The
original repository remains below its reserve and unchanged. Parent expectations
use the retained isolated E53 path, then its original-repository parent.
Integration and portable release reproduction remain separate work.
''')
ledger = D/'docs/properties-status.json'; raw = ledger.read_bytes()
reference = subprocess.check_output(GIT+['show','9025de62:docs/properties-status.json'],cwd=D)
start,end,current = span(raw); rs,re_,_ = span(reference)
assert (raw[:start],raw[end:]) == (reference[:rs],reference[re_:])
key = 'circle_support_fresh_cargo_qualification'; assert key not in current
current[key] = {'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'baseline_all_feature_passed':2478,'candidate_all_feature_passed':2487,'candidate_minimal_passed':2450,
    'scalar_hash_regressions_passed':2,'wasm_real_consumers_passed':True,
    'wasm_runtime_option':'--disable-wasm-trap-handler','default_node_runtime_qualified':False,
    'native_qualification_in_progress':True,'cache_index_admitted':False,'full_plan_complete':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated = raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_ = span(updated)
assert (updated[:us],updated[ue:]) == (reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k != 'current_work'} == {k:v for k,v in json.loads(reference).items() if k != 'current_work'}
ledger.write_bytes(updated)
assert prior.keys().isdisjoint(physical)
expectations = {'schema_version':3,'kind':'fresh Cargo and configured WASM consumer qualification',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),
    'physical_roots':[str(p) for p in [W,*closed_targets,*selected_logs]],
    'directory_inventory':[str(p) for p in [W,*closed_targets,*selected_logs]],
    'local_tool_symlink_targets':{},'inherited_artifacts_reverified':False,
    'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'All newly closed selected paths independently hashed; broader source/cache/native roots remain open.'}
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
record.update({'status':review['status'],'checkpoint_kind':'fresh Hypercurve Cargo and configured real WASM consumer qualification',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,
    'original_repository_updated':False,'isolated_worktree':str(D),'original_worktree_integration_pending':True,
    'evidence_parent_repository':str(D),'runtime_tests_rerun':True,'format_rerun':True,'format_exit_code':0,
    'whitespace_exit_code':0,'full_library_qualification_complete':True,
    'library_qualification_scope':'Fresh Cargo all-feature and no-default-feature Hypercurve suites, Clippy and docs; scalar scope is two named hash tests.',
    'hypercurve_cargo_matrix_qualified':True,'full_cargo_matrix_qualified':False,'cache_index_admitted':False,
    'configured_real_wasm_consumers_qualified':True,'default_node_runtime_qualified':False,
    'downstream_native_qualification_complete':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p) == h for p,h in physical.items())
assert all(sha(C/p) == h for p,h in source_pins.items())
assert all(sha(inherited_path(p)) == h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json') == original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_build_artifacts':len(target_paths),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
