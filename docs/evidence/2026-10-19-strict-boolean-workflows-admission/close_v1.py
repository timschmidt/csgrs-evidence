"""Admit independent exact-set regression tests for ordinary strict workflows."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/strict-boolean-workflows-admission-20261019-v1')
A=B.parent/'strict-boolean-workflows-observation-20261019-v1'
PREV_F=B.parent/'known-angle-facts-admission-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-known-angle-facts-admission'
E=O/'docs/evidence/2026-10-19-strict-boolean-workflows-admission'
X=B/'external-evidence'
BASE='f00073d098a5bf4a718291147e7f50b1ab1781cd'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from strict_boolean_workflows_runner_v1 import sha,resources,reasons
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
new=paths-{'docs/admission.md'}
assert len(paths)==6 and len(new)==5 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v1.json.gz').read_bytes()))
baseline=json.loads(gzip.decompress((B/'source-pins-baseline-v1.json.gz').read_bytes()))
assert len(pins)==2693 and len(baseline)==2687 and all(sha(O/p)==h for p,h in pins.items())
assert all(pins[p]==h for p,h in baseline.items()) and set(pins)-set(baseline)==paths
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==24
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
focused=read(B/'focused-v1/result-v1.json');lint=read(B/'focused-clippy-v1/result-v1.json')
cargo=read(B/'strict-boolean-workflows-admission-cargo-v2/result-v1.json')
msrv=read(B/'strict-boolean-workflows-admission-msrv-v2/result-v1.json')
assert all(row['passed'] for row in [focused,lint,cargo,msrv])
assert focused['tests']==50 and cargo['total_passed']==129
assert read(B/'validation-sequence-result-v2.json')['passed']
matrix=read(B/'prepared-validation-matrix-v2.json')
assert matrix['contract_sha256']==sha(B/'control/contract-v1.md')
assert matrix['source_pins_sha256']==sha(B/'source-pins-candidate-v1.json.gz')
assert all(sha(p)==h for p,h in matrix['helpers_sha256'].items())
expected={'minimal-strict_boolean_workflows':50,'minimal-strict_drilled_workflows':5,'minimal-transform_failures':11,'minimal-empty_composition':10,'fields-svg-strict_boolean_workflows':50,'fields-svg-exact_linear_modeling':3}
assert set(cargo['summaries'])==set(expected)
assert all(cargo['summaries'][p]==[['ok',str(n),'0','0','0','0']] for p,n in expected.items())
workflow_audits={}
for label in ['minimal','fields-svg']:
    log=B/'logs'/('strict-boolean-workflows-admission-cargo-v2-'+label+'-strict_boolean_workflows')/'stdout'
    rows=re.findall(r'checked\t([^\n]+)',log.read_text())
    assert len(rows)==945 and sum(int(row.split('\t')[1]) for row in rows)==58800
    workflow_audits[label]={'certified_pairs':45,'outputs':945,'open_cells':58800,'wrong_set_controls':5,'ray_retry_controls':5,'stdout_sha256':sha(log)}
binding=read(B/'baseline-binding-v1.json');assert binding['revision']==BASE
for file,key in [('prepared-protocol-v3.json','observation_protocol_sha256'),('result-v3.json','observation_result_sha256'),('review-v1.json','observation_review_sha256'),('physical-files-v1.json.gz','observation_physical_manifest_sha256')]:
    assert sha(A/file)==binding[key]
assert sha(PREV_F/'commit-verification-v1.json')==binding['prior_commit_receipt_sha256']
observation=read(A/'result-v3.json')
assert observation['summary']['certified_completions']==45 and len(observation['controls'])==5
assert all(row['certified_completion'] and row['checked_outputs']==21 for row in observation['rows'])
assert read(A/'review-v1.json')['checked_open_grid_cells']==58800
assert all(sha(p)==h for p,h in json.loads(gzip.decompress((A/'physical-files-v1.json.gz').read_bytes())).items())
source_review=read(B/'source-review-v1.json')
assert source_review['candidate_source_pins_sha256']==sha(B/'source-pins-candidate-v1.json.gz')
assert not source_review['production_implementation_changed']
assert all(sha(p)==h for p,h in source_review['documents_local_links_sha256'].items())
for manifest in (B/'frozen').glob('*/executables-v1.json'):
    assert all(sha(item['copy'])==item['sha256'] for item in read(manifest).values())
assert sha(focused['binary'])==focused['binary_sha256']
registry=json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
for folder in (B/'overlays').iterdir():
    assert read(folder/'closed-v1.json')['unmounted']
    lower=json.loads(gzip.decompress((folder/'lower-pins-v1.json.gz').read_bytes()))
    assert all(sha(p)==h for p,h in lower.items())
assert not os.path.ismount(B/'target') and not os.path.ismount(B/'target-msrv')
commands={}
for root in [A,B]:
    for folder in sorted((root/'logs').iterdir()):
        record=read(folder/'result.json')
        assert record['output_closed'] and not record['stops'],folder
        assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
        assert folder.name not in commands;commands[folder.name]=record
failures={name:row['exit_code'] for name,row in commands.items() if row['exit_code']}
assert failures=={'strict-boolean-workflows-observation-v1-compile':1},failures
assert read(B/'validation-sequence-progress-v1.json')['/tmp/validate-strict-boolean-workflows-cargo-v1.py']['exit_code']==1
assert not read(B/'overlays/cargo-v1/closed-v1.json')['passed']
assert read(B/'driver-validation-failure-v1.json')['underlying_transform_tests_passed']==11
print('Verified final tests, unchanged production, all prepared checks, preserved failures and parent commit.',flush=True)

prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1904105,921794)
roots=[B,PREV_F,A]
for pattern in ['*strict-boolean-workflows*.py','strict-boolean-workflows-*.rs','install-strict-boolean-workflow-corpus-*.py']:
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
gzwrite(expectations,{'schema_version':3,'kind':'ordinary strict Boolean workflow test admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(path):sha(path) for path in X.iterdir() if path.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
authorization=read(B/'control/storage-allowance-v1.json')
assert authorization['new_volume_net_allowance_bytes'] is None and authorization['old_disk_b_net_allowance_bytes'] is None
review={
    'decision':'Retain the named ordinary strict workflow corpus and independent exact set oracle.',
    'owner':source_review['owner'],'properties':['P4','P8','P9','P11','P17','P18','P20','P21','P22','P24','P25','P35','P36','P37','P39'],
    'input_domain':'Nine rational box configurations under identity, shear/translation, reflection/nonuniform scale, exact root rotation and symbolic translation. All four regularized Boolean operations use STRICT.',
    'admitted_scope':'50 permanent named tests: 45 workflow pairs with 21 audited outputs each, and five control tests combining same-volume wrong-set rejection with a forced degenerate-ray retry. The catalog names this finite domain and existing drilled, transform, empty and extrusion gates.',
    'production_implementation_changed':False,'runtime_extension_claimed':False,'test_and_documentation_admitted':True,
    'proof_argument':source_review['proof_argument'],'contract_dimensions':source_review['claim_dimensions'],
    'baseline_result':{'already_supported_certified_pairs':45,'outputs':945,'open_cells':58800,'wrong_set_controls':5,'regression_gap':'No permanent named test had this independent exact represented-set oracle for all 45 pairs.'},
    'cargo_tests':cargo['summaries'],'cargo_total_passed':129,'focused_tests_passed':50,
    'workflow_audits':workflow_audits,
    'validation':'Workspace fmt and explicit helper-file rustfmt; Cargo target discovery; release builds and all selected tests in minimal and curve/sdf/metaballs/svg-io configurations; matching Cargo Clippy with -D warnings; Rust 1.95 checks of the new target in both configurations.',
    'compiler_floor':{'compiler':'1.95.0','new_test_target_checked':['no-default','curve,sdf,metaballs,svg-io'],'runtime_tests_on_floor_run':False},
    'resource_observations':{'binary_bytes':{k:v['bytes'] for k,v in cargo['artifacts'].items()},'focused_binary_bytes':focused['binary_bytes'],'scope':'Recorded compile and full-test wall times, raw samples and binary sizes characterize these checks. Dependencies were partly cached; no matched production performance, allocation or size claim follows from this tests/docs-only change.'},
    'failed_commands':failures,
    'additional_failed_attempts':[
        'Observation v1 did not compile because Rational::fraction requires a u64 denominator. Version 2 changes only the explicit integer type, retaining the exact value.',
        'Observation driver v2 failed its preflight because the v1 scratch directory existed. Version 3 uses unique scratch directories; the probe source is byte-identical to v2.',
        'Cargo validation v1 built all minimal targets and passed 11 transform tests, then its Python driver compared tuple results with a nested list. Version 2 corrects the result comparison and reruns the identical full matrix.',
        'Source-review helper v1 used whitespace-only comparison, rejecting rustfmt match-arm commas and block wrapping. Version 2 formats the original observation with repository configuration before comparing bodies. No candidate source changed.',
    ],
    'remaining_limitations':source_review['limitations']+[
        'End-to-end certainty provenance, full ordinary workload coverage, clean shipped distribution, foreign consumers and complete CI remain open.',
        'No push or release was performed. The whole pre-push validation matrix was not run for this scoped commit.',
        'Historical missing evidence was not reaudited or recovered.',
    ],
    'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,
    'artifact_volume':str(B.parent),'disk_b_allowance_gib':None,'disk_b_quota_mode':'User authorized available artifact volume capacity; no retained-artifact quota.',
    'disk_b_physical_free_guard_bytes':authorization['new_volume_physical_free_guard_bytes'],'tmp_allowance_gib':58,'logs_allowance_mib':200,
    'all_adverse_results_retained':True,'general_speedup_claimed':False,
    'next':'Continue ordinary workflow and certainty-provenance contracts, then the clean shipped user path and release gates. The finite corpus is retained acceptance evidence, not completion of properties.md.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{'exit_code':row['exit_code'],'elapsed_seconds':row['elapsed_seconds'],'wall_limit_seconds':row['wall_limit_seconds'],'stops':row['stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-candidate-v1.json.gz','source-pins-v1.json.gz'),(B/'source-review-v1.json','source-review-v1.json'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
patch=git('diff','--binary')
for path in sorted(new):
    added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False)
    assert added.returncode==1
    patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('''# E97: independent exact-set workflow acceptance

The new named corpus protects already-supported strict modeling behavior.
Nine box configurations and five affine frames exercise 45 workflows, each
with 21 independently audited outputs. An exact rational grid/ray oracle
checks represented-set equality, separately from native certified PWN
validation. Same-volume wrong-set controls and a forced ray retry run in
every frame. Production algorithms and APIs are unchanged.

The [review](review-v1.json) records the finite domain, proof argument,
checks, resource observations and limitations. All 129 selected Cargo test
results pass across two feature configurations, including 50 new tests in
each; these are overlapping configurations, not 129 distinct new tests.
Formatting, matching strict Clippy and Rust 1.95 target checks also pass.
The [contract](contract-v1.md) predates editing and the
[checkpoint](checkpoint-v1.json) pins the source and retained evidence.

This strengthens acceptance evidence; it does not expand the runtime domain,
prove manifoldness for touching/XOR outputs, certify analytic fidelity or
earlier approximate intent, or complete the shipped-user-path and broader
properties plan. Failed observation and harness attempts are preserved.
Historical missing artifacts were not reaudited or recovered.
''')

prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'strict_boolean_workflow_corpus' not in current
current['updated_on']='2026-10-19'
current['strict_boolean_workflow_corpus']={key:review[key] for key in ['decision','admitted_scope','production_implementation_changed','runtime_extension_claimed','test_and_documentation_admitted','baseline_result','cargo_tests','cargo_total_passed','focused_tests_passed','workflow_audits','validation','compiler_floor','resource_observations','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['strict_boolean_workflow_corpus'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=False,general_speedup_claimed=False)
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'ordinary strict Boolean workflow test admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(path.relative_to(O)):sha(path) for path in E.rglob('*') if path.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':False,'production_implementation_changed':False,'test_and_documentation_admitted':True,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':24,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_quota_mode':review['disk_b_quota_mode'],'disk_b_physical_free_guard_bytes':review['disk_b_physical_free_guard_bytes'],'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/path)==digest for path,digest in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'tests_and_docs_admitted':True,'full_plan_complete':False}),flush=True)
