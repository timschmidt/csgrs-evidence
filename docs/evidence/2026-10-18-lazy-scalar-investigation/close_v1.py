"""Close the rejected lazy-cache experiment without admitting runtime changes."""
import ast,gzip,hashlib,json,os,re,shutil,statistics,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'scalar-ingress-control-v1';U=Path('/tmp/csgrs-scalar-ingress-20261018-v1')
P=O/'docs/evidence/2026-10-18-required-scalar-payload'
E=O/'docs/evidence/2026-10-18-lazy-scalar-investigation'
BASE='0fa83aea7aae9d57a578da0cf28299f12ca75409'
sys.path.insert(0,str(W))
from validation_runner_v2 import sha,resources,reasons
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,value):
    assert not p.exists(),p
    p.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def gzwrite(p,value):
    assert not p.exists(),p
    p.write_bytes(gzip.compress((json.dumps(value,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end()
    value,length=json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:length].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','HEAD','--name-only') and not reasons(resources())
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
inherited=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((W/'source-pins-v1.json.gz').read_bytes()))
assert len(pins)==2656 and all(sha(O/p)==h for p,h in pins.items())
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())=={protected}
receipt=read(N/'required-payload-final-commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==23
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
disposition=read(W/'candidate-disposition-v1.json');snapshot=read(W/'rejected-cache-snapshot-v1.json')
assert disposition['decision']=='rejected' and not disposition['new_runtime_admitted']
assert disposition['patch_sha256']==sha(W/'rejected-cache-candidate-v1.patch')
assert len(snapshot)==15 and all(sha(v['copy'])==v['sha256'] for v in snapshot.values())
candidate=json.loads(gzip.decompress((W/'source-pins-v7.json.gz').read_bytes()))
assert len(candidate)==2658
assert all(sha(snapshot[p]['copy'] if p in snapshot else O/p)==h for p,h in candidate.items())
def result(phase):return read(N/('scalar-ingress-'+phase)/'result-v1.json')
scalar=result('scalar-v1');focused=result('lazy-focused-v6');cost=result('cache-cost-v2')
composition=result('cache-composition-v1');owned=result('owned-fold-diagnostic-v1')
assert scalar['passed'] and focused['passed'] and cost['passed']
assert scalar['packages']['default']['parent_tests_passed']==936
assert scalar['packages']['all']['parent_tests_passed']==1055
assert scalar['summaries']['debug-library']==[['ok','819','0','0','0','0']]
assert result('lazy-baseline-v4')['summary']==[['FAILED','1','3','0','0','0']]
assert result('lazy-consumer-baseline-v1')['summary']==[['FAILED','0','1','0','0','0']]
assert owned['stdout']==composition['outputs']['owned-fold']['stdout']
assert 'scale\tNone\ndivide\tNone\nadd\tNone' in composition['outputs']['composition']['stdout']
assert len(cost['samples'])==20 and all(s['layout_bytes']==48 for s in cost['samples'])
medians={}
for case in ['exact-clone','primitive-cold','primitive-warm','primitive-warm-clone']:
    medians[case]={}
    for variant in ['baseline','candidate']:
        rows=[r for s in cost['samples'] if s['variant']==variant for r in s['rows'] if r['case']==case]
        assert len(rows)==10 and all(r['iterations']==1000000 and r['retained_bytes']==0 for r in rows)
        medians[case][variant]={k:statistics.median(r[k] for r in rows) for k in ['elapsed_ns','allocations','allocated_bytes','peak_additional_bytes']}
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
    assert all(sha(v['copy'])==v['sha256'] for v in read(manifest).values())
registry=json.loads(gzip.decompress((W/'registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
commands={}
for folder in sorted((N/'logs').glob('scalar-ingress-*')):
    r=read(folder/'result.json')
    assert r['output_closed'] and not r['stops'],folder
    assert all(sha(folder/p)==h for p,h in r['output_sha256'].items())
    commands[folder.name]=r
assert len(commands)==128
assert {k for k,v in commands.items() if v['exit_code']}=={
 'scalar-ingress-cache-cost-v1-candidate-compile','scalar-ingress-diagnostics-v1-compile',
 'scalar-ingress-lazy-baseline-v1-build','scalar-ingress-lazy-baseline-v2-run',
 'scalar-ingress-lazy-baseline-v3-run','scalar-ingress-lazy-baseline-v4-run',
 'scalar-ingress-lazy-consumer-baseline-v1-run','scalar-ingress-lazy-focused-v1-hyperreal-run'}
print('Verified source restoration, candidate results and all 128 command records.',flush=True)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1485080,921794)
roots=[U]+sorted(N.glob('scalar-ingress-*'))+sorted(N.glob('required-payload-final-*'))
for kind in ['logs','scratch']:roots+=sorted((N/kind).glob('scalar-ingress-*'))
for pattern in ['prepare-scalar-ingress-*.py','scalar-ingress-probe-*.rs','scalar-ingress-diagnostics-*.py',
 'prepare-lazy-scalar-validation-*.py','lazy-certificates-*.py','scalar-reciprocal-probe-*.rs',
 'scalar-reciprocal-diagnostic-*.py','amend-lazy-acceptance-*.py','reduce-lazy-diff-*.py',
 'prepare-lazy-checks-*.py','lazy-cache-cost-*.rs','lazy-cache-cost-*.py',
 'lazy-owned-fold-*.rs','lazy-owned-fold-*.py','lazy-cache-composition-*.rs',
 'lazy-cache-composition-*.py','retire-lazy-cache-candidate-*.py','close-lazy-scalar-investigation-*.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
assert len(roots)==len(set(roots))
selected=[]
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()))
assert len(selected)==len(set(selected))
physical={};stats={};members={};excluded={}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat()
    state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns)
    assert str(path) not in prior,path
    physical[str(path)]=digest;stats[str(path)]=state
    with path.open('rb') as stream:magic=stream.read(8)
    generated=path.is_relative_to(U/'target')
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=str(path.relative_to(N)) if path.is_relative_to(N) else 'temporary/'+str(path.relative_to('/tmp'))
    row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason']='Generated Cargo output' if generated else 'Compiled binary or library'
        excluded[name]=row
    else:members[name]=row
print(json.dumps({'new_physical_paths_hashed':len(physical),'archive_members':len(members),'generated_outputs_retained':len(excluded)}),flush=True)
assert not E.exists();E.mkdir()
review={
 'decision':'Reject lazy reconstruction cache prototype; preserve evidence and restore all production and test sources to the parent revision.',
 'source_parent_revision':BASE,'owner':'Hyperreal serialized symbolic certificates and shared Computable access; scalar conversion owns the separate owned-fold defect.',
 'properties':['P1','P2','P3','P4','P5','P6','P18','P19','P20','P26','P35','P36','P37','P39'],
 'input_domain':'All 21 valid named symbolic certificates with optional payloads, JSON/CBOR and signed outer scales; separately labelled malformed graph/certificate diagnostics.',
 'candidate_scalar_qualification':scalar['packages'],'candidate_debug_units_passed':819,
 'candidate_focused':focused['summaries'],'candidate_strict_clippy_docs_format_passed':True,
 'candidate_full_consumers_and_msrv_executed':False,
 'rejection_reasons':disposition['reason'],
 'instrumented_cost':{'process_samples':20,'order':'Five ABBA rounds','iterations_per_row':1000000,'medians':medians,'allocator_inside_timing':True,'layout_bytes':48,'no_general_native_speed_claim':True},
 'composition_outputs':composition['outputs'],'committed_owned_fold_output':owned['stdout'],
 'acceptance_workflow_migration':'The original new automatic reciprocal-equality assertion fails for ten materialized controls. The original test and probe are retained. Before production edits, a separate documented workflow uses the existing exact rational normal form and requires Some(1). This is not a pass of the original workflow; no existing test was weakened.',
 'prototype_history':'Ephemeral Cow reconstruction loses warmed proof and fails two of four focused tests. An inline OnceLock proposal was preserved but never executed because it violates the existing one-word layout contract. The tested boxed cache passes focused/scalar checks but fails composed evidence retention and adds allocation/latency cost; all fifteen modified/added source files are preserved and removed from main.',
 'remaining_defects':['Valid lazy Pi sign queries panic despite successful interval construction.','Lazy symbolic owned exp/asinh substitute the outer rational scale for the represented symbolic value.','Forged named tags and graphs can give contradictory definite facts and intervals.','Undefined expression graphs may decode, panic on refinement, or be hidden by zero multiplication.','Automatic reciprocal equality remains Unknown in ten named-class materialized controls despite an available explicit rational normal form.'],
 'resource_contract':{'root_gib':16,'disk_b_gib':72,'tmp_gib':32,'logs_mib':96,'original_baselines_unchanged':True,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800},
 'storage_migration':'The agent-selected tmp ceiling changed from 24 to 32 GiB under prior tmp authorization. Original baseline and every other limit are retained; both contracts are archived.',
 'command_records_verified':len(commands),'source_paths_verified':len(pins),'registry_physical_paths_verified':len(registry),
 'new_runtime_admitted':False,'source_restored':True,'explicit_subtraction_candidate_admitted':False,
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
 'all_adverse_results_retained':True,'historical_missing_files_reaudited':False,
 'next':'Repair owned folding using the existing Class certificate reconstruction. First reproduce directly consumed lazy values against independent mathematical bounds; preserve the separate lazy-query, cache, certificate/domain and automatic-equality obligations.',
}
dump(E/'review-v1.json',review);dump(E/'command-results-v1.json',commands)
for name in ['contract-v1.md','lazy-contract-v1.md','lazy-contract-migration-v1.md','retained-reconstruction-v1.md','tmp-contract-v2.json','rejected-cache-candidate-v1.patch']:
    shutil.copy2(W/name,E/name)
shutil.copy2(W/'source-pins-v1.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2(Path(__file__),E/'close_v1.py')
(E/'README.md').write_text('''# Lazy scalar ingress investigation

The cache prototype is rejected. Main source and tests are restored to
0fa83aea7. All 15 modified or added files and the full patch are preserved.
This checkpoint admits no implementation.

The boxed cache passed 936 default and 1,055 all-feature scalar tests,
819 debug units, 24/29 doctests, four new scalar tests, one strict predicate
regression, and the recorded strict Clippy/docs/format checks. Broader
consumer and compiler-floor scripts were prepared but not executed.

Acceptance nevertheless fails: warmed proof is lost through scaling,
division and same-class addition. Twenty matched instrumented cost samples
also show one extra 32-byte allocation per cold primitive conversion and
per warm clone, plus latency regressions in all four measured rows. The
allocation instrumentation is inside timing; no general speed claim follows.
Raw measurements, unsuccessful candidates and setup failures are retained.

An original newly proposed automatic reciprocal-equality workflow failed
ten materialized controls. The original test remains archived. A documented
pre-implementation migration instead exercises the existing explicit exact
normal form, requiring Some(1). Passing that workflow does not discharge
the automatic-equality gap. No existing test or policy was weakened.

The investigation reproduces a separate wrong-value bug on committed code:
consuming a deserialized lazy Pi through exp yields an interval near e,
and asinh yields an interval near asinh(1). Owned folding substitutes one
for the missing symbolic payload. This is the next narrow repair.

Valid lazy sign-query panics, forged certificate/graph contradictions,
undefined graph handling, and complete proof retention remain open.
Explicit affine subtraction remains withheld. Native workloads, bindings,
release validation and full-plan completion are not established here.
Hypervoxel remains excluded; no push is performed.

Every new physical artifact is independently hashed. Generated and compiled
outputs remain physically retained; sources, protocols and raw logs are
archived. These experiment roots are closed. Original storage baselines
remain, with ceilings of 16 GiB root, 72 GiB Disk B, 32 GiB tmp and 96 MiB
cumulative logs. The tmp-only migration from 24 GiB is explicit. Temporary
artifacts remain volatile; historical missing files were not recovered or
reaudited.
''')
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'every_physical_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'rejected lazy scalar cache investigation','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'lazy_scalar_ingress_investigation' not in current
current['updated_on']='2026-10-18'
current['lazy_scalar_ingress_investigation']={
 'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz',
 'candidate_scalar_qualification':scalar['packages'],'candidate_debug_units_passed':819,'candidate_rejected':True,'source_restored':True,'new_runtime_admitted':False,'explicit_subtraction_candidate_admitted':False,'remaining_defects':review['remaining_defects'],
 'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':32,'all_adverse_results_retained':True,'performance_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        content=path.read_text();assert all(line==line.rstrip() for line in content.splitlines()) and not content.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(content)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    check=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert check.returncode==0
record={
 'status':review['decision'],'checkpoint_kind':'rejected lazy scalar cache investigation','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
 'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},
 'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),
 'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
 'inherited_implementation_sha256':inherited,'implementation_sha256':{},'restored_native_sha256':previous['restored_native_sha256'],
 'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz',
 'source_changes_applied':False,'production_rust_sources_unchanged':True,'new_implementation_admission':False,'runtime_admitted':False,'source_restored_to':BASE,
 'explicit_subtraction_candidate_admitted':False,'required_opaque_payload_admitted':True,'present_graph_domain_validation_complete':False,
 'qualification_this_checkpoint':review,'main_runtime_tests_rerun':False,'candidate_runtime_tests_rerun':True,'historical_main_qualification':str((P/'checkpoint-v1.json').relative_to(O)),
 'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'prior_commit_verified_blobs':23,
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':32,'disk_b_allowance_gib':72,'performance_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in stats.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'candidate_rejected':True,'main_source_unchanged':True}),flush=True)
