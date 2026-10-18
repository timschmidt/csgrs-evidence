"""Close isolated subtraction qualification; production admission remains pending."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'explicit-affine-control-v1'
P=O/'docs/evidence/2026-10-18-native-affine-investigation'
E=O/'docs/evidence/2026-10-18-explicit-affine-subtraction'
BASE='eae42f7c336f5de0d0ec3455a338a37a0617a108'
sys.path.insert(0,str(N/'sign-cache-publication-control-v1'))
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from validation_runner_v4_local import resources,reasons,sha
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*a):return subprocess.check_output(GIT+list(a),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,v):
    assert not Path(p).exists(),p
    Path(p).write_text(json.dumps(v,indent=2,sort_keys=True)+'\n')
def gzwrite(p,v):
    assert not Path(p).exists(),p
    Path(p).write_bytes(gzip.compress((json.dumps(v,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    s=re.search(rb'"current_work"\s*:\s*',raw).end()
    v,n=json.JSONDecoder().raw_decode(raw[s:].decode())
    return s,s+len(raw[s:].decode()[:n].encode()),v
assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','HEAD','--name-only') and not git('diff','--cached','--name-only')
assert not reasons(resources())
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
pinsfile=N/'sign-cache-publication-control-v1/main-source-pins-v3.json.gz'
pins=json.loads(gzip.decompress(pinsfile.read_bytes()))
assert len(pins)==2654 and all(sha(O/p)==h for p,h in pins.items())
assert all(sha(O/p)==h for p,h in live.items())
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
baseline=read(N/'explicit-affine-baseline-v1/result-v1.json')
candidate=read(N/'explicit-affine-candidate-v1/result-v1.json')
replay=read(N/'explicit-affine-replay-v1/result-v1.json')
analysis=read(W/'replay-analysis-v1.json')
units=read(N/'explicit-affine-units-v1/result-v1.json')
integration=read(N/'explicit-affine-integrations-v3/result-v1.json')
assert baseline['summary']==[['FAILED','2','4','0','0','849']]
assert candidate['summary']==[['ok','6','0','0','0','849']]
assert 'test result: FAILED. 851 passed; 4 failed; 0 ignored' in (N/'logs/explicit-affine-baseline-complete-unit-suite-v1/stdout').read_text()
assert 'test result: ok. 855 passed; 0 failed; 0 ignored' in (N/'logs/explicit-affine-candidate-complete-unit-suite-v1/stdout').read_text()
assert replay['passed'] and units['passed'] and integration['passed']
assert analysis['allocation_rows_identical'] and analysis['native_comparison_results_identical']
assert analysis['reduced_quadratic_projection_pairs']==8 and len(analysis['allocation_comparisons'])==100
assert len(integration['summaries'])==23 and integration['all_top_level_test_files_run']
prior_commit=read(N/'native-affine-final-commit-verification-v1.json')
assert prior_commit['commit']==BASE and prior_commit['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in prior_commit['verified_committed_blobs_sha256'].items())
folders=sorted(p for p in (N/'logs').iterdir() if p.name.startswith('explicit-affine-'))
commands={}
for folder in folders:
    r=read(folder/'result.json')
    assert r['output_closed'] and not r['stops']
    assert all(sha(folder/p)==h for p,h in r['output_sha256'].items())
    commands[folder.name]=r
adverse={k for k,v in commands.items() if v['exit_code']}
assert adverse=={'explicit-affine-baseline-tests-v1','explicit-affine-baseline-complete-unit-suite-v1'},adverse
assert not E.exists();E.mkdir()
review={
    'decision':'retain the isolated explicit-subtraction candidate for further qualification; no production admission',
    'source_revision':BASE,
    'owners':{'identity':'Hyperreal Computable affine recognizer','public_operation':'Real subtraction; equality and ordering consume its result','consumer':'Hypercurve native offsets and stroke composition'},
    'properties':['P1','P2','P3','P4','P5','P7','P8','P9','P17','P18','P19','P20','P35','P36','P37','P39'],
    'input_domain':'Rational affine offsets with structurally matching symbolic terms, recognized within the existing per-operand traversal and scale limits.',
    'representation_change':'Explicit subtraction can now return the exact rational carrier. This expands structural facts; it is not characterized as a performance-only change. Serialization and report compatibility still require final qualification.',
    'baseline':{'original_scalar_unit_tests_passed':849,'new_acceptance_passed':2,'new_acceptance_failed':4,'complete_passed':851,'complete_failed':4},
    'candidate':{'new_acceptance_passed':6,'original_scalar_unit_tests_passed':849,'complete_passed':855,'complete_failed':0,'ordinary_addition_preservation_regression_passed':True},
    'wider_units':units['summaries'],
    'scalar_integration':{'top_level_files':23,'parent_tests_passed':integration['parent_test_total'],'parent_ignored':integration['parent_ignored'],'all_original_files_run':True,'direct_compiler_all_features':True},
    'matched_native_controls':{k:v for k,v in replay['summaries'].items() if not k.endswith('rows')},
    'matched_probe':{'native_pairs':24,'common_factor_controls':3,'result_rows_per_variant':81,'mathematical_results_identical':True,'reduced_quadratic_projection_pairs':8,'reduction':'Eight repeated parallel-coordinate comparisons each go from eight named quadratic recognitions to zero.'},
    'allocation':{'alternating_pairs':5,'representations':20,'iterations_per_representation':64,'comparison_rows':100,'all_rows_identical':True,'limitations':'Rust allocation requests and payload only; no RSS or allocator-overhead bound.'},
    'limits':{'root_gib':16,'disk_b_gib':72,'tmp_gib':12,'cumulative_logs_mib':96,'child_address_space_gib':8,'compile_or_full_suite_seconds':1800,'focused_seconds':60,'maximum_concurrent_validation_children':2,'storage_baselines_reset':False},
    'resource_scope':'The recognizer retains eight visits per operand, 4096-bit shifts and 4097-bit individual scales. Structural comparison, aggregate coefficient growth and total heap use are not globally bounded. External containment remains required.',
    'setup_failure':'The first integration launch asserted 24 top-level files instead of 23 and stopped before any compilation or test. The corrected complete inventory independently matches prior qualified Cargo targets. Failed helper and empty output directories are preserved.',
    'concurrency':'Scalar integration qualification and the independent long curve unit suite overlapped within two jobs. Allocation pairs completed before that overlap. No timing performance claim uses the concurrent qualification.',
    'unchanged_failures':'E75 native stroke and aggregation failures remain open. Neither exact importer nor either rejected constructor-wide prototype was applied. The unrelated different-radical zero-refinement failure remains preserved.',
    'not_completed':['Full Cargo feature and target qualification','Candidate Clippy, documentation and minimum-compiler checks','Six-consumer complete matrix and original full native workload gates','Report and serialization migration/compatibility review','Final formatting and actual-main integration','External distribution/release validation'],
    'next':'Complete the explicit representation-change review and remaining Cargo/downstream/resource gates before applying the candidate to main. Preserve all earlier failures, unchanged original fixtures and limits.',
    'production_source_changed':False,'new_runtime_admitted':False,'explicit_subtraction_candidate_admitted':False,
    'constructor_candidates_still_rejected':True,'sign_cache_correction_retained':True,
    'all_adverse_results_retained':True,'performance_speedup_claimed':False,
    'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
}
dump(E/'review-v1.json',review)
dump(E/'command-results-v1.json',commands)
shutil.copy2(W/'replay-analysis-v1.json',E/'replay-analysis-v1.json')
for name in ['contract-v1.md','replay-contract-v1.md','unit-contract-v1.md','scalar-integration-contract-v3.md','algebra_explicit_v1.patch','add_sub_explicit_v1.patch','explicit_affine_tests_v1.rs']:
    shutil.copy2(W/name,E/name)
shutil.copy2(Path(__file__),E/'close_v1.py')
(E/'README.md').write_text("""# Explicit affine subtraction qualification

The isolated candidate reuses Hyperreal's affine recognizer at explicit Real
subtraction. Matching symbolic terms leave an exact rational offset difference.
Ordinary addition retains its existing shared-operand and cache behavior.
The previous constructor-wide candidates remain rejected.

On unchanged production code, four of six new public acceptance tests fail;
all 849 original scalar units pass. The isolated candidate passes all six
new tests and the original units. The tests include signed rational scales,
operand reversal, bare shared bases, cold/warm operands, unequal symbolic
terms, oversized-scale decline and 512 successive differences.

Wider direct-compiler unit and scalar integration results are recorded in
review-v1.json. All 23 original top-level scalar integration files run, including
CLI consumers and independent numerical oracles. The unchanged native stroke,
stroke-composition and point-equality controls pass on both matched builds.
All 81 comparison result rows agree. Eight parallel-coordinate cases avoid
the repeated quadratic recognition observed on the baseline.

Five alternating allocation pairs preserve all 100 original lifecycle rows.
This is requested Rust allocation payload and named proof-work evidence, not
a wall-clock speedup or a global memory bound. Concurrent later unit/integration
qualification is not used for timing claims.

The first integration setup miscounted 23 files as 24 and stopped before any
compiler or test ran. Its failed helper and empty directories are preserved.
The corrected inventory matches the prior qualified Cargo targets.

Production source remains unchanged. This candidate is retained for further
qualification, not admitted. Exact rational output is an intentional
representation improvement that still requires report/serialization review,
Cargo and downstream gates, and validation after actual-main integration.
The exact importer and full native completion remain open.

All original resource baselines and limits remain in force. Compiled artifacts
are physically retained with independent hashes; source, commands and raw logs
are archived. Temporary storage remains volatile. Historical missing artifacts
were not reaudited or recovered. Hypervoxel remains outside scope, and neither
release readiness nor the full properties plan is complete.
""")
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1446996,921794)
roots=sorted(p for p in N.iterdir() if p.name.startswith('explicit-affine-') or p.name.startswith('native-affine-final-'))
for name in ['logs','scratch']:
    roots.extend(sorted(p for p in (N/name).iterdir() if p.name.startswith('explicit-affine-')))
roots.extend(sorted(Path('/tmp').glob('csgrs-explicit-affine-*')))
roots.extend(sorted(Path('/tmp').glob('prepare-explicit-affine-*.py')))
roots.extend([Path('/tmp/analyze-explicit-affine-replay-v1.py'),Path(__file__)])
selected=[]
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()))
assert len(selected)==len(set(selected))
physical={};members={};excluded={};stats={}
for p in selected:
    assert p.is_file() and not p.is_symlink(),p
    before=p.stat();h=sha(p);after=p.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert str(p) not in prior,p
    physical[str(p)]=h;stats[str(p)]=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    name=str(p.relative_to(N)) if p.is_relative_to(N) else 'temporary/'+str(p.relative_to('/tmp'))
    with p.open('rb') as f:magic=f.read(8)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    row={'physical_path':str(p),'sha256':h,'bytes':after.st_size}
    (excluded if compiled else members)[name]=row
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_compiled_artifacts_physically_preserved':excluded,'every_physical_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'explicit subtraction isolated qualification; no production admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
s,e,current=span(raw);rs,re_,_=span(reference)
assert (raw[:s],raw[e:])==(reference[:rs],reference[re_:])
assert 'explicit_affine_subtraction' not in current
current['explicit_affine_subtraction']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','baseline_acceptance_failures':4,'candidate_acceptance_passed':6,'original_scalar_units_preserved':849,'wider_units':units['summaries'],'scalar_integration_files':23,'scalar_integration_parent_tests':integration['parent_test_total'],'matched_native_result_rows':81,'allocation_rows_identical':100,'native_parallel_pairs_with_less_proof_work':8,'source_changes_applied':False,'runtime_admitted':False,'original_constructor_candidates_rejected':True,'all_adverse_results_retained':True,'performance_speedup_claimed':False,'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':12,'hypervoxel_deferred_by_user':True,'full_plan_complete':False,'public_distribution_complete':False,'next':review['next']}
updated=raw[:s]+json.dumps(current,indent=2).encode()+raw[e:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in {'.md','.py','.json','.rs'}:
        t=p.read_text();assert all(line==line.rstrip() for line in t.splitlines()) and not t.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(t)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    check=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert check.returncode==0
record=dict(previous)
record.update({'status':review['decision'],'checkpoint_kind':'explicit affine subtraction isolated qualification','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':0,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{},'source_changes_applied':False,'production_rust_sources_unchanged':True,'production_prefixes_unchanged':True,'all_other_source_inputs_unchanged':True,'new_implementation_admission':False,'runtime_admitted':False,'runtime_admitted_scope':'No new production admission; isolated explicit subtraction candidate remains under qualification','explicit_subtraction_candidate_admitted':False,'constructor_candidate_admitted':False,'qualification_this_checkpoint':review,'main_qualification_this_checkpoint':{'direct_existing_scalar_units_passed':849,'matched_native_controls_passed':13,'note':'All production source remains identical to E74; candidate checks use read-only overlays.'},'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'format_rerun':False,'runtime_tests_rerun':True,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'exact_ingress_admitted':False,'final_source_parent_revision':BASE,'source_commit':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'performance_speedup_claimed':False})
dump(E/'checkpoint-v1.json',record)
for path,expected_stat in stats.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==expected_stat,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in live.items())
assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'production_source_changed':False,'runtime_admitted':False,'full_plan_complete':False}),flush=True)
