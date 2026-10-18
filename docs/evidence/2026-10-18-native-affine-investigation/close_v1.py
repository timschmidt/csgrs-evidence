"""Close the native-comparison investigation without admitting either prototype."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'native-comparison-control-v1'
P=O/'docs/evidence/2026-10-18-sign-cache-publication'
E=O/'docs/evidence/2026-10-18-native-affine-investigation'
BASE='a62636b985186ff9041f6013b2f840adb3d391b9'
sys.path.insert(0,str(N/'sign-cache-publication-control-v1'))
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from validation_runner_v4_local import resources,reasons,sha
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,v):
 assert not Path(p).exists(),p
 Path(p).write_text(json.dumps(v,indent=2,sort_keys=True)+'\n')
def gzwrite(p,v):
 assert not Path(p).exists(),p
 Path(p).write_bytes(gzip.compress((json.dumps(v,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
 start=re.search(rb'"current_work"\s*:\s*',raw).end();v,count=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:count].encode()),v
assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','HEAD','--name-only') and not git('diff','--cached','--name-only')
assert not reasons(resources())
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
assert all(sha(O/p)==h for p,h in live.items())
pinsfile=N/'sign-cache-publication-control-v1/main-source-pins-v3.json.gz'
pins=json.loads(gzip.decompress(pinsfile.read_bytes()))
assert len(pins)==2654 and all(sha(O/p)==h for p,h in pins.items())
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
native=read(N/'native-comparison-baseline-v3/result-v1.json')
assert native['summaries']=={'kicad_native_aggregation':[['FAILED','9','3','0','0','0']],'kicad_native_strokes':[['FAILED','0','10','0','0','0']],'existing_source_failures':[['ok','39','0','0','0','0']]}
owner=read(N/'affine-owner-baseline-v1/result-v1.json')
assert owner['summary']==[['FAILED','1','3','0','0','849']]
full=read(N/'affine-owner-baseline-complete-v1/result-v1.json')
assert full['existing_tests_passed']==849 and full['original_affine_preservation_test_passed']
probe=read(N/'native-comparison-probe-v1/result-v1.json');assert probe['passed'] and probe['result_rows']==81
public=read(N/'native-affine-reproduction-v1/result-v1.json')
assert public['summary']==[['FAILED','5','1','0','0','0']]
def summaries(name):
 return re.findall(r'^test result: ([A-Za-z]+)[.] ([0-9]+) passed; ([0-9]+) failed; ([0-9]+) ignored; ([0-9]+) measured; ([0-9]+) filtered out;',(N/'logs'/name/'stdout').read_text(),re.M)
assert summaries('affine-owner-candidate-tests-v1')==[('FAILED','3','1','0','0','849')]
assert summaries('affine-owner-candidate-tests-v2')==[('ok','4','0','0','0','849')]
assert summaries('affine-owner-candidate-complete-unit-suite-v2')==[('FAILED','852','1','0','0','0')]
assert not E.exists();E.mkdir()
traces={}
for line in (N/'logs/native-comparison-probe-run-v1/stdout').read_text().splitlines():
 if line.startswith('TRACE,'):
  _,case,phase,layer,operation,path,count=line.split(',')
  traces.setdefault(case,{}).setdefault(phase,{})[layer+'/'+operation+'/'+path]=int(count)
assert len(traces)==27
quadratic_cases=[case for case in traces if case.startswith(('quadratic_direction/','other_quadratic/','large_translation/','tiny_width/'))]
assert len(quadratic_cases)==16
for case in quadratic_cases:
 assert traces[case]['repeated']['computable/structural/quadratic-surd']==8
 assert traces[case]['retained_difference']['computable/structural/quadratic-surd']==1
dump(E/'trace-analysis-v1.json',{'raw_output_sha256':sha(N/'logs/native-comparison-probe-run-v1/stdout'),'cases':traces,'pairs':27,'native_coordinate_pairs':24,'common_factor_controls':3,'repeated_quadratic_pairs':quadratic_cases,'successful_quadratic_projections_per_eight_repeated_comparisons':8,'retained_difference_control_projections_per_eight_queries':1,'limitations':'The retained-difference control changes the workload and excludes its construction. Counters record named dispatch events, not all normal-form calls, allocations, latency or a predicted speedup.','speedup_claimed':False})
review={'decision':'reject constructor-wide affine cancellation; retain diagnostic findings and unchanged main source','source_revision':BASE,'owners':{'ingress':'HyperDRC KiCad straight-track boundary','identity':'Hyperreal scalar construction and comparison proof machinery'},'properties':['P1','P2','P3','P4','P5','P6','P8','P9','P17','P18','P19','P20','P25','P26','P27','P35','P36','P37','P39'],'native_reproduction':native['summaries'],'native_library_configuration':'Final actual-main Hypercircuit dependency configuration, with Hyperreal cached-f64-approx, default, dispatch-trace and serde. Original 39-test control uses its separately frozen default HyperDRC executable.','owner_baseline':{'new_tests_passed':1,'new_tests_failed':3,'complete_existing_tests_passed':849,'complete_suite_passed':850,'complete_suite_failed':3,'all_failures_are_new_expectations':True},'candidate_v1':{'focused_passed':3,'focused_failed':1,'remaining_failure':'negative rational scale absorbs the explicit negation'},'candidate_v2':{'focused_passed':4,'complete_suite_passed':852,'complete_suite_failed':1,'existing_failure':'computable::node::tests::affine_offsets_preserve_shared_bases_through_exact_scaling','failure_reason':'Eager cancellation of ordinary affine sums discards the shared-base representation required by the existing construction contract.'},'public_order_probe':{'shared_base_orders_already_pass':5,'unequal_radical_zero_refinement_control_failed':1,'control_actual_outcome':'Unknown','control_was_not_weakened':'The failed control and its expected Less remain archived. It lies outside the proposed shared-base identity; no false mathematical answer or repair is claimed.'},'trace_finding':'Sixteen native irrational-offset coordinate pairs repeat eight successful quadratic projections over eight repeated comparisons. An explicitly retained difference uses one projection across eight queries; this is diagnostic evidence, not a like-for-like speedup.','setup_failures':['The first standalone link failed on a CSGRS dependency metadata mismatch after feature builds reused its unversioned rlib filename. The final coherent library configuration linked successfully. Frozen executed test binaries were unchanged.','The generated summary regex lost escaping. The completed aggregation output was re-read after correction, not rerun or relabeled.','A draft trace-field spelling was corrected before its first compilation.'],'test_inputs_and_original_gates_weakened':False,'main_source_changed':False,'new_runtime_admitted':False,'constructor_candidate_admitted':False,'exact_importer_admitted':False,'sign_cache_correction_still_retained':True,'speedup_claimed':False,'limits':{'root_gib':16,'disk_b_gib':72,'tmp_gib':12,'cumulative_logs_mib':96,'child_address_space_gib':8,'build_seconds':1800,'focused_seconds':60,'baselines_reset':False},'not_executed':['Candidate native comparison replay','Matched allocation and timing comparison','Candidate full native gates and complete report migration','Candidate downstream matrix or final main integration'],'next':'Preserve ordinary sums. Reproduce and evaluate explicit subtraction or comparison-owned rational affine proof reuse at the scalar layer, retaining the same native shapes, negative scales, unequal-base controls, original fixtures and full-workload gates. Do not revive either rejected constructor-wide prototype.','full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True}
dump(E/'review-v1.json',review)
(E/'README.md').write_text('''# Native affine comparison investigation

The current committed libraries still fail all ten archived exact straight-track
tests and three of twelve aggregation tests. All 39 existing typed-failure
controls pass. The exact importer remains unadmitted.

Native offset probes identify repeated scalar proof construction: sixteen
irrational coordinate pairs repeat quadratic recognition on each comparison.
Retaining a difference changes that diagnostic workload; no speedup or allocation
claim follows. Shared-base public order queries already complete. An unrelated
two-radical zero-refinement expectation returns Unknown and remains failed.

Three new scalar-owner expectations fail on the unchanged implementation. The
first constructor prototype fixes two but misses negative scaling. The second
passes all four focused tests, then fails an existing shared-operand preservation
test in the full suite (852 pass, one fails). The unchanged baseline passes all
849 existing tests; only the three new expectations fail. Both prototypes are
rejected. No existing test, policy, fixture or resource gate was weakened.

The next approach must preserve ordinary sums while reusing the exact affine
identity at explicit subtraction or comparison. The sign-cache correction stays
committed. Production source is unchanged, and no new runtime is admitted.

The archive preserves both prototypes, tests, commands, raw diagnostics and
setup corrections. The initial incompatible-library link and result-reader
failure remain visible. The successful library selection includes dispatch
tracing and is not a fresh Cargo or distribution qualification. Large executables
are physically retained with individual hashes; temporary artifacts remain
volatile. Historical missing artifacts were not recovered or reaudited.

All original storage baselines and limits remain enforced. Hypervoxel stays
outside scope. The full properties plan and release validation remain open.
''')
for name in ['contract-v1.md','contract-v2.md','comparison-probe-contract-v1.md','affine-reproduction-contract-v1.md','affine-owner-contract-v1.md','affine-candidate-contract-v1.md']:
 shutil.copy2(W/name,E/name)
shutil.copy2(Path(__file__),E/'close_v1.py')
prefixes=('native-comparison-','native-affine-reproduction-','affine-owner-')
folders=sorted(p for p in (N/'logs').iterdir() if p.name.startswith(prefixes))
commands={}
for folder in folders:
 row=read(folder/'result.json');assert row['output_closed'] and not row['stops']
 assert all(sha(folder/p)==h for p,h in row['output_sha256'].items())
 commands[folder.name]=row
adverse={name for name,r in commands.items() if r['exit_code']}
assert adverse=={'native-comparison-baseline-kicad_native_aggregation-compile-v1','native-comparison-link-diagnostic-v1','native-comparison-baseline-kicad_native_aggregation-v2','native-comparison-baseline-kicad_native_strokes-v3','native-affine-reproduction-run-v1','affine-owner-baseline-tests-v1','affine-owner-candidate-tests-v1','affine-owner-candidate-complete-unit-suite-v2','affine-owner-baseline-complete-v1'},adverse
dump(E/'command-results-v1.json',commands)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1446834,921794)
roots=sorted(p for p in N.iterdir() if p.name.startswith(prefixes))
for name in ['logs','scratch']:
 roots.extend(sorted(p for p in (N/name).iterdir() if p.name.startswith(prefixes)))
temporary_names=['csgrs-native-comparison-20261018-v1','csgrs-native-comparison-20261018-v2','csgrs-native-comparison-20261018-v3','csgrs-native-comparison-probe-20261018-v1','csgrs-native-affine-reproduction-20261018-v1','csgrs-affine-owner-baseline-20261018-v1','csgrs-affine-owner-candidate-20261018-v1','csgrs-affine-owner-candidate-20261018-v2','prepare-native-comparison-v1.py','native-comparison-link-diagnostic-v1.py','prepare-native-comparison-v2.py','prepare-native-comparison-v3.py','prepare-native-comparison-probe-v1.py','fix-native-comparison-probe-fields-v1.py','prepare-native-affine-reproduction-v1.py','prepare-affine-owner-baseline-v1.py','prepare-affine-owner-candidate-v1.py','prepare-affine-owner-candidate-v2.py','affine-owner-baseline-complete-v1.py',Path(__file__).name]
roots.extend(Path('/tmp')/name for name in temporary_names)
selected=[]
for root in roots:
 assert root.exists(),root
 selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()))
assert len(selected)==len(set(selected))
physical={};members={};excluded={};stats={}
for p in selected:
 assert not p.is_symlink() and p.is_file(),p
 before=p.stat();digest=sha(p);after=p.stat()
 assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
 assert str(p) not in prior,p
 physical[str(p)]=digest;stats[str(p)]=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
 name=str(p.relative_to(N)) if p.is_relative_to(N) else 'temporary/'+str(p.relative_to('/tmp'))
 with p.open('rb') as f:is_binary=f.read(4)==b'\x7fELF'
 row={'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
 (excluded if is_binary else members)[name]=row
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
 for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as saved:
 assert set(saved.getnames())==set(members)
 for name,row in members.items():
  with saved.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_executables_physically_preserved':excluded,'every_physical_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'native affine investigation; constructor candidates rejected','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
s,e,current=span(raw);rs,re_,_=span(reference);assert (raw[:s],raw[e:])==(reference[:rs],reference[re_:])
assert 'native_affine_comparison' not in current
current['native_affine_comparison']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','current_native_stroke_failures':10,'current_native_aggregation_failures':3,'typed_failure_controls_passed':39,'native_comparison_pairs':24,'common_factor_controls':3,'baseline_owner_acceptance_failures':3,'existing_scalar_tests_passed_on_baseline':849,'candidate_v2_focused_passed':4,'candidate_v2_full_passed':852,'candidate_v2_existing_failures':1,'both_constructor_candidates_rejected':True,'unequal_radical_zero_refinement_observation':'Unknown; the original failed expectation is retained','source_changes_applied':False,'runtime_admitted':False,'sign_cache_correction_retained':True,'performance_speedup_claimed':False,'all_adverse_results_retained':True,'disk_b_allowance_gib':72,'tmp_allowance_gib':12,'storage_baselines_reset':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated=raw[:s]+json.dumps(current,indent=2).encode()+raw[e:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
 if p.suffix in {'.md','.py','.json'}:
  text=p.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),p
  if p.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
 checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record=dict(previous)
record.update({'status':review['decision'],'checkpoint_kind':'native affine comparison investigation','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':0,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{},'source_changes_applied':False,'production_rust_sources_unchanged':True,'production_prefixes_unchanged':True,'all_other_source_inputs_unchanged':True,'new_implementation_admission':False,'runtime_admitted':False,'runtime_admitted_scope':'No new runtime admission; E74 exact-sign correction remains retained','exact_sign_publication_admitted':True,'constructor_candidate_admitted':False,'qualification_this_checkpoint':review,'main_qualification_this_checkpoint':{'current_native_regressions':native['summaries'],'direct_scalar_existing_unit_tests_passed':849,'library_feature_scope':review['native_library_configuration']},'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'format_rerun':False,'format_evidence_reused_for_identical_main_sources':str((N/'logs/sign-cache-publication-main-v3-workspace-fmt/result.json')),'runtime_tests_rerun':True,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'exact_ingress_admitted':False,'final_source_parent_revision':BASE,'source_commit':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'performance_speedup_claimed':False})
dump(E/'checkpoint-v1.json',record)
for path,expected_stat in stats.items():
 st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==expected_stat,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in live.items())
assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'production_source_changed':False,'runtime_admitted':False,'full_plan_complete':False}),flush=True)
