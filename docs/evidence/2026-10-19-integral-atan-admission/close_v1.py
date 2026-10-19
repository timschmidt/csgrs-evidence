"""Admit integral atan endpoint completion only after all final-source checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/integral-atan-admission-20261019-v1')
PREV_B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/atanh-rational-admission-20261019-v1')
PREV_F=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/atanh-rational-admission-final-20261019-v1')
A=B.parent/'integral-atan-observation-20261019-v1'
P=O/'docs/evidence/2026-10-19-atanh-rational-admission'
E=O/'docs/evidence/2026-10-19-integral-atan-admission'
X=B/'external-evidence'
BASE='e378f873fbef140919eb8beeaed4e7ed92013f9b'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from importlib import import_module
runner=import_module('integral_atan_runner_v1')
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
def result(phase):return read(B/('integral-atan-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v1.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_integral_atan_ranges.rs','crates/hyperreal/src/computable/node/integral_atan_range_tests.rs'}
assert len(paths)==5 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v1.json.gz').read_bytes()))
assert len(pins)==2678 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v1','consumers-v1','modeling-v1','msrv-v1']]
cost=read(B/'ordinary-cost-v1/result-v1.json')
native_cost=read(B/'native-cost-v1/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost,native_cost])
final_gates=read(B/'final-validation-gates-v1.json')
assert final_gates['passed'] and all(sha(p)==h for p,h in final_gates['results_sha256'].items())
assert scalar['packages']['default']['parent_tests_passed']==953
assert scalar['packages']['all']['parent_tests_passed']==1118
assert scalar['summaries']['debug-library']==[['ok','831','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==75
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
unit_output=''.join(p.read_text() for p in (B/'logs').glob('integral-atan-admission-scalar-v1-all-test-*-hyperreal/stdout'))
for test in ['imported_integral_atan_encloses_unit_and_nonunit_denominators','integral_atan_unit_identity_recovers_after_cancellation','integral_atan_unit_identity_preserves_concurrent_enclosures']:
    assert test+' ... ok' in unit_output,test
binding=read(B/'baseline-binding-v1.json')
assert binding['commit']==BASE and binding['external_timeouts']==3
assert sha(A/'protocol-v1.json')==binding['reproduction_protocol_sha256']
assert sha(A/'result-v1.json')==binding['reproduction_result_sha256']
assert sha(A/'review-v1.json')==binding['reproduction_review_sha256']
observation=read(A/'result-v1.json')
assert len(observation['rows'])==19 and not observation['contradictions']
assert sum(r['stops']==['wall_seconds'] for r in observation['commands'].values())==3
focused=read(B/'focused-v1/result-v1.json');assert focused['passed']
assert focused['parent_regression_external_timeout'] and focused['commands']['parent-invalid']['stops']==['wall_seconds']
for name,count in [('serde_integral_atan_ranges',2),('serde_atanh_rational_ranges',2),('serde_atan_ranges',2),('serde_log_rational_ranges',2),('serde_asinh_ranges',2),('serde_symbolic_domains',3),('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',6),('serde_named_certificates',5)]:
    assert f'test result: ok. {count} passed' in focused['summaries'][name]
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
    assert record['stops']==(['wall_seconds'] if folder.name=='integral-atan-focused-v1-parent-invalid' else []),folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
assert failures=={'integral-atan-focused-v1-parent-invalid':-15},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1855111,921794)
roots=[B,PREV_F,A]
for pattern in ['prepare-integral-atan-*.py','run-integral-atan-*.py','integral-atan-*.rs','integral_atan_*.py','interpret-integral-atan-*.py','record-integral-atan-*.py','close-integral-atan-*.py','stage-integral-atan-*.py','verify-integral-atan-*.py']:
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
    name=str(p.relative_to(B)) if p.is_relative_to(B) else 'prior-final/'+str(p.relative_to(PREV_F)) if p.is_relative_to(PREV_F) else 'observation/'+str(p.relative_to(A)) if p.is_relative_to(A) else 'temporary/'+p.name
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
gzwrite(expectations,{'schema_version':3,'kind':'integral atan endpoint completion admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})

assert native_cost['all_completed_output_assertions_passed'] and len(native_cost['samples']['parent-0'])==60
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
 'decision':'Retain native exact quarter-turn reduction for imported integral atan unit denominators.',
 'source_parent_revision':BASE,
 'owners':['Hyperreal integral arctangent approximation kernel'],
 'properties':['P1','P2','P3','P4','P5','P6','P18','P19','P26','P35','P36','P37','P39'],
 'input_domain':'IntegralAtan(n) for nonzero integer n, with uncancelled evaluation and supported precision/resource limits. Unit denominators are valid inputs. Zero-denominator import rejection is preserved. General expression domains and full-width precision are not established.',
 'admitted_scope':'The evaluator reuses the native exact atan(+/-1) identity for unit denominators before the recurrence. Non-unit denominators retain the original series. Fine endpoint refinement now completes in the tested domain while stored graphs, enclosures, following arithmetic and typed import failures retain their meaning.',
 'proof_argument':'For n=+/-1, 1/n=n and atan(n)=+/-pi/4. The evaluator calls the existing native integer and atan constructors, whose exact rational unit branch builds the signed quarter turn. Shared pi uses Chudnovsky evaluation or non-unit Machin denominators, so this branch cannot recreate the unit series. Existing native scaling preserves the approximation error contract. For every remaining valid integer |n|>=2, the original series has geometric factor 1/n^2<=1/4. The existing coarse zero is valid because |atan(1/n)|<=pi/4<1. Stored graphs are not rewritten.',
 'contract_dimensions':{'numerical_certainty':'Directed MPFR enclosure checks and exact independent quarter-turn bounds test the approximation contract.','topological_validity':'Scalar completion proves no topology; unchanged downstream tests carry their own obligations.','geometric_fidelity':'No geometry conversion or analytic-source change; imported symbolic graphs remain authoritative.'},
 'acceptance':{
    'baseline_query_cases':19,'baseline_completed_cases':16,'baseline_external_timeouts':3,
    'baseline_timeout_scope':'Native JSON IntegralAtan(-1), native JSON IntegralAtan(1), and positive Real JSON at p=-32 exceeded 60 seconds on the verified parent. This proves failure under that external limit, not nontermination or a typed internal exhaustion outcome.',
    'formats':['native JSON','native CBOR','Real JSON','Real CBOR','owned CBOR Value','borrowed CBOR Value','Serde collections'],
    'outer_real_scales':[0,1,-3],
    'independent_exact_bounds':'atan(1)=pi/4 with 3<pi<22/7; 11/24<atan(1/2)<1/2 follows from alternating-series bounds. Odd symmetry and exact scaling supply negative and scaled bounds. Interval overlap and broad inner bounds supplement directed MPFR tests; overlap alone is not enclosure proof.',
    'directed_mpfr_precision_bits':2048,'signed_integer_denominators':10,
    'denominator_magnitudes':['1','2','5','239','2^512'],
    'precision_sequence':[4,2,1,0,-1,-8,-32,-128,-512,-8,2,1,0],
    'cold_and_warm_enclosure_checks':260,'cancelled_query_cases_and_recovery':2,
    'concurrent_unit_queries':12,'post_concurrency_queries':6,
    'original_192000_bit_and_previous_kernel_tests_preserved':True,
    'direct_focused_tests':32,'parent_focused_regression_exceeded_original_wall_limit':True,
    'invalid_zero_denominator_preserves_typed_failure':True,'wire_preserved':True,'following_arithmetic_checked':True,
 },
 'scalar_cargo':scalar['packages'],'debug_units_passed':831,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'ordinary_cost':measured(cost),'native_integral_atan_cost':measured(native_cost),
 'cost_scope':'Unchanged ordinary 17 rows, 100000 iterations and five alternating pairs. Native integral atan: 24 unit-denominator rows at n=+/-1 and p=0/-8; 36 non-unit rows at n=+/-2 and p=0/-32/-128. Each uses public Computable, imported IntegralAtan, public Real, cold construction/evaluation and warm evaluation, 10000 iterations and five alternating pairs. Every result encloses independent MPFR bounds. Process and oracle setup are excluded consistently; flags/dependencies match the verified parent. Fine endpoint timeouts are completion extensions, not matched successful-workload speedups. All adverse results are retained.',
 'cost_interpretation':read(B/'cost-interpretation-v1.json'),'cost_retention':read(B/'cost-retention-decision-v1.json'),
 'failed_attempts':failures,
 'attempt_notes':['The unchanged parent exceeds the original 60-second limit on the new integration regression. That expected timeout and all three original observation timeouts remain retained.'],
 'remaining_limitations':['General expression domains, other kernel ranges, full-width precision and typed native evaluation/cancellation remain open.','The isolated fallible-evaluation prototype remains unadmitted.','External containment does not establish internal total-work, heap, expression-growth or cancellation contracts.','Finite and concurrent tests do not establish exhaustive correctness, formal verification, coverage targets or all possible thread schedules.','The complete useful-workflow corpus, clean shipped distribution, real foreign consumers and full CI/DRC gates remain open.','Historical missing evidence was neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'artifact_volume':str(B.parent),'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,
 'next':'Continue scalar domain/evidence ownership and ordinary strict completion, then complete the shipped user path and release validation.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{'exit_code':r['exit_code'],'elapsed_seconds':r['elapsed_seconds'],'wall_limit_seconds':r['wall_limit_seconds'],'stops':r['stops']} for k,r in commands.items()})
shutil.copy2(B/'control/contract-v1.md',E/'contract-v1.md')
shutil.copy2(approval,E/'storage-allowance-v1.json')
shutil.copy2(B/'source-pins-candidate-v1.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(__file__,E/'close_v1.py')
patch=git('diff','--binary')
for path in sorted(new):
    added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False)
    assert added.returncode==1
    patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text("""# E93: integral arctangent endpoint completion

Imported integral atan nodes with unit denominators failed to complete fine
refinement under the declared external limit. The evaluator now reuses the
native exact signed quarter-turn identity while preserving stored graphs,
non-unit series behavior, enclosures and typed zero-denominator rejection.

The [review](review-v1.json) records the baseline timeouts, independent bounds,
cancellation/concurrency tests, local/downstream checks, measured costs and
remaining limitations. The [contract](contract-v1.md) predates implementation;
the [checkpoint](checkpoint-v1.json) pins source and evidence.

General domains, fallible native evaluation/cancellation, full resource
contracts, release acceptance and the full properties plan remain open.
Historical missing artifacts were not reaudited or recovered.
""")

prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'integral_atan_kernel_endpoints' not in current
current['updated_on']='2026-10-19'
current['integral_atan_kernel_endpoints']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','ordinary_cost','native_integral_atan_cost','cost_interpretation','cost_retention','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['integral_atan_kernel_endpoints'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'integral atan endpoint completion admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/path)==h for path,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
