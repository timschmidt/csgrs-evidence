"""Admit source-installation documentation with retained consumer checks."""
import sys
sys.dont_write_bytecode=True
import ast,gzip,hashlib,json,os,re,shutil,stat,subprocess,tarfile
from pathlib import Path
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
B=Path('/run/media/tim/93da2fa3-3c70-400e-ab48-a5799246bb6a/csgrs/source-installation-admission-20261019-v1')
PREV_F=B.parent/'release-path-validation-final-20261019-v1'
P=O/'docs/evidence/2026-10-19-release-path-validation'
E=O/'docs/evidence/2026-10-19-source-installation-admission'
X=B/'external-evidence'
BASE='9543d9dce99d79d51ff363c0f0dd080e1baf4441'
sys.path[:0]=[str(B/'control'),str(O/'docs/evidence/2026-10-17-resume-integration')]
from source_installation_runner_v1 import sha,resources,reasons
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
paths=set(read(B/'candidate-paths-v1.json'));assert len(paths)==21
assert set(git('diff','HEAD','--name-only').decode().splitlines())==paths
protected='docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py'
assert set(git('ls-files','--others','--exclude-standard').decode().splitlines())=={protected}
assert sha(O/protected)=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json');receipt=read(PREV_F/'commit-verification-v1.json')
assert receipt['commit']==BASE and receipt['verified_blob_count']==17
assert all(hashlib.sha256(git('show','HEAD:'+p)).hexdigest()==h for p,h in receipt['verified_committed_blobs_sha256'].items())
inherited={p:h for p,h in (previous['inherited_implementation_sha256']|previous['implementation_sha256']).items() if p not in paths}
pins=gzread(B/'source-pins-final-v2.json.gz');initial=gzread(B/'source-pins-before-v1.json.gz');matrix_pins=gzread(B/'source-pins-final-v1.json.gz')
assert len(pins)==10156 and set(pins)==set(initial)==set(matrix_pins)
assert {p for p in pins if pins[p]!=initial[p]}==paths
late={f'crates/{name}/README.md' for name in ['hyperlattice','hyperlimit','hypertri','hypergraphics','hyperreal']}
assert {p for p in pins if pins[p]!=matrix_pins[p]}==late
main=read(B/'result-v1.json');final=read(B/'final-doc-result-v1.json')
assert main['passed'] and final['passed'] and main['examples_count']==17 and main['metadata_suites']==16
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
for p,h in read(B/'ffi-release-libraries-v1.json').items():expect(p,h)
binding_preparation=read(B/'prepared-final-bindings-v1.json')
for key in ['consumers_sha256','tools_sha256']:
    for p,h in binding_preparation[key].items():expect(p,h)
assert final['real_ffi_consumers_passed']==3
assert read(B/'simple-input-repair-v1.json')['passed']
assert (B/'logs/source-installation-simple-run/stdout').read_text()==''
help_text=(B/'logs/source-installation-drc-help-run/stdout').read_text()
assert 'Usage: hyperdrc ' in help_text and '--help' in help_text
commands={};test_results={};warnings=[]
for folder in sorted((B/'logs').iterdir()):
    row=read(folder/'result.json');assert row['output_closed'] and not row['stops'] and row['exit_code']==0,folder
    for p,h in row['output_sha256'].items():expect(folder/p,h)
    commands[folder.name]=row
    stderr=(folder/'stderr').read_text();stdout=(folder/'stdout').read_text()
    assert not re.search(r'^\s*(Compiling|Checking|Verifying|Packaging) hypervoxel\b',stderr,re.M)
    warnings += [line for line in stderr.splitlines() if re.match(r'^\s*warning:',line)]
    if '--message-format=json' in row['argv']:
        for line in stdout.splitlines():
            if not line.startswith('{'):continue
            value=json.loads(line)
            if value.get('reason')=='compiler-message' and value['message']['level']=='warning':warnings.append(value['message'])
    results=re.findall(r'test result: ok\. (\d+) passed; (\d+) failed; (\d+) ignored;',stdout)
    if results:test_results[folder.name]=[{'passed':int(a),'failed':int(b),'ignored':int(c)} for a,b,c in results]
assert len(commands)==88 and not warnings,len(commands)
assert all(r['failed']==0 and r['ignored']==0 for rows in test_results.values() for r in rows)
selection=read(B/'selection-v1.json');links={};unresolved={}
for name,row in selection.items():
    path=O/row['readme'];text=path.read_text()
    assert not any(line.rstrip()!=line for line in text.splitlines())
    if name!='hyperreal':assert f'{name} {row["version"]}' in text
    if row['readme_test']:
        block=text.split('<!-- quickstart:start -->\n```rust\n',1)[1].split('\n```\n<!-- quickstart:end -->',1)[0]
        example=O/'crates'/name/'examples'/(row['example']+'.rs')
        assert block.strip()==example.read_text().strip()
        assert sha(example)==initial[str(example.relative_to(O))]
    for link in re.findall(r'\]\(([^)]+)\)',text):
        if '://' in link or link.startswith(('#','mailto:')):continue
        target=path.parent/link.split('#')[0]
        if target.exists():links[str(path.relative_to(O))+'::'+link]=True
        else:unresolved[str(path.relative_to(O))+'::'+link]='Pre-existing missing link outside the installation correction.'
assert set(unresolved)=={'crates/hyperbrep/README.md::../HYPERBREP_REBUILD_PLAN.md'}
prior_readme=git('show','HEAD:crates/hyperbrep/README.md').decode()
assert '](../HYPERBREP_REBUILD_PLAN.md)' in prior_readme
for name in ['hyperlattice','hyperlimit','hypertri','hypergraphics']:
    text=(O/'crates'/name/'README.md').read_text()
    section=text.split('## Quick start\n',1)[1].split('\n## ',1)[0]
    assert 'Run it with `cargo run`' not in section and '\ncargo run\n' not in section
review={'classification':'Admitted source-checkout installation guidance; public distribution remains open.','baseline_revision':BASE,'owner':'Distribution documentation and README metadata assertions.','properties':['P25','P28','P29','P30','P35','P36','P37','P39'],'changed_readmes':18,'changed_metadata_assertions':3,'unchanged_primary_examples_executed':17,'additional_existing_examples_executed':['hypertri/cdt','hypertri/nd'],'readme_metadata_suites':16,'final_markdown_metadata_suites':5,'passed_test_executions':sum(r['passed'] for rows in test_results.values() for r in rows),'test_results':test_results,'command_count':len(commands),'warnings':warnings,'simple_cli_stdout':(B/'logs/source-installation-final-simple-run/stdout').read_text(),'initial_simple_semantic_failure':read(B/'simple-input-repair-v1.json'),'drc_help_executed':True,'renderer_only_configuration_checked':True,'circuit_layout_interchange_checked':True,'ffi_release_static_and_dynamic_libraries_built':True,'ffi_unit_tests_executed':True,'real_ffi_consumers_passed':3,'strict_clippy_passed':True,'formatting_passed':True,'updated_local_links_valid':True,'preexisting_unresolved_links':unresolved,'rust_examples_and_semantic_assertions_unchanged':True,'metadata_migration':'Three assertions now check the current package name/version in source instructions instead of an unavailable registry manifest snippet. README/example byte equality, other metadata and semantic assertions are retained.','late_documentation_only_edit':read(B/'final-doc-edit-v1.json'),'production_implementation_changed':False,'bindings_abi_changed':False,'dependency_feature_or_policy_changes':False,'new_runtime_implementation_admitted':False,'hypervoxel_deferred_by_user':True,'hypervoxel_built_or_packaged':False,'full_runtime_corpus_rerun':False,'current_readme_contents_packaged':False,'public_distribution_complete':False,'full_ci_complete':False,'full_plan_complete':False,'historical_artifact_reaudit':False,'performance_claimed':False,'all_adverse_results_retained':True,'source_example_execution_method':'Cargo builds the exact documented package/example/configuration; independently copied executables run under the separate 60-second limit. Build paths may be reused by Cargo; every executed frozen copy remains retained.','artifact_volume':str(B.parent),'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,'tmp_allowance_gib':58,'logs_allowance_mib':200,'storage_baselines_reset':False,'next':'Continue complete consumer/release and provenance obligations. Repackage changed README contents before a current-archive claim. The public version/dependency blockers and deferred Hypervoxel packaging closure remain open; source instructions do not establish a public install.'}
print(json.dumps({'commands_verified':len(commands),'example_executions':19,'test_executions':review['passed_test_executions']}),flush=True)
prior,missing=load(previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(2040593,921794)
roots=[B,PREV_F,*sorted(Path('/tmp').glob('*source-installation*.py'))]
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
gzwrite(expectations,{'schema_version':3,'kind':'source installation documentation admission','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'temporary_artifacts_volatile':True,'required_loader':'docs/evidence/2026-10-17-resume-integration/load_expectations_v2.py'})
loaded,unavailable=load(expectations,allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
dump(X/'command-results-v1.json',commands)
E.mkdir();external={str(p):sha(p) for p in X.iterdir() if p.is_file()}
dump(E/'external-evidence-v1.json',{'files_sha256':external,'archive_bytes':archive.stat().st_size,'archive_members':len(members),'physical_paths':len(physical),'content_verified':True,'portable_distribution_evidence':False})
dump(E/'review-v1.json',review)
dump(E/'command-summary-v1.json',{name:{key:row[key] for key in ['exit_code','elapsed_seconds','wall_limit_seconds','stops']} for name,row in commands.items()})
for source,target in [(B/'control/contract-v1.md','contract-v1.md'),(B/'control/final-entrypoint-contract-v1.md','final-entrypoint-contract-v1.md'),(B/'control/storage-allowance-v1.json','storage-allowance-v1.json'),(B/'source-pins-before-v1.json.gz','source-pins-before-v1.json.gz'),(B/'source-pins-final-v1.json.gz','matrix-source-pins-v1.json.gz'),(B/'source-pins-final-v2.json.gz','source-pins-v1.json.gz'),(B/'final-doc-edit-v1.json','final-doc-edit-v1.json'),(B/'simple-input-repair-v1.json','simple-input-repair-v1.json'),(Path(__file__),'close_v1.py')]:shutil.copy2(source,E/target)
(E/'implementation.patch').write_bytes(git('diff','--binary'))
(E/'README.md').write_text('''# E101: source-version installation instructions

Eighteen crate READMEs now give concrete source-checkout entry points and retain
the documented feature selections. Obsolete registry installation snippets and
sibling-checkout assumptions are removed. Three metadata assertions follow the
displayed source package versions; example byte-equality and semantic assertions
remain unchanged. The [contract](contract-v1.md) binds the scope before editing.

All seventeen primary examples, two additional triangulation examples, sixteen
README suites, Hyperreal metadata and Simple, HyperDRC help, the renderer-only
and circuit layout/interchange configurations, FFI release libraries and FFI
unit tests pass. Unchanged C, C++ and Python construction-evidence consumers
pass against the frozen release library. Strict Clippy and formatting pass. Five final Markdown-only
corrections receive their affected metadata reruns. The [review](review-v1.json)
and [commands](command-summary-v1.json) record exact configurations and limits.
Cargo builds and frozen executions are separate to retain a runtime wall bound.
The original Simple invocation returned zero without evaluating its argument.
The corrected guide supplies the expression on stdin; the acceptance check now
requires the independently derived answer 7/8 and decimal 0.875. The initial
empty output is retained and is not counted as a completed calculation.

No production implementation, example, manifest, dependency, feature, policy or
binding ABI changes. The current READMEs have not been repackaged; E100's archive
checks describe the prior documentation bytes. Source-checkout success does not
establish public installation. Complete release, full pre-push CI, provenance
and the broader plan remain open, and Hypervoxel remains deferred. One existing
HyperBREP rebuild-plan link remains unresolved outside this installation repair.
Historical missing artifacts were not reaudited. The [checkpoint](checkpoint-v1.json)
retains hashes and the exact admission boundary.
''')
prefix=str(E.relative_to(O))+'/'
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();assert hashlib.sha256(raw).hexdigest()==previous['ledger_after_sha256']
reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]) and 'source_installation_admission' not in current
current['updated_on']='2026-10-19';current['source_installation_admission']=review|{'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':str(expectations)}
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
record={'status':review['classification'],'checkpoint_kind':'source installation documentation admission','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':{str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()},'external_evidence_files_sha256':external,'artifact_expectations':str(expectations),'artifact_expectations_sha256':sha(expectations),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'previously_closed_registry_paths_verified':len(registry),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':inherited,'implementation_sha256':{p:sha(O/p) for p in paths},'new_implementation_paths':[],'restored_native_sha256':{p:h for p,h in previous['restored_native_sha256'].items() if p not in paths},'main_source_pins_sha256':sha(E/'source-pins-v1.json.gz'),'main_source_pins':prefix+'source-pins-v1.json.gz','source_changes_applied':True,'new_runtime_implementation_admission':False,'production_implementation_changed':False,'qualification_this_checkpoint':review,'main_runtime_tests_rerun':False,'current_revision_consumer_checks_executed':True,'open_experiment_artifacts_closed_here':True,'closed_experiment_roots':[str(root) for root in sorted(set(roots))],'prior_commit_verified_blobs':17,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True,'final_source_parent_revision':BASE,'temporary_artifacts_volatile':True,'storage_baselines_reset':False,'all_adverse_results_retained':True,'tmp_allowance_gib':58,'disk_b_allowance_gib':None,'disk_b_physical_free_guard_bytes':1<<30,'logs_allowance_mib':200,'general_speedup_claimed':False}
dump(E/'checkpoint-v1.json',record)
for path,state in states.items():
    info=Path(path).stat();assert (info.st_size,info.st_mtime_ns,info.st_ctime_ns)==state,path
assert all(sha(O/p)==h for p,h in pins.items()) and not reasons(resources())
print(json.dumps({'new_verified_paths':len(physical),'expected_paths':len(loaded),'archive_bytes':archive.stat().st_size,'documentation_admitted':True,'full_plan_complete':False}),flush=True)
