# Close native package builds for the explicit in-scope dependency closure.
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
ORIGIN=Path('/home/tim/Documents/GitHub/workspace/csgrs')
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
D=V/'paper-worktree-v1'; B=V/'checkout-baseline-v1'; C=V/'checkout-candidate-v1'
W=Path(__file__).resolve().parent
P=D/'docs/evidence/2026-10-17-in-scope-msrv'
E=D/'docs/evidence/2026-10-17-in-scope-packages'
PREFIX=str(E.relative_to(D))+'/'
BASE='ab85891beceb3c3eb82ab19ea646613f22226fc5'
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
sys.path.insert(0,str(ORIGIN/'docs/evidence/2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load

def sha(path):
    with Path(path).open('rb') as stream:return hashlib.file_digest(stream,'sha256').hexdigest()
def read(path):return json.loads(Path(path).read_text())
def dump(path,value):Path(path).write_text(json.dumps(value,sort_keys=True,indent=2)+'\n')
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end()
    value,count=json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:count].encode()),value
def inherited_path(name):
    local=D/name
    return local if local.exists() else ORIGIN/name

def git(args):return subprocess.check_output(GIT+args,cwd=D)
assert not E.exists() and shutil.disk_usage(D).free>768*1024**2
assert git(['rev-parse','HEAD']).decode().strip()==BASE
assert not git(['status','--porcelain=v1','--untracked-files=all'])
previous=read(P/'checkpoint-v1.json')
assert all(sha(D/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior)==1273234 and len(missing)==27093
inherited=previous['inherited_implementation_sha256']|previous['implementation_sha256']
live=previous['restored_native_sha256']|inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p))==h for p,h in pins.items())
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
original_ledger=sha(ORIGIN/'docs/properties-status.json')
assert original_ledger=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
result=read(V/'in-scope-package-result-v1.json');protocol=read(V/'in-scope-package-protocol-v1.json')
prep=read(V/'in-scope-package-preparation-v1.json')
assert result['selected_package_builds_passed'] and result['verified_final_archives']==14
assert result['independently_hashed_physical_archive_paths']==42 and not result['warnings']
assert result['hypervoxel_deferred_by_user'] and not result['whole_workspace_package_success_claim']
assert result['source_unchanged'] and result['all_nongenerated_members_verified'] and result['normalized_manifests_verified']
controls=V/'control/in-scope-packages-v1';R=V/'checkout-release-candidate-v1'
assert sha(controls/'validate_v1.py')==protocol['helper_sha256']
assert sha(controls/'prepare_v1.py')==prep['helper_sha256']
assert sha(controls/'contract-v1.md')==protocol['contract_sha256']==prep['contract_sha256']
assert sha(controls/'selection-v1.json')==protocol['selection_sha256']==prep['selection_sha256']
source_inventory=V/'release-candidate-source-inventory-v1.json.gz'
assert sha(source_inventory)==protocol['source_inventory_sha256']==prep['source_inventory_sha256']
source_pins=json.loads(gzip.decompress(source_inventory.read_bytes()))
assert all(sha(R/p)==h for p,h in source_pins.items())
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=R,text=True).strip()==BASE
status=subprocess.check_output(GIT+['status','--porcelain=v1','--untracked-files=all'],cwd=R,text=True).splitlines()
assert {line[3:] for line in status}==set(prep['cache_overlay_sha256'])
assert all(sha(R/p)==sha(C/p)==h for p,h in prep['cache_overlay_sha256'].items())
old_pins={p:h for p,h in json.loads(gzip.decompress((V/'candidate-source-inventory-v1.json.gz').read_bytes())).items()
    if not p.startswith(('crates/comparisons/','crates/hypervoxel/'))}
assert all(sha(C/p)==h for p,h in old_pins.items())
physical_archives=read(V/'in-scope-package-physical-archives-v1.json')
assert len(physical_archives)==42 and all(sha(p)==r['sha256'] for p,r in physical_archives.items())
inspections=json.loads(gzip.decompress((V/'in-scope-package-members-v1.json.gz').read_bytes()))
assert len(inspections)==14 and set(inspections)==set(protocol['selected_packages'])
assert all(r['native_cargo_build_verification_passed'] and r['nongenerated_members_equal_source_bytes'] for r in inspections.values())
folder=V/'logs/in-scope-package-build-v1';command=read(folder/'result.json')
assert command['exit_code']==0 and command['output_closed'] and not command['stops']
assert all(sha(folder/n)==h for n,h in command['output_sha256'].items())
review={'status':'fourteen in-scope packages assembled and verified by native Cargo with all features',
    'documentation_base_revision':BASE,'prepared_source_base_revision':prep['base_revision'],
    'prepared_candidate_worktree':str(R),'prepared_candidate_branch':prep['head_branch'],
    'source_inventory_sha256':sha(source_inventory),'source_files_verified':len(source_pins),
    'candidate_overlay_sha256':prep['cache_overlay_sha256'],'admitted_package_updates_sha256':prep['admitted_package_updates_sha256'],
    'source_policy_feature_fixture_changes_during_package_run':False,'prior_candidate_unchanged':True,
    'selected_package_count':14,'verified_final_archives':14,'physical_archive_paths_independently_hashed':42,
    'packages':{name:{'bytes':r['bytes'],'sha256':r['sha256'],'members':len(r['members'])} for name,r in inspections.items()},
    'all_nongenerated_members_equal_source':True,'active_manifests_without_workspace_patches_or_paths':True,
    'new_cache_regression_module_in_hypercurve_archive':True,'hyperreal_replay_bundle_exclusion_preserved':True,
    'native_cargo_verification_enabled':True,'all_features':True,'command_exit_code':0,
    'command_elapsed_seconds':command['elapsed_seconds'],'warnings':[],
    'native_temporary_staging_of_unpublished_packages':True,'public_registry_availability_verified':False,
    'whole_workspace_distribution_qualified':False,'hypervoxel_deferred_by_user':True,
    'dependency_blocked_in_scope_distributions':sorted(result['blocked_in_scope_packages']),
    'runtime_tests_rerun':False,'runtime_performance_claim':False,'cache_index_admitted':False,
    'release_qualification_complete':False,'full_plan_complete':False,'historical_missing_paths':27093,
    'original_35_file_bundle_disposition':'rejected; smaller admitted fixes preserved',
    'original_worktree_integration_pending':True}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:shutil.copy2(W/name,E/name)
target=V/'target-in-scope-packages-v1'
closed_roots=[W,controls,target,folder,V/'scratch/in-scope-package-build-v1']
selected=[p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith((
    'in-scope-package-','release-candidate-source-inventory-','msrv-stage-','msrv-commit-'))]
for root in closed_roots:selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};members={};excluded={}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(path)]=digest
    row={'physical_path':str(path),'sha256':digest,'bytes':before.st_size};name=str(path.relative_to(V))
    (excluded if path.is_relative_to(target) else members)[name]=row
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
(E/'README.md').write_text('''# Fourteen in-scope package builds

Cargo assembled and verified all-feature builds of fourteen actual packages:
Hyperreal, Hyperlattice, Hyperlimit, Hypersolve, Hypertri, Hypercurve, Hyperbrep,
Hyperevolution, Hypermesh, Hypergraphics, Hyperpack, Hyperparts, Hyperpath and
Hyperphysics. The command exited zero in 208.773 seconds without warnings or
resource stops. Build verification was enabled; these are not file-list or
--no-verify results. The elapsed time is an execution receipt, not a speedup.

Every nongenerated archive member is byte-identical to the prepared source.
The active normalized manifests contain no workspace sections, local path
dependencies or patches. Every final archive and all staging copies were
independently hashed: fourteen final archives and forty-two physical archive
paths. Hypercurve's nine-test cache regression module is present. Hyperreal's
admitted archive-only exclusion is retained; the historical bundles remain in
the repository. The raw per-package inventories, locks and VCS metadata are
retained with the actual archive files.

The new isolated source worktree starts from the admitted packaging correction
and adds only the unchanged three-file Hypercurve cache proposal. Its complete
inventory, source base, patch and new test source are retained. The old candidate
and the documentation/validation worktree remain unchanged by the package run.
The package command compiles extracted code using Cargo's native temporary
staging of unpublished members. That establishes prepublication buildability,
not public registry availability or runtime semantic test completion.

Hypervoxel remains deferred by user instruction. The dependency selection
includes optional edges and preserves all supported features. HyperSDF, CSGRS,
CSGRS FFI, HyperDRC and Hypercircuit retain their distribution blockers. No
complete-workspace package success or shipped modeling pipeline is claimed.
The separate Hypercurve cache proposal remains unadmitted.

The complete package target is closed and retained outside Git. Every new
physical path is independently hashed, including each duplicate archive copy;
small raw controls and logs are archived and content-verified. Prepared source
and general caches remain open. Historical missing paths remain 27,093 and
unqualified. Only current_work changes in the ledger. The original repository
remains unchanged, with integration pending its storage reserve. No push,
publication, complete release or full-plan completion occurred.
''')
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes()
reference=git(['show','9025de62:docs/properties-status.json'])
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='in_scope_package_qualification';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'verified_packages':14,'physical_archive_paths_hashed':42,'native_cargo_build_verification_enabled':True,
    'prepared_candidate_worktree':str(R),'hypervoxel_deferred_by_user':True,
    'dependency_blocked_in_scope_distributions':review['dependency_blocked_in_scope_distributions'],
    'cache_index_admitted':False,'release_qualification_complete':False,'full_plan_complete':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'native Cargo builds of fourteen in-scope packages',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'Every new native package target, control and log path hashed; source and other caches remain open.'}
(E/'artifact-expectations-v1.json.gz').write_bytes(gzip.compress((json.dumps(expectations,sort_keys=True)+'\n').encode(),mtime=0))
for path in E.iterdir():
    if path.suffix in ['.py','.md','.json']:
        content=path.read_text();assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=D,stdout=out,stderr=err)
assert checked.returncode==0
files={str(p.relative_to(D)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous)
record.update({'status':review['status'],'checkpoint_kind':'native Cargo builds of fourteen in-scope packages',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,'original_repository_updated':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True,'evidence_parent_repository':str(D),
    'runtime_tests_rerun':False,'format_rerun':False,'format_exit_code':None,'whitespace_exit_code':0,
    'independent_packages_prepublication_verified':14,'prepared_candidate_worktree':str(R),
    'hypervoxel_deferred_by_user':True,'cache_index_admitted':False,'full_cargo_matrix_qualified':False,
    'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(R/p)==h for p,h in source_pins.items())
assert all(sha(C/p)==h for p,h in old_pins.items())
assert all(sha(inherited_path(p))==h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json')==original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_physical_files':len(excluded),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'verified_packages':14,
    'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
