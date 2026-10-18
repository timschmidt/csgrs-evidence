"""Correct the Point2 fixture to permit stronger proofs and reject a distinct point."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
O=Path('/home/tim/Documents/GitHub/workspace/csgrs');N=O.parent/'csgrs-properties-validation-2026-10-17-v2';W=Path(__file__).resolve().parent
E=O/'docs/evidence/2026-10-18-point-equality-strengthening';P=O/'docs/evidence/2026-10-18-point-equality-contracts';L=O/'docs/evidence/2026-10-17-resume-integration'
BASE='7758062126b228695cb7a56aaaa205923ffc86c9';TEST='crates/hypercurve/tests/point_equality_contract.rs'
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
assert git('rev-parse','HEAD').decode().strip()==BASE and git('diff','--name-only').decode().splitlines()==[TEST] and not git('diff','--cached','--name-only')
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256'];assert len(live)==182 and all(sha(O/p)==h for p,h in live.items() if p!=TEST)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(1360476,921794)
final=read(N/'point-rational-contract-strengthening-v1/result-v1.json')
assert final['passed'] and final['tests_per_implementation']==3 and final['test_executions']==6
assert sha(O/TEST)==sha(W/'point_equality_contract_v2.rs')==final['source_sha256']
assert hashlib.sha256(git('show','HEAD:'+TEST)).hexdigest()=='8d25627857b5ba0157f8c9cf4946b36703110ffcb6810800920f9cd5059a9aba'
assert all(sha(v['path'])==v['sha256'] for libs in final['libraries'].values() for v in libs.values())
assert all(sha(v['path'])==v['sha256'] for v in final['binaries'].values())
assert not E.exists();E.mkdir();shutil.copy2(Path(__file__),E/'close_v1.py')
commands={};roots=[N/'point-rational-contract-strengthening-v1']
for pattern in ['point-rational-contract-strengthening-*']:
    for folder in sorted((N/'logs').glob(pattern)):
        r=read(folder/'result.json');assert r['exit_code']==0 and r['output_closed'] and not r['stops']
        assert all(sha(folder/name)==digest for name,digest in r['output_sha256'].items())
        commands[folder.name]=r;roots.extend([folder,N/'scratch'/folder.name])
assert len(commands)==5
retention=read(W/'retention-contract-v2.json');assert retention['disk_b_net_consumption_limit_bytes']==72*1024**3 and not retention['initial_free_baselines_reset']
review={'decision':'correct the Point2 fixture to permit stronger proofs and independently reject a distinct symbolic point; optimization proposals remain unadmitted','corrects_checkpoint':'E67','production_passing_tests_were_not_weakened_to_hide_a_failure':True,'parent_revision':BASE,'owning_layer':'Hypercurve Point2 exact-coordinate equality contract','properties':['P3','P4','P5','P8','P9','P17','P35','P36'],'input_domain':'mixed exact rational/symbolic coordinates, exact dyadic line constructions and an unresolved symbolic zero alongside a known rational coordinate','independent_oracles':['(0,0)+1/n*(n,m)=(1,m/n), with integer n and m','2*pi=pi+pi and rational fraction identities','sin(e)^2+cos(e)^2-1=0; adding exact positive 1e-400 makes the other point distinct'],'coverage':['both rational-axis placements','STRICT to APPROXIMATE_512 to STRICT on exact facts','sub-binary64 rational separation','shared point identity','same low-high-low precision sequence permits newly certified equality and rejects contradictory zero/nonzero facts'],'validation':final,'commands':commands,'test_source_sha256':sha(O/TEST),'production_implementation_changed':False,'candidate_optimization_admitted':False,'other_experiment_artifacts_remain_open':True,'authorized_retention_contract':retention,'public_distribution_complete':False,'full_plan_complete':False,'hypervoxel_deferred_by_user':True,'limitations':['Only the third test changes; all three tests pass on both implementations. It no longer fixes an Unknown outcome or failed proof history. This does not admit an optimization.','The separate optimization experiments and their targets remain open and are not closed by this checkpoint.','Only the named tests are recompiled against hash-verified baseline and candidate libraries. Broader candidate qualification remains separate and ongoing.','The last historical audit observed 921794 missing paths; older history is not re-audited here.','No public release, binding, pre-push matrix or complete properties-plan claim is made.']}
dump(E/'review-v1.json',review)
(E/'README.md').write_text("""# Permit stronger proofs in point acceptance tests

E67's third test unnecessarily required a mathematically zero trigonometric
identity to stay Unknown and its point comparison to stay inconclusive after
refinement. That conflicts with the existing P4 contract: warming may expose a
stronger proof. The previous test passed; this correction does not hide an
implementation failure.

The revised test retains the original identity, both coordinate-axis placements,
and the exact low-high-low precision sequence. It permits a new exact-zero proof
and rejects a contradictory nonzero fact. It also adds the same identity plus
exact positive `1e-400`. Those points are independently distinct, so equality of
the other rational coordinate must not certify their equality. Both comparison
directions and the absence of a false zero fact are checked. The first two tests
are unchanged.

Final whole-workspace formatting and warning-denied compilation pass. All three
tests pass on the unchanged production libraries and the inline candidate:
six test executions. The [review](review-v1.json) records the commands, library
hashes and exact source. Only the acceptance test changes; no optimization,
policy, fixture reduction or resource-limit change is admitted.

The [raw archive](raw-evidence-v1.tar.gz) and
[member index](archive-members-v1.json.gz) preserve this correction and its runs.
Both executables remain separately hash-pinned outside the archive. E67's old
test and evidence remain intact. The containing experimental control directory
and candidate build targets remain open. Wider candidate checks continue
separately. The last historical audit recorded 921,794 missing paths; that
history is not re-audited here. Hypervoxel remains excluded. Public distribution
and the full plan remain open; no push was made.
""")
selected=[p for root in roots for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()]
selected.extend(W/name for name in ['point_equality_contract_v2.rs','point-contract-strengthening-v1.md','point-contract-strengthening-proposal-v1.json','point_contract_strengthening_validate_v1.py','point-contract-strengthening-transition-v1.json','close_point_strengthening_v1.py'])
selected.extend(N/name for name in ['point-contract-stage-verification-v1.json','point-contract-commit-verification-v1.json'])
assert len(selected)==len(set(selected));physical={};members={};excluded={}
for p in selected:
    assert p.is_file() and not p.is_symlink(),p
    before=p.stat();digest=sha(p);after=p.stat();assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(p)]=digest;row={'physical_path':str(p),'sha256':digest,'bytes':before.st_size}
    (excluded if p.name.endswith('-point-equality-contract') else members)[str(p.relative_to(N))]=row
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
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'Point2 acceptance fixture allows stronger proofs','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'closed_paths_are_individually_enumerated':True,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'required_loader':str((L/'load_expectations_v2.py').relative_to(O))})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256'];reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]);assert 'point_equality_contract_strengthening' not in current
current['point_equality_contract_strengthening']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','test_source':TEST,'existing_acceptance_tests_updated':1,'tests_per_implementation':3,'test_executions':6,'supersedes_third_test_contract_checkpoint':'E67','production_implementation_changed':False,'candidate_optimization_admitted':False,'experiment_targets_remain_open':True,'disk_b_allowance_gib':72,'disk_b_baseline_reset':False,'other_execution_limits_unchanged':True,'hypervoxel_deferred_by_user':True,'public_distribution_complete':False,'full_plan_complete':False}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in ('.md','.py','.json'):
        text=p.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
files={str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous);record.update({'status':review['decision'],'checkpoint_kind':'test contract correction for stronger evidence','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':files,'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{TEST:sha(O/TEST)},'source_changes_applied':True,'production_rust_sources_unchanged':True,'point_equality_changed':False,'point_equality_contract_tests_admitted':True,'point_equality_candidate_admitted':False,'qualification_this_checkpoint':['all three corrected point contracts compile with warnings denied and pass on both unchanged production and inline candidate libraries: six executions','final whole-workspace formatting passes'],'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'open_experiment_artifacts_closed_here':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items()) and all(sha(O/p)==h for p,h in live.items() if p!=TEST)
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'ledger_sha256':sha(ledger),'production_implementation_changed':False}),flush=True)
