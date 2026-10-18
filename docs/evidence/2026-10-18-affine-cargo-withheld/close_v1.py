"""Close the qualification and retain the decisive malformed-input blocker."""
import ast,difflib,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
sys.dont_write_bytecode=True
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'explicit-affine-cargo-control-v1'
U=Path('/tmp/csgrs-explicit-affine-cargo-20261018-v1')
P=O/'docs/evidence/2026-10-18-explicit-affine-subtraction'
E=O/'docs/evidence/2026-10-18-affine-cargo-withheld'
BASE='0179a1b68621d48e1b5087d64d64493e0c3819c5'
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
assert not git('diff','HEAD','--name-only') and not git('diff','--cached','--name-only')
assert not reasons(resources())
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256']
pins=json.loads(gzip.decompress((W/'main-source-pins-v1.json.gz').read_bytes()))
assert len(pins)==2654 and all(sha(O/p)==h for p,h in pins.items())
assert all(sha(O/p)==h for p,h in live.items())
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
receipt=read(N/'explicit-affine-final-commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==19
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
scalar=read(N/'affine-cargo-scalar-v1/result-v1.json')
downstream=read(N/'affine-cargo-downstream-v2/result-v1.json')
serialization=read(N/'affine-cargo-serialization-v2/result-v1.json')
diagnostic=read(N/'affine-cargo-malformed-serde-v2/result-v1.json')
blocker=read(W/'malformed-serde-review-v1.json')
assert scalar['passed'] and downstream['passed'] and serialization['passed']
assert scalar['packages']['default']['parent_tests_passed']==940
assert scalar['packages']['all']['parent_tests_passed']==1047
assert scalar['summaries']['debug-library']==[['ok','823','0','0','0','0']]
assert sum(v['parent_test_passed'] for v in downstream['packages'].values())==5549
assert sum(v['parent_ignored'] for v in downstream['packages'].values())==40
assert len(downstream['native_gates'])==3 and all(v['passed'] for v in downstream['native_gates'].values())
assert sum(v['proved_values'] for v in serialization['cross_version_readers'].values())==144
assert diagnostic['diagnostic_completed'] and blocker['new_failure_masking'] is True
assert blocker['diagnostic_sha256']==sha(N/'affine-cargo-malformed-serde-v2/result-v1.json')
for phase in ['msrv-v1','reports-v1','main-v1','main-msrv-v1','main-reports-v1']:
 assert not (N/('affine-cargo-'+phase)).exists(),phase
assert not (W/'main-source-integration-v1.json').exists()
for manifest in sorted((U/'frozen').glob('*/executables-v1.json')):
 assert all(sha(v['copy'])==v['sha256'] for v in read(manifest).values())
for row in read(W/'serialization-input-preservation-v1.json')['libraries'].values():
 assert sha(row['copy'])==row['sha256']
for row in read(N/'affine-cargo-malformed-serde-v2/probe-protocol-v1.json')['libraries'].values():
 assert sha(row['copy'])==row['sha256']
registry=json.loads(gzip.decompress((W/'registry-inputs-v1.json.gz').read_bytes()))
assert len(registry)==48478 and all(sha(p)==h for p,h in registry.items())
print('Verified completed qualification, failure blocker, source and registry inputs.',flush=True)
commands={}
for folder in sorted((N/'logs').glob('affine-cargo-*')):
 result=read(folder/'result.json')
 assert result['output_closed'] and not result['stops'],folder
 assert all(sha(folder/p)==h for p,h in result['output_sha256'].items())
 commands[folder.name]=result
assert {k for k,v in commands.items() if v['exit_code']}=={
 'affine-cargo-serialization-v1-baseline-compile',
 'affine-cargo-malformed-serde-v1-baseline-compile',
}
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True)
assert (len(prior),len(missing))==(1447592,921794)
registry_closed_verified=sum(prior.get(path)==digest for path,digest in registry.items())
roots=[W,U]
roots+=sorted(N.glob('affine-cargo-*'))
roots+=sorted(N.glob('explicit-affine-final-*'))
for kind in ['logs','scratch']:roots+=sorted((N/kind).glob('affine-cargo-*'))
for pattern in [
 'prepare-explicit-affine-cargo-*.py','prepare-affine-cargo-harness-*.py',
 'qualify-affine-serialization-*.py','qualify-affine-cargo-*.py',
 'prepare-affine-downstream-*.py','freeze-affine-serialization-*.py',
 'prepare-affine-main-*.py','qualify-affine-main-*.py',
 'affine-malformed-serde-probe-*.rs','probe-affine-malformed-serde-*.py',
 'prepare-affine-malformed-serde-*.py','record-affine-malformed-review-*.py',
]:roots+=sorted(Path('/tmp').glob(pattern))
roots.append(Path(__file__))
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
 generated=path.is_relative_to(U/'target') or path.is_relative_to(U/'target-msrv-v1')
 compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
 name=str(path.relative_to(N)) if path.is_relative_to(N) else 'temporary/'+str(path.relative_to('/tmp'))
 row={'physical_path':str(path),'sha256':digest,'bytes':after.st_size}
 if generated or compiled:
  row['archive_exclusion_reason']='Generated Cargo build/documentation output' if generated else 'Compiled binary or library'
  excluded[name]=row
 else:members[name]=row
print(json.dumps({'physical_paths_hashed':len(physical),'archive_members':len(members),'generated_outputs_physically_preserved':len(excluded)}),flush=True)
assert not E.exists();E.mkdir()
review={
 'decision':blocker['decision'],'source_revision':BASE,'semantic_acceptance_passed':False,
 'owners':blocker['owners'],'properties':['P1','P2','P3','P4','P5','P6','P7','P8','P9','P17','P18','P19','P20','P26','P27','P35','P36','P37','P39'],
 'scalar_cargo':{'packages':scalar['packages'],'debug_units_passed':823,'strict_clippy_default_and_all_features_passed':True,'docs_passed':True,'format_passed':True},
 'downstream_cargo':{'packages':downstream['packages'],'parent_tests_passed':5549,'parent_ignored':40,'strict_clippy_all_targets_all_features_passed':True,'docs_passed':True,'original_native_gates':downstream['native_gates']},
 'valid_serialization_corpus':{'recipes':18,'independent_rational_value_checks':144,'changed_rows':{k:len(v) for k,v in serialization['changed_values'].items()},'cache_warming_preserves_bytes_in_each_version':True,'wire_schema_changed':False,'all_serialization_validity_proved':False},
 'failure_blocker':blocker,'observed_malformed_pipelines':diagnostic['outputs'],
 'setup_failures_retained':[
  'Preparation guard rejected rustfmt expression blocks; corrected before compilation.',
  'Harness-generation AST guard rejected a missing quote before any harness execution.',
  'First serialization probe used an i64 denominator where the API requires u64; corrected source retained separately.',
  'Downstream driver required same-line ok despite native reports printed between the test name and ok; successful completed outputs were rehashed and parsed without rerunning or weakening tests.',
  'First malformed-input probe supplied a frozen rlib basename not beginning with lib; corrected by independently copying identical bytes under the original basename.',
 ],
 'concurrency':'The long curve unit suite overlapped briefly with one focused malformed-input compile/process at a time, within two children. Native workload gates and performance measurements were not running during that overlap; no timing claim uses it.',
 'storage':{'root_allowance_gib':16,'disk_b_allowance_gib':72,'tmp_allowance_gib':24,'storage_baselines_reset':False,'tmp_migration':'The earlier 12-GiB temporary-artifact cap was agent-selected. The explicit 24-GiB storage-only migration uses the existing user authorization for /tmp. Original workload, time, memory, job and log limits stay unchanged.','cumulative_logs_mib':96,'child_address_space_gib':8,'full_command_seconds':1800,'focused_command_seconds':60},
 'source_registry_files_rehashed':48478,
 'compiled_output_preservation':'Every physical file is hashed independently. Generated Cargo build/documentation outputs and compiled programs/libraries remain physically retained with their hashes; source, protocols and logs are archived.',
 'not_executed_due_to_blocker':['Compiler-floor checks','Full native report comparison','Production integration','Actual-main requalification','Release and binding requalification'],
 'next':'Repair typed validation at the owning scalar deserialization boundary, preserving valid representations and explicit resource/uncertainty contracts. Reproduce and qualify that repair before revisiting the affine candidate.',
 'production_source_changed':False,'new_runtime_admitted':False,'explicit_subtraction_candidate_admitted':False,
 'all_adverse_results_retained':True,'performance_speedup_claimed':False,
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
}
dump(E/'review-v1.json',review);dump(E/'command-results-v1.json',commands)
for name in ['contract-v1.md','storage-migration-v1.md','tmp-contract-v1.json','serialization-contract-v1.md','malformed-serde-review-v1.json']:
 shutil.copy2(W/name,E/name)
shutil.copy2('/tmp/affine-malformed-serde-probe-v1.rs',E/'malformed-serde-probe-v1.rs')
shutil.copy2(Path(__file__),E/'close_v1.py')
patch=[]
for relative,source in {
 'crates/hyperreal/src/computable/node/algebra.rs':W/'algebra_explicit_v2.rs',
 'crates/hyperreal/src/real/arithmetic/add_sub.rs':W/'real/arithmetic/add_sub.rs',
 'crates/hyperreal/src/real/mod.rs':W/'real/mod.rs',
 'crates/hyperreal/src/real/explicit_affine_tests.rs':W/'real/explicit_affine_tests.rs',
}.items():
 before=(O/relative).read_text() if (O/relative).exists() else ''
 patch.extend(difflib.unified_diff(before.splitlines(keepends=True),source.read_text().splitlines(keepends=True),fromfile='a/'+relative,tofile='b/'+relative))
(E/'candidate-not-applied.patch').write_text(''.join(patch))
(E/'README.md').write_text("""# Affine Cargo qualification withheld

The explicit affine-subtraction candidate is not admitted. A new boundary
diagnostic found that malformed JSON representing sqrt(-1) causes the current
JSON-to-subtraction pipeline to panic, while the candidate publishes exact
rational -1 and a singleton certified interval. Missing irrational payloads
panic in both versions. Neither behavior satisfies typed failure at ingress.
No real number has square -1; wrapper agreement is not the oracle.

The candidate passes the declared valid-input corpus: 940 default and 1,047
all-feature scalar tests, 823 debug units, scalar doctests, and 5,549 tests
across six downstream consumers. The 40 original downstream ignores remain.
The original board, Gerber and copper-neck gates pass with complete pinned
fixtures. Formatting, strict Clippy and documentation for the named
combinations pass. These successes do not override the reproduced blocker.

Eighteen valid scalar serialization recipes pass 144 independent rational
value checks with both reader versions. Their raw JSON, CBOR, display and
immediate facts change intentionally when a rational carrier is exposed.
Cache warming preserves each version's bytes in those cases. This does not
establish safe handling of arbitrary serialized representations.

All failed setup attempts and the output-parser correction are retained.
The completed HyperDRC tests were rehashed and parsed correctly without
rerunning or weakening them. The malformed diagnostic briefly overlaps
the single long curve unit process within the existing two-child limit.
No performance claim uses this qualification.

The temporary-artifact allowance changes explicitly from the agent-selected
12 GiB to 24 GiB under existing /tmp authorization. Disk B remains at the
user-approved 72 GiB. All original baselines, workload, time, memory and
cumulative log limits remain. The registry inputs are mounted read-only.

Production remains unchanged. Compiler-floor checks, full report comparison
and main integration are withheld. Prepared helpers are archived but were
not executed. Their admission guards reject the known blocker.
The next work belongs at scalar deserialization: reject malformed input
with typed failure while preserving valid round trips and honest budgets.

Every new physical artifact has an independent hash. Generated Cargo outputs
and compiled artifacts are retained physically; source, commands and raw logs
are archived. These experiment roots are now closed and must not be mutated.
Temporary storage remains volatile. Historical missing artifacts were neither
reaudited nor recovered. Hypervoxel stays outside scope; release qualification
and the full properties plan remain open.
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
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'affine Cargo qualification withheld after malformed-input failure masking','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True)
assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes()
assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json')
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
assert 'explicit_affine_cargo_qualification' not in current
current['updated_on']='2026-10-18'
current['explicit_affine_cargo_qualification']={
 'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json',
 'checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz',
 'scalar_cargo':review['scalar_cargo'],'downstream_packages':downstream['packages'],
 'downstream_parent_tests_passed':5549,'downstream_parent_ignored':40,
 'valid_serialization_value_checks':144,'new_failure_masking':True,
 'failure_boundary':'Malformed serialized scalar representations can enter a downstream arithmetic pipeline.',
 'source_changes_applied':False,'runtime_admitted':False,'semantic_acceptance_passed':False,
 'storage_baselines_reset':False,'disk_b_allowance_gib':72,'tmp_allowance_gib':24,
 'all_adverse_results_retained':True,'performance_speedup_claimed':False,
 'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
 'next':review['next'],
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
 'status':review['decision'],'checkpoint_kind':'affine Cargo qualification withheld by malformed-input failure masking',
 'previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
 'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},
 'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
 'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),
 'previously_closed_paths_verified':registry_closed_verified,'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},
 'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
 'inherited_implementation_sha256':live,'implementation_sha256':{},
 'source_changes_applied':False,'production_rust_sources_unchanged':True,'production_prefixes_unchanged':True,'all_other_source_inputs_unchanged':True,
 'new_implementation_admission':False,'runtime_admitted':False,'runtime_admitted_scope':'No new production admission. Candidate withheld because invalid serialized input can be masked as a rational result.',
 'explicit_subtraction_candidate_admitted':False,'constructor_candidate_admitted':False,
 'qualification_this_checkpoint':review,'main_qualification_this_checkpoint':{'note':'Production source still matches E74. The verified baseline library was used in serialization and malformed-input comparisons; actual-main Cargo integration was not performed.'},
 'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),
 'format_rerun':True,'runtime_tests_rerun':True,'main_runtime_tests_rerun':False,
 'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(p) for p in roots],
 'prior_commit_verified_blobs':19,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,
 'exact_ingress_admitted':False,'final_source_parent_revision':BASE,'source_commit':BASE,
 'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,
 'tmp_allowance_gib':24,'disk_b_allowance_gib':72,'performance_speedup_claimed':False,
})
dump(E/'checkpoint-v1.json',record)
for path,state in stats.items():
 stat=Path(path).stat();assert (stat.st_size,stat.st_mtime_ns,stat.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and all(sha(O/p)==h for p,h in live.items())
assert not reasons(resources())
print(json.dumps({'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'candidate_admitted':False,'production_source_changed':False,'full_plan_complete':False}),flush=True)
