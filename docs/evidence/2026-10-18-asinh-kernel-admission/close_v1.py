"""Admit asinh range enforcement only after all final-source checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/Disk B/csgrs/asinh-kernel-admission-20261018-v1')
PREV_B=Path('/run/media/tim/Disk B/csgrs/symbolic-domain-admission-20261018-v1')
PREV_F=Path('/run/media/tim/Disk B/csgrs/symbolic-domain-admission-final-20261018-v1')
P=O/'docs/evidence/2026-10-18-symbolic-domain-admission'
E=O/'docs/evidence/2026-10-18-asinh-kernel-admission'
X=B/'external-evidence'
BASE='59b1df88378b34954db82824ae883cc18a112043'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from importlib import import_module
runner=import_module('asinh_runner_v2' if (B/'control/asinh_runner_v2.py').exists() else 'asinh_runner_v1')
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
def result(phase):return read(B/('asinh-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v1.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_asinh_ranges.rs','crates/hyperreal/src/computable/node/asinh_range_tests.rs'}
assert len(paths)==5 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v3.json.gz').read_bytes()))
assert len(pins)==2670 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==22
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v3','consumers-v1','modeling-v1','msrv-v1']]
cost=read(B/'ordinary-cost-v1/result-v1.json')
native_cost=read(B/'native-cost-v2/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost,native_cost])
assert scalar['packages']['default']['parent_tests_passed']==942
assert scalar['packages']['all']['parent_tests_passed']==1099
assert scalar['summaries']['debug-library']==[['ok','820','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==75
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
unit_output=''.join(p.read_text() for p in (B/'logs').glob('asinh-admission-scalar-v3-all-test-*-hyperreal/stdout'))
for test in ['asinh_range_proof_accounts_for_every_allowed_sample_rounding','both_asinh_series_reduce_large_inputs_and_preserve_small_inputs']:
    assert test+' ... ok' in unit_output,test
baseline=read(B/'baseline-result-v1.json')
assert baseline['reproduced'] and sha(baseline['binary'])==baseline['binary_sha256']
assert 'incorrect_claims=16' in (B/'logs/asinh-kernel-baseline-v1-diagnostics/stdout').read_text()
focused=read(B/'focused-v3/result-v1.json');assert focused['passed']
assert 'test result: FAILED. 0 passed; 1 failed' in focused['summaries']['parent-invalid']
for name,count in [('serde_asinh_ranges',2),('serde_symbolic_domains',3),('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',6),('serde_named_certificates',5)]:
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
    assert record['output_closed'] and not record['stops'],folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
assert failures=={
 'asinh-kernel-baseline-v1-assertions':101,
 'symbolic-domain-focused-v1-parent-invalid':101,
 'symbolic-domain-focused-v3-parent-invalid':101,
 'asinh-admission-scalar-v1-default-build':101,
 'asinh-native-cost-v1-parent-compile':1,
},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1808496,921794)
roots=[B,PREV_F]
for pattern in ['prepare-asinh-*.py','run-asinh-*.py','asinh-*.rs','asinh_*.py','apply-asinh-*.py','close-asinh-*.py','stage-asinh-*.py','verify-asinh-*.py','checkpoint-asinh-*.py','repair-asinh-*.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
selected=[]
for root in sorted(set(roots)):
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (not p.is_dir() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected)==len(set(selected))
physical={};states={};members={};excluded={};special={}
for p in selected:
    before=p.lstat()
    if not stat.S_ISREG(before.st_mode):
        assert stat.S_ISCHR(before.st_mode) and before.st_rdev==0,p
        special[str(p)]={'kind':'overlay_whiteout','mode':stat.S_IMODE(before.st_mode),'rdev':0};continue
    assert not p.is_symlink() and str(p) not in prior,p
    h=sha(p);after=p.stat();state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns)
    physical[str(p)]=h;states[str(p)]=state
    if len(physical)%5000==0:
        assert not reasons(resources());print(json.dumps({'new_paths_rehashed':len(physical)}),flush=True)
    with p.open('rb') as stream:magic=stream.read(8)
    generated=p.is_relative_to(B) and any(part.startswith(('overlay-upper','overlay-work','target','cargo-home','gmp-cache','xdg-cache')) for part in p.relative_to(B).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    source_archive=p.name=='source-baseline-v1.tar.gz'
    name=str(p.relative_to(B)) if p.is_relative_to(B) else 'prior-final/'+str(p.relative_to(PREV_F)) if p.is_relative_to(PREV_F) else 'temporary/'+p.name
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
gzwrite(expectations,{'schema_version':3,'kind':'asinh approximation range admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})

assert native_cost['all_completed_output_assertions_passed'] and len(native_cost['samples']['parent-0'])==18
metrics=['allocations','allocated_bytes','retained_bytes','peak_extra_bytes']
assert all(cost['samples']['parent-'+str(i)][name][metric]==cost['samples']['candidate-'+str(i)][name][metric] for i in range(5) for name in cost['samples']['parent-0'] for metric in metrics)
expected_delta={'allocations':40000,'allocated_bytes':960000,'retained_bytes':0,'peak_extra_bytes':80}
for pair in range(5):
    for name in native_cost['samples']['parent-0']:
        delta={metric:native_cost['samples']['candidate-'+str(pair)][name][metric]-native_cost['samples']['parent-'+str(pair)][name][metric] for metric in metrics}
        assert delta==(expected_delta if name=='imported-generic-asinh-cold-1' else {metric:0 for metric in metrics}), (pair,name,delta)
approval=B/'control/storage-allowance-v2.json'
authorization=read(approval)
assert authorization['user_answer']=='Use as much of Disk B as needed.' and authorization['new_net_allowance_bytes'] is None
allowance=None
storage_mode=authorization['disk_b_quota_mode']
physical_guard=authorization['physical_free_guard_bytes']
def measured(record):
    return {'candidate_over_parent_median_latency':record['candidate_over_parent_median_latency'],
      'binary_bytes':{k:v['bytes'] for k,v in record['binaries'].items()},
      'allocation_deltas_first_pair':{name:{m:record['samples']['candidate-0'][name][m]-record['samples']['parent-0'][name][m] for m in ['allocations','allocated_bytes','retained_bytes','peak_extra_bytes']} for name in record['samples']['parent-0']},
      'completed_output_assertions_passed':True,'all_five_alternating_pairs_retained':True,'general_speedup_claimed':False}
review={
 'decision':'Retain asinh series range checks and native logarithmic fallback.',
 'source_parent_revision':BASE,
 'owners':['Hyperreal approximation kernels'],
 'properties':['P1','P3','P4','P5','P6','P18','P19','P26','P35','P36','P37','P39'],
 'input_domain':'Existing finite real asinh arguments, with valid child expressions, uncancelled evaluation and supported precision/resource limits. General child-domain validity and fallible evaluation remain separate open obligations.',
 'admitted_scope':'Both PrescaledAsinh and AsinhRational justify their series range before a coarse-zero shortcut, and use the shared logarithmic identity with odd symmetry for larger arguments. Valid imported graphs retain their wire representation and following arithmetic.',
 'proof_argument':'For the generic kernel, its existing working sample a has error at most one at precision s. bits(abs(a)) <= -s-1 implies abs(a) <= 2^(-s-1)-1, so abs(x) <= 1/2 after including the error. The existing alternating series and its error budget apply on this interval; abs(asinh(x)) <= abs(x) justifies the coarse-zero shortcut. A sample outside that test is separated from zero and proves its sign; odd symmetry reduces negative inputs before the existing ln(x+sqrt(1+x^2)) evaluator. The rational kernel accepts only zero or a proved magnitude below 1/2 into the series; unavailable magnitude metadata is not a smallness proof. These arguments do not prove arbitrary child domains, unbounded precision or cancellation behavior.',
 'acceptance':{'baseline_incorrect_claims':16,'formats':['native JSON','native CBOR','Real JSON','Real CBOR','owned CBOR Value','borrowed CBOR Value','Serde collections'],'scales':[0,1,-3],'independent_coarse_oracle':'e < 11/4 gives sinh(2) < 121/32 < 4, hence abs(asinh(+/-4)) > 2 and a scale-two approximation cannot be zero.','directed_mpfr_precision_bits':2048,'small_and_large_rational_inputs':23,'series_representations':2,'sample_boundary_checks':1170,'extreme_test_scales_bits':512,'original_192000_bit_tests_preserved':True,'direct_focused_tests':24,'symbolic_inputs':['pi','sqrt(2)','arithmetic spelling of +/-4'],'wire_preserved':True,'cold_and_warm_precision_sequences_preserved':True,'final_source_scalar_rerun':True},
 'scalar_cargo':scalar['packages'],'debug_units_passed':820,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'ordinary_cost':measured(cost),'native_asinh_cost':measured(native_cost),
 'cost_scope':'Ordinary corpus: unchanged 17 rows, 100000 iterations, five alternating pairs. Native asinh: 18 rows, 10000 iterations, five alternating pairs, cold construction plus evaluation or warm evaluation at precisions 1,-32,-128; every result is checked against independently directed MPFR bounds. Compiler flags/dependencies match the verified parent. No general speedup claim.',
 'cost_interpretation':'The cold imported generic coarse query now obtains the missing range proof: four extra allocations and 96 extra allocated bytes per iteration, with 80 extra peak bytes in the measured case. Its latency increased in the retained run. Other measured native allocation metrics and all ordinary-corpus allocation metrics match. Exactness and supported completion take priority over this recorded cost.',
 'failed_attempts':failures,
 'attempt_notes':['The expected parent assertion failure records incorrect mathematical enclosures. Both new parent regression runs fail as expected.','The first full build caught an unconstrained integer type in the new MPFR fixture. The explicit i32 annotation fixed it without changing the test cases.','The first benchmark harness attempted a private Real conversion and did not compile; its corrected version measures the public certified-interval API on both revisions.','The first complete scalar matrix passed. Review then required an affirmative small-magnitude proof when magnitude metadata is unavailable. Final-source checks were repeated without weakening workloads.'],
 'remaining_limitations':['General expression domains, other private kernel ranges and typed native evaluation/cancellation remain open.','The older isolated fallible-evaluation prototype is present but unadmitted; its whole-crate obligations are not discharged here.','The i32-overflow magnitude case is handled conservatively by inspection; no multi-gigabit operand was allocated as an empirical test.','Per-process containment does not establish total internal work, heap, expression-growth or cancellation contracts.','Finite tests and matched measurements do not establish exhaustive correctness, formal verification or full ordinary-workload coverage.','Clean shipped-distribution and foreign consumers, full CI/DRC gates and the complete properties plan remain open.','Historical missing evidence was neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,
 'next':'Continue scalar domain/evidence ownership and ordinary strict completion, then complete the shipped user path and release validation.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{'exit_code':r['exit_code'],'elapsed_seconds':r['elapsed_seconds'],'wall_limit_seconds':r['wall_limit_seconds'],'stops':r['stops']} for k,r in commands.items()})
shutil.copy2(B/'control/contract-v1.md',E/'contract-v1.md')
shutil.copy2(approval,E/'storage-allowance-v1.json')
shutil.copy2(B/'source-pins-candidate-v3.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(__file__,E/'close_v1.py')
patch=git('diff','--binary')
for path in sorted(new):
    added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False)
    assert added.returncode==1
    patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('# E89: asinh approximation range enforcement\n\nImported small-series nodes previously returned a zero approximation for\n`asinh(+/-4)` at scale two, publishing enclosures that exclude the exact value.\nThe kernels now establish their series range from the argument and reuse the\nnative logarithmic identity with odd symmetry for larger values. Stored graphs\nremain unchanged and subsequent arithmetic consumes the corrected values.\n\nThe [review](review-v1.json) records the mathematical argument, independent\noracles, final-source validation, measured costs and remaining limitations.\nThe [contract](contract-v1.md) predates implementation; the applicable explicit\n[storage approval](storage-allowance-v1.json) retains the original baselines.\nThe [checkpoint](checkpoint-v1.json) pins sources and evidence.\n\nAll new physical artifacts are hashed independently under Disk B/csgrs, and\nall raw archive members are verified. Generated files and binaries remain at\ntheir recorded paths. General domain validity, typed native cancellation,\ncomplete resource contracts, release acceptance and the full plan remain open.\n')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'asinh_kernel_ranges' not in current
current['updated_on']='2026-10-18'
current['asinh_kernel_ranges']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','ordinary_cost','native_asinh_cost','cost_interpretation','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['asinh_kernel_ranges'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'asinh approximation range admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':22,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/path)==h for path,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
