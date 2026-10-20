"""Close glTF empty composition and input validation without rewriting prior evidence."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/gltf-empty-composition-admission-20261019-v1')
PREV_F=B.parent/'interchange-failure-admission-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-interchange-failure-admission'
E=O/'docs/evidence/2026-10-19-gltf-empty-composition-admission'
X=B/'external-evidence'
BASE='04fd2ddf173cc68108777178305d292d2a211db3'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from gltf_empty_runner_v1 import sha,resources,reasons
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
paths=set(read(B/'candidate-paths-v1.json'));assert len(paths)==4
new_paths={'tests/gltf_empty_composition.rs'}
assert len(new_paths)==1
assert set(git('diff','HEAD','--name-only').decode().splitlines())==paths-new_paths
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())==new_paths|{protected}
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json');receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==26
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
pins=gzread(B/'source-pins-final-v4.json.gz');initial=gzread(B/'source-pins-baseline-v1.json.gz')
assert len(pins)==10166 and len(initial)==10165 and set(pins)-set(initial)==new_paths
assert {p for p in pins if pins[p]!=initial.get(p)}==paths
v3_pins=gzread(B/'source-pins-final-v3.json.gz')
assert {p for p,h in pins.items() if v3_pins[p]!=h}=={'tests/gltf_empty_composition.rs'}
assert read(B/'candidate-result-v4.json')['passed']
assert read(B/'baseline-reproduction-v2.json')['results']['deep']['exit_code']==134
assert read(B/'candidate-reproduction-v3.json')['all_expected_results']
assert read(B/'candidate-independent-validation-v3.json')['all_zero_errors']
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
for p,h in read(B/'baseline-compatibility-inputs-v2.json')['library_and_test_sha256'].items():expect(p,h)
for p,h in read(B/'validator-tools-v1.json')['files_sha256'].items():expect(p,h)
for p,h in read(B/'candidate-format-fixtures-v3.json').items():expect(p,h)
for p,h in read(B/'candidate-libraries-v3.json').items():expect(p,h)
for p,h in read(B/'retained-probe-libraries-v1.json')['libraries_sha256'].items():expect(p,h)
expect('/usr/bin/time',read(B/'prepared-deep-resource-v1.json')['timer_sha256'])
expect(B/'frozen/gltf-empty-probe-candidate-v3',read(B/'prepared-deep-resource-v1.json')['binary_sha256'])
compiler=read(Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1/cargo-preparation-protocol-v1.json'))
for p,h in compiler['tool_sha256'].items():expect(p,h)
commands={};test_results={};warnings=[]
for folder in sorted((B/'logs').iterdir()):
    row=read(folder/'result.json');assert row['output_closed'] and not row['stops'],folder
    expected_exit={'gltf-empty-baseline-cycle':134,'gltf-empty-baseline-deep':134,'gltf-empty-baseline-independent-deep':1,'gltf-empty-baseline-compatibility-build':1,'gltf-empty-candidate-v1-focused-build':101,'gltf-empty-candidate-v2-focused-build':101}.get(folder.name,0)
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
assert not warnings,warnings
candidate_results={name:rows for name,rows in test_results.items() if name.startswith('gltf-empty-candidate-v4-')}
assert all(row['failed']==0 and row['ignored']==0 for rows in candidate_results.values() for row in rows)
review={
    'classification':'Retained glTF empty-result composition, validated reader preconditions and iterative scene traversal.',
    'baseline_revision':BASE,
    'owner':'CSGRS glTF format boundary; native triangle carriers, gltf parser/document validation and shared scalar/mesh implementations retained.',
    'properties':['P4','P6','P18','P19','P25','P26','P27','P29','P30','P35','P36','P37','P39'],
    'changed_paths':sorted(paths),
    'baseline':read(B/'baseline-reproduction-v2.json'),
    'candidate':read(B/'candidate-reproduction-v3.json'),
    'baseline_accessor_compatibility':read(B/'baseline-compatibility-result-v2.json'),
    'candidate_revisions':[read(B/('candidate-revision-v'+str(version)+'.json')) for version in [2,3,4]],
    'probe_library_retention':read(B/'retained-probe-libraries-v1.json'),
    'intermediate_library_replacement':read(B/'prepared-probe-library-retention-v1.json'),
    'candidate_compile_failures':'V1 assumed reversible gltf scene iterators; V2 also exposed the child iterator restriction. Collected stack segments are reversed in V3 to preserve DFS order. The baseline compatibility probe initially attempted push on Arc slices; V2 replaces the owned buffers. Original failures are retained.',
    'final_validation_timing':'Production and documentation are unchanged since V3. V4 strengthens only the disconnected-component semantic oracle. All 12 affected tests and strict minimal lint pass again at V4; full affected runtime, default IO/export tests, remaining lint/docs/feature/MSRV/WASM checks follow that final edit. V3 format-validator, isolated probes and serialization comparisons exercise identical production hashes.',
    'candidate_test_executions':sum(row['passed'] for rows in candidate_results.values() for row in rows),
    'test_results':test_results,'command_count':len(commands),'warnings':warnings,
    'independent_semantics':{
        'empty':'Schema-valid empty scene, named empty node, JSON-only GLB; canonical empty import -> transform -> strict regularized-set identities -> export/import, union and complete repeated subtraction.',
        'nonempty':'Exact box boundary planes and signed volume, separately checked for each disconnected component before Booleans; strict PWN/manifold checks. Native TRIANGLES index order and exact integer positions checked across 24 unsigned/implicit/interleaved/sparse JSON and GLB combinations.',
        'provenance':'Approximate hull -> strict full subtraction -> export -> import -> transform/strict Boolean -> export/import. Import reports missing source history, and subsequent local certification does not erase it. Empty import consumes no coordinates and does not add a projection flag. The format does not preserve the original construction receipt.',
        'malformed':'Zero counts, missing references, wrong index type, unreadable ranges, alignment/overflow, sparse order/count/bounds, cycles/multiple parents/non-root scene nodes, present empty arrays and invalid transforms return errors. Invalid native geometry and duplicate names cannot become successful empty output.',
        'full_scale':'The unchanged 10000-node valid hierarchy completes. The baseline aborts with stack overflow; the independent Khronos validator also overflows on this fixture. No reduced fixture replaces it.',
        'caches':['cold','warm','evicted','source position replacement','source triangle replacement','returned String mutation','concurrent per-thread export'],
    },
    'independent_validator':read(B/'candidate-independent-validation-v3.json'),
    'baseline_independent_validator':read(B/'baseline-independent-validation-v2.json'),
    'serialization_comparison':read(B/'serialization-comparison-v3.json'),
    'writer_contract':'Geometry and duplicate-name failures leave preexisting sink bytes unchanged. Later stream failures may publish a prefix.',
    'api_migration':'Valid empty scenes/objects now succeed. An asset without a scene is still rejected, now Unsupported instead of MalformedInput because library assets can be valid. Malformed forest/accessor/count/range cases now diagnose before readers/traversal; unreadable indices are not silently replaced. Nonempty serialization is byte-identical in the retained six-artifact comparison.',
    'parser_bridge':'The gltf-json dependency requires Scene.nodes although glTF permits omission. Normalize that one optional property internally, reject explicitly empty node arrays, then reuse its typed Root and native document validation. Prevalidate accessor references before its unchecked POSITION hook and consumed byte ranges before its readers. No replacement geometry kernel.',
    'cache_budget':'Four successful strings and owned Arc identities per thread, FIFO; no heap-byte bound or reset/disable API. Cache implementation unchanged.',
    'deep_fixture_resources':read(B/'deep-resource-result-v1.json'),
    'internal_total_work_memory_cancellation_complete':False,
    'validation':read(B/'candidate-result-v4.json'),
    'prepared_matrix':read(B/'prepared-validation-matrix-v1.json'),
    'foreign_binding_runtime_consumers_executed':0,
    'foreign_boundary_qualification':'Current native/JS bindings do not expose these glTF functions; wasm32 compile/Clippy checked. Actual Node Khronos validator consumes generated JSON/GLB files; this is format validation, not binding acceptance.',
    'full_default_runtime_repeated':False,'full_default_previous_revision_only':'E103 at 291259adc',
    'msrv_all_targets_checked':'1.95.0','msrv_runtime_not_executed':True,
    'source_package_reverification_open':True,'public_distribution_complete':False,
    'full_ci_complete':False,'full_plan_complete':False,'historical_artifact_reaudit':False,
    'hypervoxel_deferred_by_user':True,'hypervoxel_built_or_packaged':False,
    'performance_claimed':False,'all_adverse_results_retained':True,'artifact_volume':str(B.parent),
    'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,
    'tmp_allowance_gib':58,'logs_allowance_mib':200,'storage_baselines_reset':False,
    'scope_limits':['No claim of full glTF schema compliance or arbitrary input allocation/cancellation bounds.','Unselected unsupported primitive representations are not flattened. Existing transform float projection and native normal-certification failure shape remain unchanged.','The official independent validator cannot complete the unchanged 10000-node valid fixture; its raw error is preserved.','No new full default runtime, foreign binding runtime, package or public-release acceptance is claimed.'],
    'next':'Repair reproduced PLY tiny-coordinate loss, then classify scalar-adapter index projection and remaining native format failures. Continue strict completion, provenance and current source-package/public release validation. Hypervoxel remains out of scope.'
}
print(json.dumps({'commands_verified':len(commands),'candidate_test_executions':review['candidate_test_executions']}),flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(2084527,921794)
snapshot=B/'final-source-v4';assert not snapshot.exists()
for path in paths:
    target=snapshot/path;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(O/path,target);assert sha(target)==pins[path]
roots=[B,PREV_F,*sorted(Path('/tmp').glob('*gltf-empty*'))]
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
gzwrite(expectations,{'schema_version':3,'kind':'glTF empty composition admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
E.mkdir();external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'portable_distribution_evidence':False})
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{key:row[key] for key in ['exit_code','elapsed_seconds','wall_limit_seconds','stops']} for name,row in commands.items()})
for source,target in [
    (B/'control/contract-v1.md','contract-v1.md'),
    (B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),
    (B/'source-pins-baseline-v1.json.gz','source-pins-before-v1.json.gz'),
    (B/'source-pins-final-v4.json.gz','source-pins-v1.json.gz'),
    (B/'baseline-reproduction-v2.json','baseline-reproduction-v1.json'),
    (B/'candidate-reproduction-v3.json','candidate-reproduction-v1.json'),
    (B/'candidate-revision-v2.json','compile-revision-v2.json'),
    (B/'candidate-revision-v3.json','compile-revision-v3.json'),
    (B/'candidate-revision-v4.json','oracle-revision-v1.json'),
    (B/'serialization-comparison-v3.json','serialization-comparison-v1.json'),
    (Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
patch=git('diff','--binary')
for path in sorted(new_paths):
    addition=subprocess.run(GIT+['diff','--no-index','--binary','--','/dev/null',path],cwd=O,capture_output=True)
    assert addition.returncode==1 and not addition.stderr
    patch+=addition.stdout
(E/'implementation.patch').write_bytes(patch)
(E/'README.md').write_text('# E105: glTF empty-result composition\n\nCanonical empty meshes, named empty objects and scenes with no objects now\nexport and reimport as valid empty scenes. Imported emptiness continues\nthrough transforms, strict Boolean identities, complete subtraction and export.\nThe [contract](contract-v1.md) identifies the owning format layer, input domain\nand external containment before implementation.\n\nThe baseline also exposed zero-count accessor and invalid-reference panics,\nunreadable indices silently replaced with implicit indices, and stack overflow\non cyclic and deep node graphs. Reader preconditions now fail explicitly and\nnode forests are checked and traversed iteratively. The original 10,000-node\nvalid hierarchy completes without reducing its size or imposing a depth cap.\nPositions without triangles, malformed native indices and duplicate names\nremain errors. Geometry failures leave writer sinks untouched.\n\nTwelve public tests cover exact geometry, separate topology checks, qualified\nsource history, scene selection and transforms, caches, invalid input and\ncontinued composition. Twenty-four valid accessor combinations also pass on\nthe retained baseline. The final test edit strengthens the disconnected-box\noracle before any Boolean call; production is unchanged from the V3 format\nchecks. All affected tests and the broader matrix run after that edit.\n\nThe Khronos validator accepts all 32 generated JSON/GLB files with zero errors.\nIt also identifies malformed baseline fixtures, but the tool itself overflows\nits stack on the full deep valid hierarchy. That limitation and the original\nfixture are retained. Six nonempty serialization snapshots match the previous\nbaseline byte for byte, independently of the semantic checks.\n\nThe [review](review-v1.json) and [command record](command-summary-v1.json)\nrecord full affected minimal-feature runtime tests, default IO/export tests,\nstrict all-target Clippy, isolated features, Rust 1.95 checks, rustdoc, wasm32\ncompilation/Clippy and formatting. Compiler mistakes and all adverse probes\nremain in the raw evidence. The current C/JS APIs do not expose these glTF\nfunctions; Node format validation is not foreign binding acceptance.\n\nImport reports missing source history; empty import consumes no coordinates.\nLater local proofs cannot certify original source intent. Full provenance,\ninternal total-work/allocation/cancellation contracts, broader format\nconformance, current package/public installation and the full plan remain open.\nThe full default runtime suite was not repeated. PLY tiny-coordinate loss and\nadapter index projection remain next. There is no performance claim or\nHypervoxel work. Historical missing artifacts were not reaudited. The\n[checkpoint](checkpoint-v1.json) records the exact evidence and limitations.\n')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]) and 'gltf_empty_composition_admission' not in current
current['updated_on']='2026-10-19';current['gltf_empty_composition_admission']=review|{'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations)}
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
record={'status':review['classification'],'checkpoint_kind':'glTF empty composition admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':len(registry),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{p:sha(O/p) for p in paths},'new_implementation_paths':sorted(new_paths),'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_runtime_implementation_admission':True,'production_implementation_changed':True,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':True,'current_revision_consumer_checks_executed':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in sorted(set(roots))],'prior_commit_verified_blobs':26,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'gltf_empty_composition_admitted':True,'full_plan_complete':False}),flush=True)
