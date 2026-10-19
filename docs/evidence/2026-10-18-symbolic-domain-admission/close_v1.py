"""Admit rejection-only symbolic domain contradictions after final-source checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/Disk B/csgrs/symbolic-domain-admission-20261018-v1')
PREV_B=Path('/run/media/tim/Disk B/csgrs/domain-admission-20261018-v1')
PREV_F=Path('/run/media/tim/Disk B/csgrs/domain-admission-final-20261018-v1')
P=O/'docs/evidence/2026-10-18-arithmetic-domain-admission'
E=O/'docs/evidence/2026-10-18-symbolic-domain-admission'
X=B/'external-evidence'
BASE='d9d946bc88fd657323741053df720fe207173122'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from symbolic_runner_v2 import sha,resources,reasons
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
def result(phase):return read(B/('symbolic-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v1.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_symbolic_domains.rs'}
assert len(paths)==9 and set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new|{protected}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
assert all(sha(p)==h for p,h in previous['external_evidence_files_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v2.json.gz').read_bytes()))
assert len(pins)==2668 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==20
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v1','consumers-v1','modeling-v1','msrv-v1']]
cost=read(B/'ordinary-cost-v2/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost])
assert scalar['packages']['default']['parent_tests_passed']==940
assert scalar['packages']['all']['parent_tests_passed']==1095
assert scalar['summaries']['debug-library']==[['ok','818','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==75
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
unit_output=''.join(p.read_text() for p in (B/'logs').glob('symbolic-admission-scalar-v1-all-test-*-hyperreal/stdout'))
for test in ['domain_contradictions_never_publish_conditional_facts','domain_contradiction_limits_and_abort_preserve_facts_and_recover']:
    assert test+' ... ok' in unit_output,test
baseline=read(B/'baseline-result-v2.json')
assert baseline['reproduced'] and sha(baseline['binary'])==baseline['binary_sha256']
assert 'accepted_invalid=56' in (B/'logs/symbolic-domain-baseline-v2-diagnostics/stdout').read_text()
focused=read(B/'focused-v2/result-v1.json');assert focused['passed']
assert 'test result: ok. 1 passed' in focused['summaries']['parent-valid']
assert 'test result: FAILED. 0 passed; 1 failed' in focused['summaries']['parent-invalid']
for name,count in [('serde_symbolic_domains',3),('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',6),('serde_named_certificates',5)]:
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
 'symbolic-domain-baseline-v1-compile':1,
 'symbolic-domain-baseline-v2-assertions':101,
 'symbolic-domain-focused-v1-parent-invalid':101,
 'symbolic-domain-focused-v2-parent-invalid':101,
},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1797916,921794)
roots=[B,PREV_F]
for pattern in ['prepare-symbolic-*.py','run-symbolic-*.py','symbolic-*.rs','symbolic_*.py','apply-symbolic-*.py','close-symbolic-*.py','stage-symbolic-*.py','verify-symbolic-*.py']:
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
gzwrite(expectations,{'schema_version':3,'kind':'symbolic domain contradiction admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
review={
 'decision':'Retain bounded symbolic domain contradiction checks without publishing conditional values or signs.',
 'source_parent_revision':BASE,'owners':['Hyperreal expression deserialization','Hyperreal shared bounded quotient recognizer'],
 'properties':['P1','P3','P4','P5','P6','P18','P19','P26','P35','P36','P37','P39'],
 'input_domain':'Existing partial-function and stored kernel-range admission, extended by conditional rational identities over structurally equal opaque atoms and the existing guarded quotient grammar.',
 'admitted_scope':'Reject symbolic algebraic contradictions of required domains through native and Real import, preserving valid graph bytes and existing exact proofs. Conditional proofs publish no value or sign.',
 'proof_argument':'Assume every dependency in an imported argument denotes a valid real. The existing bounded quotient projection derives an exact conditional rational identity, using structural atom identity and checked inverse guards. If that rational violates the outer required domain, the composite is undefined under the assumption; if any dependency is undefined, the composite is already undefined. Reject either way. A rational inside the requested domain proves nothing about dependency validity and is discarded. No conditional fact is published. Exact-leaf and defined-rational proofs retain their earlier behavior. Non-arithmetic opaque roots cannot project to a rational and are skipped before allocating a doomed attempt. This is an implementation argument, not a new formal verification result.',
 'acceptance':{'baseline_accepted_invalid_cases':56,'invalid_symbolic_graphs':420,'valid_symbolic_graphs':315,'arithmetic_recipes':7,'partial_and_range_variants':15,'atoms':['sin(1/2)','pi','sqrt(2)','sqrt(-atan(1)) (invalid but unproved; rejection-only rows)'],'formats':['JSON','CBOR','owned CBOR Value','borrowed CBOR Value','Serde collections'],'outer_scales':[0,1,-3],'precision_sequence':[-8,-32,-8],'valid_wire_bytes_preserved':True,'deep_valid_chain':70,'parent_valid_matrix_passed':True,'direct_candidate_tests_passed':22,'private_no_publication_and_abort_tests':2,'modeling_and_svg_regressions_executed':True,'original_opaque_regression_retained_and_now_rejected':True,'separate_unresolved_endpoint_obligation_retained':True},
 'diagnostic_migration':'Previously accepted symbolic domain contradictions now return native format errors or Problem::ParseError through Real wrappers. An undecided named certificate remains UnknownCertificate. No wire-layout change or supported valid-input reduction.',
 'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'cost':{'matched_rows':17,'iterations_per_row':100000,'pairs':5,'all_completed_contract_assertions_passed':True,'candidate_over_parent_median_latency':cost['candidate_over_parent_median_latency'],'allocation_counts_and_bytes_identical':all(cost['samples']['parent-'+str(i)][name][metric]==cost['samples']['candidate-'+str(i)][name][metric] for i in range(5) for name in cost['samples']['parent-0'] for metric in ['allocations','allocated_bytes','retained_bytes','peak_extra_bytes']),'executables_bytes':{k:v['bytes'] for k,v in cost['binaries'].items()},'matched_builds':'Parent and candidate direct rustc all-feature builds with identical compiler flags and dependency paths; parent verified against sealed E87 artifacts. Full Cargo correctness qualified separately.','interpretation':'Limited matched completed-work measurements, with every slower row retained; no general speedup claim. Correctness takes priority over measured cost.','raw_evidence':str(B/'ordinary-cost-v2/result-v1.json'),'first_candidate_adverse_results':str(B/'ordinary-cost-v1/result-v1.json'),'first_candidate_observation':'Six extra allocations per opaque import and slower import rows. Final candidate skips opaque roots that cannot project to a rational; both complete five-pair measurements retained.','general_speedup_claimed':False},
 'failed_attempts':{'baseline_compile':'The initial probe selected an older same-named serde_json dependency and rustc reported colliding StableCrateIds. Version 2 selects the highest retained matching dependency layer; original failed compile retained.','baseline_assertion':'The committed parent accepted all 56 undefined graph/wrapper cases. Expected failing assertion retained.','parent_new_regression':'Both versions of the new rejection test fail on the parent as expected; the identical valid matrix passes on parent and candidate.'},
 'resource_contract':{'proof_limits_per_attempt':{'nodes':512,'depth':64,'atoms':32,'terms':64,'degree':8,'coefficient_bits':4096,'operations':8192},'separate_fallback_after_defined_rational_declines':True,'total_parser_and_structural_matcher_work_bounded':False,'child_address_space_gib':8,'cargo_jobs':2,'focused_seconds':60,'compile_and_full_suite_seconds':1800,'disk_b_approval_sha256':sha(B/'control/storage-allowance-v1.json')},
 'remaining_limitations':['General expression domain/range validity remains unproved; sqrt(-atan(1)) still demonstrates an unknown obligation. The conditional proof cannot certify its zero product or an acosh endpoint. Existing general facts and unchecked construction still need domain ownership work.','Per-attempt recognizer limits are not complete parser, graph-allocation, structural-matcher, retained-memory or total-work bounds. Hostile tests remain externally contained.','Native unchecked partial-function construction preconditions are unchanged.','Finite tests do not establish exhaustive correctness, formal verification, coverage targets or the full ordinary-workload corpus.','Real foreign-language consumers, clean shipped-distribution validation, full geometry/DRC runtime gates and the complete properties plan remain open.','Historical missing artifacts were neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':149,'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,'next':'Continue native domain obligations and ordinary strict completion, then complete user-path and release validation.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{'exit_code':r['exit_code'],'elapsed_seconds':r['elapsed_seconds'],'wall_limit_seconds':r['wall_limit_seconds'],'stops':r['stops']} for k,r in commands.items()})
shutil.copy2(B/'control/contract-v1.md',E/'contract-v1.md')
shutil.copy2(B/'control/storage-allowance-v1.json',E/'storage-allowance-v1.json')
shutil.copy2(B/'source-pins-candidate-v2.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(__file__,E/'close_v1.py')
new_diff=subprocess.run(GIT+['diff','--no-index','--','/dev/null',next(iter(new))],cwd=O,stdout=subprocess.PIPE,check=False)
assert new_diff.returncode==1
(E/'implementation.patch').write_bytes(git('diff','--binary')+new_diff.stdout)
(E/'README.md').write_text('# E88: symbolic domain contradictions\n\nThe committed parent accepts `inverse(x - x)` for symbolic x and can publish\nan exact-zero fact when an outer zero factor hides the reciprocal. Import now\nuses bounded algebra to reject a contradiction of the required domain. The\nconditional identity publishes no value or sign and cannot certify a cancelled\ndependency. Valid graphs retain their bytes and downstream composition.\n\nThe [review](review-v1.json) records the proof argument, diagnostics, completed\nchecks, both cost measurements, failed attempts and remaining limitations.\nThe [contract](contract-v1.md) predates implementation; its retained-storage\nceiling was raised by the [explicit user approval](storage-allowance-v1.json).\nThe [checkpoint](checkpoint-v1.json) pins the final sources and evidence.\n\nAll bulky outputs remain under Disk B/csgrs. Every new physical artifact is\nhashed independently and every raw archive member is verified. Generated files\nand binaries remain at their recorded paths. Earlier missing history is not\ncredited as recovered. General domain validation, complete resource contracts,\nforeign consumers, release acceptance and the full properties plan remain open.\n')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'symbolic_domain_contradictions' not in current
current['updated_on']='2026-10-18'
current['symbolic_domain_contradictions']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','cost','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['symbolic_domain_contradictions'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in {'.md','.py','.json'}:
        value=p.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'symbolic domain contradiction admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{p:sha(O/p) for p in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':20,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':149,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for p,state in states.items():
    st=Path(p).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,p
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
