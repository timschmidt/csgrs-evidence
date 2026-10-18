"""Close the independently reproduced importer rejection and point-cost observation."""
import ast,gzip,hashlib,json,os,re,shutil,subprocess,sys,tarfile
from pathlib import Path
sys.dont_write_bytecode=True
O=Path('/home/tim/Documents/GitHub/workspace/csgrs');N=O.parent/'csgrs-properties-validation-2026-10-17-v2'
W=N/'native-track-revisit-control-v1';S=N/'native-track-revisit-source-v1';T=N/'targets/native-track-revisit-v1'
E=O/'docs/evidence/2026-10-17-native-track-revisit';P=O/'docs/evidence/2026-10-17-native-aggregation-flat';L=O/'docs/evidence/2026-10-17-resume-integration'
BASE='7abc7128c00ad1b4bbb10ddd24dc968c39dfdd8a'
sys.path.insert(0,str(L))
from load_expectations_v2 import load,sha
GIT=['git','-c','core.splitIndex=true','-c','index.version=4','-c','maintenance.auto=false','-c','gc.auto=0'];os.environ['GIT_OPTIONAL_LOCKS']='0'
def read(p):return json.loads(Path(p).read_text())
def dump(p,v):
    assert not Path(p).exists(),p
    Path(p).write_text(json.dumps(v,indent=2,sort_keys=True)+'\n')
def gzwrite(p,v):
    assert not Path(p).exists(),p
    Path(p).write_bytes(gzip.compress((json.dumps(v,sort_keys=True)+'\n').encode(),mtime=0))
def git(*a):return subprocess.check_output(GIT+list(a),cwd=O)
def span(raw):
    start=re.search(rb'"current_work"\s*:\s*',raw).end();value,count=json.JSONDecoder().raw_decode(raw[start:].decode());return start,start+len(raw[start:].decode()[:count].encode()),value
assert E.is_dir() and sha(E/'close_v1.py')==sha(W/'close_v1.py')
assert git('rev-parse','HEAD').decode().strip()==BASE
assert not git('diff','--name-only') and not git('diff','--cached','--name-only')
assert sha(O/'docs/evidence/2026-10-14-scalar-integration/checkpoint_v4.py')=='08f03034be0ecf4141edae2ee9581b08cdbb05bbfc41a8da2eb478ad5340d4ef'
previous=read(P/'checkpoint-v1.json')
assert all(sha(O/p)==h for p,h in previous['evidence_files_sha256'].items())
prior,missing=load(O/previous['artifact_expectations'],allow_unqualified=True);assert (len(prior),len(missing))==(1348391,921794)
live=previous['restored_native_sha256']|previous['inherited_implementation_sha256']|previous['implementation_sha256'];assert all(sha(O/p)==h for p,h in live.items())
pins=json.loads(gzip.decompress((N/'native-track-revisit-source-v1.json.gz').read_bytes()));assert len(pins)==10267 and all(sha(S/p)==h for p,h in pins.items())
mainpins=json.loads(gzip.decompress((N/'native-aggregation-flat-integration-source-v1.json.gz').read_bytes()));mainpins.pop('docs/properties-status.json');assert all(sha(O/p)==h for p,h in mainpins.items())
baseline=read(N/'native-track-revisit-baseline-v1/result-v1.json');assert baseline['current_gaps_reproduced']
assert baseline['outcomes']['kicad_native_strokes']['summary']==[['FAILED','0','10','0','0','0']]
assert baseline['outcomes']['kicad_native_aggregation']['summary']==[['FAILED','9','3','0','0','0']]
assert baseline['outcomes']['existing_failures']['passed']==39
phases={p:read(N/('native-track-revisit-'+p+'-result-v1.json')) for p in ['build','focused','gates']}
assert phases['build']['passed'] and phases['focused']['passed'] and not phases['gates']['passed']
assert sum(int(v[0][1]) for v in phases['focused']['summaries'].values())==75
assert {k:v['exit_code'] for k,v in phases['gates']['summaries'].items()}=={'full-board':101,'copper-neck':101,'gerber':0}
prep=read(W/'preparation-v1.json');assert prep['production_changed_files']==['crates/hyperdrc/src/kicad/tracks.rs'] and not prep['cache_proposal_present']
point=read(N/'native-track-revisit-point-cost-v1/result-v1.json');assert not point['implementation_changed'] and not point['optimization_benchmark']
commands={};roots=[W,S,T,N/'native-track-revisit-artifacts-v1',N/'native-track-revisit-baseline-v1',N/'native-track-revisit-point-cost-v1']
for folder in sorted((N/'logs').glob('track-revisit-*')):
    r=read(folder/'result.json');assert r['output_closed'];assert all(sha(folder/p)==h for p,h in r['output_sha256'].items())
    assert not re.search(r'(?:Compiling|Checking|Packaging|Verifying) hypervoxel\b',(folder/'stderr').read_text())
    commands[folder.name]=r;roots.extend([folder,N/'scratch'/folder.name])
    if 'point-' not in folder.name:assert not r['stops']
expected_failures={'track-revisit-baseline-kicad_native_strokes-run-v1':101,'track-revisit-baseline-kicad_native_aggregation-run-v1':101,'track-revisit-gates-full-board-v1':101,'track-revisit-gates-copper-neck-v1':101}
assert {k:v['exit_code'] for k,v in commands.items() if v['exit_code'] and 'track-revisit-point-' not in k}==expected_failures
gate_details={}
for label in ['full-board','copper-neck','gerber']:
    folder=N/'logs'/('track-revisit-gates-'+label+'-v1');out=(folder/'stdout').read_text();err=(folder/'stderr').read_text()
    gate_details[label]={'exit_code':commands[folder.name]['exit_code'],'process_elapsed_seconds':commands[folder.name]['elapsed_seconds'],'diagnostic':err.strip(),'stdout_sha256':sha(folder/'stdout'),'stderr_sha256':sha(folder/'stderr')}
    assert 'skipping complex project fixture' not in out+err
artifacts=read(N/'native-track-revisit-artifacts-v1/executables-v1.json');assert all(sha(v['executed_copy'])==v['sha256'] for v in artifacts.values())
assert all(not v['fresh'] for v in read(N/'native-track-revisit-artifacts-v1/fresh-local-build-v1.json'))
binaries={Path(v['executed_copy']) for v in artifacts.values()}|{N/'native-track-revisit-baseline-v1/kicad_native_strokes',N/'native-track-revisit-baseline-v1/kicad_native_aggregation',N/'native-track-revisit-point-cost-v1/point-equality-cost'}
for r in [baseline,point]:
    assert all(sha(v['path'])==v['sha256'] for v in r['libraries'].values())
review={'decision':'rejected: exact-track importer passes focused semantics but exceeds both original native resource gates','parent_revision':BASE,'production_unchanged':True,'source_preparation':prep,'baseline':baseline,'phases':phases,'original_gate_details':gate_details,'point_equality_cost':point,'commands':commands,'qualified_aggregation_retained':True,'exact_ingress_admitted':False,'cache_proposal_admitted':False,'original_35_edit_bundle_still_rejected':True,'hypervoxel_deferred_by_user':True,'full_plan_complete':False,'next':['Prototype a borrowed exact-rational coordinate comparison at Point2 equality only after recording the measured baseline, retaining the original symbolic proof fallback and shared-point path.','Qualify any equality repair with independent semantic cases, cold/warm and large-coefficient workloads, allocation measurements, the full affected corpus and native gates before retention.','Keep the importer rejected until original resource gates, independently audited report migrations and affected downstream acceptance pass.'],'limitations':['Rectangles and round-capped analytic strokes represent different sets; importer timings are diagnostic, not optimization speedups.','The current point probe measures instrumented requested Rust allocations; it is not a candidate comparison or an RSS/native-allocation measurement.','No point equality implementation was changed or admitted here.','The isolated importer retains readiness 22 for the experiment; it is not a release artifact and no output migration is admitted.','Full native suite, Clippy/docs, Hypercircuit, bindings and report migration are not rerun for this rejected isolated importer.','No new internal work, memory, coefficient-growth or cancellation bound is established.','E63 last observed 921794 missing historical paths; this checkpoint does not re-audit that history.','Public distribution, release, pre-push and the complete properties plan remain open.']}
dump(E/'review-v1.json',review)
for name in ['contract-v1.md','point-equality-probe-contract-v1.md','candidate-tracked-v1.patch']:shutil.copy2(W/name,E/name)
rows=point['rows'];allocation_lines='\n'.join('| '+r['case']+' | '+str(r['allocations'])+' | '+str(r['requested_bytes'])+' |' for r in rows if r['phase']=='repeated-traversal')
(E/'README.md').write_text(f"""# Exact KiCad ingress after flat native aggregation

The isolated importer remains **rejected**. Current revision `{BASE}` reproduces
all ten archived exact-stroke failures and three of twelve archived aggregation
failures, while its existing 39 source-failure tests pass. A fresh worktree changes
only the production track importer, retains the committed flat aggregation, and
adds the unchanged archived tests. The reviewed 39-test migration preserves all
six extreme fixtures and replaces their obsolete finite-adapter rejection with
exact area, bounds, membership, strict-receipt and native-handoff assertions.
All 75 focused candidate tests pass.

The unchanged original full-board and copper-neck gates both fail. Their exact
assertion diagnostics and process timing observations are in
[the review](review-v1.json); process elapsed time is not substituted for the
full-board worker-CPU or neck body-wall assertion. Gerber passes. No cache
proposal is included. No production file changes, readiness migration, importer
admission, or weaker gate is retained. The earlier aggregation repair remains
admitted and the original 35-edit bundle remains rejected.

A separate [point-equality probe contract](point-equality-probe-contract-v1.md)
measures current public `Point2` equality against independently derived integer
labels. Coordinates include exact decimals, non-dyadic rationals, subrange and
superrange values, large coefficients, shared handles and symbolic translation.
The repeated 65,536-comparison traversal reports:

| Input | Requested Rust allocations | Requested bytes |
| --- | ---: | ---: |
{allocation_lines}

Construction and output formatting are outside each measured loop. First-pass
and repeated-pass observations, timings, live payload and peak payload are all
retained. These instrumented observations identify work to investigate; they do
not qualify an optimization, establish an internal bound, or count native GMP
allocations or allocator overhead. Point equality source is unchanged. A future
experiment can compare already known rational coordinates through the existing
scalar equality implementation, while retaining the symbolic proof fallback.

The [raw archive](raw-evidence-v1.tar.gz) preserves helpers, source proposals,
all command records and observations. [Its member index](archive-members-v1.json.gz)
hashes every archived byte stream and names larger physical artifacts retained
outside the archive. Every new physical path is hashed separately; older
history is not claimed recovered. The last historical audit observed 921,794
missing paths. Only `current_work` changes in the execution ledger. Hypervoxel
is excluded, public distribution and the full plan remain open, and no push
occurred.
""")
selected=[p for root in roots for p in sorted(root.rglob('*')) if p.is_file() or p.is_symlink()]
selected.extend(p for p in sorted(N.glob('native-track-revisit-*')) if p.is_file())
selected.extend(N/name for name in ['flat-evidence-stage-verification-v1.json','flat-evidence-commit-verification-v1.json'])
assert len(selected)==len(set(selected));physical={};members={};excluded={}
for p in selected:
    assert p.is_file() and not p.is_symlink(),p
    before=p.stat();h=sha(p);after=p.stat();assert (before.st_size,before.st_mtime_ns,before.st_ctime_ns)==(after.st_size,after.st_mtime_ns,after.st_ctime_ns)
    physical[str(p)]=h;row={'physical_path':str(p),'sha256':h,'bytes':before.st_size};name=str(p.relative_to(N))
    (excluded if p in binaries or p.is_relative_to(T) or p.is_relative_to(S) else members)[name]=row
assert prior.keys().isdisjoint(physical)
archive=E/'raw-evidence-v1.tar.gz';assert not archive.exists()
with tarfile.open(archive,'w:gz') as output:
    for name,row in members.items():output.add(row['physical_path'],arcname=name,recursive=False)
with tarfile.open(archive,'r:gz') as saved:
    assert set(saved.getnames())==set(members)
    for name,row in members.items():
        with saved.extractfile(name) as stream:assert hashlib.file_digest(stream,'sha256').hexdigest()==row['sha256']
gzwrite(E/'archive-members-v1.json.gz',{'members':members,'excluded_artifacts_physically_preserved':excluded,'archive_sha256':sha(archive),'archive_bytes':archive.stat().st_size,'all_members_content_verified':True})
prefix=str(E.relative_to(O))+'/'
gzwrite(E/'artifact-expectations-v1.json.gz',{'schema_version':3,'kind':'exact-track importer recheck and point equality attribution','parent_expectations':previous['artifact_expectations'],'parent_expectations_sha256':previous['artifact_expectations_sha256'],'added_physical_artifacts_sha256':physical,'expected_artifact_paths':len(prior)+len(physical),'inherited_expected_artifact_paths':len(prior),'last_observed_missing_artifact_paths':len(missing),'new_physical_artifacts_verified':len(physical),'physical_roots':[str(p) for p in roots],'complete_artifact_audit_passed':False,'historical_preservation_complete':False,'old_history_reaudited':False,'required_loader':str((L/'load_expectations_v2.py').relative_to(O))})
loaded,unavailable=load(E/'artifact-expectations-v1.json.gz',allow_unqualified=True);assert loaded==prior|physical and unavailable==missing
ledger=O/'docs/properties-status.json';raw=ledger.read_bytes();reference=git('show','9025de62:docs/properties-status.json');start,end,current=span(raw);rs,re_,_=span(reference)
assert (raw[:start],raw[end:])==(reference[:rs],reference[re_:]);assert 'native_track_revisit' not in current
current['native_track_revisit']={'status':review['decision'],'parent_revision':BASE,'review':prefix+'review-v1.json','checkpoint':prefix+'checkpoint-v1.json','artifact_expectations':prefix+'artifact-expectations-v1.json.gz','baseline_stroke_failures':10,'baseline_aggregation_failures':3,'candidate_focused_tests_passed':75,'original_native_resource_gates_failed':2,'production_source_unchanged':True,'exact_ingress_admitted':False,'point_equality_changed':False,'point_cost_cases_completed':sum(1 for r in rows if r['phase']=='repeated-traversal'),'point_cost_implementation_pending':True,'qualified_aggregation_retained':True,'cache_proposal_admitted':False,'hypervoxel_deferred_by_user':True,'public_distribution_complete':False,'full_plan_complete':False}
updated=raw[:start]+json.dumps(current,indent=2).encode()+raw[end:];us,ue,_=span(updated);assert (updated[:us],updated[ue:])==(reference[:rs],reference[re_:]);ledger.write_bytes(updated)
for p in E.iterdir():
    if p.suffix in ('.md','.py','.json'):
        text=p.read_text();assert all(line==line.rstrip() for line in text.splitlines()) and not text.endswith('\n\n'),p
        if p.suffix=='.py':ast.parse(text)
with (E/'whitespace.stdout').open('wb') as out,(E/'whitespace.stderr').open('wb') as err:r=subprocess.run(GIT+['diff','--check'],cwd=O,stdout=out,stderr=err)
assert r.returncode==0
files={str(p.relative_to(O)):sha(p) for p in E.rglob('*') if p.is_file()}
record=dict(previous);record.update({'status':review['decision'],'checkpoint_kind':'isolated exact-track rejection and current point-cost attribution','previous_closure':str((P/'checkpoint-v1.json').relative_to(O)),'previous_closure_sha256':sha(P/'checkpoint-v1.json'),'evidence_files_sha256':files,'artifact_expectations':prefix+'artifact-expectations-v1.json.gz','artifact_expectations_schema':3,'artifact_expectations_sha256':sha(E/'artifact-expectations-v1.json.gz'),'inherited_expected_artifact_paths':len(prior),'new_physical_artifacts_verified':len(physical),'last_missing_path_observation':{'checkpoint':'E63','count':len(missing),'reaudited_here':False},'ledger_before_sha256':hashlib.sha256(raw).hexdigest(),'ledger_after_sha256':sha(ledger),'inherited_implementation_sha256':live,'implementation_sha256':{},'source_changes_applied':False,'production_prefixes_unchanged':True,'qualification_this_checkpoint':['current revision reproduces 10 exact-stroke and 3 aggregation failures; 39 existing source tests pass','fresh isolated importer build and 75 focused tests','unchanged full-board and copper-neck gates fail; Gerber passes','instrumented current Point2 equality cost probe'],'historical_qualification_flags_inherited_from':str((P/'checkpoint-v1.json').relative_to(O)),'native_candidate_admitted':True,'native_candidate_admitted_scope':'E65 aggregation only; this importer rejected','exact_kicad_ingress_admitted':False,'cache_index_admitted':False,'point_equality_changed':False,'full_plan_complete':False,'public_distribution_complete':False,'hypervoxel_deferred_by_user':True})
dump(E/'checkpoint-v1.json',record)
assert all(sha(p)==h for p,h in physical.items()) and all(sha(O/p)==h for p,h in live.items())
print(json.dumps({'decision':review['decision'],'new_physical_paths':len(physical),'expected_paths':len(loaded),'archive_members':len(members),'archive_bytes':archive.stat().st_size,'ledger_sha256':sha(ledger)}),flush=True)
