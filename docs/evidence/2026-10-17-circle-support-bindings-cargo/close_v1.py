"""Close native binding consumer evidence; do not admit code."""
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


P=D/'docs/evidence/2026-10-17-circle-support-modeling-cargo'
E=D/'docs/evidence/2026-10-17-circle-support-bindings-cargo'
PREFIX=str(E.relative_to(D))+'/'
BASE='c2c51fe458f26c519215794a306bf363733c764b'
assert not E.exists() and shutil.disk_usage(D).free>768*1024**2
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=D,text=True).strip()==BASE
assert not subprocess.check_output(GIT+['status','--porcelain','--untracked-files=all'],cwd=D)
previous=read(P/'checkpoint-v1.json')
assert all(sha(D/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior)==1235837 and len(missing)==27093
inherited=previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live=previous['restored_native_sha256'] | inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p))==h for p,h in pins.items())
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
original_ledger=sha(ORIGIN/'docs/properties-status.json')
assert original_ledger=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
native=read(V/'native-bindings-result-v1.json');go=read(V/'go-consumers-result-v1.json')
tool=read(V/'go-tools-result-v2.json');failure=read(V/'go-tools-attempt-v1-result.json')
assert native['complete_for_declared_scope'] and native['consumer_count']==27
assert native['ffi_ci_checks_passed'] and native['actual_c_cpp_python_consumers_passed']
assert native['source_unchanged'] and go['source_unchanged']
assert go['complete_for_declared_scope'] and go['test_count']==6 and go['failures']==go['skips']==0
assert tool['complete'] and tool['files_verified']==15657 and tool['telemetry_off']
assert not failure['complete'] and failure['parent_exit_code']==1 and not failure['consumer_executed']
assert tool['observed_environment']['GOENV']=='' and tool['environment']['GOENV']=='off'
protocol=read(V/'native-bindings-protocol-v1.json')
assert sha(V/'control/native-bindings-v1/validate_v1.py')==protocol['helper_sha256']
assert sha(V/'control/native-bindings-v1/contract-v1.md')==protocol['contract_sha256']
assert sha(V/'candidate-source-inventory-v1.json.gz')==protocol['source_inventory_sha256']
inventory=json.loads(gzip.decompress((V/'candidate-source-inventory-v1.json.gz').read_bytes()))
source_pins={p:h for p,h in inventory.items() if not p.startswith('crates/comparisons/')}
assert all(sha(C/p)==h for p,h in source_pins.items())
for name,stem in [('go-consumers-protocol-v1.json','go-consumers-v1'),('go-tools-protocol-v2.json','go-tools-v2')]:
    row=read(V/name)
    helper='validate_v1.py' if stem=='go-consumers-v1' else 'verify_v2.py'
    assert sha(V/'control'/stem/helper)==row['helper_sha256']
    assert sha(V/'control'/stem/'contract-v1.md')==row['contract_sha256']
assert all(sha(p)==row['sha256'] for p,row in read(V/'go-tools-v1/file-inventory-v1.json').items())
copy_proof=read(V/'go-consumers-v1/copy-proof-v1.json')
assert all(sha(p)==row['sha256'] and sha(row['source'])==row['sha256'] for p,row in copy_proof.items())
library=read(V/'native-binding-consumers-v1/library.json')
assert sha(library['path'])==library['sha256']==go['actual_library_sha256']
assert all(row['library_sha256']==library['sha256'] for row in native['consumers'].values())
selected_logs=[p for p in sorted((V/'logs').iterdir()) if p.name.startswith(('ffi-','go-tools-','go-consumers-'))]
assert len(selected_logs)==66,len(selected_logs)
for folder in selected_logs:
    row=read(folder/'result.json')
    assert row['output_closed'] and row['exit_code']==0 and not row['stops'],folder
    assert all(sha(folder/n)==h for n,h in row['output_sha256'].items())
rows=re.findall(r'^test result: (\w+)\. (\d+) passed; (\d+) failed; (\d+) ignored; (\d+) measured; (\d+) filtered out;',
    (V/'logs/ffi-tests-v1/stdout').read_text(),re.M)
assert len(rows)==2 and sum(int(row[1]) for row in rows)==10
assert all(row[0]=='ok' and row[2]==row[3]==row[5]=='0' for row in rows)
events=[json.loads(line) for line in (V/'logs/go-consumers-runtime-v1/stdout').read_text().splitlines()]
assert not any(row.get('Action') in ['fail','skip'] for row in events)
assert sorted(row['Test'] for row in events if row.get('Action')=='pass' and 'Test' in row)==go['tests_passed']
review={'status':'actual C, C++, Python and Go consumer tests passed; cache admission remains open',
    'documentation_base_revision':BASE,'rust_baseline_revision':'7ed43501755fd64a01f54c3078d12229cbc0129d',
    'source_inventory_sha256':protocol['source_inventory_sha256'],'source_pin_count':len(source_pins),
    'ffi_ci_checks_passed':True,'ffi_tests_passed':10,'ffi_tests_failed':0,'ffi_tests_ignored':0,
    'actual_consumers_passed':{'C':9,'C++':9,'Python':9,'Go_tests':6},'commands_passed':len(selected_logs),
    'library_sha256':library['sha256'],'go_version':tool['tool_version'],'go_installed_files_verified':15657,
    'go_test_cache_disabled':True,'go_setup_v1_parent_failed':True,'go_setup_v2_passed':True,
    'go_setup_failure_category':'harness expected off instead of the empty disabled configuration filename',
    'native_js_types_passed':True,'native_js_loader_executed':False,
    'all_binding_certainty_surfaces_audited':False,'source_fixture_policy_changes':False,
    'cache_index_admitted':False,'all_workspace_ci_qualified':False,'all_bindings_qualified':False,
    'external_distribution_complete':False,'release_qualification_complete':False,'full_plan_complete':False,
    'performance_comparison':False,'remaining_gates':['Hypercurve demo','clean installed distribution'],
    'original_35_file_bundle_disposition':'rejected; independently retained smaller fixes unchanged',
    'original_worktree_integration_pending':True}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:shutil.copy2(W/name,E/name)
closed_roots=[W,*[V/'control'/p for p in ['native-bindings-v1','go-tools-v1','go-tools-v2','go-consumers-v1']],
    V/'native-binding-consumers-v1',V/'go-consumers-v1',V/'go-tools-v1',
    *selected_logs,*[V/'scratch'/p.name for p in selected_logs]]
selected=[p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith(('native-bindings-','go-tools-','go-consumers-','modeling-cargo-stage-','modeling-cargo-commit-'))]
for root in closed_roots:selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};members={};excluded={}
primary_sources={V/'go-tools-v1/install/go'/p for p in ['src/cmd/go/internal/cfg/cfg.go','src/cmd/go/internal/envcmd/env.go','src/cmd/go/alldocs.go']}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(path)]=digest
    row={'physical_path':str(path),'sha256':digest,'bytes':before.st_size}
    name=str(path.relative_to(V))
    external=(path.is_relative_to(V/'scratch') or
        path.is_relative_to(V/'native-binding-consumers-v1/pycache') or
        (path.is_relative_to(V/'native-binding-consumers-v1') and before.st_mode & 0o111) or
        path.is_relative_to(V/'go-consumers-v1/lib') or
        path.is_relative_to(V/'go-tools-v1/install') or
        path.suffix=='.gz') and path not in primary_sources
    (excluded if external else members)[name]=row
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as source:
    assert set(source.getnames())==set(members)
    for name,row in members.items():
        with source.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
dump(E/'archive-members-v1.json',{'members':members,'archive_sha256':sha(archive),'archive_bytes':archive.stat().st_size,
    'all_members_content_verified':True,'excluded_artifacts_physically_preserved':excluded})
(E/'README.md').write_text("""# Actual native binding consumer qualification

All existing consumer programs passed against the same tested native library:
nine C, nine C++ and nine Python programs, plus all six Go tests in a fresh
external module with unchanged source and header copies. C/C++ assertions were
enabled; Go test-result caching was disabled. Exact library and source hashes
were checked before and after. The FFI workflow checks passed, including ten
Rust tests with no failures or ignored tests. Native TypeScript syntax and
Python compilation passed; a native JavaScript loader was not executed.

The first Go setup helper failed after its four successful commands because
its assertion expected GOENV to report off. The verified Go implementation
reports an empty disabled configuration filename. The failed helper and its
raw child command logs remain preserved. A new helper corrected only that
expectation, verified every installed file, and passed fresh version and
environment checks before the consumers ran. No repository policy, test,
fixture or resource limit changed to obtain these results.

This checkpoint records 66 successful child commands and the separate failed
setup-parent assertion. It does not establish every binding certainty surface,
clean registry installation, release readiness, or the entire infinite input
domain. The cache candidate remains separately uncommitted and unadmitted.
The original 35-file bundle remains rejected. The demo and clean installed
consumer path remain separate gates.

Raw logs, controls, receipts, copied consumer source and the inspected Go source
are archived and verified. Executables, the library snapshot, installed SDK,
compiler caches and retained Go work files are independently hashed at each
physical path and explicitly excluded from the Git archive. General build,
cache and configuration roots stay open. The original repository is unchanged;
only current_work changes in the isolated ledger. Historical missing paths
remain 27,093 and are not requalified by this checkpoint.
""")
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes()
reference=subprocess.check_output(GIT+['show','9025de62:docs/properties-status.json'],cwd=D)
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='circle_support_native_binding_qualification';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'actual_consumers_passed':review['actual_consumers_passed'],'ffi_tests_passed':10,
    'go_setup_failure_preserved':True,'cache_index_admitted':False,'full_plan_complete':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'actual native binding consumer qualification',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'Every newly closed native-binding physical path independently hashed; general build/cache/config roots remain open.'}
(E/'artifact-expectations-v1.json.gz').write_bytes(gzip.compress((json.dumps(expectations,sort_keys=True)+'\n').encode(),mtime=0))
for path in E.iterdir():
    if path.suffix in ['.py','.md','.json']:
        content=path.read_text();assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check','--','docs/properties-status.json'],cwd=D,stdout=out,stderr=err)
assert checked.returncode==0
files={str(p.relative_to(D)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous)
record.update({'status':review['status'],'checkpoint_kind':'actual native binding consumer qualification',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,'original_repository_updated':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True,'evidence_parent_repository':str(D),
    'runtime_tests_rerun':True,'format_rerun':True,'format_exit_code':0,'whitespace_exit_code':0,
    'native_binding_declared_scope_complete':True,'all_bindings_qualified':False,
    'cache_index_admitted':False,'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(C/p)==h for p,h in source_pins.items())
assert all(sha(inherited_path(p))==h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json')==original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_physical_files':len(excluded),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
