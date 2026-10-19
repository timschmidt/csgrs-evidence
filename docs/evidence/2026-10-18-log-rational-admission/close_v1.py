"""Admit rational logarithm range enforcement only after all final-source checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/Disk B/csgrs/log-rational-admission-20261018-v1')
PREV_B=Path('/run/media/tim/Disk B/csgrs/asinh-kernel-admission-20261018-v1')
PREV_F=Path('/run/media/tim/Disk B/csgrs/asinh-kernel-admission-final-20261018-v1')
P=O/'docs/evidence/2026-10-18-asinh-kernel-admission'
E=O/'docs/evidence/2026-10-18-log-rational-admission'
X=B/'external-evidence'
BASE='7f3d813e91d96e76245dfa7342bff88007f7505a'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from importlib import import_module
runner=import_module('log_rational_runner_v1')
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
def result(phase):return read(B/('log-rational-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v1.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_log_rational_ranges.rs','crates/hyperreal/src/computable/node/log_rational_range_tests.rs'}
assert len(paths)==5 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v2.json.gz').read_bytes()))
assert len(pins)==2672 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v1','consumers-v1','modeling-v1','msrv-v1']]
cost=read(B/'ordinary-cost-v1/result-v1.json')
native_cost=read(B/'native-cost-v1/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost,native_cost])
assert scalar['packages']['default']['parent_tests_passed']==944
assert scalar['packages']['all']['parent_tests_passed']==1103
assert scalar['summaries']['debug-library']==[['ok','822','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==75
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
unit_output=''.join(p.read_text() for p in (B/'logs').glob('log-rational-admission-scalar-v1-all-test-*-hyperreal/stdout'))
for test in ['rational_log_series_enclose_small_large_and_near_minus_one_residuals','binary_scaled_logs_preserve_residuals_and_full_width_shifts']:
    assert test+' ... ok' in unit_output,test
baseline=read(B/'baseline-result-v1.json')
assert baseline['reproduced'] and sha(baseline['binary'])==baseline['binary_sha256']
assert 'incorrect_claims=32' in (B/'logs/log-rational-baseline-v1-diagnostics/stdout').read_text()
focused=read(B/'focused-v2/result-v1.json');assert focused['passed']
assert 'test result: FAILED. 0 passed; 1 failed' in focused['summaries']['parent-invalid']
for name,count in [('serde_log_rational_ranges',2),('serde_asinh_ranges',2),('serde_symbolic_domains',3),('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',6),('serde_named_certificates',5)]:
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
 'log-rational-baseline-v1-assertions':101,
 'log-rational-focused-v1-serde_log_rational_ranges-candidate-v1-compile':1,
 'log-rational-focused-v2-parent-invalid':101,
},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1822245,921794)
roots=[B,PREV_F]
for pattern in ['prepare-log-rational-*.py','run-log-rational-*.py','log-rational-*.rs','log_rational_*.py','apply-log-rational-*.py','close-log-rational-*.py','stage-log-rational-*.py','verify-log-rational-*.py','checkpoint-log-rational-*.py','repair-log-rational-*.py']:
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
gzwrite(expectations,{'schema_version':3,'kind':'rational logarithm range admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})

assert native_cost['all_completed_output_assertions_passed'] and len(native_cost['samples']['parent-0'])==72
approval=B/'control/storage-allowance-v1.json'
authorization=read(approval)
assert authorization['user_answer']=='Use as much of Disk B as needed.' and authorization['new_net_allowance_bytes'] is None
allowance=None
storage_mode=authorization['disk_b_quota_mode']
physical_guard=authorization['physical_free_guard_bytes']
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
review={
 'decision':'Retain rational logarithm range checks and shared native reduction.',
 'source_parent_revision':BASE,
 'owners':['Hyperreal approximation kernels'],
 'properties':['P1','P3','P4','P5','P6','P18','P19','P26','P35','P36','P37','P39'],
 'input_domain':'Finite rational residuals r > -1, representing ln(1+r), optionally plus shift*ln(2), with uncancelled evaluation and supported precision/resource limits. Existing invalid-residual import rejection is preserved. General native domains and fallible evaluation remain separate obligations.',
 'admitted_scope':'PrescaledLnRational and BinaryScaledLnRational establish the shared residual kernel range before using its series or coarse-zero shortcut. Larger or near-minus-one residuals reuse native exact-rational logarithm reduction. Stored valid graphs retain their wire representation and following arithmetic.',
 'proof_argument':'Zero is exact. For a nonzero residual, an affirmative exact binary magnitude below -1 proves |r| < 1/2. Then 1/2 < 1+r < 3/2, so |ln(1+r)| < ln(2) < 1, justifying the coarse-zero shortcut and the existing series/error budget. Missing magnitude metadata is not a smallness proof. Otherwise r.add_one() forms the exact positive logarithm argument, and the existing native logarithm reducer computes the same value. The binary-scaled kernel retains its original two-term precision budget but now receives a valid approximation of its residual logarithm. No wrapper normalization or stored-graph mutation is used.',
 'acceptance':{
    'baseline_incorrect_claims':32,
    'formats':['native JSON','native CBOR','Real JSON','Real CBOR','owned CBOR Value','borrowed CBOR Value','Serde collections'],
    'scales':[0,1,-3],
    'independent_exact_oracles':'8/3 < e < 11/4 proves 1 < ln(5) < 2, -3 < ln(1/16) < -2 and 2/3 < ln(2) < 1. The large dyadic residuals give exact integer multiples of ln(2), including nonzero binary shifts.',
    'directed_mpfr_precision_bits':2048,
    'plain_and_zero_shift_residuals':22,
    'scaled_residuals':11,
    'binary_shifts':[-2147483648,-4096,-17,-3,0,3,17,4096,2147483647],
    'precision_sequence':[2,1,0,-1,-32,-128,-512,-8,2,0],
    'cold_and_warm_enclosure_checks':2860,
    'extreme_residual_scales_bits':512,
    'original_192000_bit_tests_preserved':True,
    'direct_focused_tests':26,
    'invalid_residuals_preserve_typed_failure':True,
    'wire_preserved':True,
    'following_arithmetic_checked':True,
 },
 'scalar_cargo':scalar['packages'],'debug_units_passed':822,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'ordinary_cost':measured(cost),'native_log_cost':measured(native_cost),
 'cost_scope':'Ordinary corpus: unchanged 17 rows, 100000 iterations, five alternating pairs. Native logarithms: 72 rows, 10000 iterations, five alternating pairs; Computable and Real public logarithms plus imported plain/scaled rational residuals, r=+/-1/16, shifts 0 and 4, precision 0,-32,-128, cold construction/evaluation and warm evaluation. Each result is checked against independently directed MPFR bounds. Compiler flags and dependencies match the verified parent. All slower rows are retained.',
 'cost_interpretation':'All measured allocation counts, allocated bytes, retained bytes and peak bytes match the parent across all rows and all five pairs. Ordinary median latency ratios range from 0.9909 to 1.1196; native-log ratios range from 0.8605 to 1.1394, including a 13.94% slower cold Real query. The ordinary and native executables grow by 720 and 688 bytes respectively. Every unfavorable row is retained. These limited measurements do not establish a general speedup or isolate the cause of timing changes. Exactness and supported completion take priority over the recorded costs.',
 'failed_attempts':failures,
 'attempt_notes':['The baseline numerical assertion and parent regression fail as expected, reproducing incorrect enclosures.','The first integration-fixture compile used the u64-only fraction helper for an exact 2^64 denominator; parsing that exact fraction fixes the fixture without changing its cases or precision. The failed build is retained.','Review corrected an unexecuted parent-library reference in the replacement focused driver before it could be used; the actual parent was verified against E89 final source and sealed library hashes.'],
 'remaining_limitations':['General expression domains, other private kernel ranges and typed native evaluation/cancellation remain open.','The isolated fallible-evaluation prototype remains unadmitted; its whole-crate obligations are not discharged here.','The unavailable i32 magnitude-metadata branch is handled conservatively by inspection; no multi-gigabit operand was allocated for empirical coverage.','Per-process containment does not establish total internal work, heap, expression-growth or cancellation contracts.','Finite tests and matched measurements do not establish exhaustive correctness, formal verification, coverage targets or the complete useful-workload corpus.','Clean shipped-distribution and foreign consumers, full CI/DRC gates and the full properties plan remain open.','Historical missing evidence was neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,
 'next':'Continue scalar domain/evidence ownership and ordinary strict completion, then complete the shipped user path and release validation.'}
assert review['ordinary_cost']['all_allocation_and_byte_metrics_identical'] and review['native_log_cost']['all_allocation_and_byte_metrics_identical']
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{'exit_code':r['exit_code'],'elapsed_seconds':r['elapsed_seconds'],'wall_limit_seconds':r['wall_limit_seconds'],'stops':r['stops']} for k,r in commands.items()})
shutil.copy2(B/'control/contract-v1.md',E/'contract-v1.md')
shutil.copy2(approval,E/'storage-allowance-v1.json')
shutil.copy2(B/'source-pins-candidate-v2.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(__file__,E/'close_v1.py')
patch=git('diff','--binary')
for path in sorted(new):
    added=subprocess.run(GIT+['diff','--no-index','--','/dev/null',path],cwd=O,stdout=subprocess.PIPE,check=False)
    assert added.returncode==1
    patch+=added.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('# E90: rational logarithm range enforcement\n\nImported rational logarithm nodes previously published coarse enclosures that\nexclude their represented values, including binary-scaled logarithms. The\nshared kernel now proves its small residual range before the series shortcut\nand reuses native exact-rational log reduction outside that range. Stored\ngraphs and following arithmetic retain their meaning.\n\nThe [review](review-v1.json) records independent bounds, directed MPFR tests,\nlocal and downstream checks, matched costs, failures and remaining limitations.\nThe [contract](contract-v1.md) predates implementation. The explicit\n[storage authorization](storage-allowance-v1.json) permits Disk B use as needed.\nThe [checkpoint](checkpoint-v1.json) pins the source and evidence.\n\nGeneral domains, typed native evaluation/cancellation, full resource contracts,\nrelease acceptance and the complete properties plan remain open. Historical\nmissing artifacts were not reaudited or recovered.\n')

prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'rational_log_kernel_ranges' not in current
current['updated_on']='2026-10-18'
current['rational_log_kernel_ranges']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','ordinary_cost','native_log_cost','cost_interpretation','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['rational_log_kernel_ranges'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'rational logarithm range admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/path)==h for path,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
