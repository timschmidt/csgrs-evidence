"""Close the native quantile certification repair after final-source checks."""
import ast,difflib,gzip,hashlib,json,os,re,shutil,stat,statistics,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
W=N/'quantile-admission-control-v1';B=V/'quantile-admission-validation-v1'
DB=Path('/run/media/tim/Disk B/csgrs')
DATA=DB/'development-artifacts-2026-10-18-v1';RC=DB/'relocation-2026-10-18-v1'
U=Path('/tmp/csgrs-quantile-admission-20261018-v1').resolve();X=B/'external-evidence'
P=O/'docs/evidence/2026-10-18-kernel-admission'
E=O/'docs/evidence/2026-10-18-quantile-admission'
BASE='a91983ad7966651ce9ec4f9b0d932db699735429'
sys.path.insert(0,str(W))
from quantile_admission_runner_v6 import sha,resources,reasons
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
def result(phase,version=1):return read(B/('quantile-admission-'+phase)/('result-v'+str(version)+'.json'))

assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--cached','--name-only') and not reasons(resources())
paths=set(read(B/'cargo-preparation-v4.json')['candidate_paths']);assert len(paths)==5
new={'crates/hyperreal/tests/normal_quantile_evidence.rs'}
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
pins=json.loads(gzip.decompress((B/'source-pins-candidate-v4.json.gz').read_bytes()))
assert len(pins)==2666 and all(sha(O/p)==h for p,h in pins.items())
receipt=read(V/'kernel-admission-final-v1/commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==20
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
focused,scalar,consumers,modeling,msrv,ordinary,cost,near_half=[result(p) for p in ['candidate-v4','scalar-v2','consumers-v3','modeling-v1','msrv-v1','ordinary-cost-v1','quantile-cost-v1','near-half-v1']]
assert all(r['passed'] for r in [focused,scalar,consumers,modeling,msrv,ordinary,cost,near_half])
assert focused['summaries']==[['ok','7','0','0','0','0']]
assert result('baseline-v2')['summaries']==[['FAILED','0','2','0','0','2']]
baseline=read(B/'baseline-result-v1.json')
assert baseline['revision']==BASE and all(row['incorrect_result_reproduced'] for row in baseline['results'].values())
assert scalar['packages']['default']['parent_tests_passed']==940
assert scalar['packages']['all']['parent_tests_passed']==1084
assert scalar['summaries']['debug-library']==[['ok','818','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==366 and consumers['packages']['hypercircuit']['passed']==60
assert near_half['cases']==18
assert result('diagnostics-v1')['passed'] and result('diagnostics-v1')['unchanged_baseline_probe']
assert sum(int(rows[-1][1]) for rows in modeling['summaries'].values())==73
assert ordinary['completed_outputs_checked'] and len(ordinary['samples']['baseline-0'])==17
assert cost['completed_outputs_checked'] and len(cost['samples']['baseline-0'])==8
rejected_composition=result('large-cdf-v2')
repaired_composition=result('large-cdf-v3')
assert rejected_composition['cases']['baseline']['completed_exact_identity']
assert rejected_composition['cases']['candidate']['command']['stops']==['wall_seconds']
assert all(row['completed_exact_identity'] for row in repaired_composition['cases'].values())
assert repaired_composition['source_sha256']==rejected_composition['source_sha256']
assert repaired_composition['wall_seconds_unchanged']==rejected_composition['wall_seconds_unchanged']==60
rejected_upper=json.loads(gzip.decompress((B/'rejected-upper-v1-sha256.json.gz').read_bytes()))
assert len(rejected_upper)==11413 and all(sha(p)==digest for p,digest in rejected_upper.items())
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
    assert record['output_closed'],folder
    allowed_stops=['wall_seconds'] if folder.name=='quantile-admission-large-cdf-v2-candidate-run' else []
    assert record['stops']==allowed_stops,folder
    assert all(sha(folder/p)==h for p,h in record['output_sha256'].items())
    commands[folder.name]=record
failures={k:r['exit_code'] for k,r in commands.items() if r['exit_code']}
expected_failures={
 'quantile-admission-baseline-v1-test-compile':1,
 'quantile-admission-baseline-v2-test-run':101,
 'quantile-admission-large-cdf-v1-baseline-compile':1,
 'quantile-admission-large-cdf-v2-candidate-run':-15,
 'quantile-admission-consumers-v2-hypercircuit-build':101,
}
assert failures==expected_failures,failures
print('Verified final-source results, preserved failed candidates and immutable lower targets.',flush=True)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1579635,921794)
relocation=read(RC/'result-v1.json');relocation_plan=read(RC/'plan-v1.json')
assert relocation['passed'] and len(relocation['relocations'])==27
assert relocation['plan_sha256']==sha(RC/'plan-v1.json')
assert relocation_plan['disk_b_allowance_gib']==145 and not relocation_plan['original_baselines_reset']
relocated_leaves={};relocated_metadata={}
for index,moved in enumerate(relocation['relocations']):
    source=Path(moved['source']);destination=Path(moved['destination'])
    assert source.is_symlink() and source.resolve()==destination
    manifest=RC/(f'{index:02d}-{source.name}-v2')/'destination-inventory-v1.json.gz'
    assert sha(manifest)==moved['destination_inventory_sha256'],manifest
    original=json.loads(gzip.decompress(manifest.read_bytes()))
    assert len(original)==moved['paths']
    for relative,row in original.items():
        p=destination/relative
        if row['kind']=='file':relocated_leaves[str(p)]=row
        elif row['kind']!='directory':relocated_metadata[str(p)]=row
assert len(relocated_leaves)==188224 and len(relocated_metadata)==7529
roots=[DATA,RC,DB/'relocate_ephemera_v1.py',DB/'relocate_ephemera_v2.py',W,B,V/'kernel-admission-final-v1']
for pattern in ['prepare-quantile-*.py','quantile-*.py','quantile-*.rs','run-quantile-*.py','amend-quantile-*.py','close-quantile-*.py','stage-quantile-*.py','verify-quantile-*.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
roots=sorted(set(roots));selected=[]
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if (not p.is_dir() or p.is_symlink()) and not p.is_relative_to(X)])
assert len(selected)==len(set(selected))
physical={};states={};members={};excluded={};special_entries={}
for p in selected:
    metadata=p.lstat()
    if not stat.S_ISREG(metadata.st_mode):
        assert stat.S_ISCHR(metadata.st_mode) and metadata.st_rdev==0,p
        special_entries[str(p)]={'kind':'overlay_whiteout','mode':stat.S_IMODE(metadata.st_mode),'rdev':0}
        continue
    assert not p.is_symlink() and str(p) not in prior,p
    before=p.stat();digest=sha(p);after=p.stat()
    state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns),p
    physical[str(p)]=digest;states[str(p)]=state
    if len(physical)%10000==0:
        assert not reasons(resources())
        print(json.dumps({'physical_files_rehashed':len(physical)}),flush=True)
    if str(p) in relocated_leaves:
        old=relocated_leaves[str(p)]
        assert (digest,after.st_size,stat.S_IMODE(after.st_mode))==(old['sha256'],old['size'],old['mode']),p
    with p.open('rb') as f:magic=f.read(8)
    generated=p.is_relative_to(U) and any(part.startswith(('overlay-upper','overlay-modeling-upper','overlay-msrv-upper','target')) for part in p.relative_to(U).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    historical_relocated=p.is_relative_to(DATA) and not p.is_relative_to(U)
    name=('relocated/'+str(p.relative_to(DB)) if p.is_relative_to(DB) else 'disk-b/'+str(p.relative_to(V)) if p.is_relative_to(V) else str(p.relative_to(N)) if p.is_relative_to(N) else 'temporary/'+str(p.relative_to('/tmp')))
    row={'physical_path':str(p),'sha256':digest,'bytes':after.st_size}
    if generated or compiled or historical_relocated:
        row['archive_exclusion_reason']='Relocated historical artifacts; independently verified source/destination inventories and prior archives are preserved' if historical_relocated else 'Generated Cargo output' if generated else 'Compiled binary or library';excluded[name]=row
    else:members[name]=row
assert set(relocated_leaves)<=set(physical)
assert all(special_entries[p]['kind']==row['kind'] and special_entries[p]['mode']==row['mode'] and special_entries[p]['rdev']==row['rdev'] for p,row in relocated_metadata.items())
print(json.dumps({'new_paths_hashed_independently':len(physical),'archive_members':len(members),'compiled_or_generated_retained':len(excluded)}),flush=True)
assert not X.exists();X.mkdir()
archive=X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz',dereference=True) as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
gzwrite(X/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'nonregular_overlay_entries':special_entries,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
dump(X/'relocation-verification-v1.json',{'plan_sha256':sha(RC/'plan-v1.json'),'result_sha256':sha(RC/'result-v1.json'),'relocated_directories':27,'original_regular_files_reverified':len(relocated_leaves),'original_overlay_whiteouts_reverified':len(relocated_metadata),'source_aliases_verified':True,'new_physical_paths_recorded':True,'inherited_logical_paths_preserved_as_aliases':True,'historically_missing_files_recovered':False,'new_paths_added_after_move':True,'old_leaf_contents_and_modes_unchanged':True})
expectations=X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'native quantile certification','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
assert not E.exists();E.mkdir()
external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'path_count':len(physical),'content_verified':True,'original_storage_baselines_unchanged':True,'portable_distribution_evidence':False})
ratios={}
for group,measurements in [('ordinary',ordinary),('quantile',cost)]:
    ratios[group]={}
    for name in measurements['samples']['baseline-0']:
        a=[measurements['samples']['baseline-'+str(i)][name] for i in range(5)]
        b=[measurements['samples']['candidate-'+str(i)][name] for i in range(5)]
        ratios[group][name]={'baseline_nanoseconds':[row['nanoseconds'] for row in a],'candidate_nanoseconds':[row['nanoseconds'] for row in b],'ratio_of_medians':statistics.median(row['nanoseconds'] for row in b)/statistics.median(row['nanoseconds'] for row in a),'baseline_complete_rows':a,'candidate_complete_rows':b}
review={
 'decision':'Retain native CDF-certified normal quantiles, safeguarded Newton iteration, monotone fallback and exact half-probability/CDF composition identities.',
 'source_parent_revision':BASE,'owners':['Hyperreal normal-quantile approximation','Hyperreal constructors and structural facts'],
 'properties':['P1','P2','P3','P4','P5','P6','P18','P19','P20','P25','P26','P27','P35','P36','P37','P39'],
 'input_domain':'Defined computable probabilities strictly between zero and one, with arbitrary seed integers and binary scales. The existing Real probability/tail admission contract is unchanged. General native expression-domain and extreme precision/resource bounds remain open.',
 'admitted_scope':'A seed or Newton proposal cannot publish a certified approximation by itself. Native, imported and wrapped quantiles use CDF enclosures or a verified retained construction identity. Exact half-probability and recognized rational-CDF inverses compose without refinement.',
 'proof_argument':'For a trial at precision p-2, strict CDF bounds at trial +/- 2 units enclose the root within half a result ulp. Rounding the trial adds at most half an ulp. Comparisons require a gap greater than the sum of the two approximation errors. Monotonicity supplies search direction; an exact midpoint comparison can decline while the neighboring bracket certifies. A bracket of width at most one result ulp permits midpoint rounding with total error at most one ulp. Newton only proposes points inside a previously certified bracket. The bounded scalar normalizer may suggest a rational inverse from a retained erf argument; structural equality with a complete reconstructed native CDF proves that identity independently of the seed. This is an implementation argument conditional on the native CDF approximation contract, not a new formal verification result.',
 'acceptance':{'new_tests_passed':7,'baseline_endpoint_tests_failed':2,'independent_oracle':'MPFR erfc at 384 bits; independent existing 1000-digit mpmath fixtures','interior_and_tail_probability_recipes':6,'seed_recipes':5,'representations':['native','JSON','CBOR'],'precision_sequence':[0,-80,0],'concurrent_threads':4,'concurrent_queries':16,'preexisting_abort_and_recovery':True,'half_probability_downstream_division_and_addition':True,'near_half_cases':18,'near_half_oracle':'1/6 < normal density < 1/2 on [-1,1]','valid_graph_bytes_preserved':True,'rational_cdf_composition_cases':54,'altered_cdf_graph_rejected_as_identity':True,'exact_cdf_downstream_rational_inverse':True},
 'migration':'Seeds are retained evaluation hints rather than certified values. Imported valid graph bytes remain unchanged. The native constructor now canonicalizes exact half probability to zero and recognized rational-CDF inverses to their exact values. Approximation integers may change within their documented one-ulp contract; this is a correctness repair, not a performance-only or identical-serialization claim for those native exact constructions.',
 'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'consumer_features':consumers['feature_gate_matrix'],'modeling':modeling['summaries'],
 'modeling_method':'Cargo builds the public modeling library in minimal and curve,sdf,metaballs,svg-io configurations; rustc compiles the unchanged integration sources against those exact libraries. Unrelated competitive C++ dev dependencies and the full root CI matrix are not covered.',
 'compiler_floor':{'compiler':'1.95.0','all_targets':['hyperreal','hyperlimit','hypercurve'],'features':['all','no-default'],'modeling_library':['no-default','curve,sdf,metaballs,svg-io'],'runtime_or_clippy_on_floor_run':False},
 'strict_clippy_passed':['Hyperreal default/all all-targets','Hyperlimit all all-targets','Hypercurve SVG all-targets','Hypercircuit interchange all-targets','Hypercircuit geometry/all curved_outline','CSGRS minimal and fields/SVG libraries'],
 'docs_and_format_passed':True,'cost_controls':ratios,'cost_protocol':read(B/'cost-protocol-v1.json'),'cost_interpretation':'The original 17 controls preserve their 100000-iteration workload. Eight quantile rows each perform 1000 successful operations, with five alternating pairs and independent 96-bit enclosure checks. Fresh and warm scope, materialization and destruction are explicit. All allocation, retention, peak, latency and size results remain, including regressions. No general speedup is claimed; the correctness repair determines retention.',
 'binary_bytes':{group:{k:v['bytes'] for k,v in measurements['binaries'].items()} for group,measurements in [('ordinary',ordinary),('quantile',cost)]},'layout_bytes':48,'general_speedup_claimed':False,
 'composition_rejection_and_repair':{'rejected':rejected_composition,'repaired':repaired_composition,'unchanged_source_and_budget_verified':True,'rejected_upper_files_preserved':len(rejected_upper)},
 'storage_relocation':{'plan':relocation_plan,'result_sha256':sha(RC/'result-v1.json'),'relocated_directories':27,'original_regular_files_reverified':len(relocated_leaves),'compatibility_paths_preserved':True,'new_build_target':str(U/'target-v3'),'old_upper_immutable':True,'separate_mutable_copy':read(B/'cargo-preparation-v4.json'),'repository_target_not_moved_due_capacity':True},
 'environmental_failure':{'failed_command':'quantile-admission-consumers-v2-hypercircuit-build','exit_code':101,'compiler_diagnostic':'rustc-LLVM ERROR: IO failure on output stream: Input/output error','diagnosis':'A simultaneous quota report showed the per-user tmpfs allocation at its 51490 MiB limit, and a sandbox creation attempt reported Quota exceeded. This supports an environmental quota diagnosis; the compiler and FUSE output did not identify that cause directly.','recovery':'User-authorized relocation to Disk B; unchanged candidate-v4 source and complete consumer workloads rerun in consumers-v3. Old failed outputs preserved.','superseded_unexecuted_helper':'quota_recovery_v1.py planned a separate /dev/shm build but was never executed.'},
 'adverse_results':['The first final-source consumer pass failed during the Hypercircuit compile with an I/O error at an observed full per-user temporary-storage quota. Its partial outputs and successful preceding checks remain; the complete unchanged consumer matrix passed after relocation.','The first large-CDF probe used a private constructor and did not compile; its public-constructor correction retained the same value and workload.','Candidate-v2 passed its scalar and consumer suites but exhausted the original 60-second quantile(CDF(1000)) workload that the parent completed. Candidate-v2 is rejected. Candidate-v4 restores the unchanged composition through a checked structural CDF identity; both builds and all failed evidence remain.','The initial regression tried to call a private cache method and did not compile. The failed source and compiler output remain. The corrected public test checks absent sign evidence and successful independent-oracle recovery.','Both new endpoint tests fail on the parent revision. Fresh constructor and imported-graph diagnostics reproduce the false 100 approximation and [99,101] interval for inverse-CDF(1/2).','CDF certification adds work to successful quantile evaluation. All measured timing and allocation increases remain in cost_controls; they are not represented as optimizations.'],
 'resource_contract':{'root_gib':16,'disk_b_gib':145,'tmp_gib':58,'logs_mib':200,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800,'original_baselines_unchanged':True},
 'resource_limitations':'Trial magnitudes only choose guard precision; they never prove a result. General import, extreme requested precisions, coefficients, expression growth and total work remain externally contained. Cancellation uses the existing raw approximation signal interface; typed cancellation and exhaustion for all native evaluation are not established by these tests.',
 'tmp_amendment':read(W/'tmp-contract-v3.json'),'log_amendment':read(W/'log-allowance-v2.json'),'overlay_results':overlays,'source_paths_verified':len(pins),'registry_paths_verified':len(registry),'command_records_verified':len(commands),'all_adverse_results_retained':True,
 'remaining_limitations':['General non-leaf domain/range admission remains open, including the earlier false zero fact on an undefined zero product.','The native quantile constructor still requires a defined probability in its mathematical domain; this patch does not add a general typed domain validator.','Finite tests and independent numerical oracles do not establish complete producer verification or all expression/precision/resource behavior.','Full geometry/DRC runtime gates, actual foreign-language consumers, clean shipped-distribution validation and the full properties plan remain open.','Historical missing artifacts were not reaudited or recovered. Present build artifacts moved to Disk B with verified compatibility aliases; small helper scripts still have temporary paths.'],
 'next':'Continue native domain obligations and ordinary strict-mode completion, then the complete external user-path and release validation.',
 'runtime_admitted':True,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
}
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{k:{field:r[field] for field in ['exit_code','elapsed_seconds','stops','output_sha256']} for k,r in commands.items()})
for source,dest in [(W/'contract-v1.md','contract-v1.md'),(W/'composition-repair-contract-v1.json','composition-repair-contract-v1.json'),(W/'tmp-contract-v3.json','tmp-contract-v3.json'),(W/'log-allowance-v2.json','log-allowance-v2.json'),(RC/'plan-v1.json','relocation-plan-v1.json'),(RC/'result-v1.json','relocation-result-v1.json'),(X/'relocation-verification-v1.json','relocation-verification-v1.json'),(B/'source-pins-candidate-v4.json.gz','source-pins-v1.json.gz'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/dest)
patch=git('diff','HEAD','--',*sorted(paths-new)).decode()
for p in sorted(new):patch+=''.join(difflib.unified_diff([], (O/p).read_text().splitlines(keepends=True),fromfile='/dev/null',tofile='b/'+p))
(E/'implementation.patch').write_text(patch)
(E/'README.md').write_text("""# Native quantile certification (E86)

Normal-quantile seeds and Newton steps now propose values; native CDF bounds
or verified retained CDF identities certify published approximations. Monotone search repairs bad seeds.
Exact half probability stays zero through imports and downstream arithmetic.
Recognized rational CDF inverses stay exact without evaluating tiny tails.
Valid stored graph bytes are preserved. Native exact constructions now return
canonical rational values, an explicit correctness migration.

The parent revision freshly reproduces 100 and the false interval [99,101]
for inverse-CDF(1/2). New tests cover both tails, extreme seed scales, MPFR
enclosures, serialization, concurrent refinement and cancellation recovery.
The unchanged thousand-digit mpmath reference cases pass. Additional near-half
checks distinguish coarse numerical zero from an exact zero fact.

Candidate-v2 is rejected: it exhausted the unchanged 60-second
quantile(CDF(1000)) workload that the parent completed. Candidate-v4 restores
that composition through a checked CDF identity. Tests reject an altered
CDF graph that only resembles the valid identity. Both builds remain retained.

The review records full scalar checks, selected predicate/curve/circuit and
modeling consumers, Rust 1.95, strict lint, documentation and formatting.
Matched controls preserve completed workloads and retain every cost increase.
The general native domain/resource contract, full bindings, distribution and
release validation remain open. Hypervoxel is excluded.

External manifests identify independently hashed physical files and a verified
raw archive. Closed build layers remain read-only. Original storage baselines
persist: root 16 GiB, agent-selected temporary storage 58 GiB, and the
user-approved cumulative log allowance of 200 MiB. The user requested moving
bulky ephemera to Disk B/csgrs; 27 directories (about 65 GiB allocated) moved
only after independent source and destination verification. Compatibility
symlinks retain the old paths. The derived Disk B allowance is 145 GiB,
including the previous 72 GiB, moved storage and 8 GiB of headroom. Original
free-space baselines were not reset.

The earlier final-source consumer build stopped with an I/O error while the
per-user temporary quota was full. That failed build remains preserved. A
separate mutable Disk B copy passed the complete unchanged consumer checks.
All 188224 relocated regular files and 7529 whiteouts were rechecked at
closure. The repository target remains in place because it exceeds Disk B
capacity. No historical missing artifact was recovered or newly credited.
""")
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
a,b,current=span(raw);ra,rb,_=span(reference)
assert (raw[:a],raw[b:])==(reference[:ra],reference[rb:])
assert 'native_quantile_certification' not in current
current['updated_on']='2026-10-18'
current['native_quantile_certification']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations),'scalar_cargo':scalar['packages'],'debug_units_passed':818,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'modeling':modeling['summaries'],'compiler_floor':review['compiler_floor'],'runtime_admitted':True,'admitted_scope':review['admitted_scope'],'remaining_limitations':review['remaining_limitations'],'storage_baselines_reset':False,'disk_b_allowance_gib':145,'storage_relocation':prefix+'relocation-verification-v1.json','tmp_allowance_gib':58,'logs_allowance_mib':200,'all_adverse_results_retained':True,'general_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
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
record={'status':review['decision'],'checkpoint_kind':'native quantile certification','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,'new_implementation_paths':sorted(new),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'external_evidence_sealed_separately':str(X),'prior_commit_verified_blobs':20,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':145,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for p,state in states.items():
    st=Path(p).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,p
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'runtime_admitted':True,'full_plan_complete':False}),flush=True)
