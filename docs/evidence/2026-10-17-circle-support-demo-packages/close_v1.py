"""Close demo success and package-assembly failures; do not admit code."""
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


P=D/'docs/evidence/2026-10-17-circle-support-bindings-cargo'
E=D/'docs/evidence/2026-10-17-circle-support-demo-packages'
PREFIX=str(E.relative_to(D))+'/'
BASE='932c569ef02b8b06a5ee2dfd0460a56070041bf6'
assert not E.exists() and shutil.disk_usage(D).free>768*1024**2
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=D,text=True).strip()==BASE
assert not subprocess.check_output(GIT+['status','--porcelain','--untracked-files=all'],cwd=D)
previous=read(P/'checkpoint-v1.json')
assert all(sha(D/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior)==1252519 and len(missing)==27093
inherited=previous['inherited_implementation_sha256'] | previous['implementation_sha256']
live=previous['restored_native_sha256'] | inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p))==h for p,h in pins.items())
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
original_ledger=sha(ORIGIN/'docs/properties-status.json')
assert original_ledger=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
demo=read(V/'curve-demo-result-v1.json');package=read(V/'workspace-package-result-v2.json')
staging=json.loads(gzip.decompress((V/'workspace-package-staged-members-v1.json.gz').read_bytes()))
inspection=read(V/'workspace-package-staging-inspection-v1.json')
assert demo['complete'] and demo['exact_demo_ci_commands_passed'] and demo['source_unchanged']
assert demo['test_summaries']==[['ok','42','0','0','0','0']]
assert not package['archive_assembly_complete'] and package['command']['exit_code']==101 and not package['command']['stops']
assert package['source_unchanged'] and not package['package_builds_verified']
assert staging['logical_staged_package_count']==8 and staging['independently_hashed_physical_archive_paths']==17
assert staging['all_source_members_byte_equal'] and staging['final_output_archives']==0
assert all(sha(p)==row['sha256'] for p,row in inspection['archives'].items())
assert read(V/'workspace-package-preflight-failure-v1.json')['package_command_launched'] is False
source_inventory=V/'candidate-source-inventory-v1.json.gz'
inventory=json.loads(gzip.decompress(source_inventory.read_bytes()))
source_pins={p:h for p,h in inventory.items() if not p.startswith('crates/comparisons/')}
assert all(sha(C/p)==h for p,h in source_pins.items())
for name,folder,helper,contract in [
 ('curve-demo-protocol-v1.json','curve-demo-v1','validate_v1.py','contract-v1.md'),
 ('workspace-package-protocol-v2.json','workspace-package-v2','assemble_v2.py','contract-v2.md')]:
    row=read(V/name)
    assert sha(V/'control'/folder/helper)==row['helper_sha256']
    assert sha(V/'control'/folder/contract)==row['contract_sha256']
    assert sha(source_inventory)==row['source_inventory_sha256']
selected_logs=[V/'logs'/name for name in sorted(demo['commands'])]+[V/'logs/workspace-package-assembly-v2']
assert len(selected_logs)==5
for folder in selected_logs:
    row=read(folder/'result.json')
    expected=101 if folder.name=='workspace-package-assembly-v2' else 0
    assert row['output_closed'] and row['exit_code']==expected and not row['stops']
    assert all(sha(folder/n)==h for n,h in row['output_sha256'].items())
text=(V/'logs/workspace-package-assembly-v2/stderr').read_text()
assert 'no matching package named `hypervoxel` found' in text and 'hypersdf v0.2.0' in text
hyperreal=staging['completed_staging_archives']['hyperreal']
checkpoint_rows={p:r for p,r in hyperreal['members'].items() if p.startswith('benchmarks/checkpoints/')}
assert hyperreal['bytes']==108043832 and len(checkpoint_rows)==126
checkpoint_bytes=sum(row['bytes'] for row in checkpoint_rows.values());assert checkpoint_bytes==110147092
wasm=V/'target-curve-demo-v1/wasm32-unknown-unknown/release/hypercurve_ui.wasm'
assert wasm.is_file()
review={'status':'demo CI passed; workspace package assembly failed on excluded Hypervoxel registry dependency',
 'documentation_base_revision':BASE,'rust_baseline_revision':'7ed43501755fd64a01f54c3078d12229cbc0129d',
 'source_inventory_sha256':sha(source_inventory),'source_pin_count':len(source_pins),
 'demo_tests_passed':42,'demo_tests_failed':0,'demo_tests_ignored':0,'demo_clippy_passed':True,
 'demo_release_wasm_built':True,'demo_wasm_sha256':sha(wasm),'demo_wasm_bytes':wasm.stat().st_size,
 'demo_registry_archives_verified':demo['registry_archives_verified'],'interactive_browser_qualified':False,
 'workspace_package_members_selected':19,'workspace_package_exit_code':101,'workspace_package_resource_stop':False,
 'package_blocker':'hypersdf requires hypervoxel, excluded from the root workspace and not found by the updated registry lookup',
 'package_preflight_v1_failed_before_command':True,'package_preflight_v2_selection_independently_verified':True,
 'initial_partial_inventory_omitted_nested_staging':True,'corrected_staged_logical_packages':8,
 'corrected_physical_archive_paths':17,'incomplete_archive_count':1,'final_package_archive_count':0,
 'staged_nongenerated_members_equal_source_bytes':True,'candidate_cache_test_in_staged_hypercurve':True,
 'hyperreal_archive_bytes':hyperreal['bytes'],'hyperreal_checkpoint_members':126,'hyperreal_checkpoint_bytes':checkpoint_bytes,
 'package_builds_verified':False,'source_fixture_policy_changes':False,'cache_index_admitted':False,
 'all_workspace_ci_qualified':False,'external_distribution_complete':False,'release_qualification_complete':False,
 'full_plan_complete':False,'performance_comparison':False,
 'next_work':['preserve all historical bundles while narrowing Hyperreal package membership',
              'prepare excluded release dependencies without deleting optional supported capabilities',
              'build packaged artifacts and complete the external modeling pipeline and MSRV checks'],
 'original_35_file_bundle_disposition':'rejected; independently retained smaller fixes unchanged',
 'original_worktree_integration_pending':True}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:shutil.copy2(W/name,E/name)
targets=[V/'target-curve-demo-v1',V/'target-workspace-packages-v2']
closed_roots=[W,*[V/'control'/p for p in ['curve-demo-v1','workspace-package-v1','workspace-package-v2','package-staging-audit-v1']],
 *targets,*selected_logs,*[V/'scratch'/p.name for p in selected_logs]]
selected=[p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith(('curve-demo-','workspace-package-','bindings-cargo-stage-','bindings-cargo-commit-','continuation-after-bindings-qualification-'))]
for root in closed_roots:selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};members={};excluded={}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(path)]=digest
    row={'physical_path':str(path),'sha256':digest,'bytes':before.st_size}
    name=str(path.relative_to(V))
    (excluded if any(path.is_relative_to(target) for target in targets) else members)[name]=row
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
(E/'README.md').write_text("""# Demo qualification and package assembly findings

The unchanged Hypercurve demo workflow passed: 42 tests, strict Clippy and the
release wasm32 build. Its separate lockfile's registry archives were verified.
This qualifies the declared workflow commands, not interactive browser behavior.

A full root-workspace archive-assembly attempt selected all 19 publishable members
and failed after updating the registry: HyperSDF requires Hypervoxel, which is
excluded from this workspace and was not found in the registry. No dependency,
feature or policy was weakened. Package builds were deliberately a later gate;
the failed assembly cannot be credited as a successful distribution.

Cargo retained eight pairs of staged archives and one incomplete HyperSDF file.
The initial summary inspected only the final directory and omitted that staging.
A recursive follow-up preserved all 17 physical archive paths and verified every
nongenerated member of the eight staged packages byte-for-byte against source.
Normalized active manifests contain no workspace paths or patches. Hypercurve's
new cache regression module is present. No final package archives were published
by the command. The separate v1 helper's stale membership-count assertion also
remains preserved; it failed before launching Cargo.

The staged Hyperreal archive is 108,043,832 bytes (103.0 MiB). Its 126 historical
checkpoint members contribute 110,147,092 uncompressed bytes. Large archived
verification bundles dominate this package. A package-content migration must
preserve source, tests, required fixtures, summaries and the repository's replay
bundles. No such metadata change is applied by this checkpoint.

The [Cargo package documentation](https://doc.rust-lang.org/cargo/commands/cargo-package.html)
describes multi-package assembly and the separate verification step. The
[Cargo publishing guide](https://doc.rust-lang.org/cargo/reference/publishing.html)
documents a 10 MB archive limit; a crate-specific exception was not investigated.

Raw controls, logs and inventories are archived and verified. The completed demo
target and package-staging target are closed, independently hashed at every
physical path, and retained outside the Git archive. Source and general Cargo,
compiler and native-build caches remain open. The cache candidate is unadmitted;
release, external-consumer, MSRV and full-plan completion remain open. Historical
missing paths remain 27,093. Only current_work changes in the isolated ledger;
the original repository remains unchanged.
""")
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes()
reference=subprocess.check_output(GIT+['show','9025de62:docs/properties-status.json'],cwd=D)
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='circle_support_demo_package_qualification';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
 'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
 'demo_tests_passed':42,'demo_release_wasm_built':True,'workspace_package_assembly_passed':False,
 'staged_packages_verified':8,'hyperreal_archive_bytes':hyperreal['bytes'],'cache_index_admitted':False,
 'full_plan_complete':False,'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'demo workflow qualification and failed package assembly',
 'parent_expectations':str(D/previous['artifact_expectations']),
 'parent_expectations_repository_relative':previous['artifact_expectations'],
 'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
 'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
 'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
 'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
 'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
 'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
 'scope':'Every new closed demo/package physical path independently hashed; general source/cache/build roots remain open.'}
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
record.update({'status':review['status'],'checkpoint_kind':'demo workflow and package assembly findings',
 'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
 'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
 'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
 'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
 'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
 'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
 'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
 'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,'original_repository_updated':False,
 'isolated_worktree':str(D),'original_worktree_integration_pending':True,'evidence_parent_repository':str(D),
 'runtime_tests_rerun':True,'format_rerun':False,'format_exit_code':None,'whitespace_exit_code':0,
 'demo_workflow_qualification_complete':True,'workspace_package_assembly_complete':False,
 'cache_index_admitted':False,'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(C/p)==h for p,h in source_pins.items())
assert all(sha(inherited_path(p))==h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json')==original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
 'archive_members':len(members),'excluded_physical_files':len(excluded),'archive_bytes':archive.stat().st_size,
 'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
