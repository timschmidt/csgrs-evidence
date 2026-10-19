"""Admit retained integral atan facts only after all final-source checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/integral-atan-facts-admission-20261019-v1')
PREV_B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/acos-complement-admission-20261019-v1')
PREV_F=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/acos-complement-admission-final-20261019-v1')
A=B.parent/'integral-atan-facts-observation-20261019-v1'
L=B.parent/'integral-atan-facts-legacy-20261019-v1'
P=O/'docs/evidence/2026-10-19-acos-complement-admission'
E=O/'docs/evidence/2026-10-19-integral-atan-facts-admission'
X=B/'external-evidence'
BASE='d5b16c26471768ff53a59fbce8285e288c447e2f'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from importlib import import_module
runner=import_module('integral_atan_facts_runner_v1')
sha,resources,reasons=runner.sha,runner.resources,runner.reasons
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,x):
    assert not p.exists(),p
    p.write_text(json.dumps(x,indent=2,sort_keys=True)+'\n')
def gzwrite(p,x):
    assert not p.exists(),p
    p.write_bytes(gzip.compress((json.dumps(x,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    a=re.search(rb'"current_work"\s*:\s*',raw).end()
    x,n=json.JSONDecoder().raw_decode(raw[a:].decode())
    return a,a+len(raw[a:].decode()[:n].encode()),x
def result(phase):return read(B/('integral-atan-facts-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v2.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_integral_atan_facts.rs','crates/hyperreal/src/computable/node/integral_atan_facts_tests.rs','crates/hyperreal/tests/fixtures/integral_atan_legacy_trig.json'}
assert len(paths)==8 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v2.json.gz').read_bytes()))
assert len(pins)==2683 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==20
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v2','consumers-v2','modeling-v2','msrv-v2']]
cost=read(B/'ordinary-cost-v1/result-v1.json')
native_cost=read(B/'native-cost-v1/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost,native_cost])
matrix=read(B/'prepared-validation-matrix-v3.json')
plan=read(B/'planned-cost-matrix-v2.json')
assert matrix['active_contract_sha256']==plan['active_contract_sha256']==sha(B/'control/contract-v1.md')
correction=read(B/'msrv-pre-run-binding-correction-v3.json')
assert sha(correction['preserved_pre_run_helper'])==correction['previous_sha256']
assert sha(correction['unexecuted_helper'])==correction['corrected_sha256']
assert all(sha(p)==h for p,h in matrix['helper_sha256'].items())
assert matrix['source_pins_sha256']==sha(B/'source-pins-candidate-v2.json.gz')
assert all(sha(p)==h for p,h in plan['source_and_driver_sha256'].items())
assert plan['native']['rows']==96
assert matrix['composition_addendum_sha256']==plan['composition_addendum_sha256']==sha(B/'control/composition-addendum-v2.md')
final_gates=read(B/'final-validation-gates-v1.json')
assert final_gates['passed'] and all(sha(p)==h for p,h in final_gates['results_sha256'].items())
assert scalar['packages']['default']['parent_tests_passed']==959
assert scalar['packages']['all']['parent_tests_passed']==1128
assert scalar['summaries']['debug-library']==[['ok','837','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==75
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
unit_output=''.join(p.read_text() for p in (B/'logs').glob('integral-atan-facts-admission-scalar-v2-all-test-*-hyperreal/stdout'))
for test in ['integral_atan_readers_retain_exact_argument_and_family','integral_atan_facts_compose_through_trig_and_arithmetic','integral_atan_facts_survive_concurrent_reuse']:
    assert test+' ... ok' in unit_output,test
binding=read(B/'baseline-binding-v1.json')
assert binding['commit']==BASE and binding['already_certified_cases']==20 and binding['imported_undecided_cases']==48
assert sha(A/'protocol-v1.json')==binding['reproduction_protocol_sha256']
assert sha(A/'result-v1.json')==binding['reproduction_result_sha256']
assert sha(A/'review-v1.json')==binding['reproduction_review_sha256']
observation=read(A/'result-v1.json')
assert len(observation['rows'])==72 and not observation['contradictions'] and len(observation['both_identities_certified'])==20 and len(observation['undecided_identity_cases'])==52
assert all(r['exit_code']==0 and not r['stops'] for r in observation['commands'].values())
focused=read(B/'focused-v2/result-v1.json');assert focused['passed']
assert focused['commands']['parent-invalid']['exit_code']==101
assert len(focused['original_fresh_process_cases'])==72 and focused['both_identities_certified']==68
assert all('contradicted=false' in row and 'contradicted=true' not in row for row in focused['original_fresh_process_cases'].values())
for name,count in [('serde_integral_atan_facts',2),('serde_acos_complement_ranges',2),('serde_integral_atan_ranges',2),('serde_atanh_rational_ranges',2),('serde_atan_ranges',2),('serde_log_rational_ranges',2),('serde_asinh_ranges',2),('serde_symbolic_domains',3),('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',6),('serde_named_certificates',5)]:
    assert f'test result: ok. {count} passed' in focused['summaries'][name]
assert len(focused['composition_diagnostic'].splitlines())==120 and all('sign=Some(Zero)' in line for line in focused['composition_diagnostic'].splitlines())
legacy=read(L/'result-v1.json')
assert legacy['passed'] and legacy['rows']==24 and legacy['enclosure_checks']==72
assert sha(L/'legacy-trig-v1.json')==binding['legacy_fixture_sha256']==sha(O/'crates/hyperreal/tests/fixtures/integral_atan_legacy_trig.json')
assert sha(L/'result-v1.json')==binding['legacy_result_sha256']
for root,key in [(A,'reproduction_physical_manifest_sha256'),(L,'legacy_physical_manifest_sha256')]:
    assert sha(root/'physical-files-v1.json.gz')==binding[key]
    physical_manifest=json.loads(gzip.decompress((root/'physical-files-v1.json.gz').read_bytes()))
    assert all(sha(p)==h for p,h in physical_manifest.items())
for manifest in (B/'frozen').glob('*/executables-v1.json'):
    assert all(sha(item['copy'])==item['sha256'] for item in read(manifest).values())
registry=json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
for folder in (B/'overlays').iterdir():
    record=read(folder/'closed-v1.json')
    assert record['unmounted']
    lower=json.loads(gzip.decompress((folder/'lower-pins-v1.json.gz').read_bytes()))
    assert all(sha(p)==h for p,h in lower.items())
assert not os.path.ismount(B/'target') and not os.path.ismount(B/'target-msrv')
commands={};prelaunch=[]
for folder in sorted((B/'logs').iterdir()):
    if not (folder/'result.json').exists():
        raise AssertionError(('unclosed command',str(folder)))
    record=read(folder/'result.json')
    assert record['output_closed'],folder
    assert not record['stops'],folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
assert failures=={'integral-atan-facts-focused-v1-parent-invalid':101,'integral-atan-facts-focused-v2-parent-invalid':101,'integral-atan-facts-admission-scalar-v1-default-test-38-hyperreal':101,'integral-atan-facts-composition-diagnostic-v1-parent-compile':1},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1877441,921794)
roots=[B,PREV_F,A,L]
for pattern in ['prepare-integral-atan-facts-*.py','run-integral-atan-facts-*.py','integral-atan-facts-*.rs','integral_atan_facts_*.py','interpret-integral-atan-facts-*.py','record-integral-atan-facts-*.py','close-integral-atan-facts-*.py','stage-integral-atan-facts-*.py','verify-integral-atan-facts-*.py','review-integral-atan-facts-*.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
selected=[]
for root in sorted(set(roots)):
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (not p.is_dir() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected)==len(set(selected))
physical={};states={};members={};excluded={};special={};already_expected={}
for p in selected:
    before=p.lstat()
    if not stat.S_ISREG(before.st_mode):
        assert stat.S_ISCHR(before.st_mode) and before.st_rdev==0,p
        special[str(p)]={'kind':'overlay_whiteout','mode':stat.S_IMODE(before.st_mode),'rdev':0};continue
    assert not p.is_symlink(),p
    h=sha(p);after=p.stat();state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns)
    if str(p) in prior:
        assert prior[str(p)]==h,p
        already_expected[str(p)]=h
        continue
    physical[str(p)]=h;states[str(p)]=state
    if len(physical)%5000==0:
        assert not reasons(resources());print(json.dumps({'new_paths_rehashed':len(physical)}),flush=True)
    with p.open('rb') as stream:magic=stream.read(8)
    generated=p.is_relative_to(B) and any(part.startswith(('overlay-upper','overlay-work','target','cargo-home','gmp-cache','xdg-cache')) for part in p.relative_to(B).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    source_archive=p.name=='source-baseline-v1.tar.gz'
    name=str(p.relative_to(B)) if p.is_relative_to(B) else 'prior-final/'+str(p.relative_to(PREV_F)) if p.is_relative_to(PREV_F) else 'observation/'+str(p.relative_to(A)) if p.is_relative_to(A) else 'legacy/'+str(p.relative_to(L)) if p.is_relative_to(L) else 'temporary/'+p.name
    assert name not in members and name not in excluded,name
    row={'physical_path':str(p),'sha256':h,'bytes':after.st_size}
    if generated or compiled or source_archive:
        row['archive_exclusion_reason']='Generated Cargo output or compiled binary/library' if not source_archive else 'Baseline source archive retained separately'
        excluded[name]=row
    else:members[name]=row
assert not X.exists();X.mkdir()
archive=X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz',dereference=True) as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(X/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'nonregular_overlay_entries':special,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
expectations=X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'retained integral atan facts admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})

assert native_cost['all_completed_output_assertions_passed'] and len(native_cost['samples']['parent-0'])==96
approval=B/'control/storage-allowance-v1.json'
authorization=read(approval)
assert authorization['user_instruction']=='Use /run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/'
assert authorization['new_volume_net_allowance_bytes'] is None and authorization['old_disk_b_net_allowance_bytes'] is None
allowance=None
storage_mode='User authorized available artifact volume capacity; no retained-artifact quota.'
physical_guard=authorization['new_volume_physical_free_guard_bytes']
def measured(record):
    metrics=['allocations','allocated_bytes','retained_bytes','peak_extra_bytes']
    deltas=[{name:{m:record['samples']['candidate-'+str(i)][name][m]-record['samples']['parent-'+str(i)][name][m] for m in metrics} for name in record['samples']['parent-0']} for i in range(5)]
    return {
        'candidate_over_parent_median_latency':record['candidate_over_parent_median_latency'],
        'binary_bytes':{k:v['bytes'] for k,v in record['binaries'].items()},
        'allocation_deltas_first_pair':deltas[0],
        'allocation_deltas_stable_across_all_five_pairs':all(d==deltas[0] for d in deltas),
        'all_allocation_and_byte_metrics_identical':all(v==0 for d in deltas for row in d.values() for v in row.values()),
        'completed_output_assertions_passed':True,
        'all_five_alternating_pairs_retained':True,
        'general_speedup_claimed':False,
    }
ordinary_ratios=cost['candidate_over_parent_median_latency']
native_ratios=native_cost['candidate_over_parent_median_latency']
review={
 'decision':'Retain shared recovery of exact arguments from IntegralAtan nodes, with explicit derived-representation migration and all measured costs disclosed.',
 'owner':'Hyperreal native inverse-trig argument readers and construction metadata; native and Real consumers reuse the shared readers.',
 'properties':['P2','P3','P4','P18','P19','P26','P27','P35','P36','P37','P39'],
 'input_domain':'IntegralAtan(n), n a nonzero integer, denotes principal atan(1/n). Signed unit, ordinary and 512-bit-power denominators are exercised. The existing accepted serialization domain and typed rejection of denominator zero are preserved. This does not establish arbitrary expression domains or all precision values.',
 'admitted_scope':'Recover the exact rational reciprocal through native Rational inversion; delegate the Computable argument reader to the same implementation and include IntegralAtan in inverse-trig construction metadata. Existing sine, cosine, cotangent, pi/atan composition and arithmetic machinery can then reuse the retained fact without refining the angle. The shared signed half-pi reader preserves its existing sign restriction while a general internal reader feeds the native algebraic sine/cosine pair with the exact orientation and swap. Source IntegralAtan graphs are not rewritten.',
 'proof_argument':'For nonzero integer n, the representation defines theta=atan(1/n) in (-pi/2,pi/2), so its exact argument is the signed rational 1/n. Native Rational inversion preserves that value and rejects zero. Existing consumers use this same principal-branch argument. Independently, tan(theta)=1/n and sin^2+cos^2=1 imply sin^2=1/(n^2+1), cos^2=n^2/(n^2+1), cos>0 and sign(sin)=sign(n). Pi shifts and half-pi complements follow the ordinary trigonometric identities. For s in {-1,+1}, sin(s*pi/2-atan(a))=s/sqrt(1+a^2) and cos(s*pi/2-atan(a))=s*a/sqrt(1+a^2); native composition swaps the same pair and applies s. The family metadata enables existing proof search; it is not itself a new value or sign certificate. This is a local mathematical argument, not formal verification of every consumer.',
 'contract_dimensions':{'numerical_certainty':'Independent rational identities and directed MPFR square-root enclosures establish the tested facts and value bounds.','topological_validity':'These scalar facts do not establish mesh or curve topology. Downstream tests retain their separate obligations.','geometric_fidelity':'No analytic surface or quantization claim is added. The original symbolic source graphs remain authoritative.'},
 'interchange_migration':{'intentional_representation_change':True,'description':'Newly derived sin/cos/cot results may use existing algebraic carriers and wire forms instead of opaque trig graphs. This accompanies stronger evidence, not a performance-only change. No format tag is added. Original input graphs retain their wire representation.','legacy_fixture_parent':BASE,'legacy_fixture_sha256':binding['legacy_fixture_sha256'],'prior_derived_outputs':24,'prior_json_and_actual_cbor_checked':True,'baseline_legacy_enclosure_checks':72,'candidate_legacy_enclosure_checks':144,'legacy_precision_sequence':[0,-128,0],'new_derived_facts_survive_json_and_cbor':True,'deterministic_serialization_checked':True},
 'source_review':'Production changes recover the stored reciprocal argument, mark the inverse-trig family, share the half-pi argument reader while preserving the signed helper contract, and extend the native sin/cos composition helper to apply the exact half-pi rotation. Rustfmt also normalizes existing layout in the touched exp_trig module. Tests and documentation describe the expanded capability and representation migration.',
 'acceptance':{
    'baseline_fresh_process_cases':72,'baseline_completed_cases':72,'baseline_both_identities_certified':20,'baseline_imported_undecided_cases':48,'baseline_separate_public_native_quarter_pi_undecided_cases':4,'baseline_contradictions':0,
    'candidate_fresh_process_cases':72,'candidate_both_identities_certified':68,'candidate_imported_both_identities_certified':48,'candidate_separate_public_native_quarter_pi_undecided_cases':4,'candidate_contradictions':0,'original_certified_cases_preserved':20,
    'case_groups':focused['groups'],'original_histories':['cold','angle refined at -128'],'identity_query_precision':0,
    'formats':['native JSON','native CBOR','Real JSON','Real CBOR','owned CBOR Value','borrowed CBOR Value','JSON and CBOR collections'],'outer_real_scales':[0,1,-1,2],
    'denominators':['-1','1','-2','2','-5','5','-239','239','-2^512','2^512'],
    'composition':['sine/cosine signs and squares','pi plus angle','half pi minus angle','atan monotonicity via following subtraction','cotangent and following subtraction','doubled-angle rational sine/cosine enclosure'],
    'concurrent_threads':16,'concurrent_squared_identity_checks':32,'post_concurrency_squared_identity_checks':8,
    'diagnostic_squared_identity_queries':120,'diagnostic_parent_unknown':120,'diagnostic_first_candidate_unknown':4,'diagnostic_final_candidate_certified':120,'both_signed_half_pi_orientations_checked':True,'direct_focused_tests':36,'new_unit_tests':3,'new_integration_tests':2,'parent_focused_regression_fails':True,'invalid_zero_denominator_preserves_typed_failure':True,'raw_zero_argument_readers_decline':True,'cold_construction_and_proofs_leave_angle_unrefined':True,
    'original_192000_bit_and_previous_kernel_tests_preserved':True,
 },
 'scalar_cargo':scalar['packages'],'debug_units_passed':837,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'ordinary_cost':measured(cost),'native_integral_atan_facts_cost':measured(native_cost),
 'cost_scope':'Unchanged ordinary 17 rows, 100000 iterations and five alternating pairs. Native sin/cos of atan(1/n): n=1,2, public/imported Computable and Real, p=0/-32/-128, cold construction/evaluation and warm evaluation, 96 rows, 10000 iterations and five alternating pairs. Every measured value encloses independent directed MPFR square-root bounds. Process/oracle setup is excluded consistently; flags and dependencies match the verified parent. Exact identity completion is separately reported: an old Unknown is never counted as a successful exact proof. All adverse samples are retained.',
 'cost_interpretation':read(B/'cost-interpretation-v1.json'),'cost_retention':read(B/'cost-retention-decision-v1.json'),
 'failed_attempts':failures,
 'attempt_notes':['The first acceptance-record helper stopped before any ledger or evidence-directory write because its unit-test assertion retained stale names from the prior patch. Version 2 names the three actual E95 tests, all present in the passing final-source unit log. The failed helper and correction receipt are preserved; production code and validation results did not change.','Before the compiler-floor phase ran, a generated helper logical-target path was corrected from target-msrv-v2 back to the inherited target-msrv-v1. The unexecuted previous helper, correction receipt and both preparation matrices remain preserved; workloads, physical isolation and limits did not change.','The first full scalar attempt found one failure: half-pi composition of atan(-1) remained Unknown. Its source and all outputs were preserved. The independent 120-query diagnostic found four such candidate facts and 120 parent Unknowns. A shared half-pi reader and native algebraic rotation resolve all 120 without weakening the original test; both orientations were added.','The first external diagnostic did not compile because it called a private shift helper. Version 2 uses public multiplication by exact one-half; the failed source and compiler diagnostic remain preserved.','The new exact-identity regression fails against the unchanged parent and passes against the candidate. All 72 original observation cases, including four separately unresolved public native quarter-pi cases, are preserved.','The legacy fixture was captured and independently checked against the parent before production edits; its bytes are copied unchanged into the regression corpus.'],
 'remaining_limitations':['Four public native quarter-pi cases remain undecided; the imported IntegralAtan extension does not fix or conceal this separate representation gap.','General expression domains, full-width precision and typed native evaluation/cancellation remain open. The isolated fallible-evaluation prototype remains unadmitted.','External containment does not establish internal total-work, heap, expression-growth or cancellation bounds. Exact rational reciprocals and derived algebraic carriers may require additional work and allocations.','Finite and concurrent tests do not establish exhaustive correctness, formal verification, coverage targets or every thread schedule.','The complete useful-workflow corpus, clean shipped distribution, real foreign consumers and full CI/DRC gates remain open.','Historical missing evidence was neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'artifact_volume':str(B.parent),'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,
 'next':'Continue scalar domain/evidence ownership and ordinary strict completion, including the separately reproduced public native quarter-pi gap; then complete shipped-user-path and release validation.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{'exit_code':r['exit_code'],'elapsed_seconds':r['elapsed_seconds'],'wall_limit_seconds':r['wall_limit_seconds'],'stops':r['stops']} for k,r in commands.items()})
shutil.copy2(B/'control/contract-v1.md',E/'contract-v1.md')
shutil.copy2(B/'control/composition-addendum-v2.md',E/'composition-addendum-v2.md')
shutil.copy2(approval,E/'storage-allowance-v1.json')
shutil.copy2(B/'source-pins-candidate-v2.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(__file__,E/'close_v2.py')
patch=git('diff','--binary')
for path in sorted(new):
    added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False)
    assert added.returncode==1
    patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text("""# E95: retained integral arctangent facts

Imported `IntegralAtan(n)` nodes now expose their exact `atan(1/n)` argument
to shared sine, cosine, cotangent and arithmetic consumers. The unchanged
72-case replay certifies both squared identities in 68 cases, up from 20.
All 48 imported cases are resolved. Four public native quarter-pi cases remain
undecided and are preserved separately.

The [review](review-v1.json) records the independent identities, legacy graph
compatibility, local/downstream checks, full cost samples and limitations.
The [contract](contract-v1.md) predates the implementation. Its
[composition addendum](composition-addendum-v2.md) records the preserved
first-attempt failure and the shared half-pi repair. Newly derived
algebraic outputs can use different existing wire representations; retained
input graphs and prior derived JSON/CBOR outputs remain supported. This
representation migration accompanies stronger proofs, not a performance-only
claim. The [checkpoint](checkpoint-v1.json) pins implementation and evidence.

General domains, fallible native evaluation/cancellation, internal resource
bounds, complete shipped-user-path validation and the full properties plan
remain open. Historical missing evidence was not reaudited or recovered.
""")

prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'integral_atan_retained_facts' not in current
current['updated_on']='2026-10-19'
current['integral_atan_retained_facts']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','ordinary_cost','native_integral_atan_facts_cost','cost_interpretation','cost_retention','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['integral_atan_retained_facts'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'retained integral atan facts admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':20,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/path)==h for path,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
