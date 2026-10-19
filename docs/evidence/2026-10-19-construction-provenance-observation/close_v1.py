"""Seal the reproduced construction-evidence gap without claiming a runtime repair."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/construction-provenance-observation-20261019-v1')
PREV_F=B.parent/'strict-boolean-workflows-admission-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-strict-boolean-workflows-admission'
E=O/'docs/evidence/2026-10-19-construction-provenance-observation'
X=B/'external-evidence'
BASE='3e1bc0282a013940c8d4600066e2ca90841f26d9'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from construction_provenance_runner_v1 import sha,resources,reasons
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
assert not git('diff','HEAD','--name-only') and not reasons(resources())
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert git('ls-files','--others','--exclude-standard').decode().splitlines()==[protected]
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited=previous['inherited_implementation_sha256']|previous['implementation_sha256']
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-v1.json.gz').read_bytes()))
assert len(pins)==2693 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==20
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
results={v:read(B/('construction-provenance-observation-baseline-v'+str(v))/'result-v1.json') for v in [2,3]}
assert all(row['passed'] for row in results.values())
assert len(results[2]['rows'])==8 and len(results[3]['rows'])==12
for v in [1,2,3]:
    protocol=read(B/('prepared-protocol-v'+str(v)+'.json'))
    assert protocol['revision']==BASE and protocol['source_pins_sha256']==sha(B/'source-pins-v1.json.gz')
    assert protocol['contract_sha256']==sha(B/'control/contract-v1.md')
    assert all(sha(p)==h for p,h in protocol['helpers_sha256'].items())
    assert protocol['probe_sha256']==sha(B/('probes/construction-provenance-observation-v'+str(v)+'.rs'))
assert protocol['outside_point_addendum_sha256']==sha(B/'control/outside-point-addendum-v1.md')
review=read(B/'observations-v1.json')
assert review['final_cases']==12 and review['outside_point_cases']==4 and review['original_eight_cases_preserved']
assert review['observation_result_sha256']==sha(B/'construction-provenance-observation-baseline-v3/result-v1.json')
assert all(sha(O/p)==row['sha256'] for p,row in review['source_review'].items())
for result in results.values():
    assert all(sha(row['stl'])==row['stl_sha256'] for row in result['rows'])
for manifest in (B/'frozen').glob('*/executables-v1.json'):
    assert all(sha(item['copy'])==item['sha256'] for item in read(manifest).values())
registry=json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
for folder in (B/'overlays').iterdir():
    assert read(folder/'closed-v1.json')['unmounted']
    lower=json.loads(gzip.decompress((folder/'lower-pins-v1.json.gz').read_bytes()))
    assert all(sha(p)==h for p,h in lower.items())
assert not os.path.ismount(B/'target')
commands={}
for folder in sorted((B/'logs').iterdir()):
    record=read(folder/'result.json')
    assert record['output_closed'] and not record['stops'],folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
assert len(commands)==24
failures={name:row['exit_code'] for name,row in commands.items() if row['exit_code']}
assert failures=={'construction-provenance-observation-baseline-v1-compile':1},failures
print('Verified twelve-case observation, preserved eight-case predecessor, unchanged production and prior commit.',flush=True)

prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1906995,921794)
roots=[B,PREV_F]
for pattern in ['*construction-provenance*.py','construction-provenance-*.rs']:
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
    name=str(path.relative_to(B)) if path.is_relative_to(B) else 'prior-final/'+str(path.relative_to(PREV_F)) if path.is_relative_to(PREV_F) else 'temporary/'+path.name
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
gzwrite(expectations,{'schema_version':3,'kind':'construction provenance current-revision observation','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(path):sha(path) for path in X.iterdir() if path.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
authorization=read(B/'control/storage-allowance-v1.json')
assert authorization['new_volume_net_allowance_bytes'] is None and authorization['old_disk_b_net_allowance_bytes'] is None
dump(E/'observations-v1.json',review)
dump(E/'command-summary-v1.json',{name:{'exit_code':row['exit_code'],'elapsed_seconds':row['elapsed_seconds'],'wall_limit_seconds':row['wall_limit_seconds'],'stops':row['stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/outside-point-addendum-v1.md','outside-point-addendum-v1.md'),(B/'next-change-contract-v1.md','next-change-contract-v1.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-v1.json.gz','source-pins-v1.json.gz'),(B/'probes/construction-provenance-observation-v3.rs','observation-v3.rs'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
(E/'README.md').write_text('''# E98: construction evidence can disappear between supported operations

Twelve current-revision pipelines reproduce the missing provenance boundary.
An approximate hull reports `Approximate512Consumed`; its extracted mesh then
passes strict transform, Boolean composition, binary STL export/import,
closed-PWN validation and further composition. Those later operations expose
local `Certified` receipts, with no surviving receipt for the original hull
claim. Exact and approximate histories produce identical STL bytes.

The tiny outside-point fixture demonstrates a real distinction in represented
sets: the intended hull includes an additional pyramid of volume
`2^-1200 / 3`, which the approximate output omits. A separate sign proof run
after the complete pipeline certifies the original point is outside. The
later topology certificates correctly describe the resulting geometry; they
do not certify that earlier construction intent. The fractional translation
also changes coordinates at the documented binary32 boundary.

The [observations](observations-v1.json) retain exact expectations, source
review, receipt sequences and qualifications. All eight original cases are
preserved in the expanded twelve-case run. The [probe](observation-v3.rs),
[contract](contract-v1.md), [outside-point addendum](outside-point-addendum-v1.md)
and [checkpoint](checkpoint-v1.json) bind the evidence to the target revision.
The [follow-up acceptance gate](next-change-contract-v1.md) requires separate
construction evidence through native, modeling, format and binding paths.

No production code is changed or admitted here. This investigation is not a
repair, release qualification, full provenance audit, or completion of the
properties plan. Historical missing artifacts remain unreaudited.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'construction_provenance_observation' not in current
current['updated_on']='2026-10-19'
current['construction_provenance_observation']={key:review[key] for key in ['classification','owner','decision','original_eight_cases_preserved','final_cases','approximate_source_cases','outside_point_cases','source_intent_counterexample','format_contract','validation_scope','limitations','next','production_implementation_changed','runtime_admitted','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user']}
current['construction_provenance_observation'].update(parent_revision=BASE,observations=prefix+'observations-v1.json',next_change_contract=prefix+'next-change-contract-v1.md',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),general_speedup_claimed=False)
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json','.rs'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
    if path.suffix=='.md':
        for link in re.findall(r'\]\(([^)]+)\)',path.read_text()):
            if '://' not in link and not link.startswith('#') and link!='checkpoint-v1.json':assert (path.parent/link.split('#')[0]).exists(),link
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['classification'],'checkpoint_kind':'construction provenance current-revision observation','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(path.relative_to(O)):sha(path) for path in E.rglob('*') if path.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{},'new_implementation_paths':[],'restored_native_sha256':previous['restored_native_sha256'],'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':False,'new_implementation_admission':False,'runtime_admitted':False,'production_implementation_changed':False,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':False,'current_revision_pipeline_observations_executed':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':20,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_quota_mode':'User authorized available artifact volume capacity; no retained-artifact quota.','disk_b_physical_free_guard_bytes':authorization['new_volume_physical_free_guard_bytes'],'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/path)==digest for path,digest in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_repair_admitted':False,'full_plan_complete':False}),flush=True)
