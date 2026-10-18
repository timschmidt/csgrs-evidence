"""Close the circle-envelope feasibility rejection without admitting production source."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
O=Path('/home/tim/Documents/GitHub/workspace/csgrs');N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1');W=Path(__file__).resolve().parent
E=O/'docs/evidence/2026-10-18-circle-envelope';P=O/'docs/evidence/2026-10-18-profile-attribution-correction';L=O/'docs/evidence/2026-10-17-resume-integration'
BASE='a1ffc2de7151f0a49229f186001ceae04839d38f'
sys.path.insert(0,str(L));sys.path.insert(0,str(N/'control'));sys.path.insert(0,str(N/'point-rational-equality-control-v1'))
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
assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--name-only') and not git('diff','--cached','--name-only')
assert not reasons(resources())
previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
assert all(sha(O/p)==h for p,h in live.items())
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
for p,h in previous['extra_unchanged_inputs_sha256'].items():assert sha(O/p)==h
pins=json.loads(gzip.decompress((N/'point-rational-main-integration-v2/source-pins-v1.json.gz').read_bytes()))
assert len(pins)==2653 and all(sha(O/p)==h for p,h in pins.items())
baseline=read(N/'circle-envelope-baseline-v1/result-v1.json');candidate=read(N/'circle-envelope-candidate-v1/result-v1.json')
assert baseline['passed'] and candidate['focused_passed'] and not candidate['gates_passed']
assert candidate['support_tests']==11 and candidate['native_tests']==75
assert candidate['gates']['full-board']['exit_code']==101
review=read(W/'review-v1.json');assert not review['runtime_admitted'] and not review['full_plan_complete']
assert review['source_revision']==BASE
for row in read(V/'circle-envelope-candidate-artifacts-v1/executables-v1.json').values():assert sha(row['copy'])==row['sha256']
assert sha(baseline['artifact']['copy'])==baseline['artifact']['sha256']
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1416543,921794)
commands={}
for folder in sorted((N/'logs').glob('circle-envelope-*')):
    assert (folder/'result.json').exists(),folder
    row=read(folder/'result.json');assert row['output_closed']
    for name,h in row.get('output_sha256',{}).items():assert sha(folder/name)==h
    commands[folder.name]=row
assert all(not r['stops'] for r in commands.values())
assert not E.exists();E.mkdir()
for name in ['close_v1.py','review-v1.json','README.md']:shutil.copy2(W/name,E/name)
dump(E/'command-results-v1.json',commands)
roots=[]
for base in [N,V]:
    roots.extend(sorted(base.glob('circle-envelope*')))
    roots.extend(sorted((base/'targets').glob('circle-envelope*')))
for name in ['logs','scratch']:roots.extend(sorted((N/name).glob('circle-envelope-*')))
roots.extend(sorted(N.glob('exact-profile-*')))
roots.extend(sorted(N.glob('profile-attribution-*')))
selected=[]
for root in roots:
    assert root.exists(),root
    if root.is_file():selected.append(root)
    else:selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};previously_closed={};members={};excluded={};stats={}
target_roots={p for b in [N,V] for p in (b/'targets').glob('circle-envelope*')}
for ordinal,p in enumerate(selected):
    assert p.is_file() and not p.is_symlink(),p
    before=p.stat();digest=sha(p);after=p.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns),p
    stats[str(p)]=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    if str(p) in prior:
        assert prior[str(p)]==digest,p;previously_closed[str(p)]=digest;continue
    physical[str(p)]=digest;row={'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
    archive_name=str(p.relative_to(N)) if p.is_relative_to(N) else 'disk-b/'+str(p.relative_to(V))
    outside_archive=any(p.is_relative_to(root) for root in target_roots) or p.suffix in {'.rlib','.rmeta','.so','.a'}
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
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'circle-envelope feasibility rejection','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':len(previously_closed),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'required_loader':str((L/'load_expectations_v2.py').relative_to(O))})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference);assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'circle_envelope_feasibility' not in current
current['circle_envelope_feasibility']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','baseline_support_tests_passed':11,'candidate_support_tests_passed':11,'candidate_native_tests_passed':75,'gates':candidate['gates'],'matched_benchmark':False,'source_changes_applied':False,'kernel_candidate_admitted':False,'exact_track_importer_admitted':False,'all_adverse_measurements_retained':True,'general_speedup_claimed':False,'disk_b_allowance_gib':72,'disk_b_baseline_reset':False,'other_execution_limits_unchanged':True,'hypervoxel_deferred_by_user':True,'public_distribution_complete':False,'full_plan_complete':False,'next':review['next']}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in ('.md','.py','.json'):
        text=p.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
files={str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous);record.update({'status':review['decision'],'checkpoint_kind':'circle-envelope feasibility rejection','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':files,'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':len(previously_closed),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{},'source_changes_applied':False,'production_rust_sources_unchanged':True,'production_prefixes_unchanged':True,'point_equality_changed':False,'new_implementation_admission':False,'candidate_changes_separately_uncommitted':False,'qualification_this_checkpoint':{'baseline_support_passed':11,'candidate_support_passed':11,'candidate_native_passed':75,'candidate_original_gates_passed':sum(v['exit_code']==0 for v in candidate['gates'].values()),'candidate_original_gates_failed':sum(v['exit_code']!=0 for v in candidate['gates'].values())},'main_qualification_this_checkpoint':{},'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'format_rerun':True,'runtime_tests_rerun':True,'main_runtime_tests_rerun':False,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'exact_ingress_admitted':False,'cache_index_admitted':False,'final_source_parent_revision':BASE})
dump(E/'checkpoint-v1.json',record)
for path,expected in stats.items():
    s=Path(path).stat();assert (s.st_size,s.st_mtime_ns,s.st_ctime_ns)==expected,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in live.items())
assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'previously_closed_paths_verified':len(previously_closed),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'ledger_sha256':sha(ledger),'runtime_admitted':False,'full_plan_complete':False}),flush=True)
