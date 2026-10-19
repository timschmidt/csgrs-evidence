"""Seal qualified construction-summary admission and preserve adverse evidence."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/construction-evidence-admission-20261019-v1')
PREV_F=B.parent/'construction-provenance-observation-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-construction-provenance-observation'
E=O/'docs/evidence/2026-10-19-construction-evidence-admission'
X=B/'external-evidence'
BASE='9283ae9251d095a9b7c00ca3ee9fea6763b49686'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from construction_evidence_runner_v1 import sha,resources,reasons
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(path):return json.loads(Path(path).read_text())
def dump(path,value):
 assert not path.exists(),path
 path.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def gzwrite(path,value):
 assert not path.exists(),path
 path.write_bytes(gzip.compress((json.dumps(value,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
 start=re.search(rb'"current_work"\s*:\s*',raw).end()
 value,length=json.JSONDecoder().raw_decode(raw[start:].decode())
 return start,start+len(raw[start:].decode()[:length].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'candidate-paths-v1.json'))
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert protected not in paths and sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
new=set(git('ls-files','--others','--exclude-standard').decode().splitlines())-{protected}
assert set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
assert new<=paths
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-final-v1.json.gz').read_bytes()))
prior_pins=json.loads(gzip.decompress((B/'source-pins-check-v4.json.gz').read_bytes()))
assert len(pins)==2705 and set(pins)==set(prior_pins) and paths<=set(pins)
assert {p for p in pins if pins[p]!=prior_pins[p]}=={'docs/construction-evidence.md','tests/wasm/construction_evidence.ts'}
assert all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==15
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
results={phase:read(B/('construction-evidence-admission-'+phase)/'result-v1.json') for phase in ['baseline-replay-v1','check-v4','nested-cache-prepare-v1','nested-checks-v1','combined-downstream-v1','msrv-v1','ffi-consumers-v1','wasm-consumers-v2','cost-baseline-v2','replay-cost-v2','node-containment-v1','final-docs-v1']}
assert all(result['passed'] for result in results.values())
assert read(B/'qualification-result-v1.json')['passed']
review=read(B/'review-v1.json')
assert review['baseline_revision']==BASE and review['runtime_admitted'] and not review['full_plan_complete']
assert all(sha(O/p)==row['sha256'] for p,row in review['resource_observations']['source_sizes'].items())
assert len(results['replay-cost-v2']['original_rows'])==12 and len(results['replay-cost-v2']['costs'])==40 and len(results['replay-cost-v2']['bound_costs'])==20
for row in results['replay-cost-v2']['original_rows']:assert sha(row['stl'])==row['stl_sha256']
for row in results['replay-cost-v2']['costs']+results['replay-cost-v2']['bound_costs']:assert sha(row['time_file'])==row['time_sha256']
for manifest in (B/'frozen').glob('*/executables-v1.json'):
 assert all(sha(item['copy'])==item['sha256'] for item in read(manifest).values())
package_resolution={}
wasm_upper=Path(read(B/'overlays/wasm-consumers-v2/closed-v1.json')['retained_upper'])
for logical,digest in results['wasm-consumers-v2']['package_sha256'].items():
 physical_path=wasm_upper/Path(logical).relative_to(B/'target')
 frozen_path=B/'frozen/wasm-consumers-v2/consumer'/physical_path.relative_to(wasm_upper/'wasm-bindings-node')
 assert sha(physical_path)==digest and sha(frozen_path)==digest
 assert results['wasm-consumers-v2']['frozen_package_sha256'][str(frozen_path)]==digest
 package_resolution[logical]={'physical_path':str(physical_path),'frozen_path':str(frozen_path),'sha256':digest}
assert len(package_resolution)==len(results['wasm-consumers-v2']['frozen_package_sha256'])
assert all(sha(p)==h for p,h in results['wasm-consumers-v2']['frozen_package_sha256'].items())
review['closure_preflight_correction']=read(B/'closure-preflight-correction-v1.json')
review['wasm_unmounted_package_resolution']=package_resolution
assert all(sha(p)==h for p,h in read(B/'wasm-tools-v1.json')['tools_sha256'].items())
registry=json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
for folder in (B/'overlays').iterdir():
 assert read(folder/'closed-v1.json')['unmounted']
 lower=json.loads(gzip.decompress((folder/'lower-pins-v1.json.gz').read_bytes()))
 assert all(sha(p)==h for p,h in lower.items())
assert not any(os.path.ismount(B/name) for name in ['target','target-msrv','cost-baseline-target','cost-baseline-target-v2'])
commands={}
for folder in sorted((B/'logs').iterdir()):
 record=read(folder/'result.json')
 assert record['output_closed'] and not record['stops'],folder
 assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
 commands[folder.name]=record
failures={name:row['exit_code'] for name,row in commands.items() if row['exit_code']}
assert failures=={'construction-evidence-admission-check-v1-native-check':101,'construction-evidence-admission-check-v2-model-check':101,'construction-evidence-admission-check-v3-model-check':101,'construction-evidence-admission-qualification-v2-fuzz-check':101,'construction-evidence-admission-wasm-consumers-v1-script':2,'construction-evidence-admission-cost-baseline-v1-baseline-cost-v1-compile':1},failures
review['failed_commands']=failures
review['failed_attempts']=['Native check v1 found old Vec iteration consumers after the BooleanMeshBatch Arc migration; consumers were corrected without changing malformed-carrier assertions.','Model check v2 found the new JS STL wrapper omitted the format argument to io_error; the format-specific mapping was restored.','Model check v3 required a const exported getter; the existing wasm-bindgen lint exemption style was applied. All affected checks were rerun on the final code.']
review['failed_attempts'].append('Qualification v1 stopped after a successful downstream build because the artifact key omitted the package name; parsing retained Cargo JSON reproduces the collision. Version 2 labels standalone downstream packages separately and completes all remaining checks. A versioned harness also executes every original combined-feature downstream test with package-bound artifact keys. No production or test source changed.')
review['validation_driver_failure']=read(B/'driver-failure-v1.json')
review['failed_attempts'].append('The original nested fuzz check could not download autocfg 1.5.1 in the preserved offline registry. The unchanged nested lockfiles were supplied from existing local archives in a private checksum-verified registry; no shared registry mutation, lock update or network access was needed.')
review['failed_attempts'].append('The new TypeScript client used fromStl rather than the existing fromSTL export. The unchanged assertions were rerun through the complete WASM script after that one-name correction. The failed generated package is retained; its first preservation helper encountered overlay metadata and a second version preserved all regular package files with the marker recorded separately.')
review['wasm_consumer_correction']=read(B/'wasm-consumer-correction-v1.json')
assert all(sha(p)==v for p,v in review['wasm_consumer_correction']['frozen_failed_package_sha256'].items())
review['failed_attempts'].append('Cost probe v1 did not compile because Real does not implement From<usize>. Version 2 converts i % 3 to u8 with a checked conversion; the values, fixtures, assertions and budgets are unchanged. No result samples existed before this correction.')
review['cost_probe_correction']=read(B/'cost-probe-correction-v1.json')
review['boundary_source_change']=read(B/'boundary-source-change-v1.json')
boundary_pins=json.loads(gzip.decompress((B/'source-pins-check-v5.json.gz').read_bytes()))
assert {p for p in pins if pins[p]!=boundary_pins[p]}=={'docs/construction-evidence.md'}
review['nested_registry_preparation']={k:v for k,v in read(B/'nested-cache-copy-record-v1.json').items() if k!='copy_inputs'}
new_registry=json.loads(gzip.decompress((B/'nested-registry-inputs-v1.json.gz').read_bytes()))
assert all(sha(p)==v for p,v in new_registry.items())
review['preparation_record_note']='Initial check helpers reused the prepared-check-matrix-v1 filename; its retained contents describe v4. Versioned helpers, source pins, per-command protocols, closed overlays and raw failed command logs retain the preceding attempts.'
review['storage_baselines_reset']=False
review['retention_reason']='Retain the stronger construction-evidence contract despite the recorded time and memory costs. This is a correctness/completeness admission, not an optimization or speedup claim.'
review['measured_median_latency_increases_percent']=[{'mode':row['mode'],'iterations':row['iterations'],'increase_percent':100*(row['candidate_over_baseline_median_ratios']['elapsed_ns']-1)} for row in review['resource_observations']['cases']]
print('Verified final runtime matrix, original replay, bindings, costs, source pins and prior commit.',flush=True)

prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1907274,921794)
roots=[B,PREV_F]
for pattern in ['*construction-evidence*.py','construction-evidence-*.rs','construction-evidence-*.c','construction-evidence-*.cpp','construction-evidence-*.ts']:
    roots+=sorted(Path('/tmp').glob(pattern))
selected=[]
for root in sorted(set(roots)):
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (not p.is_dir() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected)==len(set(selected))
physical={};states={};members={};excluded={};special={}
for path in selected:
    before=path.lstat()
    if not stat.S_ISREG(before.st_mode):
        assert stat.S_ISCHR(before.st_mode) and before.st_rdev==0,path
        special[str(path)]={'kind':'overlay_whiteout','mode':stat.S_IMODE(before.st_mode),'rdev':0};continue
    assert not path.is_symlink(),path
    digest=sha(path);after=path.stat();state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns)
    if str(path) in prior:
        assert prior[str(path)]==digest,path
        continue
    physical[str(path)]=digest;states[str(path)]=state
    if len(physical)%5000==0:
        assert not reasons(resources());print(json.dumps({'new_paths_rehashed':len(physical)}),flush=True)
    with path.open('rb') as stream:magic=stream.read(8)
    generated=path.is_relative_to(B) and any(part.startswith(('overlay-upper','overlay-work','target','cost-baseline-target','cost-baseline-upper','cost-baseline-work','cargo-home','gmp-cache','xdg-cache')) for part in path.relative_to(B).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=str(path.relative_to(B)) if path.is_relative_to(B) else 'prior-final/'+str(path.relative_to(PREV_F)) if path.is_relative_to(PREV_F) else 'temporary/'+path.name
    assert name not in members and name not in excluded,name
    row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason']='Cargo registry/cache/build artifact or compiled binary/library; physically preserved and individually hashed'
        excluded[name]=row
    else:members[name]=row
assert not X.exists();X.mkdir()
archive=X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz',dereference=True) as bundle:
    for name,row in members.items():bundle.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as bundle:
    assert set(bundle.getnames())==set(members)
    for name,row in members.items():
        with bundle.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(X/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'nonregular_overlay_entries':special,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
expectations=X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'qualified native construction evidence admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(path):sha(path) for path in X.iterdir() if path.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
authorization=read(B/'control/storage-allowance-v1.json')
assert authorization['new_volume_net_allowance_bytes'] is None and authorization['old_disk_b_net_allowance_bytes'] is None
review.update(artifact_volume=str(B.parent),disk_b_allowance_gib=None,disk_b_quota_mode='User authorized available artifact volume capacity; no retained-artifact quota.',disk_b_physical_free_guard_bytes=authorization['new_volume_physical_free_guard_bytes'],tmp_allowance_gib=58,logs_allowance_mib=200)
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{'exit_code':row['exit_code'],'elapsed_seconds':row['elapsed_seconds'],'wall_limit_seconds':row['wall_limit_seconds'],'stops':row['stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-final-v1.json.gz','source-pins-v1.json.gz'),(B/'source-pins-check-v4.json.gz','runtime-source-pins-v1.json.gz'),(B/'source-pins-check-v5.json.gz','binding-source-pins-v1.json.gz'),(B/'cost-review-v1.json','cost-review-v1.json'),(B/'producer-review-v1.md','producer-review-v1.md'),(Path(__file__),'close_v2.py')]:shutil.copy2(source,E/target)
patch=git('diff','--binary')
for path in sorted(new):
 added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False);assert added.returncode==1;patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('''# E99: retained native construction qualifications

Native meshes now preserve a compact construction summary separately from local
predicate certainty, topology proofs and geometric fidelity. Supported transforms,
Boolean composition, empty results, hulls and other mesh operations carry it
forward. Buffer edits expose missing history without erasing known qualifications;
modeling caches distinguish otherwise identical geometry with different evidence.
An immutable in-process binary STL artifact preserves source qualifications and
records coordinate projection. Plain-byte import exposes missing source history.

The [public guide](../../construction-evidence.md) explains the explicit source
boundary, BooleanMeshBatch Arc migration and supported Rust/binding surfaces.
The [review](review-v1.json) records the executed domain and limitations; the
[contract](contract-v1.md) predates implementation. The twelve original E98
pipelines retain their geometry, local receipts, policies and exact STL bytes.
New tests separately assert retained construction evidence, mutation, caches,
empty composition and concurrency. The full native/root/downstream matrix,
matching strict lints, docs, compiler-floor checks and real affected binding
consumers pass within the recorded configurations.

The [cost record](cost-review-v1.json) retains forty matched original-workload samples,
twenty samples of the new bound-artifact path, allocator/RSS data, sizes and the
mutation probe. Weak batch identity witnesses
can retain old backing allocations until their carriers are dropped. On this
host the mesh carrier grows from 40 to 48 bytes and the batch from 48 to 72 bytes;
the 10,000-point mutation probe retains 1,440,048 bytes after replacement until
the batch is dropped. The four matched instrumented cases have approximately
1.3-12.0% higher median elapsed time across five trials each. These limited
samples do not establish general latency bounds. All unfavorable results remain
recorded. The change delivers a stronger evidence contract and makes no speedup
or constant-heap claim. The [checkpoint](checkpoint-v1.json) binds
source, commands and individually hashed physical artifacts.

This summary is not complete provenance, per-boundary source mapping, replayable
proof or persistent proof-preserving interchange. Curve lineage, full pre-push CI,
clean shipped distribution and the broader properties plan remain open. Earlier
failed checks remain in the raw evidence. Historical missing artifacts were not
reaudited or recovered. Hypervoxel remains excluded.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'construction_evidence_admission' not in current
current['updated_on']='2026-10-19'
keys=['classification','decision','owner','properties','input_domain','baseline_reproduced_before_edit','original_pipeline_replay_cases','new_pipeline_cases','new_control_tests','baseline_geometry_and_bytes_preserved','actual_approximate_pipeline_cases','exact_pipeline_controls','claim_dimensions','api_migration','passed_test_executions','test_count_note','strict_workflow_audits','ffi_consumers_passed','validation','msrv_runtime_executed','wasm_node_containment','late_documentation_only_edit','limitations','production_implementation_changed','runtime_admitted','full_plan_complete','public_distribution_complete','full_ci_complete','hypervoxel_deferred_by_user','all_adverse_results_retained','general_speedup_claimed','next','failed_commands','failed_attempts','preparation_record_note','storage_baselines_reset','artifact_volume','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib']
current['construction_evidence_admission']={key:review[key] for key in keys}
current['construction_evidence_admission'].update(parent_revision=BASE,review=prefix+'review-v1.json',cost_review=prefix+'cost-review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations))
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
 if path.suffix in {'.md','.py','.json'}:
  value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
  if path.suffix=='.py':ast.parse(value)
 if path.suffix=='.md':
  for link in re.findall(r'\]\(([^)]+)\)',path.read_text()):
   if '://' not in link and not link.startswith('#') and link!='checkpoint-v1.json':assert (path.parent/link.split('#')[0]).exists(),link
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
 checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['classification'],'checkpoint_kind':'qualified native construction evidence admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(path.relative_to(O)):sha(path) for path in E.rglob('*') if path.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','runtime_source_pins_sha256':sha(E/'runtime-source-pins-v1.json.gz'),'binding_source_pins_sha256':sha(E/'binding-source-pins-v1.json.gz'),'only_late_edits':'TypeScript fromSTL spelling correction followed by the complete boundary rerun; resource disclosure in docs followed by affected final checks. No Rust/native binding source changed.','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'production_implementation_changed':True,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'current_revision_pipeline_observations_executed':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':15,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_quota_mode':review['disk_b_quota_mode'],'disk_b_physical_free_guard_bytes':review['disk_b_physical_free_guard_bytes'],'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
 info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/path)==digest for path,digest in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_summary_admitted':True,'full_plan_complete':False}),flush=True)
