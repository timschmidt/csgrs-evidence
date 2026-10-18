"""Admit the required-payload invariant after the final actual-source checks."""
import ast,difflib,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'real-serde-payload-control-v1'
U=Path('/tmp/csgrs-real-serde-payload-20261018-v1')
P=O/'docs/evidence/2026-10-18-affine-cargo-withheld'
E=O/'docs/evidence/2026-10-18-required-scalar-payload'
BASE='7ce3ff7f000b59d8b497f42b3f9bd9c135fc71fe'
sys.path.insert(0,str(W))
from validation_runner_v1 import sha,resources,reasons
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
assert not git('diff','--cached','--name-only') and not reasons(resources())
implementation={p:sha(O/p) for p in [
 'crates/hyperreal/src/real/arithmetic/representation.rs',
 'crates/hyperreal/src/serde.rs','crates/hyperreal/README.md',
 'crates/hyperreal/tests/serde_payload.rs','crates/hypercurve/tests/svg_scalar_failures.rs',
 'crates/hypercircuit/tests/curved_outline.rs',
]}
assert set(git('diff','HEAD','--name-only').decode().splitlines())==set(implementation)-{'crates/hyperreal/tests/serde_payload.rs','crates/hypercurve/tests/svg_scalar_failures.rs'}
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
prior_live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
inherited={p:h for p,h in prior_live.items() if p not in implementation}
assert all(sha(O/p)==h for p,h in inherited.items())
pins=json.loads(gzip.decompress((W/'source-pins-v4.json.gz').read_bytes()))
assert len(pins)==2656 and all(sha(O/p)==h for p,h in pins.items())
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())=={protected,'crates/hyperreal/tests/serde_payload.rs','crates/hypercurve/tests/svg_scalar_failures.rs'}
receipt=read(N/'affine-cargo-withheld-final-commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==18
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
baseline=read(N/'real-serde-payload-baseline-v2/result-v1.json')
focused=read(N/'real-serde-payload-focused-v1/result-v1.json')
scalar=read(N/'real-serde-payload-scalar-v2/result-v1.json')
consumers=read(N/'real-serde-payload-consumers-v2/result-v1.json')
msrv=read(N/'real-serde-payload-msrv-v2/result-v1.json')
boundary=read(N/'real-serde-payload-boundary-v2/result-v1.json')
assert baseline['summary']==[['FAILED','2','6','0','0','0']]
assert all(r['passed'] for r in [focused,scalar,consumers,msrv,boundary])
assert scalar['packages']['default']['parent_tests_passed']==934
assert scalar['packages']['all']['parent_tests_passed']==1049
assert scalar['summaries']['debug-library']==[['ok','817','0','0','0','0']]
assert consumers['packages']['hyperlimit']['passed']==365
assert consumers['packages']['hypercircuit']['passed']==60
assert consumers['feature_gate_matrix']['geometry']['summaries']==[['ok','4','0','0','0','0']]
assert consumers['feature_gate_matrix']['all']['summaries']==[['ok','5','0','0','0','0']]
assert read(N/'real-serde-payload-feature-baseline-v1/result-v1.json')['baseline_failure_reproduced']
assert boundary['svg_fixture_was_structurally_decodable_before_repair']
assert boundary['negative_root_domain_defect_remains'] and not boundary['affine_candidate_admitted']
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
 assert all(sha(v['copy'])==v['sha256'] for v in read(manifest).values())
for lib in boundary['libraries'].values():assert sha(lib['frozen_copy'])==lib['sha256']
registry=json.loads(gzip.decompress((W/'registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
commands={}
for folder in sorted((N/'logs').glob('real-serde-payload-*')):
 result=read(folder/'result.json')
 assert result['output_closed'] and not result['stops'],folder
 assert all(sha(folder/p)==h for p,h in result['output_sha256'].items())
 commands[folder.name]=result
assert {k for k,v in commands.items() if v['exit_code']}=={
 'real-serde-payload-baseline-v1-build','real-serde-payload-baseline-v2-run',
 'real-serde-payload-consumers-v1-hypercircuit-clippy','real-serde-payload-feature-baseline-v1-curved-outline',
}
print('Verified actual-source qualification, typed boundary results and retained dependencies.',flush=True)
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1468359,921794)
roots=[U]+sorted(N.glob('real-serde-payload-*'))+sorted(N.glob('affine-cargo-withheld-final-*'))
for kind in ['logs','scratch']:roots+=sorted((N/kind).glob('real-serde-payload-*'))
for pattern in ['prepare-real-serde-payload-*.py','prepare-payload-feature-baseline-*.py','real-serde-payload-boundary-*.py','real-serde-payload-boundary-probe-*.rs']:
 roots+=sorted(Path('/tmp').glob(pattern))
roots+=sorted(Path('/tmp').glob('close-real-serde-payload-*.py'))
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
 generated=any(path.is_relative_to(U/name) for name in ['target','target-msrv-v2','target-feature-baseline-v1'])
 compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
 name=str(path.relative_to(N)) if path.is_relative_to(N) else 'temporary/'+str(path.relative_to('/tmp'))
 row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
 if generated or compiled:
  row['archive_exclusion_reason']='Generated Cargo build/documentation output' if generated else 'Compiled binary or library'
  excluded[name]=row
 else:members[name]=row
print(json.dumps({'new_physical_paths_hashed':len(physical),'archive_members':len(members),'generated_outputs_physically_preserved':len(excluded)}),flush=True)
assert not E.exists();E.mkdir()
review={
 'decision':'Retain typed rejection of a missing opaque Real payload and repair the reproduced circuit test feature declarations; the present-graph domain blocker remains open.',
 'source_parent_revision':BASE,'owner':'Hyperreal Real Deserialize; SVG and predicate/circuit interchange consume the shared implementation.',
 'properties':['P3','P6','P18','P26','P35','P36','P37','P39'],
 'input_domain':'Existing serialized Real schema. Irrational requires Some(Computable), even with a zero outer scale; symbolic certificates retain their optional lazy payload.',
 'implementation':'Common Deserialize checks the required payload before publishing Real. Public JSON/CBOR convenience readers retain Problem::ParseError. Wire names, order, existing valid encodings and cache skipping are preserved.',
 'baseline':{'new_tests_failed':6,'valid_controls_passed':2,'initial_compile_setup_error_retained':True,'setup_correction':'Change fixture bound types from i32 to Rational::new-compatible i64; no fixture value, assertion or production change.'},
 'focused':focused['summaries'],'scalar_cargo':scalar['packages'],'debug_units_passed':817,
 'consumer_cargo':consumers['packages'],'consumer_feature_gate_matrix':consumers['feature_gate_matrix'],
 'consumer_feature_gate_repair':{'baseline_failure_reproduced':True,'all_test_bodies_and_original_gates_byte_identical':True,'interchange_tests_passed':2,'geometry_tests_passed':4,'all_feature_tests_passed':5,'scalar_and_affected_consumer_checks_repeated_after_final_edit':True},
 'compiler_floor':{'compiler':msrv['compiler'],'features':msrv['features'],'all_targets':msrv['all_targets'],'packages':['hyperreal','hyperlimit','hypercurve'],'runtime_tests_rerun':False,'clippy_on_msrv_run':False},
 'format_passed':True,
 'strict_clippy_passed':['Hyperreal default/all features all targets','Hyperlimit all features all targets','Hypercurve svg all targets','Hypercircuit interchange all targets','Hypercircuit interchange+geometry curved_outline','Hypercircuit all features curved_outline'],
 'docs_passed':['Hyperreal all features','Hyperlimit all features','Hypercurve svg','Hypercircuit interchange'],
 'independent_oracles':'An opaque class with no payload denotes no recoverable real value. Known rational, pi, e, sqrt(2), and pi+e bounds check valid values before downstream translation; byte identity is checked independently.',
 'boundary_diagnostic':{'outputs':boundary['outputs'],'svg_fixture_decoded_by_baseline':True,'missing_payload_now_typed':True,'negative_root_domain_defect_remains':True},
 'remaining_limitations':['Present Computable graphs are not fully validated for mathematical domains. sqrt(-1) still decodes and panics on refinement.','Arbitrary symbolic-tag/payload consistency and global hostile-input resource bounds are not established.','The explicit affine subtraction candidate remains withheld.','Full native board/copper workloads, all bindings, release/distribution and the complete pre-push workflow matrix were not rerun for this narrow serde repair.'],
 'storage':{'root_gib':16,'disk_b_gib':72,'tmp_gib':24,'logs_mib':96,'baselines_reset':False,'child_address_space_gib':8,'compile_or_full_suite_seconds':1800,'focused_seconds':60,'jobs':2},
 'source_paths_rehashed':len(pins),'registry_physical_files_rehashed':len(registry),
 'preservation':'Each physical artifact is hashed independently. Generated output and compiled programs/libraries remain physically retained; source, protocols and logs are archived. Previous closed roots are unchanged.',
 'new_runtime_admitted':True,'admitted_scope':'Required opaque payload at deserialization, plus consumer test declarations aligned with their existing feature gates.',
 'explicit_subtraction_candidate_admitted':False,'performance_speedup_claimed':False,
 'next':'Validate mathematical domains and representation certificates at scalar ingress with honest typed uncertainty/resource behavior, preserving valid legacy schedules and the certified-success corpus, before reconsidering affine cancellation.',
 'all_adverse_results_retained':True,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
}
dump(E/'review-v1.json',review);dump(E/'command-results-v1.json',commands)
for name in ['contract-v1.md','feature-contract-v1.md','tmp-contract-v1.json']:shutil.copy2(W/name,E/name)
shutil.copy2(W/'source-pins-v4.json.gz',E/'source-pins-v1.json.gz')
shutil.copy2('/tmp/real-serde-payload-boundary-probe-v1.rs',E/'boundary-probe-v1.rs')
shutil.copy2(Path(__file__),E/'close_v1.py')
patch=[]
tracked=set(git('ls-files').decode().splitlines())
for relative in sorted(implementation):
 before=git('show','HEAD:'+relative).decode() if relative in tracked else ''
 patch.extend(difflib.unified_diff(before.splitlines(True),(O/relative).read_text().splitlines(True),fromfile='a/'+relative,tofile='b/'+relative))
(E/'implementation.patch').write_text(''.join(patch))
(E/'README.md').write_text("""# Required opaque scalar payload

Real deserialization now rejects an Irrational class without its Computable
payload, including null, omitted fields, and a zero outer scale. The common
implementation protects direct Serde, JSON/CBOR convenience readers, CBOR
Value conversions, enclosing collections and downstream SVG exact-coordinate
ingress. Convenience readers retain the typed Problem::ParseError outcome.
Valid symbolic certificates still permit lazily omitted payloads.

Six new public-boundary tests fail on unchanged production; two valid controls
pass. All eight pass after repair. The downstream SVG regression passes, as
do the 20 existing SVG tests and the predicate serialization matrix. A retained
baseline library independently confirms the SVG fixture previously decoded
successfully, so this regression exercises the scalar invariant rather than
merely invalid CBOR syntax.

The final actual source passes 934 default and 1,049 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, the complete 365-test predicate suite,
and the circuit interchange targets named in review-v1.json. Formatting,
the named strict Clippy/docs configurations, and Rust 1.95 all-target
all-feature/minimal checks for Hyperreal/Hyperlimit/Hypercurve pass.
No existing test, policy, fixture or ignore marker was weakened.

An interchange-only circuit Clippy check exposed imports of geometry-only
APIs in curved_outline. A separate target reproduces the same failure with
committed scalar sources. Gate those imports and their geometry-only helper;
all test bodies and existing test gates are byte-identical. The two
interchange, four geometry, and five all-feature curved-outline tests pass,
including the original DRC/CAM assertions. The full scalar and affected
consumer checks were repeated after this final configuration edit.


The initial test-only integer-width compile error and all diagnostic output
are retained. Known exact bounds verify valid values and downstream translation.
JSON/CBOR byte identity after cache warming is a separate assertion.

This is a narrow structural repair. A present graph encoding sqrt(-1) still
decodes and panics during refinement, reproduced again after this repair.
General mathematical-domain and symbolic-certificate validation remain open.
The affine subtraction candidate remains withheld. Full native workloads,
all bindings, distribution and the complete pre-push workflow matrix were not
rerun here; no push or performance claim is made.

Every new physical artifact has an independent hash. Generated Cargo outputs
and compiled artifacts remain physically retained; source, protocols and raw
logs are archived. These experiment roots are now closed. Original baselines
and current 16/72/24-GiB root/Disk B/tmp ceilings remain; cumulative logs stay
at 96 MiB. Temporary artifacts are volatile. Historical missing files were
neither reaudited nor recovered. Hypervoxel and full-plan completion remain
outside this admission.
""")
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as tf:
 for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
 assert set(tf.getnames())==set(members)
 for name,row in members.items():
  with tf.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'every_physical_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'required opaque scalar payload admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'required_opaque_scalar_payload' not in current
current['updated_on']='2026-10-18'
current['required_opaque_scalar_payload']={
 'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json',
 'checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz',
 'scalar_cargo':scalar['packages'],'debug_units_passed':817,'consumers':consumers['packages'],'consumer_feature_gate_matrix':consumers['feature_gate_matrix'],
 'compiler_floor':review['compiler_floor'],'new_failing_baseline_tests':6,'new_passing_scalar_tests':8,
 'downstream_svg_regression_passed':True,'source_changes_applied':True,'runtime_admitted':True,
 'admitted_scope':review['admitted_scope'],'remaining_present_graph_domain_blocker':True,
 'explicit_subtraction_candidate_admitted':False,'storage_baselines_reset':False,
 'disk_b_allowance_gib':72,'tmp_allowance_gib':24,'all_adverse_results_retained':True,
 'performance_speedup_claimed':False,'full_plan_complete':False,'public_distribution_complete':False,
 'hypervoxel_deferred_by_user':True,'next':review['next'],
}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:]
us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
ledger.write_bytes(updated)
for path in E.iterdir():
 if path.suffix in {'.md','.py','.json','.rs'}:
  text=path.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),path
  if path.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
 check=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert check.returncode==0
record=dict(previous)
record.update({
 'status':review['decision'],'checkpoint_kind':'required opaque scalar payload admission',
 'previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
 'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},
 'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
 'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),
 'previously_closed_paths_verified':sum(prior.get(p)==h for p,h in registry.items()),
 'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},
 'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
 'inherited_implementation_sha256':inherited,'implementation_sha256':implementation,
 'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz',
 'source_changes_applied':True,'production_rust_sources_unchanged':False,'production_prefixes_unchanged':False,'all_other_source_inputs_unchanged':True,
 'new_implementation_admission':True,'runtime_admitted':True,'runtime_admitted_scope':review['admitted_scope'],
 'explicit_subtraction_candidate_admitted':False,'constructor_candidate_admitted':False,
 'required_opaque_payload_admitted':True,'present_graph_domain_validation_complete':False,
 'qualification_this_checkpoint':review,'main_qualification_this_checkpoint':review,
 'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),
 'format_rerun':True,'runtime_tests_rerun':True,'main_runtime_tests_rerun':True,'readme_tests_rerun':True,
 'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],
 'prior_commit_verified_blobs':18,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
 'final_source_parent_revision':BASE,'source_commit':BASE,'temporary_artifacts_volatile':True,
 'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':24,'disk_b_allowance_gib':72,
 'performance_speedup_claimed':False,
})
dump(E/'checkpoint-v1.json',record)
for path,state in stats.items():
 stat=Path(path).stat();assert (stat.st_size,stat.st_mtime_ns,stat.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in inherited.items())
assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'required_payload_admitted':True,'affine_candidate_admitted':False,'full_plan_complete':False}),flush=True)
