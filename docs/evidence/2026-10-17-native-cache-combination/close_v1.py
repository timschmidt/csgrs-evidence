# Preserve the combination result and its source, fixture, and resource evidence.
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
O=Path('/home/tim/Documents/GitHub/workspace/csgrs')
V=Path('/run/media/tim/Disk B/csgrs-properties-validation-2026-10-17-v1')
D=V/'paper-worktree-v1';W=Path(__file__).resolve().parent;C=V/'control/native-combination-v1'
P=D/'docs/evidence/2026-10-17-in-scope-packages';E=D/'docs/evidence/2026-10-17-native-cache-combination'
PREFIX=str(E.relative_to(D))+'/'
BASE='2564d20ed04e23c54ab8969b71ba2b0843efac63'
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0']
os.environ['GIT_OPTIONAL_LOCKS']='0'
sys.path.insert(0,str(O/'docs/evidence/2026-10-16-physical-build-requalification'))
from load_expectations_v1 import load

def sha(path):
    with Path(path).open('rb') as stream:return hashlib.file_digest(stream,'sha256').hexdigest()
def read(path):return json.loads(Path(path).read_text())
def dump(path,value):Path(path).write_text(json.dumps(value,sort_keys=True,indent=2)+'\n')
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end()
    value,count=json.JSONDecoder().raw_decode(raw[start:].decode())
    return start,start+len(raw[start:].decode()[:count].encode()),value
def inherited_path(name):return D/name if (D/name).exists() else O/name
def git(args):return subprocess.check_output(GIT+args,cwd=D)
assert not E.exists() and shutil.disk_usage(D).free>768*1024**2
assert git(['rev-parse','HEAD']).decode().strip()==BASE and not git(['status','--porcelain=v1','--untracked-files=all'])
previous=read(P/'checkpoint-v1.json');assert all(sha(D/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(D/previous['artifact_expectations'],allow_unqualified=True)
assert len(prior)==1276675 and len(missing)==27093
inherited=previous['inherited_implementation_sha256']|previous['implementation_sha256']
live=previous['restored_native_sha256']|inherited
for pins in [live,previous['extra_unchanged_inputs_sha256'],previous['live_source_dependency_pins_sha256']]:
    assert all(sha(inherited_path(p))==h for p,h in pins.items())
assert sha(D/'docs/properties-status.json')==previous['ledger_after_sha256']
assert sha(O/'docs/properties-status.json')=='b86be07fd3b288a1ca97665d5ddce3988eb07c5ef112e136c3eaca4c2904cde3'
assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=O,text=True).strip()=='7ed43501755fd64a01f54c3078d12229cbc0129d'
final=read(V/'native-combination-final-review-v1.json')
assert final['format_exit_code']==0 and final['baseline_missing_claims']==14
assert final['candidate_focused_passes']==61 and final['candidate_focused_failures']==0
assert sha(C/'finish_v2.py')==final['helper_sha256']
cache_review=read(C/'cache-admission-review-v1.json')
assert all(sha(D/p)==row['sha256'] for p,row in cache_review['reviewed_checkpoints'].items())
source_roots=[];artifact_roots=[];commands={};sources={};outcomes={};binaries=set()
for mode in ['baseline','candidate']:
    prep=read(V/('native-combination-'+mode+'-preparation-v1.json'))
    protocol=read(V/('native-combination-'+mode+'-protocol-v1.json'))
    result=read(V/('native-combination-'+mode+'-result-v1.json'));outcomes[mode]=result
    assert result['complete_for_declared_scope'] and result['source_unchanged']
    assert sha(C/'prepare_v1.py')==prep['helper_sha256']
    assert sha(C/'validate_v1.py')==protocol['helper_sha256']
    assert sha(C/'contract-v1.md')==prep['contract_sha256']==protocol['contract_sha256']
    inventory=Path(prep['source_inventory']);assert sha(inventory)==prep['source_inventory_sha256']==protocol['source_inventory_sha256']
    pins=json.loads(gzip.decompress(inventory.read_bytes()));root=Path(prep['source_root']);sources[mode]=pins
    assert len(pins)==10266 and all(sha(root/p)==h for p,h in pins.items())
    assert subprocess.check_output(GIT+['rev-parse','HEAD'],cwd=root,text=True).strip()==BASE
    assert all(pins[p]==h for p,h in cache_review['rust_proposal_sha256'].items())
    if mode=='candidate':assert all(pins[p]==h for p,h in prep['original_e36_file_sha256'].items())
    source_roots.append(root);artifact_roots.append(Path(protocol['binary_snapshot_root']))
    for name,row in result['artifacts'].items():
        path=Path(row['executed_copy']);assert sha(path)==row['sha256'];binaries.add(path)
    for label,row in result['commands'].items():
        folder=V/'logs'/('native-combination-'+mode+'-'+label+'-v1')
        assert read(folder/'result.json')==row and row['output_closed'] and not row['stops']
        assert all(sha(folder/n)==h for n,h in row['output_sha256'].items())
        commands[folder.name]=row
assert outcomes['baseline']['focused']['kicad_track_failures']['passed']==39
assert outcomes['baseline']['focused']['kicad_native_strokes']['failed']==10
assert outcomes['baseline']['focused']['kicad_native_aggregation']['passed']==8
assert outcomes['baseline']['focused']['kicad_native_aggregation']['failed']==4
assert len(binaries)==7
original_tests=O/'docs/evidence/2026-10-17-kicad-native-strokes/candidate-changes-v4'
for p in ['crates/hyperdrc/tests/kicad_native_strokes.rs','crates/hyperdrc/tests/kicad_native_aggregation.rs']:
    assert sources['baseline'][p]==sources['candidate'][p]==sha(original_tests/p)
for p in ['crates/hyperdrc/src/app.rs','crates/hyperdrc/src/checks/layer.rs']:
    assert sources['baseline'][p]==sources['candidate'][p]
fixtures=read(artifact_roots[1]/'fixtures-v1.json');assert len(fixtures)==2
for row in fixtures.values():assert row['exit_code']==0 and row['independent_extractors_agree'] and sha(row['archive'])==row['archive_sha256']
folder=V/'logs/native-combination-final-format-v1';row=read(folder/'result.json')
assert row['exit_code']==0 and not row['stops'] and row['output_closed']
assert all(sha(folder/n)==h for n,h in row['output_sha256'].items());commands[folder.name]=row
assert len(commands)==12
cli_root=V/'native-combination-cli-v1';cli=read(cli_root/'result-v1.json')
assert cli['complete_for_declared_scope'] and cli['fresh_cli_test_passes']==2 and cli['fresh_cli_test_failures']==0
assert sha(C/'cli_retention_v1.py')==cli['helper_sha256']
assert sha(C/'cli-retention-contract-v1.md')==cli['contract_sha256']
assert not cli['first_baseline_cli_image_preserved'] and cli['baseline_rebuilt_for_fresh_qualification']
for row in cli['children'].values():
    path=Path(row['frozen_path']);assert sha(path)==row['sha256'];binaries.add(path)
for label,row in cli['commands'].items():
    folder=V/'logs'/('native-combination-cli-'+label+'-v1')
    assert read(folder/'result.json')==row and row['output_closed'] and row['exit_code']==0 and not row['stops']
    assert all(sha(folder/n)==h for n,h in row['output_sha256'].items());commands[folder.name]=row
assert len(commands)==15 and len(binaries)==9
artifact_roots.append(cli_root)
cli2_root=V/'native-combination-cli-v2';cli2=read(cli2_root/'result-v1.json')
assert cli2['complete_for_declared_scope'] and cli2['fresh_baseline_cli_test_passed']
assert cli2['target_initially_absent'] and cli2['v1_baseline_retry_superseded'] and cli2['original_compilations_verified_fresh']
assert sha(C/'cli_retention_v2.py')==cli2['helper_sha256']
assert sha(C/'cli-retention-contract-v2.md')==cli2['contract_sha256']
correction=read(cli2_root/'stale-artifact-correction-v1.json')
assert not correction['shared_target_retry_qualified_for_baseline']
assert all(not row['matches_retained_test'] for row in cli['rebuilt_test_images'].values())
assert cli['children']['baseline']['sha256']==cli['children']['candidate']['sha256']
for row in cli2['copies'].values():
    path=Path(row['frozen_path']);assert sha(path)==row['sha256'];binaries.add(path)
for label,row in cli2['commands'].items():
    folder=V/'logs'/('native-combination-cli-'+label+'-v2')
    assert read(folder/'result.json')==row and row['output_closed'] and row['exit_code']==0 and not row['stops']
    assert all(sha(folder/n)==h for n,h in row['output_sha256'].items());commands[folder.name]=row
assert len(commands)==17 and len(binaries)==11
fresh_cli_target=Path(cli2['target']);assert fresh_cli_target==V/'target-native-combination-cli-baseline-v2'
artifact_roots.append(cli2_root)
for name in commands:
    stderr=(V/'logs'/name/'stderr').read_text()
    assert not re.search(r'(?:Compiling|Checking|Verifying|Packaging) hypervoxel\b',stderr)
metrics={}
for label,record in outcomes['candidate']['gates'].items():
    stderr=(V/'logs'/('native-combination-candidate-'+label+'-v1')/'stderr').read_text()
    matches=re.findall(r'took ([0-9]+(?:\.[0-9]+)?)s(?: of worker time)?',stderr)
    metrics[label]={'exit_code':record['exit_code'],'process_elapsed_seconds':record['elapsed_seconds'],
        'assertion_time_seconds':float(matches[-1]) if matches else None,
        'assertion_time_unit':'worker CPU seconds' if label=='full-board' else 'check-body wall seconds' if label=='copper-neck' else 'wall seconds',
        'original_threshold_seconds':60 if label=='copper-neck' else 120}
failed=[name for name,row in metrics.items() if row['exit_code']!=0]
assert all(metrics[n]['assertion_time_seconds'] is not None for n in failed)
review={'status':final['decision'],'target_revision':BASE,'cache_admission_review':cache_review,
    'source_roots':{m:str(source_roots[i]) for i,m in enumerate(['baseline','candidate'])},
    'source_files_per_variant':10266,'e36_v4_files_byte_identical':13,'cache_rust_proposal_unchanged':True,
    'baseline_results':{k:{f:r[f] for f in ['passed','failed','ignored']} for k,r in outcomes['baseline']['focused'].items()},
    'candidate_focused_passed':61,'candidate_focused_failed':0,'candidate_focused_ignored':0,
    'test_relationships':final['test_relationships'],'native_resource_gates':metrics,'failed_gates':failed,
    'all_original_gates_passed':not failed,'format_exit_code':0,'full_fixture_extractions_verified':2,
    'retained_test_executable_copies':8,'retained_cli_copies':3,'qualified_cli_copies':2,'raw_commands':len(commands),
    'source_unchanged_during_execution':True,'fresh_cli_test_passes':2,
    'cli_child_retention_v1_superseded_for_baseline':cli,'cli_child_retention_v2':cli2,
    'stale_shared_target_retry_rejected':correction,'unqualified_retry_commands':correction['rejected_commands'],
    'first_baseline_cli_image_preserved':False,
    'same_contract_speedup_claimed':False,'no_geometry_policy_fixture_threshold_weakening':True,
    'independent_report_migration_audit_complete':False,'clippy_rerun':False,'full_downstream_suite_rerun':False,
    'known_historical_clippy_failure':'E36 v4 map_clone remains unresolved in the unchanged prototype',
    'known_historical_report_migration':'12/201 to 12/197 still requires independent audit',
    'cache_index_admitted':False,'exact_ingress_admitted':False,'original_35_file_bundle_restored':False,
    'hypervoxel_deferred_by_user':True,'external_distribution_complete':False,'production_source_changes':False,
    'full_plan_complete':False,'historical_missing_paths':27093,'original_worktree_integration_pending':True,
    'preparation_failure_preserved':read(C/'finish-helper-preparation-failure-v1.json')}
dump(W/'review-v1.json',review)
subprocess.run(GIT+['sparse-checkout','add',str(E.relative_to(D))],cwd=D,check=True,stdout=subprocess.DEVNULL)
E.mkdir(parents=True)
for name in ['contract-v1.md','close_v1.py','review-v1.json']:shutil.copy2(W/name,E/name)
closed_roots=[W,C,*source_roots,*artifact_roots,fresh_cli_target]
for name in commands:closed_roots.extend([V/'logs'/name,V/'scratch'/name])
selected=[p for p in sorted(V.iterdir()) if p.is_file() and p.name.startswith((
    'native-combination-','in-scope-packages-stage-','in-scope-packages-commit-','continuation-after-in-scope-packages-'))]
for root in closed_roots:selected.extend(p for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink())
assert len(selected)==len(set(selected))
physical={};members={};excluded={}
for path in selected:
    assert path.is_file() and not path.is_symlink(),path
    before=path.stat();digest=sha(path);after=path.stat()
    assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(path)]=digest;row={'physical_path':str(path),'sha256':digest,'bytes':before.st_size}
    name=str(path.relative_to(V))
    (excluded if path in binaries or path.is_relative_to(fresh_cli_target) or any(path.is_relative_to(root) for root in source_roots) else members)[name]=row
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz'
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as source:
    assert set(source.getnames())==set(members)
    for name,row in members.items():
        with source.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
(E/'archive-members-v1.json.gz').write_bytes(gzip.compress((json.dumps({'members':members,
    'archive_sha256':sha(archive),'archive_bytes':archive.stat().st_size,'all_members_content_verified':True,
    'excluded_artifacts_physically_preserved':excluded},sort_keys=True)+'\n').encode(),mtime=0))
lines=['# E62: exact-track/cache combination remains unadmitted','',review['status']+'.','',
    'The fresh baseline retains all 39 source-failure passes, but fails all ten',
    'exact-stroke tests and four of twelve native-aggregation tests. The isolated',
    'combination passes all 61 focused tests. Its thirteen exact-track proposal',
    'files match E36 v4 byte for byte; the cache proposal and the independent',
    'stroke/aggregation test bodies are unchanged. The documented finite-range',
    'failure test migrates to exact successful construction; the other 38 test',
    'names and pass results are preserved. No original workload assertion,',
    'fixture, policy, resolution or malformed-input check is weakened.','',
    '| Original gate | Exit | Process seconds | Failed assertion seconds | Limit |',
    '| --- | ---: | ---: | ---: | ---: |']
for name,row in metrics.items():lines.append('| '+name+' | '+str(row['exit_code'])+' | '+format(row['process_elapsed_seconds'],'.3f')+' | '+(str(row['assertion_time_seconds']) if row['assertion_time_seconds'] is not None else 'not emitted on pass')+' | '+str(row['original_threshold_seconds'])+' |')
lines+=['','The full-board assertion measures worker CPU; the neck assertion measures',
    'check-body wall time. Process elapsed time includes the entire test process.',
    'Both complete project ZIPs pass CRC/member checks and independent Python/unzip',
    'board extraction. The Gerber workload retains its original scope. These',
    'are completion gates, not a matched speedup benchmark: the current adapter',
    'and exact-track prototype represent different sets.','',
    'Root format checking passes. Full downstream tests and Clippy were not rerun',
    'for this probe. The unchanged historical map_clone finding, independent',
    'report migration audit, affected consumers and external distribution remain',
    'open. The cache alone also remains unadmitted under its original contract;',
    'native staging of fourteen unpublished packages does not establish a shipped',
    'public consumer path. Hypervoxel remains deferred.','',
    'Every new source path, executed binary copy, command output, control and',
    'scratch path is independently hashed. Both fresh source trees and binary',
    'copies are closed. A fresh baseline test harness and three child CLI copies',
    'are also retained. One CLI copy is an unqualified duplicate from a stale',
    'shared-target retry. The qualified candidate and clean-target baseline each',
    'pass the exact public diagnostic test using explicit private child bindings.',
    'The first baseline CLI image was not separately frozen before target reuse;',
    'its rebuild and fresh test do not recover an unrecorded earlier binary hash.',
    'The source/build/run receipts remain. The first CLI retry reported a 0.31s',
    'build but returned candidate images for the baseline source. All three test',
    'hashes differed from the retained baseline, and both child hashes matched',
    'the candidate. That baseline retry is unqualified despite zero exit codes.',
    'Its raw claim remains preserved and is explicitly superseded by the fresh',
    'target result. The clean build verifies newly compiled local artifacts from',
    'the baseline source. Initial baseline/candidate compiles are independently',
    'verified fresh, so their original semantic and workload results stand.',
    'The complete fresh CLI target is now closed and retained.',
    'The shared Cargo target and general caches remain open.',
    'Large source/binary duplicates remain physically retained outside Git.',
    'The first final-helper generator failed on an incorrect function-name',
    'assumption before writing a helper; its receipt is preserved, and the',
    'corrected final helper completed without changing source or assertions.','',
    'Only current_work changes in the ledger. Historical missing paths remain',
    '27,093 and unqualified. The original repository and production source remain',
    'unchanged. No push, publication, full-bundle restoration, admission or',
    'full-plan completion is claimed.','',
    'Next: investigate cold support discovery and native aggregation on the',
    'complete projects, and assess neck construction separately. A new repair',
    'needs an owning-layer contract and independent semantic/resource tests;',
    'neither these focused passes nor earlier warm-cache measurements waive the',
    'existing full-project limits.']
(E/'README.md').write_text('\n'.join(lines)+'\n')
ledger=D/'docs/properties-status.json';raw=ledger.read_bytes();reference=git(['show','9025de62:docs/properties-status.json'])
start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:])
key='native_cache_combination';assert key not in current
current[key]={'status':review['status'],'contract':PREFIX+'contract-v1.md','qualification':PREFIX+'review-v1.json',
    'checkpoint':PREFIX+'checkpoint-v1.json','artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'baseline_missing_claims':14,'candidate_focused_passed':61,'original_resource_gates':metrics,
    'cache_index_admitted':False,'exact_ingress_admitted':False,'hypervoxel_deferred_by_user':True,
    'external_distribution_complete':False,'full_plan_complete':False,'isolated_worktree':str(D),
    'original_worktree_integration_pending':True}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated)
assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:])
assert {k:v for k,v in json.loads(updated).items() if k!='current_work'}=={k:v for k,v in json.loads(reference).items() if k!='current_work'}
ledger.write_bytes(updated)
expectations={'schema_version':3,'kind':'fresh exact-track and unchanged cache combination',
    'parent_expectations':str(D/previous['artifact_expectations']),
    'parent_expectations_repository_relative':previous['artifact_expectations'],
    'parent_expectations_sha256':previous['artifact_expectations_sha256'],'parent_repository_during_closure':str(D),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'added_physical_artifacts_sha256':physical,'new_physical_artifacts_verified':len(physical),
    'expected_artifact_paths':len(prior)+len(physical),'physical_roots':[str(p) for p in closed_roots],
    'directory_inventory':[str(p) for p in closed_roots],'local_tool_symlink_targets':{},
    'inherited_artifacts_reverified':False,'complete_artifact_audit_passed':False,'historical_preservation_complete':False,
    'scope':'New source snapshots, eight test executable copies, three CLI copies including one unqualified duplicate, fresh CLI target, controls, logs and scratch; original baseline CLI image not preserved; shared target and caches remain open.'}
(E/'artifact-expectations-v1.json.gz').write_bytes(gzip.compress((json.dumps(expectations,sort_keys=True)+'\n').encode(),mtime=0))
for path in E.iterdir():
    if path.suffix in ['.py','.md','.json']:
        text=path.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),path
        if path.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:
    checked=subprocess.run(GIT+['diff','--check'],cwd=D,stdout=out,stderr=err)
assert checked.returncode==0
files={str(p.relative_to(D)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous);record.update({'status':review['status'],'checkpoint_kind':'fresh exact-track/cache combination',
    'previous_closure':str((P/'checkpoint-v1.json').relative_to(D)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),
    'evidence_files_sha256':files,'artifact_expectations':PREFIX+'artifact-expectations-v1.json.gz',
    'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),
    'inherited_expected_artifact_paths':len(prior),'inherited_missing_artifact_paths':len(missing),
    'new_physical_artifacts_verified':len(physical),'implementation_sha256':{},'inherited_implementation_sha256':inherited,
    'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),
    'only_current_work_changed':True,'source_changes_applied':False,'candidate_changes_separately_uncommitted':True,
    'production_prefixes_unchanged':True,'production_rust_sources_unchanged':True,'original_repository_updated':False,
    'isolated_worktree':str(D),'original_worktree_integration_pending':True,'evidence_parent_repository':str(D),
    'runtime_tests_rerun':True,'format_rerun':True,'format_exit_code':0,'whitespace_exit_code':0,
    'hypervoxel_deferred_by_user':True,'cache_index_admitted':False,'exact_ingress_admitted':False,
    'full_cargo_matrix_qualified':False,'release_qualification_complete':False,'full_plan_complete':False})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items())
assert all(sha(inherited_path(p))==h for p,h in live.items())
print(json.dumps({'new_physical_paths':len(physical),'expected_physical_paths':len(prior)+len(physical),
    'archive_members':len(members),'excluded_physical_files':len(excluded),'archive_bytes':archive.stat().st_size,
    'evidence_files':len(files)+1,'ledger_sha256':sha(ledger),'failed_gates':failed,
    'production_source_changes':False,'cache_index_admitted':False}),flush=True)
