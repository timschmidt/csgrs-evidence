"""Close the native boundary failure and cache repair without rewriting prior evidence."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/native-boundary-failure-admission-20261019-v1')
PREV_F=B.parent/'curve-adapter-failure-admission-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-curve-adapter-failure-admission'
E=O/'docs/evidence/2026-10-19-native-boundary-failure-admission'
X=B/'external-evidence'
BASE='82f2f94442e3f4a9d4ab7e3be16ec7414d77320f'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from native_boundary_runner_v1 import sha,resources,reasons
from load_expectations_v2 import load
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
def git(*args):return subprocess.check_output(GIT+list(args),cwd=O)
def read(path):return json.loads(Path(path).read_text())
def gzread(path):return json.loads(gzip.decompress(Path(path).read_bytes()))
def dump(path,value):
    assert not path.exists(),path
    path.write_text(json.dumps(value,indent=2,sort_keys=True)+'\n')
def gzwrite(path,value):
    assert not path.exists(),path
    path.write_bytes(gzip.compress((json.dumps(value,sort_keys=True)+'\n').encode(),mtime=0))
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end();value,length=json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:length].encode()),value
assert git('rev-parse','HEAD').decode().strip()==BASE and not git('diff','--cached','--name-only')
assert not E.exists() and not X.exists() and not reasons(resources())
paths=set(read(B/'candidate-paths-v1.json'));assert len(paths)==15
new_paths={p for p in paths if p.startswith('tests/')}
assert len(new_paths)==4
assert set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new_paths
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new_paths|{protected}
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json');receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==24
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
pins=gzread(B/'source-pins-final-v4.json.gz');initial=gzread(B/'source-pins-baseline-v1.json.gz')
assert len(pins)==10164 and len(initial)==10160 and set(pins)-set(initial)==new_paths
assert {p for p in pins if pins[p]!=initial.get(p)}==paths
for name in ['candidate-native-result-v1.json','candidate-consumer-result-v1.json','candidate-feature-result-v1.json','candidate-wasm-result-v1.json']:assert read(B/name)['passed']
assert read(B/'public-reproduction-v2.json')['failed']==5
assert read(B/'cache-reproduction-v1.json')['exit_code']==101
expected={}
def expect(path,digest):
    path=str(path);assert path not in expected or expected[path]==digest,path;expected[path]=digest
for table in [pins,inherited,previous['evidence_files_sha256']]:
    for p,h in table.items():expect(O/p,h)
for p,h in previous['external_evidence_files_sha256'].items():expect(p,h)
registry=gzread(N/'lazy-proof-control-v1/registry-inputs-v1.json.gz');assert len(registry)==48478
for p,h in registry.items():expect(p,h)
for manifest in B.glob('*-executables-v1.json'):
    for row in read(manifest).values():expect(row['copy'],row['sha256'])
for name in ['ffi-release-libraries-v1.json','ffi-release-libraries-v4.json']:
    for p,h in read(B/name).items():expect(p,h)
binding=read(B/'baseline-binding-v1.json');expect(binding['copy'],binding['sha256'])
for p,h in read(B/'prepared-consumers-v1.json')['tools_sha256'].items():expect(p,h)
for p,h in read(B/'prepared-feature-matrix-v1.json')['msrv_tools_sha256'].items():expect(p,h)
for p,h in read(B/'prepared-wasm-matrix-v1.json')['tools_sha256'].items():expect(p,h)
for p,h in read(B/'candidate-wasm-result-v1.json')['frozen_package_sha256'].items():expect(p,h)
compiler=read(Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1/cargo-preparation-protocol-v1.json'))
for p,h in compiler['tool_sha256'].items():expect(p,h)
commands={};test_results={};warnings=[]
for folder in sorted((B/'logs').iterdir()):
    row=read(folder/'result.json');assert row['output_closed'] and not row['stops'],folder
    assert row['exit_code']==(1 if folder.name=='native-boundary-candidate-fmt' else 101 if folder.name in {'native-boundary-baseline-private-tests-run','native-boundary-baseline-cache-probe-run','native-boundary-baseline-public-tests-run','native-boundary-baseline-public-tests-v2-run','native-boundary-candidate-focused-build','native-boundary-candidate-root-clippy'} else 0),folder
    for p,h in row['output_sha256'].items():expect(folder/p,h)
    commands[folder.name]=row
    stderr=(folder/'stderr').read_text();stdout=(folder/'stdout').read_text()
    assert not re.search(r'^\s*(Compiling|Checking|Verifying|Packaging) hypervoxel\b',stderr,re.M)
    warnings += [{'command':folder.name,'diagnostic':line} for line in stderr.splitlines() if re.match(r'^\s*warning:',line)]
    if '--message-format=json' in row['argv']:
        for line in stdout.splitlines():
            if not line.startswith('{'):continue
            value=json.loads(line)
            if value.get('reason')=='compiler-message' and value['message']['level']=='warning':warnings.append(value['message'])
    results=re.findall(r'test result: (?:ok|FAILED)\. (\d+) passed; (\d+) failed; (\d+) ignored;',stdout)
    if results:test_results[folder.name]=[{'passed':int(a),'failed':int(b),'ignored':int(c)} for a,b,c in results]
assert len(commands)>=100
assert all(row['command']=='native-boundary-candidate-root-clippy' and row['diagnostic']=='warning: build failed, waiting for other jobs to finish...' for row in warnings)
candidate_results={name:rows for name,rows in test_results.items() if 'baseline' not in name}
assert all(row['failed']==0 for rows in candidate_results.values() for row in rows)
assert read(B/'candidate-consumer-result-v1.json')['real_consumer_executions']==36
review={
    'classification':'Retained native boundary causes and retriable attributed GPU export failures.',
    'baseline_revision':BASE,
    'owner':'Hypermesh normal certification and typed failure; CSGRS adapter/modeling conversion and attributed cache; Hyperreal error equality trait.',
    'properties':['P4','P6','P18','P19','P25','P28','P29','P30','P35','P36','P39'],
    'changed_paths':sorted(paths),'production_conversion_routes':6,
    'baseline_public_regressions':5,'baseline_private_helper_regressions':1,
    'baseline_semantic_success_controls':1,
    'baseline_test_v1_incorrect_expectation':'Rational noninteger projection already returns Hyperreal(NotAnInteger); preserved in v2. All v1 logs and test sources retained.',
    'candidate_v2_clippy_failure':'One unnecessary clone in an integration test; v3 borrows the same point. Production source hashes remained identical at v3, and the changed test suite was rerun. Subsequent v4 only formats the GPU source and rebuilds affected targets.',
    'test_lint_revision_evidence':read(B/'candidate-revision-v3.json'),
    'final_revision_evidence':read(B/'candidate-revision-v4.json'),
    'candidate_v3_format_failure':'Initial formatting used root settings rather than crates/.rustfmt.toml. V4 applies the existing Hypermesh configuration only; the GPU source snapshot, failed fmt log and all affected final rechecks are retained.',
    'candidate_v1_test_compile_failure':'Expected rows needed explicit Real types; source snapshot and diagnostics retained. Production implementation unchanged in v2.',
    'failure_families_exercised':['RawReal','F32','F64','I128'],
    'independent_semantics':{'normal':'Triangle (0,0,0),(1,0,0),(0,3,4) has exact normal (0,-4/5,3/5); exact source rows checked; integer projection remains a typed rejection.', 'point_transform':'Affine translation (4,5,6) sends (1,2,3) to (5,7,9) in every family.', 'cache_recovery':'A triangle of height pi minus its -1024-bit lower rational enclosure exports after proving the same height positive at -1100 bits. Baseline native export recovered while AttributedMesh retained its old failure.', 'cache_states':['cold','warm','stronger-proof recovery','clone and metadata-map sharing','concurrent success','source mutation isolation','returned buffer mutation isolation','scalar-adapter cache eviction'], 'composition':'Canonical empty exports, repeated graphics consumption and unchanged full strict Boolean/composition corpus.'},
    'candidate_test_executions':sum(row['passed'] for rows in candidate_results.values() for row in rows),
    'test_results':test_results,'command_count':len(commands),'warnings':warnings,
    'real_native_consumer_executions':36,'native_consumer_languages':['C','C++','Python'],
    'existing_native_consumers_preserved':33,'new_native_consumers':3,
    'ffi_output_ownership_checked':True,'diagnostic_text_preserved_for_reproduced_cases':True,
    'api_migration':'GpuMeshError adds TriangleNormalUndecided and TriangleNormalFailed with scalar cause; ValidationError adds Gpu. Problem gains Eq. AttributedMesh returns owned GpuMeshError and caches successes only. Polyhedron/graphics undecided ABI status changes from 4 to 5; invalid remains 4; signatures and numeric ABI values unchanged. Point adapters retain Problem.',
    'coverage_qualifications':['Curve surface/closed validation failures reproduced through private helpers; public translated/rotated curve probes succeeded, so no public construction failure coverage is claimed for those helpers.', 'Opaque symbolic undecided polyhedron/graphics ABI inputs exercised by Rust FFI tests; real C/C++/Python consumers cover reachable invalid rings, exact-normal projection, empties and recovery.', 'Scalar normalization resource-cause propagation is implemented, but no genuine GPU scalar-exhaustion fixture is claimed.', 'Attributed cache retains one successful buffer per shared carrier, without a heap-byte limit; no reset/disable API.', 'PLY and glTF exports still flatten GPU causes; separately recorded as open follow-up candidates.'],
    'root_minimal_and_default_tests_passed':True,'attributed_obj_consumer_tests_passed':True,
    'ffi_tests_and_release_build_passed':True,'strict_clippy_and_formatting_passed':True,
    'msrv_all_targets_checked':'1.95.0','msrv_runtime_not_executed':True,
    'wasm_host_feature_checked':True,'wasm_runtime_not_rerun':False,'wasm_consumers':read(B/'candidate-wasm-result-v1.json'),
    'go_toolchain_unavailable':read(B/'candidate-consumer-result-v1.json')['go_unavailable'],
    'candidate_release_library_bytes':(B/'frozen/release-v4/libcsgrs_ffi.so').stat().st_size,
    'matched_binary_size_comparison_claimed':False,'performance_claimed':False,
    'source_package_reverification_open':True,'public_distribution_complete':False,
    'full_ci_complete':False,'full_plan_complete':False,'historical_artifact_reaudit':False,
    'hypervoxel_deferred_by_user':True,'hypervoxel_built_or_packaged':False,
    'all_adverse_results_retained':True,'artifact_volume':str(B.parent),
    'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,
    'tmp_allowance_gib':58,'logs_allowance_mib':200,'storage_baselines_reset':False,
    'next':'Reproduce and repair remaining PLY/glTF GPU error flattening and scalar-adapter index overflow conversion. Continue ordinary strict completion, provenance and current source-package/public release validation; Hypervoxel remains out of scope.'
}
print(json.dumps({'commands_verified':len(commands),'candidate_test_executions':review['candidate_test_executions']}),flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(2060262,921794)
snapshot=B/'final-source-v4';assert not snapshot.exists()
for path in paths:
    target=snapshot/path;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/path,target);assert sha(target)==pins[path]
roots=[B,PREV_F,*sorted(Path('/tmp').glob('*native-boundary*'))]
selected=[]
for root in sorted(set(roots)):selected.extend([root] if root.is_file() else [p for p in sorted(root.rglob('*')) if not p.is_dir() or p.is_symlink()])
assert len(selected)==len(set(selected))
physical={};states={};members={};excluded={}
for path in selected:
    before=path.lstat();assert stat.S_ISREG(before.st_mode) and not path.is_symlink(),path
    digest=sha(path);after=path.stat();state=(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    assert state==(before.st_size,before.st_mtime_ns,before.st_ctime_ns)
    key=str(path)
    if key in expected:assert expected.pop(key)==digest,path
    if key in prior:
        assert prior[key]==digest,path
        continue
    physical[key]=digest;states[key]=state
    if len(physical)%5000==0:
        assert not reasons(resources());print(json.dumps({'new_paths_rehashed':len(physical)}),flush=True)
    with path.open('rb') as stream:magic=stream.read(8)
    generated=path.is_relative_to(B) and any(part.startswith(('target','cargo-home','gmp-cache','xdg-cache')) for part in path.relative_to(B).parts)
    compiled=magic.startswith(b'\x7fELF') or magic==b'!<arch>\n'
    name=str(path.relative_to(B)) if path.is_relative_to(B) else 'prior-final/'+str(path.relative_to(PREV_F)) if path.is_relative_to(PREV_F) else 'temporary/'+path.name
    assert name not in members and name not in excluded
    row={'physical_path':key,'sha256':digest,'bytes':after.st_size}
    if generated or compiled:
        row['archive_exclusion_reason']='Registry/cache/build artifact or compiled binary/library; physically preserved and independently hashed';excluded[name]=row
    else:members[name]=row
for i,(p,h) in enumerate(expected.items()):
    assert sha(p)==h,p
    if i%10000==0:
        assert not reasons(resources());print(json.dumps({'source_and_prior_paths_verified':i}),flush=True)
X.mkdir();archive=X/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz',dereference=True) as tf:
    for name,row in members.items():tf.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as tf:
    assert set(tf.getnames())==set(members)
    for name,row in members.items():
        with tf.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(X/'archive-members-v1.json.gz',{'members':members,'excluded_generated_and_compiled_artifacts_physically_preserved':excluded,'every_path_hashed_independently':True,'all_archive_members_verified':True,'archive_sha256':sha(archive)})
expectations=X/'artifact-expectations-v1.json.gz'
gzwrite(expectations,{'schema_version':3,'kind':'native boundary failure and cache admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
E.mkdir();external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'portable_distribution_evidence':False})
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{key:row[key] for key in ['exit_code','elapsed_seconds','wall_limit_seconds','stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-baseline-v1.json.gz','source-pins-before-v1.json.gz'),(B/'source-pins-final-v4.json.gz','source-pins-v1.json.gz'),(B/'public-reproduction-v2.json','baseline-reproduction-v1.json'),(B/'control/contract-extension-v1.md','contract-extension-v1.md'),(B/'cache-reproduction-v1.json','cache-reproduction-v1.json'),(B/'private-reproduction-v1.json','private-reproduction-v1.json'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
patch=git('diff','--binary')
for path in sorted(new_paths):
    addition=subprocess.run(GIT+['diff','--no-index','--binary','--','/dev/null',path],cwd=O,capture_output=True)
    assert addition.returncode==1 and not addition.stderr
    patch+=addition.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('''# E103: native boundary failures and graphics cache recovery

The six reproduced conversion routes now preserve native causes: mesh
polyhedron construction (with and without context), exact graphics export,
point transforms, and both curve mesh-validation helpers. Hypermesh separates
proven degenerate normals from undecided normals and retains scalar failures.
The [contract](contract-v1.md) and [extension](contract-extension-v1.md) state
ownership, domains, migrations and resource limits before implementation.

AttributedMesh now caches successful exact buffers only. The baseline proved
that native export could succeed after stronger scalar evidence while its
sidecar still returned the old cached failure. Repeated, concurrent and shared
metadata exports recover without replacing authoritative geometry. Owned GPU
errors replace borrowed errors; successful buffers remain borrowed.

All four scalar adapters preserve tested categories and causes. Independent
exact normal/coordinate expectations, mutation and eviction checks, the full
original strict-mode corpus, native GPU/scalar tests, FFI tests, attributed OBJ
consumption and 36 real C/C++/Python consumers supply acceptance evidence.
Strict Clippy, formatting and Rust 1.95 all-target checks also pass. See the
[review](review-v1.json) and [commands](command-summary-v1.json) for exact scope.

Undecided polyhedron/graphics ABI outcomes now report status 5 instead of 4;
invalid inputs remain 4. Failure publishes no output handle or buffer. ABI
signatures and numeric status values are unchanged. Private helper failures
are not evidence of public construction failure coverage; public translated
and rotated curve probes succeeded. GPU scalar exhaustion was not reproduced.
A baseline test expectation error and the first candidate's test-only compile
failure, a test-only Clippy finding and a crate-formatting mismatch are retained
with corrected controls and unchanged fixtures. The full minimal/root and scalar
runtime checks precede the final test-borrow and GPU-format-only edits; affected
GPU/root/FFI tests are rerun and release libraries rebuilt. Default-feature,
consumer and remaining checks use the final source pins.

PLY/glTF GPU error flattening remains an open follow-up. WASM host/target checks and the real JavaScript/TypeScript consumers pass;
Go consumers were not executed. No speedup is claimed. The
cache has no heap-byte bound. Current source packages, public installation,
complete provenance and the full plan remain open; Hypervoxel is out of scope.
Historical missing artifacts were not reaudited. The
[checkpoint](checkpoint-v1.json) retains hashes and these limits.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]) and 'native_boundary_failure_admission' not in current
current['updated_on']='2026-10-19';current['native_boundary_failure_admission']=review|{'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations)}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for path in E.iterdir():
    if path.suffix in {'.md','.py','.json'}:
        value=path.read_text();assert all(line==line.rstrip() for line in value.splitlines()) and not value.endswith('\n\n')
        if path.suffix=='.py':ast.parse(value)
    if path.suffix=='.md':
        for link in re.findall(r'\]\(([^)]+)\)',path.read_text()):
            if '://' not in link and not link.startswith('#') and link!='checkpoint-v1.json':assert (path.parent/link.split('#')[0]).exists()
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:checked=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert checked.returncode==0
record={'status':review['classification'],'checkpoint_kind':'native boundary failure and cache admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':len(registry),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{p:sha(O/p) for p in paths},'new_implementation_paths':sorted(new_paths),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_runtime_implementation_admission':True,'production_implementation_changed':True,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'current_revision_consumer_checks_executed':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in sorted(set(roots))],'prior_commit_verified_blobs':24,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'native_boundary_repair_admitted':True,'full_plan_complete':False}),flush=True)
