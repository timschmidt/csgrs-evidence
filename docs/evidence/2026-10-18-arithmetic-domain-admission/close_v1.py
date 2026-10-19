"""Admit bounded rational graph domains after final-source qualification."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
B=Path('/run/media/tim/Disk B/csgrs/domain-admission-20261018-v1')
P=O/'docs/evidence/2026-10-18-quantile-admission'
E=O/'docs/evidence/2026-10-18-arithmetic-domain-admission'
X=B/'external-evidence'
BASE='e417fdbeacc8e8f9731c65082ddefcee251d87c6'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from domain_runner_v1 import sha,resources,reasons
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
def result(phase):return read(B/('domain-admission-'+phase)/'result-v1.json')

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v2.json')['candidate_paths'])
new={'crates/hyperreal/tests/serde_arithmetic_domains.rs'}
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
assert len(pins)==2667 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(V/'quantile-admission-final-v1/commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==23
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar,consumers,modeling,msrv=[result(p) for p in ['scalar-v2','consumers-v2','modeling-v2','msrv-v1']]
cost=read(B/'ordinary-cost-v3/result-v1.json')
assert all(r['passed'] for r in [scalar,consumers,modeling,msrv,cost])
assert scalar['packages']['default']['parent_tests_passed']==940
assert scalar['packages']['all']['parent_tests_passed']==1089
assert scalar['summaries']['debug-library']==[['ok','818','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert sum(int(r[-1][1]) for r in modeling['summaries'].values())==74
assert cost['all_completed_output_assertions_passed'] and len(cost['samples']['parent-0'])==17
baseline=read(B/'baseline-result-v1.json')
assert baseline['reproduced'] and sha(baseline['binary'])==baseline['binary_sha256']
assert 'accepted-invalid-inputs\t52' in (B/'logs/domain-baseline-v1-diagnostics/stdout').read_text()
assert 'test result: ok. 1 passed' in (B/'logs/domain-parent-v2-valid/stdout').read_text()
assert 'assertion failed: serde_json::from_value::<Computable>(invalid).is_err()' in (B/'logs/domain-parent-v2-limits/stderr').read_text()
for name,count in [('serde_arithmetic_domains',4),('serde_graph_domains',4),('serde_kernel_invariants',5),('serde_named_certificates',5)]:
    assert f'test result: ok. {count} passed' in (B/'logs'/('domain-focused-v1-'+name+'-candidate-v1-test')/'stdout').read_text()
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
        assert folder.name=='domain-admission-scalar-v1-default-build' and not list(folder.iterdir())
        prelaunch.append(folder.name);continue
    record=read(folder/'result.json')
    assert record['output_closed'] and not record['stops'],folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
assert failures=={'domain-baseline-v1-assertions':101,'domain-focused-v1-serde_arithmetic_domains-parent-v1-compile':1,'domain-parent-v2-limits':101},failures
print('Verified final source, test outcomes, retained failures, compiler inputs and previous commit.',flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1786314,921794)
roots=[B,V/'quantile-admission-final-v1']
for pattern in ['prepare-domain-*.py','run-domain-*.py','domain-*.rs','domain_*.py','close-domain-*.py','stage-domain-*.py','verify-domain-*.py']:
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
    name=str(p.relative_to(B)) if p.is_relative_to(B) else 'prior-final/'+str(p.relative_to(V/'quantile-admission-final-v1')) if p.is_relative_to(V/'quantile-admission-final-v1') else 'temporary/'+p.name
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
gzwrite(expectations,{'schema_version':3,'kind':'bounded rational graph domain admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
review={
 'decision':'Retain shared bounded rational proofs at native graph admission; reject known invalid domains and small-kernel ranges before outer identities or wrappers publish a value.',
 'source_parent_revision':BASE,'owners':['Hyperreal native expression deserialization','Hyperreal shared defined rational quotient evaluator'],
 'properties':['P1','P3','P4','P5','P6','P18','P19','P26','P35','P36','P37','P39'],
 'input_domain':'Existing exact-rational argument checks plus defined rational Add, Multiply, Square, Negate, Offset, LinearCombination3 and nonzero-denominator Inverse expressions admitted by the existing bounded evaluator.',
 'admitted_scope':'Reject proved domain/range violations before importing Computable or Real. Preserve valid graph bytes, existing exact-leaf proofs, and genuinely undecided named-certificate diagnostics.',
 'proof_argument':'For each partial function, inspect its already-decoded child using existing exact proofs, then the shared rational-only quotient evaluator. The evaluator checks every operand and inverse denominator before simplifying products or sums, admits no opaque atoms and performs exact arithmetic under its existing limits. A proved rational outside the existing mathematical domain or private kernel range fails decoding. No inferred validity, invalidity or zero is published when recognition declines. This is an implementation argument, not new formal verification.',
 'acceptance':{'invalid_arithmetic_graphs':224,'valid_arithmetic_graphs':301,'arithmetic_recipes':7,'formats':['JSON','CBOR','owned CBOR Value','borrowed CBOR Value','Serde collections'],'outer_scales':[0,1,-3],'precision_sequence':[-8,-32,-8],'valid_wire_bytes_preserved':True,'large_leaf_bits':5001,'deep_valid_chain':70,'previously_supported_valid_matrix_passed_on_parent':True,'direct_candidate_tests_passed':18,'modeling_and_svg_regressions_executed':True},
 'diagnostic_migration':'Previously accepted invalid rational arithmetic, and an invalid named Exp payload previously returning UnknownCertificate, now fail with ParseError. Unproved opaque named equality still returns UnknownCertificate. Wire layout and valid supported inputs are unchanged.',
 'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'cost':{'matched_rows':17,'iterations_per_row':100000,'pairs':5,'all_completed_contract_assertions_passed':True,'candidate_over_parent_median_latency':cost['candidate_over_parent_median_latency'],'allocation_counts_and_bytes_identical':all(cost['samples']['parent-'+str(i)][name][metric]==cost['samples']['candidate-'+str(i)][name][metric] for i in range(5) for name in cost['samples']['parent-0'] for metric in ['allocations','allocated_bytes','retained_bytes','peak_extra_bytes']),'executables_bytes':{k:v['bytes'] for k,v in cost['binaries'].items()},'interpretation':'Limited matched measurements, including all slower rows; no general speedup claim. Correctness repair takes precedence over the reported cost increases.','raw_evidence':str(B/'ordinary-cost-v3/result-v1.json'),'general_speedup_claimed':False},
 'failed_attempts':{'baseline_assertion':'Expected 52 invalid-input acceptance failures on the committed parent.','parent_link':'Missing parent dependency directory in the direct compiler command; fixed without source or workload change.','parent_limits':'Valid large/deep inputs pass; the final newly required rejection assertion fails on the parent as expected.','scalar_preflight':'Scratch-directory collision before a Cargo process launched; separate scratch directories repair the harness.','cost_parser':'The first completed parent sample was retained after the parser mistook its completion marker for a numerical row. A second helper stopped before compilation because its parent-reference path was wrong. Version 3 fixes the harness and reruns the same full five alternating pairs; no workload, policy, iteration count or benchmark source changed.'},
 'remaining_limitations':['General opaque-expression domain/range validation remains open; a preserved unresolved-opaque regression still demonstrates why cached zero alone is not a domain proof.','The optional rational recognizer is bounded per attempt; parsing, graph allocation, direct large leaves and total import work do not have a complete internal resource/cancellation contract.','Native unchecked partial-function construction preconditions are unchanged.','This finite matrix does not establish exhaustive correctness, formal verification, coverage targets or the entire useful-workload corpus.','Real foreign-language consumers, clean shipped-distribution validation, full geometry/DRC runtime gates and the complete properties plan remain open.','Historical missing artifacts were neither reaudited nor recovered.'],
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'storage_baselines_reset':False,'disk_b_allowance_gib':145,'tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,'next':'Continue unresolved native domain obligations and ordinary strict completion, then complete user-path and release validation.'}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{'exit_code':r['exit_code'],'elapsed_seconds':r['elapsed_seconds'],'wall_limit_seconds':r['wall_limit_seconds'],'stops':r['stops']} for k,r in commands.items()})
shutil.copy2(B/'control/contract-v1.md',E/'contract-v1.md')
shutil.copy2(B/'source-pins-candidate-v2.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(__file__,E/'close_v1.py')
new_diff=subprocess.run(GIT+['diff','--no-index','--','/dev/null',next(iter(new))],cwd=O,stdout=subprocess.PIPE,check=False)
assert new_diff.returncode==1
(E/'implementation.patch').write_bytes(git('diff','--binary')+new_diff.stdout)
(E/'README.md').write_text('''# E87: bounded rational graph domain admission

The committed parent accepts `0 * inverse(1 + (-1))` and publishes an exact-zero
fact. The shared decoder now rejects rational arithmetic domain/range violations
before an outer identity, scale, named certificate, or modeling wrapper can hide
them. Valid graphs retain their bytes and supported downstream operations.

The [review](review-v1.json) records the input domain, diagnostic migration,
proof argument, completed checks, cost measurements, retained failures and
remaining limits. The [contract](contract-v1.md) predates implementation.
The [checkpoint](checkpoint-v1.json) pins sources and external evidence.

All new builds and bulky evidence are retained under Disk B/csgrs. Every new
physical artifact is hashed independently; the raw archive is verified member
by member. Generated files and compiled binaries remain at their recorded paths.
Earlier missing history is not credited as recovered. This is a local admission
checkpoint, not a release, whole-parser validation, or completion of the plan.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'arithmetic_graph_domain_admission' not in current
current['updated_on']='2026-10-18'
current['arithmetic_graph_domain_admission']={k:review[k] for k in ['decision','admitted_scope','scalar_cargo','debug_units_passed','consumers','curve_tests','modeling','compiler_floor','cost','remaining_limitations','full_plan_complete','public_distribution_complete','hypervoxel_deferred_by_user','storage_baselines_reset','disk_b_allowance_gib','tmp_allowance_gib','logs_allowance_mib','all_adverse_results_retained','next']}
current['arithmetic_graph_domain_admission'].update(parent_revision=BASE,review=prefix+'review-v1.json',checkpoint=prefix+'checkpoint-v1.json',artifact_expectations=str(expectations),runtime_admitted=True,general_speedup_claimed=False)
updated=raw[:a]+json.dumps(current,indent=2).encode()+raw[b:];ua,ub,_=span(updated)
assert (updated[:ua],updated[ub:])==(reference[:ra],reference[rb:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in {'.md','.py','.json'}:
        value=p.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(value)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['decision'],'checkpoint_kind':'bounded rational graph domain admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':48478,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{p:sha(O/p) for p in paths},'new_implementation_paths':sorted(new),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':23,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':145,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for p,state in states.items():
    st=Path(p).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,p
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
