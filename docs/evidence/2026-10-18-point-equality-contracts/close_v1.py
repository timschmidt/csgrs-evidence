"""Close independently validated Point2 contracts; keep optimization work open."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
O=Path('/home/tim/Documents/GitHub/workspace/csgrs');N=O.parent/'csgrs-properties-validation-2026-10-17-v2';W=Path(__file__).resolve().parent
E=O/'docs/evidence/2026-10-18-point-equality-contracts';P=O/'docs/evidence/2026-10-17-native-track-revisit';L=O/'docs/evidence/2026-10-17-resume-integration'
BASE='1b90c0105c71e09cacb613b4d8bfe63d62011d1c';TEST='crates/hypercurve/tests/point_equality_contract.rs'
sys.path.insert(0,str(L))
from load_expectations_v2 import load,sha
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def read(p):return json.loads(Path(p).read_text())
def dump(p,v):
    assert not Path(p).exists(),p;Path(p).write_text(json.dumps(v,indent=2,sort_keys=True)+'\n')
def gzwrite(p,v):
    assert not Path(p).exists(),p;Path(p).write_bytes(gzip.compress((json.dumps(v,sort_keys=True)+'\n').encode(),mtime=0))
def git(*a):return subprocess.check_output(GIT+list(a),cwd=O)
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end();value,count=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:count].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE and not git('diff','--name-only') and not git('diff','--cached','--name-only')
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256'];assert len(live)==181 and all(sha(O/p)==h for p,h in live.items())
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(1360437,921794)
baseline=read(N/'point-rational-equality-baseline-v1/result-v1.json');final=read(N/'point-rational-contract-integration-v1/result-v1.json')
assert baseline['existing_semantics_established'] and final['passed'] and baseline['test_count']==final['test_count']==3
assert sha(O/TEST)==sha(W/'point_equality_contract.rs')==baseline['source_sha256']==final['source_sha256']
assert all(sha(v['path'])==v['sha256'] for v in baseline['libraries'].values())
assert sha(N/'point-rational-equality-baseline-v1/point-equality-contract')==baseline['binary_sha256']
assert sha(N/'point-rational-contract-integration-v1/point-equality-contract')==final['binary_sha256']
assert not E.exists();E.mkdir();shutil.copy2(Path(__file__),E/'close_v1.py')
commands={};roots=[N/'point-rational-equality-baseline-v1',N/'point-rational-contract-integration-v1']
for pattern in ['point-rational-baseline-*','point-rational-contract-integration-*']:
    for folder in sorted((N/'logs').glob(pattern)):
        r=read(folder/'result.json');assert r['exit_code']==0 and r['output_closed'] and not r['stops']
        assert all(sha(folder/name)==digest for name,digest in r['output_sha256'].items())
        commands[folder.name]=r;roots.extend([folder,N/'scratch'/folder.name])
assert len(commands)==5
retention=read(W/'retention-contract-v2.json');assert retention['disk_b_net_consumption_limit_bytes']==72*1024**3 and not retention['initial_free_baselines_reset']
review={'decision':'retain three Point2 acceptance tests only; optimization proposals remain unadmitted','parent_revision':BASE,'owning_layer':'Hypercurve Point2 exact-coordinate equality contract','properties':['P3','P4','P5','P8','P9','P17','P35','P36'],'input_domain':'mixed exact rational/symbolic coordinates, exact dyadic line constructions and an unresolved symbolic zero alongside a known rational coordinate','independent_oracles':['(0,0)+1/n*(n,m)=(1,m/n), with integer n and m','2*pi=pi+pi and rational fraction identities','the conservative existing bool does not certify mathematical inequality when the symbolic proof remains unresolved'],'coverage':['both rational-axis placements','STRICT to APPROXIMATE_512 to STRICT on exact facts','sub-binary64 rational separation','shared point identity','low-high-low refinement queries on unresolved symbolic coordinates'],'baseline':baseline,'final_integration':final,'commands':commands,'test_source_sha256':sha(O/TEST),'production_implementation_changed':False,'candidate_optimization_admitted':False,'other_experiment_artifacts_remain_open':True,'authorized_retention_contract':retention,'public_distribution_complete':False,'full_plan_complete':False,'hypervoxel_deferred_by_user':True,'limitations':['These three tests preserve existing semantics; they do not establish the correctness or cost of an optimization.','The separate optimization experiments and their targets remain open and are not closed by this checkpoint.','Only the named tests are recompiled against already qualified and hash-verified current production libraries; the full workspace runtime suites are not rerun for this test-only change.','The last historical audit observed 921794 missing paths; older history is not re-audited here.','No public release, binding, pre-push matrix or complete properties-plan claim is made.']}
dump(E/'review-v1.json',review)
shutil.copy2(W/'retention-contract-v2.json',E/'retention-contract-v2.json')
(E/'README.md').write_text("""# Point equality acceptance tests

Three public `Point2` tests preserve the current exact-rational and symbolic
proof paths. They cover mixed coordinates in both axis positions, the exact
line identity `(0,0) + (1/n) * (n,m) = (1,m/n)`, and an unresolved symbolic zero
beside a known rational coordinate. Exact facts survive strict, approximate,
and strict policy selection. Refinement of the unresolved fixture does not
turn its conservative Boolean comparison into a proof of inequality.

The tests passed against the unchanged current production libraries before
experimentation and after integration. Final `cargo fmt --all -- --check`,
warning-denied compilation of the added test source, and all three tests pass.
The [review](review-v1.json) pins the libraries, commands, source and executable
bytes. No scalar or curve implementation change is admitted here. Optimization
experiments continue separately, with their targets and evidence still open.

The user authorized the [72 GiB Disk B allowance](retention-contract-v2.json).
It applies cumulatively from the original free-space baseline to new runner
processes. Root storage, time, memory, workload gates and log limits stay fixed;
earlier runs keep their original contracts.

The [raw archive](raw-evidence-v1.tar.gz) and
[member index](archive-members-v1.json.gz) preserve the two test runs and named
helpers. Both executable copies remain separately hash-pinned outside the
archive. This checkpoint closes only the individually listed paths; it does
not close the containing experimental control directory or any candidate build
target. Older history was not re-audited; the last audit recorded 921,794 missing
paths. Hypervoxel remains excluded. Public distribution, wider acceptance and
the full plan remain open; no push was made.
""")
selected=[p for root in roots for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()]
selected.extend(W/name for name in ['baseline_contract_v1.py','contract-v1.md','point_equality_contract.rs','integrate_point_contract_v1.py','retention-contract-v2.json','validation_runner_v4.py','close_point_contract_v1.py'])
selected.extend(N/name for name in ['track-revisit-stage-verification-v1.json','track-revisit-commit-verification-v1.json'])
assert len(selected)==len(set(selected));physical={};members={};excluded={}
for p in selected:
    assert p.is_file() and not p.is_symlink(),p
    before=p.stat();digest=sha(p);after=p.stat();assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(p)]=digest;row={'physical_path':str(p),'sha256':digest,'bytes':before.st_size}
    (excluded if p.name=='point-equality-contract' else members)[str(p.relative_to(N))]=row
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as saved:
    assert set(saved.getnames())==set(members)
    for name,row in members.items():
        with saved.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_artifacts_physically_preserved':excluded,'archive_sha256':sha(archive),'all_members_content_verified':True})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'independent Point2 acceptance tests and authorized storage contract','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'closed_paths_are_individually_enumerated':True,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'required_loader':str((L/'load_expectations_v2.py').relative_to(O))})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256'];reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]);assert 'point_equality_contracts' not in current
current['point_equality_contracts']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','test_source':TEST,'new_acceptance_tests':3,'production_implementation_changed':False,'candidate_optimization_admitted':False,'experiment_targets_remain_open':True,'disk_b_allowance_gib':72,'disk_b_baseline_reset':False,'other_execution_limits_unchanged':True,'hypervoxel_deferred_by_user':True,'public_distribution_complete':False,'full_plan_complete':False}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in ('.md','.py','.json'):
        text=p.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
files={str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous);record.update({'status':review['decision'],'checkpoint_kind':'independent test-only admission and retention allowance','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':files,'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{TEST:sha(O/TEST)},'source_changes_applied':True,'production_rust_sources_unchanged':True,'point_equality_changed':False,'point_equality_contract_tests_admitted':True,'point_equality_candidate_admitted':False,'qualification_this_checkpoint':['new three-test contract compiles with warnings denied and passes against unchanged production libraries before and after integration','final whole-workspace formatting passes'],'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'open_experiment_artifacts_closed_here':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items()) and all(sha(O/p)==h for p,h in live.items())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'ledger_sha256':sha(ledger),'production_implementation_changed':False}),flush=True)
