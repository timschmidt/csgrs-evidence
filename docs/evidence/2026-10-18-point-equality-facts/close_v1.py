"""Close equality experiments, retaining all failures and individually pinned paths."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile,time
from pathlib import Path
sys.dont_write_bytecode=True
O=Path('/home/tim/Documents/GitHub/workspace/csgrs');N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1');W=Path(__file__).resolve().parent
E=O/'docs/evidence/2026-10-18-point-equality-facts';P=O/'docs/evidence/2026-10-18-point-equality-strengthening';L=O/'docs/evidence/2026-10-17-resume-integration'
BASE='c4f6b43e4431601853cf482ac9d80936b8adde5f'
sys.path.insert(0,str(L));sys.path.insert(0,str(N/'control'))
from load_expectations_v2 import load,sha
from validation_runner_v4 import resources,reasons
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
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
application=read(W/'main-integration-application-result-v1.json')
changed=set(application['files'])|{'crates/hyperreal/PERFORMANCE.md','crates/hypercurve/PERFORMANCE.md'}
assert len(changed)==10 and set(git('diff','--name-only').decode().splitlines())==changed-{'crates/hyperreal/src/real/immediate_equality_tests.rs'}
assert all(sha(O/p)==h for p,h in live.items() if p not in changed)
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
for p,h in previous['extra_unchanged_inputs_sha256'].items():assert sha(O/p)==h
final=read(N/'point-rational-main-integration-v2/result-v1.json');assert final['passed']
pins=json.loads(gzip.decompress((N/'point-rational-main-integration-v2/source-pins-v1.json.gz').read_bytes()))
assert len(pins)==2653 and all(sha(O/p)==h for p,h in pins.items())
proposal=read(W/'inline-admission-review-v1.json');assert proposal['proceed_with_integration'] and not proposal['runtime_admitted']
assert read(N/'point-rational-inline-continuation-result-v2.json')['listed_phases_passed']
cost=read(W/'all-equality-cost-controls-review-v1.json');assert all(v['all_rows_retained'] for v in cost['controls'].values())
for folder in [N/'point-rational-equality-artifacts-v1',N/'point-rational-facts-artifacts-v1',V/'point-rational-native-facts-artifacts-v1',V/'point-rational-inline-facts-artifacts-v1',V/'point-rational-main-integration-artifacts-v2']:
    for row in read(folder/'executables-v1.json').values():assert sha(row.get('executed_copy',row.get('copy')))==row['sha256']
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1360514,921794)
commands={}
for folder in sorted((N/'logs').glob('point-rational-*')):
    assert (folder/'result.json').exists(),folder
    row=read(folder/'result.json');assert row['output_closed']
    for name,h in row.get('output_sha256',{}).items():assert sha(folder/name)==h
    commands[folder.name]=row
nonzero={k:v for k,v in commands.items() if v['exit_code']!=0 or v['stops']}
assert len(nonzero)==5,nonzero.keys()
assert not E.exists();E.mkdir();shutil.copy2(Path(__file__),E/'close_v1.py')
shutil.copy2(W/'all-equality-cost-controls-review-v1.json',E/'cost-review-v1.json')
shutil.copy2(W/'inline-admission-review-v1.json',E/'integration-decision-v1.json')
dump(E/'command-results-v1.json',commands)
review=dict(proposal);review.update({'decision':'retain shared exact rational equality facts and the Point2 consumer with the documented direct-scalar tradeoff','runtime_admitted':True,'main_validation':final,'main_validation_required_executions':sum(v['passed'] for v in final['summaries'].values()),'supplemental_narrow_filter_executions':9,'narrow_filter_harness_failure_preserved':True,'full_qualification_counts':{'hyperreal':1068,'hypercurve':2481,'hypercurve_existing_ignored':33,'hyperdrc':1667,'hyperdrc_doctests':3,'hyperlimit':365,'hypermesh':250,'hypermesh_existing_ignored':7,'csgrs_default':440,'hypercircuit_all_features':348},'original_failed_command_count':len(nonzero),'all_command_records':str((E/'command-results-v1.json').relative_to(O)),'implementation_sha256':{p:sha(O/p) for p in sorted(changed)},'extra_tradeoff':'The matched direct Rational control executable grows 56 bytes. All corresponding allocation/requested/live/peak tuples match in both phases.','scope':'Same qualified implementation bytes; main Cargo checks reuse the open target. Broad suites are not claimed as rerun on main.','remaining':['The exact-track importer remains unadmitted; no inline/importer combination ran.','Complete public distribution, binding/release validation and the full properties plan remain open.','The 921794-path historical missing observation is inherited from E63 and is not re-audited here.'],'historical_preservation_complete':False,'old_history_reaudited':False})
dump(E/'review-v1.json',review)
(E/'README.md').write_text("""# Shared exact equality facts and Point2 consumption

This change retains the existing cheap Rational equality branches in one
inlined scalar fact implementation. Real exposes Some(true), Some(false), or
inconclusive None; Point2 consumes a sufficient fact and keeps its original
difference/zero-proof fallback. Complete Rational equality retains its full
cross-product path. Unreduced representations remain supported. No policy,
input domain, importer, cache, or serialization contract is weakened.

Independent fraction/cross-product and affine-coordinate expectations cover
exact results separately from wrapper agreement. The committed point tests
permit stronger proofs after warming and reject contradictions. The
[review](review-v1.json) records the final decision, scope and source hashes;
the [cost review](cost-review-v1.json) retains every observation.

The inline candidate passes 1,068 scalar, 2,481 curve, 1,667 native plus three
native doctests, 365 predicate, 250 mesh, 440 default modeling, and 348
all-feature circuit test executions. The 33 curve and seven mesh ignores are
unchanged. Kernel/native all-target all-feature Clippy and documentation pass
with warnings denied. Rust 1.95 all-target all-feature and no-default-feature
checks pass. The original native timing assertions pass, and all 12 complete
native reports remain byte-identical. Passing counts do not substitute for
the independent semantic expectations or establish the full properties plan.

After the final edit, main-checkout formatting and 107 required test executions
pass: seven scalar equality, three public point, 14 point-group, one API
inventory, 29 scalar doctests, and 53 native ingress/aggregation tests. A first
harness mistakenly filtered point::tests instead of the original point::
group; its nine selected tests passed, then its expected-count assertion
failed. The corrected continuation restores the full 14-test filter and
reuses the identical-source successful checks. Both helpers and all original
outputs remain preserved. The implementation and tests were not changed to
hide a failure. The broader suites were run on hash-verified identical
implementation bytes; they are not claimed as rerun on main.

The unchanged nine-family Point2 probe has lower observed repeated medians
in every rational family, including the full large-coefficient case, with
fewer requested allocation calls. Symbolic allocation counts are unchanged.
The matched direct Rational control uses four samples per implementation
with matching native-build dependency features. Decimal repeated equality
has an observed +3.27% median regression: every candidate sample exceeds every
baseline sample. Shared-storage median change is +0.54%. These adverse costs
are accepted explicitly for the broader Point2 improvements, not dismissed.
The point/direct probe executables grow 1,160/56 bytes. Large-coefficient first
live payload grows 560 bytes and subrange repeated live payload grows 736 bytes.
These allocator-instrumented diagnostics are not a universal or statistically
significant speedup, an application speedup, RSS, or an internal resource bound.

The original full-rational Point2 comparison is rejected: its full
large-coefficient case is about 6.7 times slower. The unhinted fact extraction
is rejected as-is for roughly 17–25% ordinary direct-scalar regressions. The
standalone inline scalar pilot remains exploratory because transitive features
differed; its initial compile failure is preserved. The unhinted proposal
combined with exact-track ingress still fails both original timing gates.
No inline/importer combination was executed and no importer is admitted.

The [raw archive](raw-evidence-v1.tar.gz) and
[member index](archive-members-v1.json.gz) preserve contracts, helpers, proposed
sources, failures, controls, command outputs and reports. Frozen sources,
build artifacts and ELF binaries remain separately hash-pinned; every physical
path is hashed independently. Previously indexed E67/E68 paths are verified
without changing them. Prepared helpers are not credited as executed checks.
Mutable dependency caches are outside the closed experiment roots.

The approved 72 GiB Disk B ceiling uses the original free-space baseline;
the 16 GiB root, command/probe, memory, reserve and log limits are unchanged.
The old 921,794-path missing observation is not re-audited or declared recovered.
Hypervoxel remains excluded. Public distribution, the complete pre-push matrix
and the full plan remain open; no push is made.
""")
roots=[]
for base in [N,V]:
    roots.extend(sorted(base.glob('point-rational*')))
    roots.extend(sorted((base/'targets').glob('point-rational*')))
for name in ['logs','scratch']:roots.extend(sorted((N/name).glob('point-rational-*')))
roots.extend(N/name for name in ['point-strengthening-stage-verification-v1.json','point-strengthening-commit-verification-v1.json'])
selected=[]
for root in roots:
    assert root.exists(),root
    if root.is_file():selected.append(root)
    else:selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};previously_closed={};members={};excluded={};stats={}
source_roots={N/name for name in ['point-rational-equality-source-v1','point-rational-facts-source-v1','point-rational-native-facts-source-v1']}
target_roots={p for b in [N,V] for p in (b/'targets').glob('point-rational*')}
for ordinal,p in enumerate(selected):
    assert p.is_file() and not p.is_symlink(),p
    before=p.stat();digest=sha(p);after=p.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns),p
    stats[str(p)]=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    if str(p) in prior:
        assert prior[str(p)]==digest,p;previously_closed[str(p)]=digest;continue
    physical[str(p)]=digest;row={'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
    archive_name=str(p.relative_to(N)) if p.is_relative_to(N) else 'disk-b/'+str(p.relative_to(V))
    outside_archive=any(p.is_relative_to(root) for root in source_roots|target_roots) or p.suffix in {'.rlib','.rmeta','.so','.a'}
    if not outside_archive:
        with p.open('rb') as stream:outside_archive=stream.read(4)==b'\x7fELF'
    (excluded if outside_archive else members)[archive_name]=row
    if ordinal%2000==0:
        assert not reasons(resources());print(json.dumps({'hashed_paths':ordinal,'total_paths':len(selected)}),flush=True)
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as saved:
    assert set(saved.getnames())==set(members)
    for name,row in members.items():
        with saved.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_artifacts_physically_preserved':excluded,'archive_sha256':sha(archive),'all_members_content_verified':True,'previously_closed_paths_verified':previously_closed})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'shared equality facts and complete preserved experiments','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':len(previously_closed),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'required_loader':str((L/'load_expectations_v2.py').relative_to(O))})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference);assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'point_equality_facts' not in current
current['point_equality_facts']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','cost_review':prefix+'cost-review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','implementation_paths':sorted(changed),'runtime_admitted':True,'exact_track_importer_admitted':False,'cache_proposal_admitted':False,'complete_reports_byte_identical':12,'main_validation_required_executions':review['main_validation_required_executions'],'main_narrow_filter_harness_failure_preserved':True,'matched_scalar_decimal_median_regression_percent':3.266,'matched_scalar_shared_median_regression_percent':0.538,'all_adverse_measurements_retained':True,'general_speedup_claimed':False,'disk_b_allowance_gib':72,'disk_b_baseline_reset':False,'other_execution_limits_unchanged':True,'hypervoxel_deferred_by_user':True,'public_distribution_complete':False,'full_plan_complete':False}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in ('.md','.py','.json'):
        text=p.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
files={str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous);record.update({'status':review['decision'],'checkpoint_kind':'shared scalar equality facts and curve consumption admitted','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':files,'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':len(previously_closed),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':review['implementation_sha256'],'source_changes_applied':True,'production_rust_sources_unchanged':False,'production_prefixes_unchanged':False,'point_equality_changed':True,'point_equality_contract_tests_admitted':True,'point_equality_candidate_admitted':True,'new_implementation_admission':True,'candidate_changes_separately_uncommitted':False,'qualification_this_checkpoint':review['full_qualification_counts'],'main_qualification_this_checkpoint':{k:v['passed'] for k,v in final['summaries'].items()},'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'exact_ingress_admitted':False,'cache_index_admitted':False,'final_source_parent_revision':BASE})
dump(E/'checkpoint-v1.json',record)
for path,expected in stats.items():
    s=Path(path).stat();assert (s.st_size,s.st_mtime_ns,s.st_ctime_ns)==expected,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in live.items() if p not in changed)
assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'previously_closed_paths_verified':len(previously_closed),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'ledger_sha256':sha(ledger),'runtime_admitted':True,'full_plan_complete':False}),flush=True)
