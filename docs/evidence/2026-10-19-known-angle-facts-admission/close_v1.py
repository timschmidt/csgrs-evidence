"""Admit native known-angle facts only after final-source validation and review."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/known-angle-facts-admission-20261019-v1')
A=B.parent/'known-angle-facts-observation-20261019-v1'
PREV_F=B.parent/'integral-atan-facts-admission-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-integral-atan-facts-admission'
E=O/'docs/evidence/2026-10-19-known-angle-facts-admission'
X=B/'external-evidence'
BASE='6febb211e5a209ad31471853ec1fd6d8696c6911'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from known_angle_facts_runner_v1 import sha,resources,reasons
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
def result(phase):return read(B/('known-angle-facts-admission-'+phase+'-v1')/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v1.json')['candidate_paths'])
new={'crates/hyperreal/src/computable/node/atan_pi_anchors.rs','crates/hyperreal/src/computable/node/atan_pi_anchor_tests.rs','crates/hyperreal/tests/serde_atan_pi_anchors.rs','crates/hyperreal/tests/fixtures/atan_pi_anchor_legacy_trig.json'}
assert len(paths)==9 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v4.json.gz').read_bytes()))
assert len(pins)==2687 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==22
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar','consumers','modeling','msrv']]
costs={name:read(B/(name+'-cost-v1/result-v1.json')) for name in ['ordinary','native','anchor']}
assert all(row['passed'] for row in [scalar,consumers,modeling,msrv,*costs.values()])
assert read(B/'validation-sequence-result-v2.json')['passed'] and read(B/'cost-sequence-result-v1.json')['passed']
matrix=read(B/'prepared-validation-matrix-v2.json');plan=read(B/'planned-cost-matrix-v2.json')
assert matrix['active_contract_sha256']==plan['active_contract_sha256']==sha(B/'control/contract-v1.md')
assert matrix['consumer_scope_addendum_sha256']==plan['consumer_scope_addendum_sha256']==sha(B/'control/consumer-scope-addendum-v2.md')
assert matrix['source_pins_sha256']==sha(B/'source-pins-candidate-v4.json.gz')
assert all(sha(p)==h for p,h in matrix['helper_sha256'].items())
assert all(sha(p)==h for p,h in plan['source_and_driver_sha256'].items())
assert scalar['packages']['default']['parent_tests_passed']==962
assert scalar['packages']['all']['parent_tests_passed']==1133
assert scalar['summaries']['debug-library']==[['ok','840','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(row[-1][1]) for row in modeling['summaries'].values())==75
for name,count in [('ordinary',17),('native',96),('anchor',72)]:
    assert costs[name]['all_completed_output_assertions_passed'] and len(costs[name]['samples']['parent-0'])==count
unit_output=''.join(p.read_text() for p in (B/'logs').glob('known-angle-facts-admission-scalar-v1-all-test-*-hyperreal/stdout'))
for test in ['atan_pi_anchors_preserve_facts_through_periods_and_complements','atan_pi_anchor_reader_declines_unproved_correspondences','atan_pi_anchor_facts_survive_concurrent_refinement']:
    assert test+' ... ok' in unit_output,test
focused=read(B/'focused-v4/result-v1.json')
assert focused['passed'] and focused['commands']['parent-invalid']['exit_code']==101
assert focused['both_identities_certified']==72 and len(focused['original_fresh_process_cases'])==72
assert focused['known_angle_certified_function_rows']==480 and focused['public_real_wire_rows_unchanged']==532
assert all(row['square_certified'] and row['sign_certified'] and not row['contradicted'] for row in focused['known_angle_rows'])
assert not read(B/'focused-v4/real-wire-comparison-v1.json')['changed_rows']
assert read(B/'anchor-units-v2/result-v1.json')['unit_tests']==3
binding=read(B/'baseline-binding-v1.json');assert binding['commit']==BASE
for file,key in [('protocol-v1.json','observation_protocol_sha256'),('result-v1.json','observation_result_sha256'),('review-v1.json','observation_review_sha256'),('physical-files-v1.json.gz','observation_physical_manifest_sha256')]:
    assert sha(A/file)==binding[key]
observation=read(A/'result-v1.json')
assert observation['summary']['original_both_certified']==68
assert sum(row['square_certified'] for row in observation['rows'])==96
assert not any(row['contradicted'] for row in observation['rows'])
assert all(sha(p)==h for p,h in json.loads(gzip.decompress((A/'physical-files-v1.json.gz').read_bytes())).items())
assert sha(A/'legacy-derived-graphs-v1.json')==binding['legacy_sha256']==sha(O/'crates/hyperreal/tests/fixtures/atan_pi_anchor_legacy_trig.json')
source_review=read(B/'source-review-v1.json')
assert source_review['candidate_source_pins_sha256']==sha(B/'source-pins-candidate-v4.json.gz')
graph_metrics=read(B/'graph-metrics-v1.json')
assert len(graph_metrics['rows'])==48
assert graph_metrics['parent_fixture_sha256']==binding['legacy_sha256']
assert graph_metrics['focused_result_sha256']==sha(B/'focused-v4/result-v1.json')
graph_changes={}
for field in graph_metrics['maximum_per_metric']['parent_derived']:
    deltas=[row['candidate_derived'][field]-row['parent_derived'][field] for row in graph_metrics['rows']]
    graph_changes[field]={'rows_increased':sum(delta>0 for delta in deltas),'rows_decreased':sum(delta<0 for delta in deltas),'maximum_increase':max(deltas),'maximum_decrease':min(deltas)}
interpretation=read(B/'cost-interpretation-v1.json')
retention=read(B/'cost-retention-decision-v1.json')
assert retention['decision']=='keep' and retention['interpretation_sha256']==sha(B/'cost-interpretation-v1.json')
for manifest in (B/'frozen').glob('*/executables-v1.json'):
    assert all(sha(item['copy'])==item['sha256'] for item in read(manifest).values())
registry=json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
for folder in (B/'overlays').iterdir():
    assert read(folder/'closed-v1.json')['unmounted']
    lower=json.loads(gzip.decompress((folder/'lower-pins-v1.json.gz').read_bytes()))
    assert all(sha(p)==h for p,h in lower.items())
assert not os.path.ismount(B/'target') and not os.path.ismount(B/'target-msrv')
commands={}
for folder in sorted((B/'logs').iterdir()):
    record=read(folder/'result.json')
    assert record['output_closed'] and not record['stops'],folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={name:row['exit_code'] for name,row in commands.items() if row['exit_code']}
assert failures=={'known-angle-facts-focused-v1-library':1,'known-angle-facts-focused-v2-parent-invalid':101,'known-angle-facts-focused-v3-serde_atan_pi_anchors-candidate-v3-compile':1,'known-angle-facts-focused-v4-parent-invalid':101},failures
assert len(read(B/'focused-v2/real-wire-comparison-v1.json')['changed_rows'])==56
assert read(B/'anchor-units-v1/preflight-failure-v1.json')['launched_compiler_or_tests'] is False
print('Verified final source, validation, measured costs, preserved failures and parent commit.',flush=True)

prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1890461,921794)
roots=[B,PREV_F,A]
for pattern in ['prepare-known-angle-*.py','run-known-angle-*.py','known-angle-*.rs','known_angle_facts_*.py','interpret-known-angle-*.py','record-known-angle-*.py','close-known-angle-*.py','stage-known-angle-*.py','verify-known-angle-*.py']:
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
    generated=path.is_relative_to(B) and any(part.startswith(('overlay-upper','overlay-work','target','cargo-home','gmp-cache','xdg-cache')) for part in path.relative_to(B).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=str(path.relative_to(B)) if path.is_relative_to(B) else 'prior-final/'+str(path.relative_to(PREV_F)) if path.is_relative_to(PREV_F) else 'observation/'+str(path.relative_to(A)) if path.is_relative_to(A) else 'temporary/'+path.name
    assert name not in members and name not in excluded,name
    row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason']='Generated Cargo output or compiled binary/library'
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
gzwrite(expectations,{'schema_version':3,'kind':'native known-angle facts admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(path):sha(path) for path in X.iterdir() if path.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
authorization=read(B/'control/storage-allowance-v1.json')
assert authorization['new_volume_net_allowance_bytes'] is None and authorization['old_disk_b_net_allowance_bytes'] is None
cost_summary={name:{key:value for key,value in row.items() if key!='per_row'} for name,row in interpretation['comparisons'].items()}
review={
    'decision':'Retain native recovery of normalized atan/pi anchors with new exact facts and preserved public Real serialization.',
    'owner':source_review['owner'],'properties':['P2','P3','P4','P18','P19','P26','P27','P35','P36','P37','P39'],
    'input_domain':'Signed unit, sqrt(3) and inverse-sqrt(3) arctangent anchors, integer-pi shifts and both signed half-pi complements; retained rational*pi coefficients with reduced denominator 3, 4 or 6 recognized by the existing linear form.',
    'admitted_scope':'Share the existing forward atan/pi anchor correspondence, recover its selected argument from the native pi/atan form for sine/cosine, and reuse the existing unit-hypotenuse implementation. The Real-facing reader keeps its previous forms and canonical output path. No second trigonometric kernel or public API is added.',
    'proof_argument':source_review['proof_argument'],'negative_controls':source_review['negative_controls'],'resource_scope':source_review['resource_scope'],
    'contract_dimensions':{'numerical_certainty':'Independently derived exact squares and signs, directed MPFR enclosures and preserved certified results for the tested domain.','topological_validity':'No topology follows from these scalar facts; downstream suites retain their own requirements.','geometric_fidelity':'No analytic-surface or quantization claim; original scalar source graphs stay authoritative.'},
    'acceptance':{'original_cases':72,'original_both_certified_before':68,'original_both_certified_after':72,'expanded_function_rows':480,'native_square_certified_before':0,'native_square_certified_after':384,'real_square_certified_before_and_after':96,'all_480_signs_preserved':True,'contradictions':0,'original_cases_preserved':True,'focused_integration_tests':38,'new_unit_tests':3,'new_integration_tests':2,'parent_regression_fails':True,'identity_query_precision':0,'large_periods':'even/odd signed integers including 2^256','nearby_offset':'signed 2^-512, checked at 0 and -1024','cache_histories':['cold','angle refined at -128','derived value refined at -256 then exact proof at 0'],'concurrent_threads':16,'concurrent_squared_identity_checks':96,'post_concurrency_squared_identity_checks':6,'cotangent_following_identity_and_zero_failure_checked':True,'formats':['native JSON/CBOR','Real JSON/CBOR','owned/borrowed CBOR Values','JSON/CBOR collections'],'outer_real_scales':[0,-1,1,2]},
    'interchange':{'intentional_native_derived_representation_migration':True,'description':'New derived native results use existing algebraic forms; no decoder tags or wire versions change. Public atan source graphs match the pre-edit capture.','legacy_graphs':48,'legacy_fixture_sha256':binding['legacy_sha256'],'legacy_json_and_cbor_reencoding_checked':True,'legacy_native_cbor_bytes_captured_before_edit':False,'legacy_enclosure_checks':288,'legacy_precision_sequence':[0,-128,0],'public_real_json_and_cbor_rows_unchanged':532,'first_working_candidate_unnecessary_real_wire_changes':56,'those_changes_removed':True},
    'serialized_graph_metrics':{'rows':48,'raw_metrics_sha256':sha(B/'graph-metrics-v1.json'),'maximum_per_metric':graph_metrics['maximum_per_metric'],'changes_by_metric':graph_changes,'source_graphs_preserved':True,'scope':'Serialized node occurrences, nesting and observed scalar payload sizes for the captured finite domain; not unique DAG nodes, heap usage or intermediate expression-growth bounds. Candidate maximum nesting rises from seven to eight; individual rows grow by up to five nesting levels, seven node occurrences and 125 compact JSON bytes. These changes are retained alongside exact completion.'},
    'scalar_cargo':scalar['packages'],'debug_units_passed':840,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
    'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
    'cost_comparisons':cost_summary,'cost_retention':retention,'cost_scope':'17 unchanged ordinary rows x100000 iterations x5 pairs, 96 unchanged retained-atan rows x10000 x5, and 72 known-angle rows x10000 x5. Parent/candidate order alternates; all measured values satisfy independent MPFR bounds. Timing includes declared construction/materialization; process and oracle setup are excluded consistently. Exact identity completion is separate from numerical evaluation. Raw results and unfavorable rows are retained.',
    'failed_commands':failures,'additional_failed_attempts':['Focused v2 passes all functional checks but its final comparison rejects 56 public Real wire changes. Sources, results and assertion evidence are preserved.','The first unit harness fails before launching a compiler because it misreads --emit=link; the corrected harness passes all three new units.','The first downstream launcher references a nonexistent scalar-v2 prerequisite after all scalar checks passed in scalar-v1. Corrected versioned consumer/MSRV helpers preserve those passing results and every downstream workload.'],
    'remaining_limitations':['General native angle/expression domains, full-width precision and typed evaluation/cancellation remain open.','Depth-limited recognition and external containment do not establish internal total-work, coefficient-growth or heap bounds.','Finite tests and concurrent schedules do not establish exhaustive coverage or formal verification of production code.','Complete ordinary workflow coverage, clean shipped distribution, foreign consumers and full CI remain open. No push or release was performed.','Historical missing evidence was not reaudited or recovered.'],
    'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'artifact_volume':str(B.parent),'disk_b_allowance_gib':None,'disk_b_quota_mode':'User authorized available artifact volume capacity; no retained-artifact quota.','disk_b_physical_free_guard_bytes':authorization['new_volume_physical_free_guard_bytes'],'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,'general_speedup_claimed':False,
    'next':'Return to the broader ordinary strict-workflow and evidence contracts, then complete shipped-user-path and release validation; this finite scalar extension does not complete properties.md.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{'exit_code':row['exit_code'],'elapsed_seconds':row['elapsed_seconds'],'wall_limit_seconds':row['wall_limit_seconds'],'stops':row['stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/consumer-scope-addendum-v2.md','consumer-scope-addendum-v2.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-candidate-v4.json.gz','source-pins-v1.json.gz'),(B/'source-review-v1.json','source-review-v1.json'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
patch=git('diff','--binary')
for path in sorted(new):
    added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False)
    assert added.returncode==1
    patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('''# E96: retained known-angle arctangent facts

Native sine/cosine now reuse the exact atan arguments normalized to pi/6,
pi/4 and pi/3, including signs, integer periods and half-pi complements.
The original 72-case replay certifies every case, up from 68. The expanded
matrix certifies all 480 function rows, resolving 384 native square identities
while preserving the 96 existing Real proofs and every definite sign.

The [review](review-v1.json) records the mathematical argument, checks,
measured costs, unfavorable results and remaining limits. The
[contract](contract-v1.md) predates implementation; its
[consumer addendum](consumer-scope-addendum-v2.md) preserves the working
candidate rejected for changing Real serialization. All 532 captured public
Real outputs retain identical JSON and CBOR in the final candidate.

New native derived outputs intentionally use existing algebraic wire forms.
The source angle graphs stay unchanged, and 48 prior derived graphs remain
consumable. The [checkpoint](checkpoint-v1.json) pins implementation and
evidence. This admission does not establish topology, analytic fidelity,
exhaustive/formal correctness, complete distribution or the full properties
plan. Historical missing evidence was not reaudited or recovered.
''')

prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'known_angle_atan_facts' not in current
current['updated_on']='2026-10-19'
current['known_angle_atan_facts']={key:review[key] for key in ['decision','admitted_scope','acceptance','interchange','serialized_graph_metrics','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','cost_comparisons','cost_retention','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['known_angle_atan_facts'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'native known-angle facts admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(path.relative_to(O)):sha(path) for path in E.rglob('*') if path.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':22,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_quota_mode':review['disk_b_quota_mode'],'disk_b_physical_free_guard_bytes':review['disk_b_physical_free_guard_bytes'],'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/path)==digest for path,digest in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
