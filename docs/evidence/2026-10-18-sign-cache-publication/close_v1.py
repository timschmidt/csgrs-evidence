"""Admit the qualified exact-sign publication correction with preserved evidence."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
W=Path(__file__).resolve().parent;N=W.parent;O=N.parent/'csgrs';U=Path('/tmp/csgrs-sign-cache-validation-20261018-v1')
E=O/'docs/evidence/2026-10-18-sign-cache-publication';P=O/'docs/evidence/2026-10-18-sign-cache-local';L=O/'docs/evidence/2026-10-17-resume-integration'
BASE='79a67b140eac2251584c7ec6fe0205761dab892e'
sys.path.insert(0,str(L))
from load_expectations_v2 import load,sha
from validation_runner_v4_local import resources,reasons
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def read(p):return json.loads(Path(p).read_text())
def dump(p,v):
 assert not Path(p).exists(),p;Path(p).write_text(json.dumps(v,indent=2,sort_keys=True)+'\n')
def gzwrite(p,v):
 assert not Path(p).exists(),p;Path(p).write_bytes(gzip.compress((json.dumps(v,sort_keys=True)+'\n').encode(),mtime=0))
def git(*a):return subprocess.check_output(GIT+list(a),cwd=O)
def span(raw):
 start=re.search(rb'"current_work"\s*:\s*',raw).end();value,count=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:count].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE and not git('diff','--cached','--name-only')
assert not reasons(resources())
previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
integration=read(W/'main-source-integration-v3.json');implementation={p:r['after_sha256'] for p,r in integration['changes'].items()};assert len(implementation)==3
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
assert all(sha(O/p)==h for p,h in live.items() if p not in implementation)
assert all(sha(O/p)==h for p,h in implementation.items())
assert all(sha(row['qualified_source'])==row['after_sha256'] for row in integration['changes'].values())
assert set(git('diff','--name-only').decode().splitlines())==set(implementation)-{'crates/hyperreal/src/computable/node/exact_sign_cache_tests.rs'}
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert all(sha(O/p)==h for p,h in previous['extra_unchanged_inputs_sha256'].items())
pins=json.loads(gzip.decompress((W/'main-source-pins-v3.json.gz').read_bytes()));assert len(pins)==2654 and all(sha(O/p)==h for p,h in pins.items())
main=read(N/'sign-cache-publication-main-v3/result-v1.json');scalar=read(N/'sign-cache-publication-scalar-v2/result-v1.json');downstream=read(N/'sign-cache-publication-downstream-v3/result-v1.json');floor=read(N/'sign-cache-publication-msrv-v3/result-v1.json');reports=read(N/'sign-cache-publication-reports-v3/result-v1.json');cost=read(W/'cost-result-v1.json')
assert all(r['passed'] for r in [main,scalar,downstream,floor])
assert main['actual_main_without_scalar_source_overlays'] and reports['all_report_bytes_equal'] and reports['all_parsed_reports_equal'] and cost['exact_csv_identity']
assert main['packages']['hyperreal-default']['parent_test_passed']==934 and main['packages']['hyperreal-all']['parent_test_passed']==1041
assert {p:r for p,r in main['packages'].items() if not p.startswith('hyperreal-')}==downstream['packages']
assert sum(r['parent_test_passed'] for r in downstream['packages'].values())==5549
assert main['summaries']['hyperreal-debug-library']==[['ok','817','0','0','0','0']]
assert not E.exists();E.mkdir()
review={'decision':'kept: exact-sign publication preserves an existing certificate','owner':'Hyperreal AtomicFacts for immutable Computable nodes','source_parent_revision':BASE,'properties':['P3','P4','P5','P8','P9','P19','P35','P36','P37'],'finding':'A delayed unresolved structural publication could erase a completed exact-sign proof. The actual old method failed three deterministic regressions, including sqrt(2)-1; the strengthening control passed.','repair':'Retain Valid signs and recheck after every failed CAS; debug assertions diagnose contradictory proofs. Preserve the other packed fields.','production_scope':'One existing atomic publication method; no cache layout, policy, precision, expression representation or approximate-terminal change.','tests':'Four unchanged new regressions; actual-main default and all-feature scalar suites, debug library tests and six complete downstream suites. Parent counts exclude separately recorded precision child processes.','actual_main_packages':main['packages'],'isolated_downstream_packages':downstream['packages'],'debug_scalar_tests':817,'baseline_regressions_failed':3,'baseline_positive_control_passed':1,'all_original_native_gates_passed':True,'compiler_floor':'Rust 1.95 all-target checks with all features and no default features for Hyperreal, Hyperlimit and Hypercurve; no 1.95 runtime or Clippy claim.','reports':'Twelve complete baseline/candidate/candidate/baseline CLI reports across CPArti, HVP109A and Gerber: identical raw bytes, exact parsed values, coverage and repeats. Compatibility evidence, not an independent geometry oracle.','allocation':'All allocation rows identical across five alternating process pairs and twenty unchanged public representation lifecycles. Rust requested payload only, not RSS or an internal heap bound.','binary_bytes_delta':-56,'text_section_bytes_delta':20,'speedup_claimed':False,'storage_history':'Original 5 GiB temporary build stop and later 8 GiB copy-batch overshoot retained. Explicit 12 GiB temporary and 96 MiB log-storage migrations preserve original baselines, root/Disk B, workload, time and child-memory limits. New copies are preflighted.','limitations':['This is not a whole-cache or machine-checked concurrency proof. Reader visibility requires the stated synchronization; other decline caches remain outside scope.','Forty existing downstream ignores remain open; no test, policy, fixture or validation assertion was weakened.','The earlier scalar diagnostic-binary reuse and child-summary parsing issue remains archived; corrected scalar qualification used a fresh target.','Historical missing artifacts were not recovered or reaudited. Temporary artifacts remain volatile.','The exact track importer, release/distribution validation and the full properties plan remain open. Hypervoxel is excluded.'],'source_changes_applied':True,'runtime_admitted':True,'runtime_admitted_scope':'Monotone exact-sign publication only','full_plan_complete':False,'next':'Continue the properties plan with the retained cache invariant; evaluate strict native completion separately against its unchanged contracts.'}
final_artifacts=read(U/'main-v3-artifacts/executables-v1.json')
assert all(sha(v['copy'])==v['sha256'] for v in final_artifacts.values())
review['final_binary_binding']={'recorded_executables':len(final_artifacts),'freshly_compiled_artifacts':sum(not v['cargo_fresh'] for v in final_artifacts.values()),'byte_identical_frozen_copies_reused':sum(v['reused_identical_frozen_copy'] for v in final_artifacts.values()),'manifest_sha256':sha(U/'main-v3-artifacts/executables-v1.json'),'compiled_paths_are_historical_copies_are_authoritative':True}
review['validation_scope_notes']='Some existing proptest tests emit SourceParallel persistence diagnostics from the private working directory. Their assertions still run and the diagnostic output is retained. No directed fuzz campaign or persisted new failure-seed claim is made.'
dump(E/'review-v1.json',review)
(E/'README.md').write_text('''# Exact-sign publication correction

The shared scalar publisher now preserves a certified sign when delayed work
publishes Unknown. The guard is checked after every failed compare-and-exchange.
Three regressions failed on the old method; all four pass with the correction,
including an independently positive sqrt(2)-1 expression and a subsequent
zero-refinement public query. Other packed facts remain intact.

After integration, actual-main checks passed 934 default and 1,041 all-feature
scalar parent tests, 817 debug library tests, and 5,549 tests across six downstream
packages. Configuration totals overlap. Forty existing downstream ignores remain
open. Doctests, affected strict Clippy, documentation and formatting pass.
Rust 1.95 compilation checks pass for the scalar and immediate consumers.

All twelve complete native report replays match in raw bytes and parsed values.
Original native CPU/wall gates pass. Five alternating allocation-process pairs
produce identical rows across twenty representation lifecycles. No speedup or
whole-cache concurrency proof is claimed. The invariant note states the reader
synchronization and immutable-node preconditions.

The original 5 GiB storage stop, later 8 GiB copy-batch overshoot, and earlier
scalar harness failures remain retained. Storage migrations permit 12 GiB in
/tmp and 96 MiB of cumulative logs without resetting baselines or changing
workloads, time, memory, root-volume or approved Disk B limits. New copies are
preflighted. Historical missing artifacts are not claimed recovered; /tmp
artifacts are volatile. Source, protocols, raw logs and individual artifact hashes
are retained here, with large build artifacts preserved at their recorded paths.

This admits only the scalar publication correction. Exact-ingress completion,
release validation, broader P4 coverage and the full plan remain open.
Hypervoxel remains out of scope.
''')
for name in ['publication-invariant-v1.md','publication-source-audit-v1.json','storage-migration-v1.md','storage-migration-v2.md','log-storage-migration-v1.md','close_v1.py']:shutil.copy2(W/name,E/name)
commands={}
for folder in sorted((N/'logs').glob('sign-cache-*')):
 row=read(folder/'result.json');assert row['output_closed']
 for name,h in row.get('output_sha256',{}).items():assert sha(folder/name)==h
 commands[folder.name]=row
adverse={name for name,r in commands.items() if r['exit_code'] or r['stops']}
assert adverse=={'sign-cache-publication-baseline-regressions-v1','sign-cache-publication-downstream-v1-csgrs-build'}
dump(E/'command-results-v1.json',commands)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(1418714,921794)
roots=sorted(N.glob('sign-cache*'))+[U]+sorted(N.glob('circle-review-*'))+sorted(Path('/tmp').glob('prepare-sign-cache-*.py'))
for name in ['logs','scratch']:roots.extend(sorted((N/name).glob('sign-cache-*')))
selected=[]
for root in roots:
 assert root.exists(),root
 selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()))
assert len(selected)==len(set(selected))
physical={};previously_closed={};members={};excluded={};stats={}
target_roots=[p for p in U.iterdir() if p.is_dir() and p.name.startswith('target')]
for ordinal,p in enumerate(selected):
 assert p.is_file() and not p.is_symlink(),p
 before=p.stat();digest=sha(p);after=p.stat();assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns),p
 stats[str(p)]=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
 if str(p) in prior:
  assert prior[str(p)]==digest,p;previously_closed[str(p)]=digest;continue
 physical[str(p)]=digest;row={'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
 name=str(p.relative_to(N)) if p.is_relative_to(N) else ('temporary-builds/'+str(p.relative_to(U)) if p.is_relative_to(U) else 'temporary-helpers/'+p.name)
 outside=any(p.is_relative_to(root) for root in target_roots) or p.suffix in {'.rlib','.rmeta','.so','.a'}
 if not outside:
  with p.open('rb') as f:outside=f.read(4)==b'\x7fELF'
 assert name not in members and name not in excluded
 (excluded if outside else members)[name]=row
 if ordinal%2000==0:
  assert not reasons(resources());print(json.dumps({'hashed_paths':ordinal,'total_paths':len(selected)}),flush=True)
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
 for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as saved:
 assert set(saved.getnames())==set(members)
 for name,row in members.items():
  with saved.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_artifacts_physically_preserved':excluded,'archive_sha256':sha(archive),'all_members_content_verified':True,'previously_closed_paths_verified':previously_closed,'every_physical_path_hashed_independently':True})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'exact-sign publication admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':len(previously_closed),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':str((L/'load_expectations_v2.py').relative_to(O))})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference);assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert current['exact_sign_publication']['runtime_admitted'] is False
current['exact_sign_publication']={'status':review['decision'],'owner':review['owner'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','baseline_regressions_failed':3,'baseline_positive_control_passed':1,'candidate_regressions_passed':4,'actual_main_packages':main['packages'],'debug_library_tests':817,'downstream_parent_tests':5549,'existing_downstream_ignored_tests':40,'original_native_gates_passed':True,'all_twelve_report_bytes_and_parsed_values_equal':True,'allocation_rows_identical':True,'general_speedup_claimed':False,'actual_main_source_without_overlays_checked':True,'compiler_floor_scope':review['compiler_floor'],'source_changes_applied':True,'runtime_admitted':True,'runtime_admitted_scope':review['runtime_admitted_scope'],'disk_b_allowance_gib':72,'tmp_allowance_gib':12,'cumulative_log_allowance_mib':96,'storage_baselines_reset':False,'workload_time_and_memory_limits_unchanged':True,'all_adverse_results_retained':True,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];s,e,_=span(updated);assert (updated[:s],updated[e:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
 if p.suffix in {'.md','.py','.json'}:
  content=p.read_text();assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),p
  if p.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
record=dict(previous);record.update({'status':review['decision'],'checkpoint_kind':'exact-sign publication admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':len(previously_closed),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':implementation,'source_changes_applied':True,'production_rust_sources_unchanged':False,'production_prefixes_unchanged':False,'all_other_source_inputs_unchanged':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['runtime_admitted_scope'],'exact_sign_publication_admitted':True,'qualification_this_checkpoint':{'isolated_packages':downstream['packages'],'compiler_floor_passed':True,'complete_report_replays':12,'all_report_bytes_and_parsed_values_equal':True,'allocation_processes':10},'main_qualification_this_checkpoint':main['packages'],'main_source_pins_sha256':sha(W/'main-source-pins-v3.json.gz'),'main_source_integration_sha256':sha(W/'main-source-integration-v3.json'),'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'format_rerun':True,'runtime_tests_rerun':True,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'exact_ingress_admitted':False,'final_source_parent_revision':BASE,'source_commit':BASE,'temporary_artifacts_volatile':True,'tmp_allowance_gib':12,'cumulative_log_allowance_mib':96,'disk_b_allowance_gib':72,'storage_baselines_reset':False,'all_adverse_results_retained':True,'general_concurrency_proof_claimed':False,'performance_speedup_claimed':False})
dump(E/'checkpoint-v1.json',record)
for path,expected in stats.items():
 s=Path(path).stat();assert (s.st_size,s.st_mtime_ns,s.st_ctime_ns)==expected,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in (live|implementation).items());assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'ledger_sha256':sha(ledger),'runtime_admitted':True,'full_plan_complete':False}),flush=True)
