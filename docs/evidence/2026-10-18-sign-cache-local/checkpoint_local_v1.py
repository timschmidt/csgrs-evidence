"""Commit recoverable local qualification while downstream admission remains open."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
W=Path(__file__).resolve().parent;N=W.parent;O=N.parent/'csgrs';U=Path('/tmp/csgrs-sign-cache-validation-20261018-v1')
E=O/'docs/evidence/2026-10-18-sign-cache-local';P=O/'docs/evidence/2026-10-18-circle-envelope';BASE='78fc149debef9589876156deda773969acbe9444'
from validation_runner_v1 import sha,resources,reasons
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,v):
 assert not Path(p).exists();Path(p).write_text(json.dumps(v,indent=2,sort_keys=True)+'\n')
def span(raw):
 start=re.search(rb'"current_work"\s*:\s*',raw).end();value,count=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:count].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE and not git('diff','--name-only') and not git('diff','--cached','--name-only')
assert not reasons(resources());previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256'];assert all(sha(O/p)==h for p,h in live.items())
pins=json.loads(gzip.decompress((N/'point-rational-main-integration-v2/source-pins-v1.json.gz').read_bytes()));assert all(sha(O/p)==h for p,h in pins.items())
base=read(N/'sign-cache-publication-baseline-v1/result-v1.json');candidate=read(N/'sign-cache-publication-candidate-v1/result-v1.json');scalar=read(N/'sign-cache-publication-scalar-v2/result-v1.json');cost=read(W/'cost-result-v1.json')
assert base['reproduced'] and candidate['passed'] and scalar['passed'] and cost['exact_csv_identity'] and cost['completed_processes']==10
counts={mode:sum(int(r[-1][1]) for k,r in scalar['summaries'].items() if k.startswith(mode+'-test-')) for mode in ['default','all']};assert counts=={'default':934,'all':1041}
assert not E.exists();E.mkdir()
review={'status':'locally qualified correction; downstream and final integration admission pending','source_revision':BASE,'owner':'Hyperreal AtomicFacts publication for immutable Computable nodes','properties':['P3','P4','P5','P8','P9','P19','P35','P36','P37'],'finding':'A stale Unknown publication can overwrite a Valid exact sign. The actual current method fails three new deterministic regressions; its strengthening control passes. A proved sqrt(2)-1 sign is lost without any change to its expression or approximation cache.','repair':'Preserve an existing Valid sign and recheck after every CAS retry. Debug builds assert that independently certified signs agree. No cache field, policy, precision floor, expression representation or approximate terminal changes.','baseline_new_tests_failed':3,'baseline_new_tests_passed':1,'candidate_new_tests_passed':4,'default_scalar_parent_tests':934,'all_feature_scalar_parent_tests':1041,'debug_scalar_library_tests':817,'default_doctests':24,'all_feature_doctests':29,'child_checks_separate':'Two cold precision child checks per default/all-feature integration run, not additional unique parent tests.','clippy':'Default and all-feature release/all-target -D warnings passed.','documentation':'All-feature no-dependency docs with -D warnings passed.','formatting':'Workspace and explicit included-source checks passed.','allocation_comparison':'All requested allocation call/byte/peak/retained rows identical in five alternating pairs across all 20 original representation lifecycles.','allocation_processes':10,'candidate_binary_bytes_delta':cost['binaries']['candidate']['bytes']-cost['binaries']['baseline']['bytes'],'code_section_bytes_delta':20,'general_speedup_claimed':False,'harness_limitations':'The first scalar continuation reused the diagnostic unit-test binary and rejected valid child-process summaries. Its partial output and diagnosis are retained. Corrected qualification used a new empty target and verified fresh test executables without the diagnostic.','source_changes_applied':False,'runtime_admitted':False,'downstream_validation_in_progress':True,'compiler_floor_and_full_report_replay_complete':False,'main_integration_complete':False,'full_plan_complete':False,'hypervoxel_deferred_by_user':True,'next':'Finish affected consumers, original native resource gates, complete report replay and compiler-floor checks; only then integrate, run final main checks and decide retention.'}
dump(E/'review-v1.json',review)
(E/'README.md').write_text("""# Exact-sign cache correction: local evidence

The current scalar publication method can erase a certified sign when delayed
structural work publishes `Unknown`. Three deterministic regressions reproduce
the defect, including a real sqrt(2)-1 expression. The proposed shared-method
guard preserves the proof on every CAS retry and keeps all other packed facts.

The isolated candidate passes four new regressions, 934 default scalar parent
tests, 1,041 all-feature parent tests, 817 debug library tests, and 24/29
respective doctests. Configuration totals overlap. Two cold-precision child
checks per integration configuration are recorded separately. Default and
all-feature strict Clippy, documentation and formatting pass.

All allocation rows match across five alternating process pairs of the unchanged
20-representation public lifecycle. Requested Rust payload is measured; this is
not RSS or an internal heap bound. The probe binary shrinks 56 bytes while its
code section grows 20 bytes. No speedup is claimed.

The first scalar continuation reused a test binary containing an earlier
diagnostic and mishandled valid child-process summaries. Its partial results
remain archived. Corrected qualification used a new empty target and verified
fresh executables. No test, policy, fixture or resource limit was weakened.

Production source is unchanged. The proposed patch and unchanged regression
source are included for review. Downstream validation is running; original native
gates, full report replay, compiler-floor checks, main integration and runtime
admission remain open. Hypervoxel is excluded and the full plan is incomplete.

The archive snapshots the control sources, completed local command logs and
results. Prepared helpers are not credited as executed checks. Targets and the
ongoing downstream experiment remain open; this checkpoint does not add closed
artifact expectations or claim to recover missing historical artifacts. The
copied executable hashes were checked independently at this checkpoint; /tmp
builds remain explicitly volatile.
""")
shutil.copy2(W/'candidate-v1.patch',E/'candidate-v1.patch');shutil.copy2(W/'baseline-node/exact_sign_cache_tests.rs',E/'exact_sign_cache_tests.rs');shutil.copy2(Path(__file__),E/'checkpoint_local_v1.py')
closed_phases=['baseline-v1','baseline-seed-v1','candidate-v1','scalar-v1','scalar-v2','cost-baseline-v1','cost-candidate-v1'];selected=[]
for p in W.rglob('*'):
 if p.is_file():selected.append(p)
for phase in closed_phases:
 root=N/('sign-cache-publication-'+phase)
 selected.extend(p for p in root.rglob('*') if p.is_file())
for root in (N/'logs').glob('sign-cache-publication-*'):
 if 'downstream' in root.name:continue
 assert (root/'result.json').exists(),root
 record=read(root/'result.json');assert record['output_closed']
 for name,h in record.get('output_sha256',{}).items():assert sha(root/name)==h
 selected.extend(p for p in root.rglob('*') if p.is_file())
assert len(selected)==len(set(selected));members={str(p.relative_to(N)):{'physical_path':str(p),'sha256':sha(p),'bytes':p.stat().st_size} for p in sorted(selected)}
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as tar:
 for name,row in members.items():tar.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tar:
 assert set(tar.getnames())==set(members)
 for name,row in members.items():
  with tar.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
(E/'archive-members-v1.json.gz').write_bytes(gzip.compress((json.dumps({'members':members,'archive_sha256':sha(archive),'all_member_content_verified':True,'snapshot_not_artifact_closure':True},sort_keys=True)+'\n').encode(),mtime=0))
physical={}
for name in ['baseline-artifacts']+[phase+'-artifacts' for phase in closed_phases if phase!='baseline-v1']:
 root=U/name
 assert root.exists(),root
 for p in root.iterdir():
  if p.is_file():physical[str(p)]=sha(p)
dump(E/'verification-v1.json',{'source_pins_checked':len(pins),'source_sha256_unchanged':True,'copied_artifact_files_sha256':physical,'every_physical_copy_hashed_independently':True,'archive_members':len(members),'archive_bytes':archive.stat().st_size,'artifact_expectations_inherited_without_new_closure':previous['artifact_expectations'],'old_artifact_history_reaudited':False})
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256'];reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference);assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
prefix=str(E.relative_to(O))+'/'
assert 'exact_sign_publication' not in current;current['updated_on']='2026-10-18';current['exact_sign_publication']={'status':review['status'],'owner':review['owner'],'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','baseline_regressions_failed':3,'candidate_regressions_passed':4,'default_parent_tests':934,'all_feature_parent_tests':1041,'debug_library_tests':817,'allocation_rows_identical':True,'source_changes_applied':False,'runtime_admitted':False,'full_plan_complete':False,'next':review['next']}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];s,e,_=span(updated);assert (updated[:s],updated[e:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
 if p.suffix in ['.md','.py','.json','.rs']:
  content=p.read_text();assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),p
  if p.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
record=dict(previous);record.update({'status':review['status'],'checkpoint_kind':'local scalar publication correction pending downstream admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{},'source_changes_applied':False,'production_rust_sources_unchanged':True,'new_implementation_admission':False,'qualification_this_checkpoint':{'baseline_regressions_failed':3,'baseline_regression_control_passed':1,'candidate_regressions_passed':4,'default_parent_tests':934,'all_feature_parent_tests':1041,'debug_library_tests':817,'default_doctests':24,'all_feature_doctests':29,'allocation_processes':10},'main_qualification_this_checkpoint':{},'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'open_experiment_artifacts_closed_here':False,'closed_experiment_roots':[],'new_physical_artifacts_verified':0,'copied_artifact_files_verified_without_closure':len(physical),'runtime_tests_rerun':True,'main_runtime_tests_rerun':False,'full_plan_complete':False,'runtime_admitted':False,'final_source_parent_revision':BASE})
dump(E/'checkpoint-v1.json',record)
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in live.items());assert not reasons(resources())
print(json.dumps({'archive_members':len(members),'archive_bytes':archive.stat().st_size,'copied_artifact_files_verified':len(physical),'ledger_sha256':sha(ledger),'production_source_unchanged':True,'runtime_admitted':False}),flush=True)
