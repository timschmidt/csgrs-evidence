"""Close the scoped native kernel admission repair after final-source checks."""
import ast,difflib,gzip,hashlib,json,os,re,shutil,statistics,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
W=N/'kernel-admission-control-v1';B=V/'kernel-admission-validation-v1'
U=Path('/tmp/csgrs-kernel-admission-20261018-v1');X=B/'external-evidence'
P=O/'docs/evidence/2026-10-18-named-certificate-admission'
E=O/'docs/evidence/2026-10-18-kernel-admission'
BASE='e5e292ae5f45e7eaca19bd2cd9612f88218fb961'
sys.path.insert(0,str(W))
from kernel_admission_runner_v3 import sha,resources,reasons
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,x):
    assert not p.exists(),p
    p.write_text(json.dumps(x,sort_keys=True,indent=2)+'\n')
def gzwrite(p,x):
    assert not p.exists(),p
    p.write_bytes(gzip.compress((json.dumps(x,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    a=re.search(rb'"current_work"\s*:\s*',raw).end()
    x,n=json.JSONDecoder().raw_decode(raw[a:].decode())
    return a,a+len(raw[a:].decode()[:n].encode()),x
def result(phase,version=1):return read(B/('kernel-admission-'+phase)/('result-v'+str(version)+'.json'))

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'candidate-v5.json')['paths']);assert len(paths)==6
new={'crates/hyperreal/tests/serde_kernel_invariants.rs'}
assert set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
implementation={p:sha(O/p) for p in paths}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-v5.json.gz').read_bytes()))
assert len(pins)==2665 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(V/'named-admission-final-v1/commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==30
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
focused,scalar,consumers,modeling,msrv,diagnostic=[result(p) for p in ['candidate-v5','scalar-v2','consumers-v2','modeling-v1','msrv-v1','diagnostics-v2']]
cost=result('cost-v2',2)
retention=result('cost-retention-v1')
assert all(r['passed'] for r in [focused,scalar,consumers,modeling,msrv,cost]) and diagnostic['completed']
assert focused['summaries']==[['ok','4','0','0','0','0']]
negative=read(B/'kernel-admission-candidate-v5/negative-controls-v1.json')
assert negative['negative_controls']['baseline']['summaries']==[['FAILED','1','3','0','0','0']]
assert negative['negative_controls']['rejected-zero-reader']['summaries']==[['FAILED','3','1','0','0','0']]
assert scalar['packages']['default']['parent_tests_passed']==935
assert scalar['packages']['all']['parent_tests_passed']==1077
assert scalar['summaries']['debug-library']==[['ok','818','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366
assert consumers['packages']['hypercircuit']['passed']==60
assert all(label in modeling['summaries'] for label in ['minimal-empty_composition','minimal-solid_cache','minimal-strict_drilled_workflows','fields-svg-exact_linear_modeling'])
assert cost['completed_outputs_and_layout_preserved'] and len(cost['samples']['baseline-0'])==17
assert cost['original_zero_retention_summary_assertion_failed'] and cost['original_measurements_not_rerun_or_replaced']
assert cost['original_import_zero_retention_requirement_preserved'] and cost['all_non_timing_counters_identical']
assert retention['passed'] and retention['first_batch_retention_identical'] and retention['subsequent_batches_retain_zero_bytes']
assert result('endpoint-limits-v1')['passed']
for manifest in (U/'frozen').glob('*/executables-v1.json'):
    assert all(sha(row['copy'])==row['sha256'] for row in read(manifest).values())
registry=json.loads(gzip.decompress((N/'lazy-proof-control-v1/registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
overlays={}
for folder in (B/'overlays').iterdir():
    record=read(folder/'closed-v1.json')
    assert record['unmounted'] and record['fuse_exit_code']==0 and not os.path.ismount(record['logical_target'])
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    overlays[folder.name]=record
commands={}
for folder in sorted((B/'logs').iterdir()):
    record=read(folder/'result.json')
    assert record['output_closed'] and not record['stops'],folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
expected_failures={
 'kernel-admission-baseline-v1-run':101,
 'kernel-admission-candidate-v1-library':1,
 'kernel-admission-candidate-v2-test-run':101,
 'kernel-admission-candidate-v4-library':1,
 'kernel-admission-candidate-v5-baseline-run':101,
 'kernel-admission-candidate-v5-rejected-zero-reader-run':101,
}
assert failures==expected_failures,failures
print('Verified final-source results, preserved failed candidates and immutable lower targets.',flush=True)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1556686,921794)
roots=[U,W,B,V/'named-admission-final-v1']
for pattern in ['prepare-kernel-*.py','kernel-*.py','kernel-*.rs','run-kernel-*.py','close-kernel-*.py','stage-kernel-*.py','verify-kernel-*.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
roots=sorted(set(roots));selected=[]
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (p.is_file() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected)==len(set(selected))
physical={};states={};members={};excluded={}
for p in selected:
    assert p.is_file() and not p.is_symlink() and str(p) not in prior,p
    before=p.stat();digest=sha(p);after=p.stat()
    state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns),p
    physical[str(p)]=digest;states[str(p)]=state
    with p.open('rb') as f:magic=f.read(8)
    generated=p.is_relative_to(U) and any(part.startswith(('overlay-upper','overlay-modeling-upper','overlay-msrv-upper','target')) for part in p.relative_to(U).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=('disk-b/'+str(p.relative_to(V)) if p.is_relative_to(V) else str(p.relative_to(N)) if p.is_relative_to(N) else 'temporary/'+str(p.relative_to('/tmp')))
    row={'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason']='Generated Cargo output' if generated else 'Compiled binary or library';excluded[name]=row
    else:members[name]=row
print(json.dumps({'new_paths_hashed_independently':len(physical),'archive_members':len(members),'compiled_or_generated_retained':len(excluded)}),flush=True)
assert not X.exists();X.mkdir()
archive=X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz',dereference=True) as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
gzwrite(X/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
expectations=X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'native kernel parameter and endpoint admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'path_count':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
ratios={}
for name in cost['samples']['baseline-0']:
    a=[cost['samples']['baseline-'+str(i)][name]['nanoseconds'] for i in range(5)]
    b=[cost['samples']['candidate-'+str(i)][name]['nanoseconds'] for i in range(5)]
    ratios[name]={'baseline_nanoseconds':a,'candidate_nanoseconds':b,'ratio_of_medians':statistics.median(b)/statistics.median(a),'baseline_complete_row':cost['samples']['baseline-0'][name],'candidate_complete_row':cost['samples']['candidate-0'][name]}
review={
 'decision':'Retain native private-kernel parameter checks and defined inverse-cosine endpoint proofs. Reject broad cached-zero rational reuse.',
 'source_parent_revision':BASE,'owners':['Hyperreal native node decoding','Hyperreal structural facts and shared quotient recognition'],
 'properties':['P1','P2','P3','P4','P5','P6','P18','P19','P20','P25','P26','P27','P35','P36','P37','P39'],
 'input_domain':'Dedicated rational reduced trigonometric kernels; exact rational or certified oversized constant sinc/cosc inputs; acos(1) and acosh arguments established by bounded rational-expression evaluation.',
 'admitted_scope':'Known-invalid stored kernel ranges fail parsing before wrappers publish a scalar. Exact inverse-cosine endpoints retain zero and downstream division failure; arithmetic consumes a new proof of a defined rational endpoint, never an arbitrary cached zero.',
 'proof':'Reuse the native half-pi parameter classifier and quotient evaluator. Its rational-only mode rejects opaque atoms and checks every operand and denominator before erasing zero terms. No untrusted numerical refinement is used for admission.',
 'acceptance':{'invalid_graphs':53,'formats':['JSON','CBOR'],'outer_scales':[0,1,-3],'hidden_zero_product_and_collections':True,'endpoint_graphs':7,'endpoint_cache_sequence':[0,-64,0],'valid_private_graphs':34,'public_trig_values':39,'valid_wire_bytes_preserved':True,'new_tests_passed':4,'baseline_failed':3,'rejected_broad_zero_reader_failed':1},
 'migration':'Private rational kernel parameters outside their stored ranges now fail ParseError. Imported non-rational acosh arguments no longer receive an unproved positive sign solely from their tag; new evidence may resolve them. Accepted graph bytes remain unchanged. Defined endpoints now compose as exact zero. This is a correctness contract change, not a performance-only patch.',
 'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'consumer_features':consumers['feature_gate_matrix'],'modeling':modeling['summaries'],
 'modeling_method':'Cargo builds the public library in minimal and curve,sdf,metaballs,svg-io configurations; rustc then compiles unchanged integration sources against those exact libraries. Unrelated competitive C++ development dependencies and the full root CI matrix are not covered.',
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'strict_clippy_passed':['Hyperreal default/all all-targets','Hyperlimit all all-targets','Hypercurve SVG all-targets','Hypercircuit interchange all-targets','Hypercircuit geometry/all curved_outline','CSGRS minimal and fields/SVG libraries'],
 'docs_and_format_passed':True,'cost_controls':ratios,'cost_scope':cost['scope'],'cost_interpretation':'Instrumented matched controls retain all latency, allocation, retained-byte and peak measurements. They establish no general speedup or application performance claim. Correctness determines retention.',
 'cost_summary_correction':{'original_summary_failed':True,'cause':'The summary assumed zero retained bytes for every newly added arithmetic row. Both baseline and candidate retain the same 608 bytes for rational-add and 416 bytes for radical-add-fresh on first use.','original_five_pairs_preserved':True,'original_ten_import_rows_still_require_zero_retention':True,'all_non_timing_counters_identical':True,'first_use_retained_bytes_per_revision':cost['new_arithmetic_first_use_bytes_per_revision'],'three_batch_followup':{'same_original_rows_and_iteration_counts':True,'second_and_third_batches_all_zero_retention':True,'specific_retaining_owner_not_isolated':True},'workload_reduced':False,'largest_ratio_of_medians':max(row['ratio_of_medians'] for row in ratios.values()),'qualified_summary':str(B/'kernel-admission-cost-v2/result-v2.json'),'followup':str(B/'kernel-admission-cost-retention-v1/result-v1.json')},
 'binary_bytes':{k:v['bytes'] for k,v in cost['binaries'].items()},'layout_bytes':48,'general_speedup_claimed':False,
 'adverse_results':['The initial direct compiler driver omitted cfg allowlists; its failure is retained.','Candidate v2 passed parameter checks but lost exactness when adding one to a zero endpoint.','Broad cached-zero reuse passed the full scalar suite, then a new undefined-product diagnostic showed it erased a pending division by zero. That candidate is rejected and all its artifacts remain.','The first narrowed candidate used an unavailable Rational::cmp method; the compiler failure and corrected native comparison remain recorded.','The diagnostic summary writer failed on mixed Path/string keys after both subprocesses passed; a versioned summary reconstructs only the already-closed raw output.','Automatic approval review timed out before the modeling preparation launched; the permitted single retry succeeded. No work remains blocked by approval review.','All cost subprocesses completed successfully, but the summary assumed zero first-use retention for new arithmetic controls. That assumption failed in both revisions. The qualified summary preserves the original measurements, records identical 608/416-byte first-use retention, and cites a separate unchanged-workload three-batch followup with zero later retention.','The largest observed ratio of median instrumented times is about 1.049. All slower rows are retained; no speedup claim is made.'],
 'resource_contract':{'root_gib':16,'disk_b_gib':72,'tmp_gib':46,'logs_mib':100,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800,'original_baselines_unchanged':True},
 'resource_limitations':'Endpoint recognition reuses existing 512-node, 64-depth, 8192-operation and 4096-bit coefficient limits. These are optional proof limits, not a complete import-time or heap-byte bound. General decoding, coefficients, and expression growth require external containment.',
 'endpoint_depth_acceptance':{'cases':12,'depths':[0,8,62,64,80,8],'proof_declines_at_64_and_80':True,'later_independent_small_proof_succeeds':True,'graph_preserved':True,'cancellation_and_total_import_bounds_proved':False},
 'tmp_amendment':read(W/'tmp-contract-v5.json'),'overlay_results':overlays,'source_paths_verified':len(pins),'registry_paths_verified':len(registry),'command_records_verified':len(commands),'all_adverse_results_retained':True,
 'remaining_limitations':['General non-leaf domain/range admission remains open. The baseline already gives a false zero fact to an undefined zero product; this patch prevents the new reader from erasing it but does not repair that general fact path.','NormalQuantile still trusts a bad seed: p=1/2 with the retained seed yields 100 at precision zero through both import and the native public constructor.','Finite valid private and public representation coverage does not prove every graph or constructor.','Full geometry/DRC runtime gates, actual affected foreign-language consumers, clean shipped-distribution validation and complete resource bounds remain open.','Historical missing artifacts were not reaudited or recovered; closed evidence relies on retained external paths.'],
 'next':'Address native domain obligations and quantile seed evidence before broader strict completion and the complete external release path.',
 'runtime_admitted':True,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{field:r[field] for field in ['exit_code','elapsed_seconds','stops','output_sha256']} for k,r in commands.items()})
for source,dest in [(W/'contract-v1.md','contract-v1.md'),(W/'tmp-contract-v5.json','tmp-contract-v5.json'),(W/'log-allowance-v2.json','log-allowance-v2.json'),(B/'source-pins-v5.json.gz','source-pins-v1.json.gz'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/dest)
patch=git('diff','HEAD','--',*sorted(paths-new)).decode()
for p in sorted(new):patch+=''.join(difflib.unified_diff([], (O/p).read_text().splitlines(keepends=True),fromfile='/dev/null',tofile='b/'+p))
(E/'implementation.patch').write_text(patch)
(E/'README.md').write_text('''# Native kernel admission (E85)

This patch rejects invalid stored trigonometric ranges and proves defined
inverse-cosine endpoints before downstream arithmetic consumes them.
It preserves valid private graph bytes and public trigonometric constructors.
The new rational-only proof reuses the native bounded quotient evaluator.

Broad cached-zero reuse is rejected: despite a passing scalar suite, a new
diagnostic demonstrated that it could erase an undefined child. All failed
candidates, compiler errors and raw command results remain retained.

Final-source scalar, predicate, selected curve/circuit, modeling, compiler-floor,
lint, documentation and format checks are detailed in `review-v1.json`.
The modeling checks include empty composition, caches, full-resolution strict
drills and exact linear modeling. Matched import and arithmetic cost controls
retain every sample and make no speedup claim.
The initial cost summary failed because two arithmetic controls retained
608 and 416 bytes on first use in both revisions. All memory counters match;
a separate three-batch probe found zero retention in subsequent batches.
The original samples and failed summary remain. The largest median timing
increase was about 4.9% in these instrumented controls.

General non-leaf domain admission and quantile seed proofs remain open.
The bad p=1/2 quantile seed still produces 100 through import and the public
native constructor. Full release, bindings and stack qualification are open.
Hypervoxel is excluded. No push or full-plan completion is claimed.

`external-evidence-v1.json` identifies the verified raw archive and independent
physical-file expectations. Compiled outputs remain at their recorded paths.
The prior target layers were mounted read-only and independently reverified.
The agent-selected temporary allowance is 46 GiB at its original baseline;
the user-approved Disk B and log limits remain 72 GiB and 100 MiB.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'native_kernel_admission' not in current
current['updated_on']='2026-10-18'
current['native_kernel_admission']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations),'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],'compiler_floor':review['compiler_floor'],'runtime_admitted':True,'admitted_scope':review['admitted_scope'],'remaining_limitations':review['remaining_limitations'],'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':46,'logs_allowance_mib':100,'all_adverse_results_retained':True,'general_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:]
ua,ub,_=span(updated);assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:])
ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in {'.md','.py','.json'}:
        value=p.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'native kernel parameter and endpoint admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,'new_implementation_paths':sorted(new),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':30,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':46,'disk_b_allowance_gib':72,'logs_allowance_mib':100,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for p,state in states.items():
    st=Path(p).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,p
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
