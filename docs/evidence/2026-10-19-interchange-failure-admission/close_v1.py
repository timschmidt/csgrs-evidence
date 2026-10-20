"""Close the typed interchange failure repair without rewriting prior evidence."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/interchange-failure-admission-20261019-v1')
PREV_F=B.parent/'native-boundary-failure-admission-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-native-boundary-failure-admission'
E=O/'docs/evidence/2026-10-19-interchange-failure-admission'
X=B/'external-evidence'
BASE='291259adce256240eb8a0ff5a283388194c3b746'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from interchange_runner_v1 import sha,resources,reasons
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
paths=set(read(B/'candidate-paths-v2.json'));assert len(paths)==7
new_paths={'tests/interchange_failures.rs'}
assert len(new_paths)==1
assert set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new_paths
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new_paths|{protected}
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json');receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==33
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
pins=gzread(B/'source-pins-final-v3.json.gz');initial=gzread(B/'source-pins-baseline-v1.json.gz')
assert len(pins)==10165 and len(initial)==10164 and set(pins)-set(initial)==new_paths
assert {p for p in pins if pins[p]!=initial.get(p)}==paths
assert read(B/'candidate-result-v3.json')['passed']
assert read(B/'public-reproduction-v2.json')['failed']==4
assert read(B/'serialization-comparison-v3.json')['identical_bytes']
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
for p,h in read(B/'prepared-msrv-v1.json')['tools_sha256'].items():expect(p,h)
for p,h in read(B/'baseline-obj-inputs-v1.json')['library_sha256'].items():expect(p,h)
compiler=read(Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1/cargo-preparation-protocol-v1.json'))
for p,h in compiler['tool_sha256'].items():expect(p,h)
commands={};test_results={};warnings=[]
for folder in sorted((B/'logs').iterdir()):
    row=read(folder/'result.json');assert row['output_closed'] and not row['stops'],folder
    expected_exit={'interchange-baseline-public-tests-v1-build':1,'interchange-baseline-public-tests-v2-run':101,'interchange-candidate-minimal-full-tests':101,'interchange-candidate-v2-minimal-clippy':101}.get(folder.name,0)
    assert row['exit_code']==expected_exit,(folder,row['exit_code'])
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
assert len(commands)>=25
assert all(row['command']=='interchange-candidate-v2-minimal-clippy' and row['diagnostic']=='warning: build failed, waiting for other jobs to finish...' for row in warnings)
candidate_results={name:rows for name,rows in test_results.items() if name.startswith('interchange-candidate-v3-') or name=='interchange-candidate-v2-minimal-full-tests'}
assert all(row['failed']==0 and row['ignored']==0 for rows in candidate_results.values() for row in rows)
review={
    'classification':'Retained typed native causes at PLY/glTF graphics and OBJ vertex-reference boundaries.',
    'baseline_revision':BASE,
    'owner':'CSGRS format conversion; shared existing ValidationError conversions own category mapping, Hypermesh owns native failure.',
    'properties':['P4','P6','P18','P25','P27','P29','P30','P35','P36','P37','P39'],
    'changed_paths':sorted(paths),'production_conversion_routes':3,
    'baseline_public_regressions':4,'baseline_semantic_success_controls':5,
    'baseline_existing_obj_tests_passed':7,
    'baseline_v1_compile_failure':'Probe subtracted Rational from Real without explicit promotion; v2 fixes that type conversion only. Compiler failure and both fixture versions retained.',
    'candidate_v1_old_obj_assertion_failures':3,
    'existing_test_migration':read(B/'candidate-revision-v2.json'),
    'candidate_v1_qualification':'Nine new tests and unchanged-success serialization comparison passed. Full minimal run then failed three existing OBJ assertions expecting the old Geometry string carrier. V2 strengthens them with exact native variant, index, vertex count, source chain, and InvalidInput; every original fixture and diagnostic/composition assertion is retained.',
    'all_checks_after_final_test_edit':False,
    'final_test_lint_revision':read(B/'candidate-revision-v3.json'),
    'final_validation_timing':'V2 passed all 251 minimal tests. Clippy then required as_chunks in the independent glTF test decoder. V3 adds that and a no-remainder assertion; production hashes and all other files are identical. All nine affected tests, default IO/export suites and remaining lint/docs/feature/MSRV/WASM checks run after the final test edit.',
    'candidate_test_executions':sum(row['passed'] for rows in candidate_results.values() for row in rows),
    'test_results':test_results,'command_count':len(commands),'warnings':warnings,
    'independent_semantics':{'normal':'Open triangle (0,0,0),(1,0,0),(0,3,4) has normal (0,-4/5,3/5); independent PLY text and glTF buffer decoding check expected finite projections.', 'closed_geometry':'Unit cube OBJ/glTF roundtrips retain closed PWN/manifold checks, exact coordinate bounds and oriented volume 1, union with empty and self-difference then downstream recovery.', 'empty':'PLY empty serialization and OBJ empty roundtrip/union pass. glTF empty export is still rejected and separately reproduced.', 'cache_recovery':'Unresolved positive height pi minus its -1024-bit lower enclosure gains proof at -1100 bits. Exports retry successfully; the test certifies normal availability, not topology or fidelity of the tiny quantized coordinates.', 'cache_states':['cold','warm','evicted','mutated source positions','mutated source triangles','returned String mutation','concurrent per-thread output','stronger-proof retry']},
    'native_failure_domain':['invalid source triangle indices','proved degenerate normal','undecided normal'],
    'unreproduced_categories':['No genuine GPU resource-exhaustion or scalar-domain failure fixture is claimed.'],
    'writer_contract':'Geometry conversion errors leave preexisting sink bytes unchanged; stream failures remain StdIo. Streaming errors may publish a prefix.',
    'api_migration':'Existing IoError::Construction replaces IoError::Geometry for these three native sources. source.kind() and Error::source() preserve categories and context. Display prefix changes to <format> construction failed:, followed by the original diagnostic. Signatures and success serialization unchanged.',
    'serialization_comparison':read(B/'serialization-comparison-v3.json'),
    'adjacent_findings':read(B/'logs/interchange-baseline-diagnostics-run/stdout'),
    'scope_limits':['PLY fixed decimal formatting loses a representable 2^-70 coordinate; reproduced and still open.', 'glTF empty mesh export returns a Geometry error; reproduced and still open.', 'ScalarMesh index conversion erases TryFromIntError for usize exceeding u32 in a malformed native carrier; valid billion-vertex input not allocated or claimed.', 'Other format/triangulation conversions may still flatten native errors; this patch does not establish global completion.'],
    'cache_budget':'Four successful strings and owned Arc identities per thread, FIFO; no heap-byte bound or reset/disable API. Cache implementation unchanged.',
    'internal_total_work_memory_cancellation_complete':False,
    'validation':read(B/'candidate-result-v3.json'),
    'prepared_matrix':read(B/'prepared-validation-matrix-v3.json'),
    'foreign_runtime_consumers_executed':0,
    'foreign_boundary_qualification':'Current native/JS bindings do not expose the three changed format exports; actual wasm32 feature compile/Clippy checked. No new foreign-runtime acceptance claimed.',
    'full_default_runtime_repeated':False,'full_default_previous_revision_only':'E103 at 291259adc',
    'msrv_all_targets_checked':'1.95.0','msrv_runtime_not_executed':True,
    'source_package_reverification_open':True,'public_distribution_complete':False,
    'full_ci_complete':False,'full_plan_complete':False,'historical_artifact_reaudit':False,
    'hypervoxel_deferred_by_user':True,'hypervoxel_built_or_packaged':False,
    'performance_claimed':False,'all_adverse_results_retained':True,'artifact_volume':str(B.parent),
    'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,
    'tmp_allowance_gib':58,'logs_allowance_mib':200,'storage_baselines_reset':False,
    'next':'Repair reproduced glTF empty-output composition and PLY coordinate fidelity, then classify scalar-adapter index projection and remaining native format conversion gaps. Continue strict completion, provenance and current source-package/public release validation; Hypervoxel remains out of scope.'
}
print(json.dumps({'commands_verified':len(commands),'candidate_test_executions':review['candidate_test_executions']}),flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(2075109,921794)
snapshot=B/'final-source-v3';assert not snapshot.exists()
for path in paths:
    target=snapshot/path;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/path,target);assert sha(target)==pins[path]
roots=[B,PREV_F,*sorted(Path('/tmp').glob('*interchange*'))]
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
gzwrite(expectations,{'schema_version':3,'kind':'typed interchange failure admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
E.mkdir();external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'portable_distribution_evidence':False})
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{key:row[key] for key in ['exit_code','elapsed_seconds','wall_limit_seconds','stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-baseline-v1.json.gz','source-pins-before-v1.json.gz'),(B/'source-pins-final-v3.json.gz','source-pins-v1.json.gz'),(B/'public-reproduction-v2.json','baseline-reproduction-v1.json'),(B/'candidate-revision-v2.json','test-migration-v1.json'),(B/'candidate-revision-v3.json','test-decoder-revision-v1.json'),(B/'serialization-comparison-v3.json','serialization-comparison-v1.json'),(B/'logs/interchange-baseline-diagnostics-run/stdout','adjacent-findings-v1.json'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
patch=git('diff','--binary')
for path in sorted(new_paths):
    addition=subprocess.run(GIT+['diff','--no-index','--binary','--','/dev/null',path],cwd=O,capture_output=True)
    assert addition.returncode==1 and not addition.stderr
    patch+=addition.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('# E104: native interchange failures\n\nPLY/glTF graphics construction and OBJ vertex-reference validation now retain\nnative failure categories and sources through IoError::Construction. Invalid\nindices, proved degeneracy and undecided normals remain distinct. Geometry\nfailure leaves writer sinks untouched. The [contract](contract-v1.md) states\nthe input domain, owning layer and containment before implementation.\n\nFour regression tests fail on the unchanged baseline; five success controls\npass, including independently derived geometry expectations. All nine pass after the repair. The seven original OBJ tests\nalso pass on the baseline. Their three error-variant assertions require the\nexplicit documented migration and now check native fields and causes in\naddition to retaining original fixtures and diagnostic checks. The first probe\ncompile failure and initial candidate assertion failures remain preserved.\n\nIndependent decoded position/normal expectations, closed OBJ/glTF reimports,\nstrict topology, exact volume, empty composition, cache mutation/eviction,\nconcurrent output and stronger-proof retry supply semantic evidence. Six\nsuccessful PLY/glTF/OBJ artifacts also match the baseline byte for byte; this\ncomparison is separate from semantic validation. Cache recovery certifies the\nnormal calculation, not fidelity of tiny coordinates after finite projection.\n\nAll 251 minimal-feature tests pass at v2. A subsequent Clippy finding changes\nonly the independent glTF test decoder to as_chunks with an added no-remainder\nassertion. All nine affected tests run again at v3. Default-feature IO/export\nregressions, strict all-target Clippy, individual features, Rust 1.95 checks,\nrustdoc, wasm32 compilation/Clippy and formatting run after that final edit. See the\n[review](review-v1.json) and [command record](command-summary-v1.json) for actual\ncounts and configurations. No new foreign-runtime coverage is claimed: the\ncurrent C/JS bindings do not expose these format export APIs. The full default\nruntime suite was not repeated; E103 records its prior-revision result.\n\nThe [adjacent findings](adjacent-findings-v1.json) remain open: glTF empty export,\nPLY tiny-coordinate rounding, and scalar-adapter index conversion. Four cache\nentries do not bound heap bytes; internal total-work and cancellation contracts\nremain incomplete. There is no performance claim or Hypervoxel work. Current\nsource packages, public installation, complete provenance and the full plan\nremain open. Historical missing artifacts were not reaudited. The\n[checkpoint](checkpoint-v1.json) records exact evidence and these limitations.\n')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]) and 'interchange_failure_admission' not in current
current['updated_on']='2026-10-19';current['interchange_failure_admission']=review|{'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations)}
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
record={'status':review['classification'],'checkpoint_kind':'typed interchange failure admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':len(registry),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{p:sha(O/p) for p in paths},'new_implementation_paths':sorted(new_paths),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_runtime_implementation_admission':True,'production_implementation_changed':True,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'current_revision_consumer_checks_executed':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in sorted(set(roots))],'prior_commit_verified_blobs':33,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'interchange_repair_admitted':True,'full_plan_complete':False}),flush=True)
