"""Admit imported arctangent range enforcement only after all final-source checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/atan-kernel-admission-20261019-v1')
PREV_B=Path('/run/media/tim/Disk B/csgrs/log-rational-admission-20261018-v1')
PREV_F=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/log-rational-admission-final-20261018-v1')
A=B.parent/'atan-range-observation-20261019-v1'
TEMP_A=Path('/tmp/atan-range-observation-20261019-v1')
P=O/'docs/evidence/2026-10-18-log-rational-admission'
E=O/'docs/evidence/2026-10-19-atan-kernel-admission'
X=B/'external-evidence'
BASE='fd32065ac1f6c3073bae1f7a50c769a12c147524'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from importlib import import_module
runner=import_module('atan_kernel_runner_v1')
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
def result(phase):return read(B/('atan-kernel-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v1.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_atan_ranges.rs','crates/hyperreal/src/computable/node/atan_range_tests.rs'}
assert len(paths)==6 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v3.json.gz').read_bytes()))
assert len(pins)==2674 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v2.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v2','consumers-v2','modeling-v2','msrv-v2']]
cost=read(B/'ordinary-cost-v1/result-v1.json')
native_cost=read(B/'native-cost-v2/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost,native_cost])
final_gates=read(B/'final-validation-gates-v1.json')
assert final_gates['passed'] and all(sha(p)==h for p,h in final_gates['results_sha256'].items())
assert scalar['packages']['default']['parent_tests_passed']==948
assert scalar['packages']['all']['parent_tests_passed']==1109
assert scalar['summaries']['debug-library']==[['ok','826','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==75
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
unit_output=''.join(p.read_text() for p in (B/'logs').glob('atan-kernel-admission-scalar-v2-all-test-*-hyperreal/stdout'))
for test in ['imported_atan_series_preserve_rational_and_generic_arguments','atan_half_angle_fallback_encloses_symbolic_children','atan_range_proof_handles_every_allowed_working_sample_rounding','aborted_atan_range_reduction_recovers_without_publishing_a_cache']:
    assert test+' ... ok' in unit_output,test
binding=read(B/'baseline-binding-v1.json')
assert binding['commit']==BASE and binding['current_commit_matches_reproduced_staged_sources']
assert sha(A/'protocol-v3.json')==binding['reproduction_protocol_sha256']
assert sha(A/'result-v3.json')==binding['reproduction_result_sha256']
observation=read(A/'review-v1.json')
assert observation['completed_controls']==12 and observation['reproduced_case']['exit_code']==-15
focused=read(B/'focused-v3/result-v1.json');assert focused['passed']
assert focused['parent_regression_reproduced_timeout']
reuse=focused['parent_regression_reused_from']
assert reuse['test_source_unchanged'] and sha(reuse['path'])==reuse['sha256']
for name,count in [('serde_atan_ranges',2),('serde_log_rational_ranges',2),('serde_asinh_ranges',2),('serde_symbolic_domains',3),('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',6),('serde_named_certificates',5)]:
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
    assert record['stops']==(['wall_seconds'] if folder.name=='atan-kernel-focused-v2-parent-timeout' else []),folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
assert failures=={
 'atan-kernel-admission-scalar-v1-default-build':101,
 'atan-kernel-focused-v1-serde_atan_ranges-candidate-v1-compile':1,
 'atan-kernel-focused-v2-parent-timeout':-15,
 'atan-kernel-native-cost-v1-parent-compile':1,
},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1832882,921794)
roots=[B,PREV_F,A,TEMP_A]
for pattern in ['prepare-atan-*.py','record-atan-*.py','interpret-atan-*.py','run-atan-*.py','atan-*.rs','atan_kernel_*.py','close-atan-*.py','stage-atan-*.py','verify-atan-*.py','retain-log-and-atan-*.py','verify-log-rational-commit-v2.py']:
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
    name=str(p.relative_to(B)) if p.is_relative_to(B) else 'prior-final/'+str(p.relative_to(PREV_F)) if p.is_relative_to(PREV_F) else 'observation/'+str(p.relative_to(A)) if p.is_relative_to(A) else 'observation-original/'+str(p.relative_to(TEMP_A)) if p.is_relative_to(TEMP_A) else 'temporary/'+p.name
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
gzwrite(expectations,{'schema_version':3,'kind':'imported arctangent range admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})

assert native_cost['all_completed_output_assertions_passed'] and len(native_cost['samples']['parent-0'])==144
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
 'decision':'Retain imported arctangent range checks and shared native half-angle reduction.',
 'source_parent_revision':BASE,
 'owners':['Hyperreal approximation kernels','Hyperreal native angle reduction'],
 'properties':['P1','P3','P4','P5','P6','P18','P19','P26','P35','P36','P37','P39'],
 'input_domain':'Finite real children of PrescaledAtan, with valid child evaluation, uncancelled approximation and supported precision/resource limits. Existing typed rejection of known invalid imported children is preserved. This does not certify the domain of arbitrary expression graphs.',
 'admitted_scope':'PrescaledAtan establishes |child| <= 1/2 before entering the Taylor series. Outside the proven range, exact leaves reuse rational atan reduction; other children use the shared half-angle argument twice. Stored graphs, wire representation, value, evidence and following arithmetic are preserved.',
 'contract_dimensions':{'numerical_certainty':'The repaired evaluator supplies its native enclosure contract for valid finite children; independent exact and MPFR bounds exercise it.','topological_validity':'No topology is established by these scalar claims; the unchanged downstream modeling tests retain their own topology obligations.','geometric_fidelity':'No mesh or analytic-source conversion is changed; stored symbolic scalar graphs are preserved.'},
 'formatting':'Touched native include files were formatted with crates/.rustfmt.toml; their additional formatting-only edits change no formulas or branches.',
 'proof_argument':'For p>=1, zero has error less than 2 because |atan(x)|<pi/2<2. For p<1 the existing working sample a at precision s has error at most 2^s. If bits(|a|)<=-s-1, then |a|<=2^(-s-1)-1, so |x|<=1/2 and the original series/error budget applies. Otherwise an available exact rational uses native atan_rational. For a general real x, x/(1+sqrt(1+x*x))=tan(atan(x)/2); two shared half-angle steps give tan(atan(x)/4), of magnitude below tan(pi/8)=sqrt(2)-1<1/2, with positive denominators. Native shifting multiplies the result by four with its existing approximation budget. This fallback makes strict range progress even when an admissible boundary sample could recreate the same PrescaledAtan via ordinary reduction.',
 'acceptance':{
    'baseline':'Exact E90 library: twelve completed controls and externally stopped imported JSON PrescaledAtan(2) at p=0 after 60 seconds. Current-revision source and committed-blob binding retained. A timeout is not a proof of nontermination.',
    'formats':['native JSON','native CBOR','Real JSON','Real CBOR','owned CBOR Value','borrowed CBOR Value','Serde collections'],
    'outer_real_scales':[0,1,-3],
    'independent_exact_bounds':'For x>=2, reciprocal identity plus 3<pi<4 and 0<atan(1/x)<1/x<=1/2 give 1<atan(x)<2; negative bounds by odd symmetry. The interchange interval-overlap checks supplement stronger directed enclosures; overlap alone is not an enclosure proof.',
    'directed_mpfr_precision_bits':2048,
    'rational_values_including_zero':25,
    'rational_representations':['exact leaf','raw Add(leaf,zero) verified not to have an exact-rational leaf shortcut'],
    'rational_precision_sequence':[2,0,-1,-32,-128,-512,-8,2,0],
    'rational_cold_and_warm_checks':900,
    'symbolic_roots':[2,5,17],'symbolic_binary_shifts':[-32,-2,0,32],'symbolic_signs':[-1,1],
    'symbolic_precision_sequence':[2,0,-32,-128,-512,-8,2],
    'symbolic_cold_and_warm_checks':336,
    'working_rounding_boundary_checks':1170,
    'working_precision_pairs':[[0,-12],[-1,-13],[-32,-46],[-128,-144],[-512,-530]],
    'boundary_refinement_sequence':'requested p, -1024, requested p; all allowed +/-1 samples on the finite quarter-unit grid at both half-range boundaries',
    'extreme_rational_magnitudes_bits':512,
    'cancelled_query_publishes_no_cache_and_resumes':True,
    'original_192000_bit_tests_preserved':True,
    'direct_focused_tests':28,
    'known_invalid_children_preserve_typed_failure':True,
    'wire_preserved':True,'following_arithmetic_checked':True,
 },
 'scalar_cargo':scalar['packages'],'debug_units_passed':826,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'ordinary_cost':measured(cost),'native_atan_cost':measured(native_cost),
 'cost_scope':'Ordinary corpus: unchanged 17 rows, 100000 iterations, five alternating pairs. Native arctangent: 144 rows, 10000 iterations, five alternating pairs. Three separate fixed 48-row family processes contain +/-1/16, +/-1/2 and +/-sqrt(2)/16; four entry modes are Computable and Real public atan plus native imported leaf and raw Add(child,zero). Precisions 0,-32,-128, cold construction/evaluation and warm evaluation, every result checked against independent directed MPFR bounds. Process and oracle setup are excluded consistently. Parent and candidate have identical flags and dependencies. Boundary fallback costs and all adverse samples are retained.',
 'cost_interpretation':read(B/'cost-interpretation-v1.json'),
 'cost_retention':read(B/'cost-retention-decision-v1.json'),
 'failed_attempts':failures,
 'attempt_notes':['The current-revision reproduction and unchanged parent regression hit the original external 60-second limit. This is expanded completion, not a matched successful speedup.','The first integration test compile treated the unit ParseError variant as a tuple. The first full scalar build required explicit i32 precision literals. Both compiler failures are retained; corrections change no cases, precision or assertions.','The initial record describes the Python preparation syntax error and missing-helper execution. A later JavaScript patch-builder syntax error also occurred before applying any edit; it is recorded here from the earlier tool return, not as a retained executable helper. The original observation retains its separate compiler/preparation failures.','The native benchmark initially used a private shift method and omitted unwrapping a fallible Real division. Version 2 uses public exact multiplication by 1/16 and handles division; inputs, cases, precisions, iterations, assertions and limits are unchanged. No native timing sample ran in version 1; its compiler failure and source are retained.','Final focused-v3 reuses the hashed parent timeout from v2 because the parent library and integration source did not change; full Cargo suites separately execute all new unit tests.'],
 'remaining_limitations':['General expression domains, other private kernel ranges and typed native evaluation/cancellation remain open.','The isolated fallible-evaluation prototype remains unadmitted.','External time/address-space containment does not establish internal work, heap, expression-growth or cancellation contracts.','Finite tests and matched measurements do not establish exhaustive correctness, formal verification, coverage targets or the complete useful-workload corpus.','Clean shipped-distribution and foreign consumers, full CI/DRC gates and the full properties plan remain open.','Historical missing evidence was neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'artifact_volume':str(B.parent),'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,
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
(E/'README.md').write_text('# E91: imported arctangent range enforcement\n\nAn imported PrescaledAtan(2) reproduced a 60-second external timeout on the\nexact parent revision. The shared evaluator now proves its small-series range\nand reuses rational or shared half-angle reduction when needed. Stored graphs\nand following arithmetic keep their meaning.\n\nThe [review](review-v1.json) records independent enclosures, cache boundaries,\nlocal and downstream checks, matched costs, failures and remaining limitations.\nThe [contract](contract-v1.md) predates implementation. The\n[storage authorization](storage-allowance-v1.json) selects the new artifact volume.\nThe [checkpoint](checkpoint-v1.json) pins the source and evidence.\n\nGeneral domains, typed native evaluation/cancellation, full resource contracts,\nrelease acceptance and the complete properties plan remain open. Historical\nmissing artifacts were not reaudited or recovered.\n')

prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'atan_kernel_ranges' not in current
current['updated_on']='2026-10-19'
current['atan_kernel_ranges']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','ordinary_cost','native_atan_cost','cost_interpretation','cost_retention','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','disk_b_quota_mode','disk_b_physical_free_guard_bytes','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['atan_kernel_ranges'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'imported arctangent range admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{path:sha(O/path) for path in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{path:h for path,h in previous['restored_native_sha256'].items() if path not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':allowance,'disk_b_quota_mode':storage_mode,'disk_b_physical_free_guard_bytes':physical_guard,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/path)==h for path,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
