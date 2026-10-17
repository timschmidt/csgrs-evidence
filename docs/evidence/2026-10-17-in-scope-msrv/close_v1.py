# Close the declared Rust 1.95 matrix; preserve the deferred Hypervoxel scope.
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
ORIGIN=Path('/home/tim/Documents/GitHub/workspace/csgrs')
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
D=V/'paper-worktree-v1'; B=V/'checkout-baseline-v1'; C=V/'checkout-candidate-v1'
W=Path(__file__).resolve().parent
P=D/'docs/evidence/2026-10-17-hyperreal-package-migration'
E=D/'docs/evidence/2026-10-17-in-scope-msrv'
PREFIX=str(E.relative_to(D))+'/'
BASE='50eb1e60a2c23d16d486d0c29b0026741ccdfbaf'
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
assert len(prior)==1263053 and len(missing)==27093
inherited=previous['inherited_implementation_sha256']|previous['implementation_sha256']
live=previous['restored_native_sha256']|inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p))==h for p,h in pins.items())
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
original_ledger=sha(ORIGIN/'docs/properties-status.json')
assert original_ledger=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
result=read(V/'msrv-in-scope-result-v1.json');protocol=read(V/'msrv-in-scope-protocol-v1.json')
assert result['complete_for_declared_scope'] and result['compiler']=='1.95.0'
assert result['hypervoxel_deferred_by_user'] and len(result['commands'])==14
assert result['declared_msrv_packages_all_and_minimal']==['csgrs','csgrs-ffi','hyperdrc','hypergraphics']
assert result['extracted_hyperreal_default_and_all_checked'] and not result['source_changes']
controls=V/'control/msrv-in-scope-v1'
assert sha(controls/'validate_v1.py')==protocol['helper_sha256']
assert sha(controls/'contract-v1.md')==protocol['contract_sha256']
assert all(sha(p)==h for p,h in protocol['tool_sha256'].items())
source_inventory=V/'candidate-source-inventory-v1.json.gz'
source_pins={p:h for p,h in json.loads(gzip.decompress(source_inventory.read_bytes())).items()
    if not p.startswith(('crates/comparisons/','crates/hypervoxel/'))}
assert len(source_pins)==protocol['source_pin_count_excluding_deferred_workspaces']
assert all(sha(C/p)==h for p,h in source_pins.items())
package_members=json.loads(gzip.decompress((V/'hyperreal-package-candidate-members-v1.json.gz').read_bytes()))
assert all(sha(V/'hyperreal-package-candidate-v1'/p)==row['sha256'] for p,row in package_members.items())
selected_logs=[V/'logs'/('msrv-in-scope-'+label+'-v1') for label in result['commands']]
warning_rows=[]
for folder in selected_logs:
    row=read(folder/'result.json')
    assert row['exit_code']==0 and row['output_closed'] and not row['stops']
    assert all(sha(folder/n)==h for n,h in row['output_sha256'].items())
    for name in ['stdout','stderr']:
        text=(folder/name).read_text()
        warning_rows.extend({'command':folder.name,'stream':name,'text':line} for line in text.splitlines()
            if re.match(r'^\s*warning:',line))
        assert not re.search(r'^\s*(Checking|Compiling) hypervoxel\b',text,re.M)
assert not warning_rows,warning_rows
selection=read(V/'control/in-scope-packages-v1/selection-v1.json')
assert len(selection['eligible_packages'])==14 and len(selection['blocked_in_scope_packages'])==5
assert selection['deferred_by_user']==['hypervoxel']
shutil.copy2(V/'control/in-scope-packages-v1/selection-v1.json',W/'next-package-selection-v1.json')
review={'status':'declared Rust 1.95 matrix passed; Hypervoxel explicitly deferred by user',
    'documentation_base_revision':BASE,'candidate_source_revision':'fc23195a16f45fb396a5dd731feb6c7310d8ce7c',
    'candidate_overlay_files':3,'source_inventory_sha256':sha(source_inventory),
    'candidate_source_pin_count_excluding_deferred_workspaces':len(source_pins),
    'candidate_lock_sha256':protocol['candidate_lock_sha256'],'compiler':'1.95.0',
    'tool_sha256':protocol['tool_sha256'],'completed_commands':14,'compiler_checks':11,
    'default_root_workspace_all_targets_passed':True,
    'all_and_minimal_all_target_packages':result['declared_msrv_packages_all_and_minimal'],
    'exact_corrected_hyperreal_archive_all_target_features':['default','all'],
    'compiler_warnings':warning_rows,'source_and_closed_package_unchanged':True,
    'closed_hyperreal_extraction_mounted_read_only':True,'production_source_changes':False,
    'hypervoxel_deferred_by_user':True,'hypervoxel_compiled_in_this_matrix':False,
    'root_workspace_package_members':19,'independently_packageable_members':sorted(selection['eligible_packages']),
    'dependency_blocked_in_scope_distributions':sorted(selection['blocked_in_scope_packages']),
    'existing_dependency_or_feature_removed':False,'runtime_tests_rerun':False,
    'rust_1_95_clippy_installed_or_run':False,'complete_feature_powerset_claim':False,
    'runtime_performance_claim':False,'cache_index_admitted':False,
    'external_distribution_complete':False,'release_qualification_complete':False,'full_plan_complete':False,
    'historical_missing_paths':27093,'original_35_file_bundle_disposition':'rejected; smaller admitted fixes preserved',
    'original_worktree_integration_pending':True}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:shutil.copy2(W/name,E/name)
target=V/'target-msrv-in-scope-v1'
closed_roots=[W,controls,target,*selected_logs,*[V/'scratch'/p.name for p in selected_logs]]
selected=[p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith((
    'msrv-in-scope-','hyperreal-package-stage-','hyperreal-package-commit-','continuation-after-hyperreal-package-'))]
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
(E/'README.md').write_text('''# In-scope Rust 1.95 compatibility

The retained Hypercurve cache candidate passed the root workspace's default
all-target check on Rust 1.95.0. CSGRS, CSGRS FFI, HyperDRC and Hypergraphics also
passed all-target checks with all features and with default features disabled.
These four crates explicitly declare the compiler floor. The exact corrected
Hyperreal package extraction separately passed default and all-feature
all-target checks at the same compiler. All fourteen commands exited zero;
eleven were compiler checks and three recorded tool identity. No compiler
warnings or resource stops were observed.

The original candidate checkout remains unchanged. Its lockfile is identified
separately from the newly admitted Hyperreal package correction; the latter's
actual extraction was checked separately and mounted read-only. The new TOML
development dependency and normalized-manifest guard therefore also compile
at 1.95. No source, fixture, feature, policy or dependency version changed.
These checks are not runtime test executions or the full feature powerset.
Clippy was neither installed nor run for 1.95; the repository's MSRV workflow
requires Cargo checks, and prior stable Clippy results retain their own scope.

Hypervoxel is deferred by explicit user instruction. No command targets its
workspace, and it was not compiled in this matrix. Its dependent distribution
blockers remain: HyperSDF, CSGRS, CSGRS FFI, HyperDRC and Hypercircuit. No optional
feature or dependency was removed to make a package succeed. The retained root
metadata, including optional dependencies, identifies fourteen other packages
for a separate native Cargo package-verification run. That selection is not a
claim that the complete workspace packages successfully.

Controls, commands, raw output, scope correction and source/tool identities are
archived and verified. Every newly closed target file is hashed at its physical
path and retained on Disk B outside Git. The previously closed Hyperreal
extraction is unchanged. Historical missing paths remain 27,093, unqualified.
The separate cache candidate is still unadmitted; release and full-plan
completion remain open. Only current_work changes in the ledger. The original
repository remains unchanged and no push or publication occurred.
''')
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes()
reference=git(['show','9025de62:docs/properties-status.json'])
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='in_scope_msrv_qualification';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'compiler':'1.95.0','compiler_checks_passed':11,'hypervoxel_deferred_by_user':True,
    'dependency_blocked_in_scope_distributions':review['dependency_blocked_in_scope_distributions'],
    'runtime_tests_rerun':False,'cache_index_admitted':False,'release_qualification_complete':False,
    'full_plan_complete':False,'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'in-scope Rust 1.95 compiler qualification',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'New MSRV target and raw evidence independently hashed; no inherited whole-history audit.'}
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
record.update({'status':review['status'],'checkpoint_kind':'in-scope Rust 1.95 compiler qualification',
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
    'declared_in_scope_msrv_matrix_passed':True,'hypervoxel_deferred_by_user':True,
    'cache_index_admitted':False,'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(C/p)==h for p,h in source_pins.items())
assert all(sha(inherited_path(p))==h for p,h in live.items())
assert sha(ORIGIN/'docs/properties-status.json')==original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_physical_files':len(excluded),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'hypervoxel_deferred_by_user':True,
    'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
