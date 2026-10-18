"""Admit the narrow owned-fold repair after final-source validation."""
import ast,difflib,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs');N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'owned-fold-control-v1';U=Path('/tmp/csgrs-owned-fold-20261018-v1')
P=O/'docs/evidence/2026-10-18-lazy-scalar-investigation';E=O/'docs/evidence/2026-10-18-owned-symbolic-folding'
BASE='39bdea5aed282e76d9639535e41d00ae9a2cec15'
sys.path.insert(0,str(W))
from validation_runner_v2 import sha,resources,reasons
sys.path.insert(0,str(O/'docs/evidence/2026-10-17-resume-integration'))
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*a):return subprocess.check_output(GIT+list(a),cwd=O)
def read(p):return json.loads(Path(p).read_text())
def dump(p,value):
    assert not p.exists(),p
    p.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def gzwrite(p,value):
    assert not p.exists(),p
    p.write_bytes(gzip.compress((json.dumps(value,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end();value,length=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:length].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE and not git('diff','--cached','--name-only') and not reasons(resources())
implementation={p:sha(O/p) for p in ['crates/hyperreal/src/real/arithmetic/classification.rs','crates/hyperreal/src/real/convert.rs','crates/hyperreal/tests/serde_owned_folding.rs']}
new='crates/hyperreal/tests/serde_owned_folding.rs'
assert set(git('diff','HEAD','--name-only').decode().splitlines())==set(implementation)-{new}
previous=read(P/'checkpoint-v1.json');assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
inherited={p:h for p,h in previous['inherited_implementation_sha256'].items() if p not in implementation}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((W/'source-pins-v4.json.gz').read_bytes()));assert len(pins)==2657 and all(sha(O/p)==h for p,h in pins.items())
baseline_pins=json.loads(gzip.decompress((W/'source-pins-v3.json.gz').read_bytes()));assert baseline_pins[new]==pins[new]
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py';assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())=={protected,new}
receipt=read(N/'lazy-scalar-final-commit-verification-v1.json');assert receipt['commit']==BASE and receipt['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
def result(phase):return read(N/('owned-fold-'+phase)/'result-v1.json')
baseline=result('baseline-v2');focused=result('focused-v1');scalar=result('scalar-v1');consumers=result('consumers-v1');msrv=result('msrv-v1')
assert baseline['summary']==[['FAILED','1','4','0','0','0']]
assert all(r['passed'] for r in [focused,scalar,consumers,msrv])
assert scalar['packages']['default']['parent_tests_passed']==934 and scalar['packages']['all']['parent_tests_passed']==1054
assert scalar['summaries']['debug-library']==[['ok','817','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==365 and consumers['packages']['hypercircuit']['passed']==60
assert consumers['curve_tests']=={'hypercurve_svg':[['ok','20','0','0','0','0']],'svg_scalar_failures':[['ok','1','0','0','0','0']]}
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
    assert all(sha(v['copy'])==v['sha256'] for v in read(manifest).values())
registry=json.loads(gzip.decompress((W/'registry-inputs-v1.json.gz').read_bytes()));assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
commands={}
for folder in sorted((N/'logs').glob('owned-fold-*')):
    r=read(folder/'result.json');assert r['output_closed'] and not r['stops'],folder
    assert all(sha(folder/p)==h for p,h in r['output_sha256'].items());commands[folder.name]=r
assert {k for k,v in commands.items() if v['exit_code']}=={'owned-fold-baseline-v2-run'}
print('Verified final-source qualification, source pins and every command result.',flush=True)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(1489825,921794)
roots=[U]+sorted(N.glob('owned-fold-*'))+sorted(N.glob('lazy-scalar-final-*'))
for kind in ['logs','scratch']:roots+=sorted((N/kind).glob('owned-fold-*'))
for pattern in ['prepare-owned-fold-*.py','owned-fold-*.py','close-owned-fold-*.py','stage-lazy-scalar-investigation-*.py','verify-lazy-scalar-commit-*.py']:
    roots+=sorted(Path('/tmp').glob(pattern))
assert len(roots)==len(set(roots));selected=[]
for root in roots:
    assert root.exists(),root
    selected.extend([root] if root.is_file() else (p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()))
assert len(selected)==len(set(selected))
physical={};stats={};members={};excluded={}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat();state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns) and str(path) not in prior,path
    physical[str(path)]=digest;stats[str(path)]=state
    with path.open('rb') as f:magic=f.read(8)
    generated=any(path.is_relative_to(U/name) for name in ['target','target-msrv-v1'])
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=str(path.relative_to(N)) if path.is_relative_to(N) else 'temporary/'+str(path.relative_to('/tmp'))
    row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason']='Generated Cargo output' if generated else 'Compiled binary or library';excluded[name]=row
    else:members[name]=row
print(json.dumps({'new_physical_paths_hashed':len(physical),'archive_members':len(members),'generated_outputs_retained':len(excluded)}),flush=True)
assert not E.exists();E.mkdir()
review={
 'decision':'Retain the shared-certificate fallback in owned Real folding.',
 'source_parent_revision':BASE,'owner':'Hyperreal Real::fold, sharing Class::computable_certificate with existing borrowed access.',
 'properties':['P1','P2','P3','P6','P18','P26','P35','P36','P37','P39'],
 'input_domain':'Valid named symbolic certificates whose optional Computable payload is absent. Existing materialized values and opaque required-payload validation remain supported.',
 'implementation':'Reconstruct the named certificate in both missing-payload branches of owned folding. Existing graphs still move unchanged. Class helper visibility expands only to the parent private module; there is no public API, cache/layout or serialization change.',
 'baseline':{'new_tests_failed':4,'materialized_control_passed':1,'production_unchanged':True,'initial_helper_setup_failure_retained':'The first build succeeded but its helper wrongly expected one total Cargo artifact; the corrected helper selects the test profile before execution.','pre_baseline_strengthening':'The LnProduct bound was tightened from 0..2 to 0..1 before the executed failing baseline, excluding an erroneous value of one. The earlier file is preserved.'},
 'focused':focused['summary'],'scalar_cargo':scalar['packages'],'debug_units_passed':817,
 'new_test_scope':{'named_certificate_recipes':21,'lazy_round_trip_cases':252,'materialized_round_trip_cases':63,'forward_function_cases':32,'formats':['JSON','CBOR'],'lazy_payload_states':['null','omitted'],'matrix_scales':[0,1,-3],'forward_scales':[0,1,3,-3],'test_source_identical_between_failing_baseline_and_final_checks':True},
 'independent_oracles':'Strict rational bounds derived from pi, e, square-root inequalities, monotonicity and power/logarithm definitions. exp/ln results must lie in the original independently derived bounds. Separate forward exp(pi), exp(3pi), exp(-3pi) and asinh bounds detect paired inverse mistakes. Zero has an exact rational proof. Tag/null wire checks are separate.',
 'consumer_cargo':consumers['packages'],'curve_tests':consumers['curve_tests'],'consumer_feature_gate_matrix':consumers['feature_gate_matrix'],
 'compiler_floor':{'compiler':msrv['compiler'],'features':msrv['features'],'all_targets':msrv['all_targets'],'packages':['hyperreal','hyperlimit','hypercurve'],'runtime_tests_rerun':False,'clippy_on_msrv_run':False},
 'strict_clippy_passed':['Hyperreal default/all features all targets','Hyperlimit all features all targets','Hypercurve svg all targets','Hypercircuit interchange all targets','Hypercircuit geometry/all curved_outline'],
 'docs_passed':['Hyperreal all features','Hyperlimit all features','Hypercurve svg','Hypercircuit interchange'],'format_passed':True,
 'resource_contract':{'root_gib':16,'disk_b_gib':72,'tmp_gib':32,'logs_mib':96,'original_baselines_unchanged':True,'child_address_space_gib':8,'jobs':2,'focused_seconds':60,'compile_full_seconds':1800},
 'resource_scope':'Uses the existing certificate reconstruction cost only when a graph is missing. No new internal total-work or heap bound is claimed. All validation runs use external containment.',
 'remaining_limitations':['Valid lazy sign-query and normal-form paths still have missing-payload panics.','Arbitrary forged certificate/graph consistency and undefined graph domains are not validated.','The rejected cache prototype remains rejected; composed proof retention and automatic reciprocal equality remain open.','Explicit affine subtraction remains withheld.','The complete native workload, all bindings, distribution/release and full pre-push workflow matrix were not rerun.'],
 'command_records_verified':len(commands),'source_paths_verified':len(pins),'registry_physical_paths_verified':len(registry),
 'new_runtime_admitted':True,'admitted_scope':'Correct symbolic value during owned folding of valid lazy named certificates.','explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,
 'performance_speedup_claimed':False,'all_adverse_results_retained':True,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
 'next':'Restore consumable valid lazy-certificate queries without the rejected common-path cache costs, and validate forged certificates and undefined graph domains before reconsidering affine cancellation.',
}
dump(E/'review-v1.json',review);dump(E/'command-results-v1.json',commands)
for name in ['contract-v1.md','tmp-contract-v2.json']:shutil.copy2(W/name,E/name)
shutil.copy2(W/'source-pins-v4.json.gz',E/'source-pins-v1.json.gz');shutil.copy2(Path(__file__),E/'close_v1.py')
patch=[]
for path in sorted(implementation):
    before='' if path==new else git('show','HEAD:'+path).decode()
    patch.extend(difflib.unified_diff(before.splitlines(True),(O/path).read_text().splitlines(True),fromfile='a/'+path,tofile='b/'+path))
(E/'implementation.patch').write_text(''.join(patch))
(E/'README.md').write_text('''# Owned symbolic folding

Owned Real folding now reconstructs a missing payload from its retained
symbolic certificate. Previously a directly consumed lazy Pi produced e
from exp and asinh(1) from asinh: the fallback substituted one for Pi.
Both owned-fold fallback branches now use the same certificate constructor
as borrowed access. Existing graphs and cancellation signals still move
through the same path. Public APIs, layout, caches and wire schema stay intact.

Four new tests fail on unchanged production and one materialized control
passes. All five pass after repair, without changing their source. They
cover 252 lazy JSON/CBOR compositions across all 21 named certificate
recipes, absent/null payloads and 0/1/-3 scales, plus 63 materialized
controls. Independent forward exp/asinh bounds cover 32 more cases,
including nonunit positive and negative scales. Values are consumed
directly because cloning could conceal the original defect.

Final-source checks pass: 934 default and 1,054 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, 365 predicate tests, 21 SVG tests,
60 circuit interchange tests and the recorded geometry/all-feature circuit
targets. Strict Clippy, docs, formatting and Rust 1.95 all-target checks
for Hyperreal/Hyperlimit/Hypercurve pass in the named configurations.
The original Cargo-artifact selection setup error is preserved. A weak
LnProduct oracle was strengthened before the executed failing baseline;
that earlier test file is also retained. Existing tests, fixtures and
policies were not weakened.

This admits only owned folding of valid lazy certificates. Lazy query
panics, malformed certificate/graph consistency, undefined graph domains,
composed proof retention and automatic reciprocal equality remain open.
The cache prototype remains rejected and affine subtraction withheld.
Full native workloads, bindings, release/distribution and the complete
pre-push workflow matrix were not rerun. No performance gain or push is claimed.

Each physical artifact is hashed independently. Generated and compiled
outputs remain physically retained; sources, protocols and raw logs are
archived. These experiment roots are closed. Original storage baselines
remain at 16/72/32 GiB root/Disk B/tmp allowances and 96 MiB cumulative
logs. Temporary artifacts remain volatile. Historical missing files were
not reaudited or recovered. Hypervoxel remains excluded and the full plan
remains incomplete.
''')
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as f:assert hashlib.file_digest(f,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'every_physical_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'owned symbolic folding admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference);assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'owned_symbolic_folding' not in current;current['updated_on']='2026-10-18'
current['owned_symbolic_folding']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','scalar_cargo':scalar['packages'],'debug_units_passed':817,'consumers':consumers['packages'],'curve_tests':consumers['curve_tests'],'compiler_floor':review['compiler_floor'],'new_failing_baseline_tests':4,'new_passing_scalar_tests':5,'runtime_admitted':True,'admitted_scope':review['admitted_scope'],'remaining_limitations':review['remaining_limitations'],'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':32,'all_adverse_results_retained':True,'performance_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'next':review['next']}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        text=path.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
record={'status':review['decision'],'checkpoint_kind':'owned symbolic folding admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in implementation},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'production_rust_sources_unchanged':False,'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],'explicit_subtraction_candidate_admitted':False,'lazy_cache_candidate_admitted':False,'required_opaque_payload_admitted':True,'present_graph_domain_validation_complete':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':32,'disk_b_allowance_gib':72,'performance_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in stats.items():
    st=Path(path).stat();assert (st.st_size,st.st_mtime_ns,st.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'owned_folding_admitted':True,'full_plan_complete':False}),flush=True)
