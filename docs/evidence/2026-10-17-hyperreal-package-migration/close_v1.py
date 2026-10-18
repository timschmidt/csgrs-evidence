# Close and admit the independently validated Hyperreal package-content migration.
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
ORIGIN=Path('/home/tim/Documents/GitHub/workspace/csgrs')
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
D=V/'paper-worktree-v1'; B=V/'checkout-baseline-v1'; C=V/'checkout-candidate-v1'
W=Path(__file__).resolve().parent
P=D/'docs/evidence/2026-10-17-circle-support-demo-packages'
E=D/'docs/evidence/2026-10-17-hyperreal-package-migration'
PREFIX=str(E.relative_to(D))+'/'
BASE='a78335a44dc2b286682571d871dc00046162940c'
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
previous=read(P/'checkpoint-v1.json')
assert all(sha(D/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior)==1258220 and len(missing)==27093
changes=read(V/'hyperreal-package-source-after-v1.json')['changed_files']
assert set(changes)=={'Cargo.lock','crates/hyperreal/Cargo.toml','crates/hyperreal/README.md','crates/hyperreal/tests/readme_metadata.rs'}
status=git(['status','--porcelain=v1','--untracked-files=all']).decode().splitlines()
assert {line[3:] for line in status}==set(changes) and all(line[:3]==' M ' for line in status),status
for p,row in changes.items():assert sha(D/p)==row['after'] and sha(B/p)==row['before']
inherited=previous['inherited_implementation_sha256']|previous['implementation_sha256']
live=previous['restored_native_sha256']|inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    for p,h in pins.items():assert sha(B/p if p in changes else inherited_path(p))==h,p
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
original_ledger=sha(ORIGIN/'docs/properties-status.json')
assert original_ledger=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=ORIGIN,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
result=read(V/'hyperreal-package-validation-result-v1.json')
migration=read(V/'hyperreal-package-migration-members-v1.json')
baseline=read(V/'hyperreal-package-baseline-result-v1.json')
registry=read(V/'registry-hyperreal-observation-v1.json')
assert result['complete_for_declared_scope'] and result['readme_tests_passed']==16 and result['quickstarts_passed']==2
assert len(result['commands'])==20 and len(result['negative_controls'])==2
assert baseline['command']['exit_code']==101 and baseline['test_terminal_rows']==[['ok','2','0','0'],['FAILED','1','1','0']]
assert migration['baseline_archive_bytes']==108043832 and migration['candidate_archive_bytes']==4012052
assert migration['candidate_members']==283 and len(migration['removed_members'])==63
assert migration['all_other_members_byte_identical'] and migration['all_removed_bundles_retained_in_repository']
assert not registry['exact_version_entries'] and registry['command']['exit_code']==0
source_inventory=V/'candidate-source-inventory-v1.json.gz'
source_pins={p:h for p,h in json.loads(gzip.decompress(source_inventory.read_bytes())).items() if not p.startswith('crates/comparisons/')}
assert all(sha(C/p)==h for p,h in source_pins.items())
source_after=json.loads(gzip.decompress((V/'hyperreal-package-source-pins-v1.json.gz').read_bytes()))
source_after.update({p:r['after'] for p,r in changes.items()})
assert all(sha(D/p)==h for p,h in source_after.items())
controls=V/'control/hyperreal-package-migration-v1'
protocol=read(V/'hyperreal-package-validation-protocol-v1.json')
assert sha(controls/'validate_v1.py')==protocol['helper_sha256']
assert sha(controls/'contract-v1.md')==protocol['contract_sha256']
assert sha(controls/'contract-addendum-v1.md')==protocol['addendum_sha256']
selected_logs=[V/'logs'/('hyperreal-package-'+label+'-v1') for label in result['commands']]
selected_logs += [V/'logs/hyperreal-package-baseline-readme-v1',V/'logs/registry-hyperreal-index-v1']
assert len(selected_logs)==22
for folder in selected_logs:
    row=read(folder/'result.json')
    expected=101 if 'negative-' in folder.name or folder.name=='hyperreal-package-baseline-readme-v1' else 0
    assert row['exit_code']==expected and row['output_closed'] and not row['stops'],folder
    assert all(sha(folder/n)==h for n,h in row['output_sha256'].items())
negative_snapshots=W/'negative-control-manifests';negative_snapshots.mkdir()
for label,row in result['negative_controls'].items():
    src=Path(row['directory'])
    for name in ['Cargo.toml','Cargo.lock']:
        dest=negative_snapshots/(label+'-'+name);shutil.copy2(src/name,dest)
        assert sha(dest)==sha(src/name)
review={'status':'admitted Hyperreal package migration; whole-stack release remains open',
    'source_base_revision':BASE,'owning_layer':'Hyperreal distribution and dependency guard',
    'properties':['P37','T12'],'baseline_archive_bytes':108043832,'candidate_archive_bytes':4012052,
    'candidate_archive_sha256':migration['candidate_archive_sha256'],
    'baseline_members':346,'candidate_members':283,'replay_bundles_excluded':63,
    'excluded_bundle_bytes':sum(row['bytes'] for row in migration['removed_members'].values()),
    'all_excluded_bundles_retained_in_repository':True,'all_other_members_byte_identical_except_declared_edits':True,
    'only_lock_change':'Hyperreal dev edge to existing toml 0.8.23; no version or checksum changes',
    'features_and_production_dependency_tables_unchanged':True,'production_rust_sources_unchanged':True,
    'original_package_readme_failure_reproduced':True,'baseline_readme_passes':3,'baseline_readme_failures':1,
    'normalized_manifest_guard_corrected_without_relaxing_assertions':True,
    'default_and_all_feature_all_target_checks_and_clippy_passed':True,
    'readme_passes_across_source_archive_and_features':16,'quickstarts_executed':2,
    'verification_guard_runs_passed':2,'negative_dependency_controls_rejected':2,
    'cargo_fmt_all_passed':True,'source_and_extracted_inputs_unchanged_after_checks':True,
    'successful_validation_commands':18,'intentional_negative_validation_commands':2,
    'source_materialization_v1_failed_before_cargo':True,'edit_helper_generator_syntax_error_preserved':True,
    'unreleased_version_confirmed_by_successful_official_index_response':True,
    'registry_observation_sha256':sha(V/'registry-hyperreal-observation-v1.json'),
    'runtime_optimization_or_speedup_claim':False,'full_scalar_suite_passed':False,'formal_proofs_rerun':False,
    'msrv_qualified':False,'cache_index_admitted':False,'release_qualification_complete':False,
    'full_plan_complete':False,'historical_missing_paths':27093,
    'remaining_release_blocker':'Root workspace package assembly still needs excluded Hypervoxel registry dependency',
    'original_35_file_bundle_disposition':'rejected; independently retained smaller fixes unchanged',
    'original_worktree_integration_pending':True}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:shutil.copy2(W/name,E/name)
large_roots=[V/'target-hyperreal-package-checks-v1',V/'target-hyperreal-package-assembly-v1',
    V/'hyperreal-package-baseline-v1',V/'hyperreal-package-candidate-v1',
    *[Path(row['directory']) for row in result['negative_controls'].values()]]
closed_roots=[W,controls,*large_roots,*selected_logs,*[V/'scratch'/p.name for p in selected_logs]]
selected=[p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith((
    'hyperreal-package-','registry-hyperreal-','demo-package-stage-','demo-package-commit-'))]
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
    (excluded if any(path.is_relative_to(root) for root in large_roots) else members)[name]=row
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
(E/'README.md').write_text('''# Hyperreal package-content migration

The actual Hyperreal archive now contains 283 members and is 4,012,052 bytes,
compared with 346 members and 108,043,832 bytes before this change. Exactly 63
historical replay tarballs are omitted. Every bundle remains byte-identical in
the repository. Source, examples, tests, regression fixtures, checkpoint JSON
and compressed sample summaries remain in the package. All other members are
byte-identical except the declared manifest, lock, VCS, README and test edits.
This is an explicit distribution-content migration, not a runtime speedup.

Before editing, the original extracted package reproduced a README metadata
test failure: its textual dependency-table search rejects Cargo's normalized
manifest. The corrected test uses the already locked TOML parser as a dev
 dependency and preserves both assertions about rug. The root lock adds only
that development edge; all existing package versions and checksums are retained.
Two invalid extracted manifests fail at the intended assertions: rug moved to
normal dependencies and rug removed from development dependencies.

The extracted package has no monorepo ancestry, workspace patches or path
dependencies. Its default build, default/all-feature all-target checks and
Clippy with warnings denied pass. The source and extracted package each pass
both README test binaries under both feature settings (16 test passes across
configurations), run the unchanged quickstart program, and pass the existing
verification-acceptance guard tests. Root cargo fmt --all -- --check passes.
The all-feature normal dependency tree contains neither rug, GMP nor the TOML
test parser. These checks do not constitute the complete scalar test suite or
a rerun of formal proofs.

A successful response from the [official Hyperreal index](https://index.crates.io/hy/pe/hyperreal)
contains no version 0.13.1. The README now labels this source as unreleased and
provides the tested source example command. Neither archive assembly nor this
local extracted-package validation establishes publication or MSRV support.

Raw failures, controls, source pins, commands and output are preserved. The
first sparse preflight omitted a direct crates/ formatting file and stopped
before Cargo; its corrected replacement is separate. An edit-helper generator
syntax error wrote no files and is also recorded. Neither failure is erased.
Both build targets, all four extractions, and every newly closed physical path
are independently hashed and retained on Disk B; the large artifacts are not
copied into Git. Historical missing paths remain 27,093 and unqualified.

The isolated branch admits this package correction only. The original 35-file
native bundle remains rejected and the separate Hypercurve cache proposal
remains unadmitted. The whole-stack release still needs its excluded Hypervoxel
dependency, complete packaged consumer pipeline and MSRV checks. No push or
publication occurred. Only current_work changes in the ledger, and integration
into the original worktree remains pending its storage reserve.
'''.replace('\n dependency','\ndependency'))
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes()
reference=git(['show','9025de62:docs/properties-status.json'])
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='hyperreal_package_migration';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'archive_bytes_before':108043832,'archive_bytes_after':4012052,'retained_replay_bundles':63,
    'readme_test_passes':16,'negative_controls_rejected':2,'package_migration_admitted':True,
    'cache_index_admitted':False,'release_qualification_complete':False,'full_plan_complete':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'Hyperreal package-content migration admission',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'Every newly closed package/build/extraction path independently hashed; source and other caches remain open.'}
(E/'artifact-expectations-v1.json.gz').write_bytes(gzip.compress((json.dumps(expectations,sort_keys=True)+'\n').encode(),mtime=0))
for path in E.iterdir():
    if path.suffix in ['.py','.md','.json']:
        content=path.read_text();assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=D,stdout=out,stderr=err)
assert checked.returncode==0
files={str(p.relative_to(D)):sha(p) for p in E.rglob('*') if p.is_file()}
new_inherited={p:h for p,h in inherited.items() if p not in changes}
new_dependencies=previous['live_source_dependency_pins_sha256']|{'Cargo.lock':changes['Cargo.lock']['after']}
record=dict(previous)
record.update({'status':review['status'],'checkpoint_kind':'Hyperreal package-content migration admission',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{p:r['after'] for p,r in changes.items()},
    'inherited_implementation_sha256':new_inherited,'live_source_dependency_pins_sha256':new_dependencies,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':True,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':False,'production_rust_sources_unchanged':True,'original_repository_updated':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True,'evidence_parent_repository':str(D),
    'runtime_tests_rerun':True,'format_rerun':True,'format_exit_code':0,'whitespace_exit_code':0,
    'hyperreal_package_migration_admitted':True,'hyperreal_extracted_package_scope_passed':True,
    'cache_index_admitted':False,'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(C/p)==h for p,h in source_pins.items())
assert all(sha(D/p)==h for p,h in source_after.items())
assert all(sha(inherited_path(p))==h for p,h in (previous['restored_native_sha256']|new_inherited|record['implementation_sha256']).items())
assert sha(ORIGIN/'docs/properties-status.json')==original_ledger
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_physical_files':len(excluded),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'package_migration_admitted':True,
    'cache_index_admitted':False,'original_repository_updated':False}),flush=True)
